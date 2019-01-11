package com.ljq.house.biz.service;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.commons.collections.CollectionUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.common.base.Joiner;
import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.ljq.house.biz.mapper.HouseMapper;
import com.ljq.house.common.constants.HouseUserType;
import com.ljq.house.common.model.Community;
import com.ljq.house.common.model.House;
import com.ljq.house.common.model.HouseUser;
import com.ljq.house.common.model.User;
import com.ljq.house.common.model.UserMsg;
import com.ljq.house.common.page.PageData;
import com.ljq.house.common.page.PageParams;
import com.ljq.house.common.utils.BeanHelper;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.MessagingException;

/**
 * @Author: ljq
 * @Date: 18-12-27 下午3:59
 */

@Service
public class HouseService {
    @Autowired
    private HouseMapper houseMapper;

    @Value("${file.prefix}")
    private String imgPrefix;

    @Autowired
    private FileService fileService;

    @Autowired
    private AgencyService agencyService;

    @Autowired
    private MailService mailService;


    /**
     * 1.查询小区
     * 2.添加图片服务器地址前缀
     * 3.构建分页结果
     *
     * @param query
     * @param pageParams
     */
    public PageData<House> queryHouse(House query, PageParams pageParams) {
        List<House> houses = Lists.newArrayList();
        if (!Strings.isNullOrEmpty(query.getName())) {
            Community community = new Community();
            community.setName(query.getName());
            List<Community> communities = houseMapper.selectCommunity(community);
            if (!communities.isEmpty()) {
                query.setCommunityId(communities.get(0).getId());
            }
        }
        houses = queryAndSetImg(query, pageParams);//添加图片服务器地址前缀
        Long count = houseMapper.selectPageCount(query);
        return PageData.buildPage(houses, count, pageParams.getPageSize(), pageParams.getPageNum());
    }

    public List<House> queryAndSetImg(House query, PageParams pageParams) {
        List<House> houses = houseMapper.selectPageHouses(query, pageParams);
        System.out.println(houses.size());
        houses.forEach(h -> {
            h.setFirstImg(imgPrefix + h.getFirstImg());
            h.setImageList(h.getImageList().stream().map(img -> imgPrefix + img).collect(Collectors.toList()));
            h.setFloorPlanList(h.getFloorPlanList().stream().map(img -> imgPrefix + img).collect(Collectors.toList()));
        });
        return houses;
    }

    public List<Community> getAllCommunitys() {
        Community community = new Community();
        return houseMapper.selectCommunity(community);
    }

    /**
     * 添加房屋图片
     * 添加户型图片
     * 插入房产信息
     * 绑定用户和房产的关系
     *
     * @param house
     * @param user
     */
    public void addHouse(House house, User user) {
        if (CollectionUtils.isNotEmpty(house.getHouseFiles())) {
            String images = Joiner.on(",").join(fileService.getImgPaths(house.getHouseFiles()));
            house.setImages(images);
        }
        if (CollectionUtils.isNotEmpty(house.getFloorPlanFiles())) {
            String images = Joiner.on(",").join(fileService.getImgPaths(house.getFloorPlanFiles()));
            house.setFloorPlan(images);
        }
        BeanHelper.onInsert(house);
        houseMapper.insert(house);
        bindUser2House(house.getId(), user.getId(), false);
    }

    public void bindUser2House(Long houseId, Long userId, boolean collect) {
        HouseUser existhouseUser = houseMapper.selectHouseUser(userId, houseId, collect ? HouseUserType.BOOKMARK
                .value : HouseUserType.SALE.value);
        if (existhouseUser != null) {
            return;
        }
        HouseUser houseUser = new HouseUser();
        houseUser.setHouseId(houseId);
        houseUser.setUserId(userId);
        houseUser.setType(collect ? HouseUserType.BOOKMARK.value : HouseUserType.SALE.value);
        BeanHelper.setDefaultProp(houseUser, HouseUser.class);
        BeanHelper.onInsert(houseUser);
        houseMapper.insertHouseUser(houseUser);
    }

    public HouseUser getHouseUser(Long houseId) {
        HouseUser houseUser = houseMapper.selectSaleHouseUser(houseId);
        return houseUser;
    }

    public House queryOneHouse(Long id) {
        House query = new House();
        query.setId(id);
        List<House> houses = queryAndSetImg(query, PageParams.build(1, 1));
        if (!houses.isEmpty()) {
            return houses.get(0);
        }
        return null;
    }

    public void addUserMsg(UserMsg userMsg) {
        BeanHelper.onInsert(userMsg);
        houseMapper.insertUserMsg(userMsg);
        User agent = agencyService.getAgentDetail(userMsg.getAgentId());
        try {
            mailService.sendMail("来自用户" + userMsg.getEmail() + "的留言", userMsg.getMsg(), agent.getEmail());
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public void updateRating(Long id, Double rating) {
        House house = queryOneHouse(id);
        Double oldRating = house.getRating();
        Double newRating = oldRating.equals(0D) ? rating : Math.min((oldRating + rating) / 2, 5);
        House updateHouse = new House();
        updateHouse.setId(id);
        updateHouse.setRating(newRating);
        BeanHelper.onUpdate(updateHouse);
        houseMapper.updateHouse(updateHouse);
    }

    public void unbindUser2House(Long id, Long userId, HouseUserType type) {
        if (type.equals(HouseUserType.SALE)) {
            houseMapper.downHouse(id);
        } else {
            houseMapper.deleteHouseUser(id, userId, type.value);
        }

    }

    public List<House> getHouses() {
        return houseMapper.selectHouses();
    }

    public House selectHouseById(Long id) {
        return houseMapper.selectHouseById(id);
    }

    public int getHouseCount() {
        return houseMapper.selectHouseCount();
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public boolean batchImport(String fileName, MultipartFile file) throws Exception {
        boolean notNull = false;
        List<House> houseList = new ArrayList<>();
        if (!fileName.matches("^.+\\.(?i)(xls)$") && !fileName.matches("^.+\\.(?i)(xlsx)$")) {
            throw new Exception("上传文件格式不正确");
        }
        boolean isExcel2003 = true;
        if (fileName.matches("^.+\\.(?i)(xlsx)$")) {
            isExcel2003 = false;
        }
        InputStream is = file.getInputStream();
        Workbook wb = null;
        if (isExcel2003) {
            wb = new HSSFWorkbook(is);
        } else {
            wb = new XSSFWorkbook(is);
        }
        Sheet sheet = wb.getSheetAt(0);
        if (sheet != null) {
            notNull = true;
        }
        House house;
        for (int r = 1; r <= sheet.getLastRowNum(); r++) {
            Row row = sheet.getRow(r);
            if (row == null) {
                continue;
            }
            house = new House();
            String name = row.getCell(0).getStringCellValue();
            Integer type = Integer.valueOf(row.getCell(1).getStringCellValue());
            Integer price = Integer.valueOf(row.getCell(2).getStringCellValue());
            String images = row.getCell(3).getStringCellValue();
            Integer area = Integer.valueOf(row.getCell(4).getStringCellValue());
            Integer beds = Integer.valueOf(row.getCell(5).getStringCellValue());
            Integer baths = Integer.valueOf(row.getCell(6).getStringCellValue());
            Double rating = Double.valueOf(row.getCell(7).getStringCellValue());
            String remarks = row.getCell(8).getStringCellValue();
            String properties = row.getCell(9).getStringCellValue();
            String floor_plan = row.getCell(10).getStringCellValue();
            String tags = row.getCell(11).getStringCellValue();
            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date create_time = fmt.parse(row.getCell(12).getStringCellValue());
            Integer city_id = Integer.valueOf(row.getCell(13).getStringCellValue());
            Integer community_id = Integer.valueOf(row.getCell(14).getStringCellValue());
            String address = row.getCell(15).getStringCellValue();
            Integer state = Integer.valueOf(row.getCell(16).getStringCellValue());
            house.setName(name);
            house.setType(type);
            house.setPrice(price);
            house.setImages(images);
            house.setCreateTime(create_time);
            house.setArea(area);
            house.setBeds(beds);
            house.setBaths(baths);
            house.setRating(rating);
            house.setRemarks(remarks);
            house.setProperties(properties);
            house.setFloorPlan(floor_plan);
            house.setTags(tags);
            house.setCreateTime(create_time);
            house.setCityId(city_id);
            house.setCommunityId(community_id);
            house.setAddress(address);
            house.setState(state);
            houseList.add(house);
        }
        for (House houseinfo : houseList) {
            Long id = houseinfo.getId();
            House house1 = houseMapper.selectHouseById(id);
            if (house1 == null) {
                houseMapper.insert(houseinfo);
            } else {
                houseMapper.updateHouseAll(houseinfo);
            }
        }
        return notNull;
    }

    public List<String> selectNationCount() {
        return houseMapper.selectNationCount();
    }

    public void delete(Integer id) {
        houseMapper.delete(id);
    }

    public void inserthouse(House house) {
        houseMapper.insert(house);
    }
}
