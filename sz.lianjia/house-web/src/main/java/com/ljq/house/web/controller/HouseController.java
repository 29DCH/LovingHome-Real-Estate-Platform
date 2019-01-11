package com.ljq.house.web.controller;

import java.util.List;

import com.ljq.house.common.utils.FileUtil;
import org.apache.poi.hssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ljq.house.biz.service.AgencyService;
import com.ljq.house.biz.service.CityService;
import com.ljq.house.biz.service.CommentService;
import com.ljq.house.biz.service.HouseService;
import com.ljq.house.biz.service.RecommendService;
import com.ljq.house.common.constants.CommonConstants;
import com.ljq.house.common.constants.HouseUserType;
import com.ljq.house.common.model.Comment;
import com.ljq.house.common.model.House;
import com.ljq.house.common.model.HouseUser;
import com.ljq.house.common.model.User;
import com.ljq.house.common.model.UserMsg;
import com.ljq.house.common.page.PageData;
import com.ljq.house.common.page.PageParams;
import com.ljq.house.common.result.ResultMsg;
import com.ljq.house.web.interceptor.UserContext;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class HouseController {

    @Autowired
    private HouseService houseService;

    @Autowired
    private CityService cityService;

    @Autowired
    private AgencyService agencyService;

    @Autowired
    private RecommendService recommendService;

    @Autowired
    private CommentService commentService;

    /**
     * 1.实现分页
     * 2.支持小区搜索、类型搜索
     * 3.支持排序
     * 4.支持展示图片、价格、标题、地址等信息
     *
     * @return
     */
    @RequestMapping("/house/list")
    public String houseList(Integer pageSize, Integer pageNum, House query, ModelMap modelMap) {
        PageData<House> ps = houseService.queryHouse(query, PageParams.build(pageSize, pageNum));
        List<House> hotHouses = recommendService.getHotHouse(CommonConstants.RECOM_SIZE);
        modelMap.put("recomHouses", hotHouses);
        modelMap.put("ps", ps);
        modelMap.put("vo", query);
        return "house/listing";
    }

    @RequestMapping("/house/toAdd")
    public String toAdd(ModelMap modelMap) {
        modelMap.put("citys", cityService.getAllCitys());
        modelMap.put("communitys", houseService.getAllCommunitys());
        return "/house/add";
    }

    @RequestMapping("/house/add")
    public String doAdd(House house) {
        User user = UserContext.getUser();
        house.setState(CommonConstants.HOUSE_STATE_UP);
        houseService.addHouse(house, user);
        return "redirect:/house/ownlist";
    }

    @RequestMapping("house/ownlist")
    public String ownlist(House house, Integer pageNum, Integer pageSize, ModelMap modelMap) {
        User user = UserContext.getUser();
        house.setUserId(user.getId());
        house.setBookmarked(false);
        modelMap.put("ps", houseService.queryHouse(house, PageParams.build(pageSize, pageNum)));
        modelMap.put("pageType", "own");
        return "/house/ownlist";
    }

    /**
     * 查询房屋详情
     * 查询关联经纪人
     *
     * @param id
     * @return
     */
    @RequestMapping("house/detail")
    public String houseDetail(Long id, ModelMap modelMap) {
        House house = houseService.queryOneHouse(id);
        HouseUser houseUser = houseService.getHouseUser(id);
        recommendService.increase(id);
        List<Comment> comments = commentService.getHouseComments(id, 8);
        if (houseUser.getUserId() != null && !houseUser.getUserId().equals(0)) {
            modelMap.put("agent", agencyService.getAgentDetail(houseUser.getUserId()));
        }
        List<House> rcHouses = recommendService.getHotHouse(CommonConstants.RECOM_SIZE);
        modelMap.put("recomHouses", rcHouses);
        modelMap.put("house", house);
        modelMap.put("commentList", comments);
        return "/house/detail";
    }

    @RequestMapping("house/leaveMsg")
    public String houseMsg(UserMsg userMsg) {
        houseService.addUserMsg(userMsg);
        return "redirect:/house/detail?id=" + userMsg.getHouseId() + ResultMsg.successMsg("留言成功").asUrlParams();
    }

    //1.评分
    @ResponseBody
    @RequestMapping("house/rating")
    public ResultMsg houseRate(Double rating, Long id) {
        houseService.updateRating(id, rating);
        return ResultMsg.successMsg("ok");
    }


    //2.收藏
    @ResponseBody
    @RequestMapping("house/bookmark")
    public ResultMsg bookmark(Long id) {
        User user = UserContext.getUser();
        houseService.bindUser2House(id, user.getId(), true);
        return ResultMsg.successMsg("ok");
    }

    //3.删除收藏
    @ResponseBody
    @RequestMapping("house/unbookmark")
    public ResultMsg unbookmark(Long id) {
        User user = UserContext.getUser();
        houseService.unbindUser2House(id, user.getId(), HouseUserType.BOOKMARK);
        return ResultMsg.successMsg("ok");
    }

    @RequestMapping(value = "house/del")
    public String delsale(Long id, String pageType) {
        User user = UserContext.getUser();
        houseService.unbindUser2House(id, user.getId(), pageType.equals("own") ? HouseUserType.SALE : HouseUserType
                .BOOKMARK);
        return "redirect:/house/ownlist";
    }

    //4.收藏列表
    @RequestMapping("house/bookmarked")
    public String bookmarked(House house, Integer pageNum, Integer pageSize, ModelMap modelMap) {
        User user = UserContext.getUser();
        house.setBookmarked(true);
        house.setUserId(user.getId());
        modelMap.put("ps", houseService.queryHouse(house, PageParams.build(pageSize, pageNum)));
        modelMap.put("pageType", "book");
        return "/house/ownlist";
    }

    @RequestMapping("/exportHouseinfo")
    public void exportHouse(HttpServletRequest request, HttpServletResponse response) {
        List<House> houseList = houseService.getHouses();
        // 创建工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 创建表
        HSSFSheet sheet = workbook.createSheet("房产信息导出excel");
        // 创建行
        HSSFRow row = sheet.createRow(0);
        // 创建单元格样式
        HSSFCellStyle cellStyle = workbook.createCellStyle();
        // 表头
        String[] head = {"id", "名称", "类型", "价格", "图片地址", "面积", "卧室数量", "卫生间数量", "评分", "房产描述", "属性", "户型图", "标签",
                "创建时间", "城市id", "社区id", "房产地址", "状态"};
        HSSFCell cell;
        // 设置表头
        for (int iHead = 0; iHead < head.length; iHead++) {
            cell = row.createCell(iHead);
            cell.setCellValue(head[iHead]);
            cell.setCellStyle(cellStyle);
        }
        // 设置表格内容
        for (int iBody = 0; iBody < houseList.size(); iBody++) {
            row = sheet.createRow(iBody + 1);
            House hs = houseList.get(iBody);
            String[] userArray = new String[18];
            userArray[0] = hs.getId() + "";
            userArray[1] = hs.getName();
            userArray[2] = hs.getType() == 1 ? "For Sale" : "For Rent";
            userArray[3] = hs.getPrice() + "万";
            userArray[4] = hs.getImages();
            userArray[5] = hs.getArea() + "";
            userArray[6] = hs.getBeds() + "";
            userArray[7] = hs.getBaths() + "";
            userArray[8] = hs.getRating() + "";
            userArray[9] = hs.getRemarks();
            userArray[10] = hs.getProperties();
            userArray[11] = hs.getFloorPlan();
            userArray[12] = hs.getTags();
            userArray[13] = hs.getCreateTime() + "";
            userArray[14] = hs.getCityId() + "";
            userArray[15] = hs.getCommunityId() + "";
            userArray[16] = hs.getAddress();
            userArray[17] = hs.getState() == 1 ? "上架" : "下架";
            for (int iArray = 0; iArray < userArray.length; iArray++) {
                row.createCell(iArray).setCellValue(userArray[iArray]);
            }

        }
        // 生成Excel文件
        FileUtil.createFile(response, workbook, "房产信息数据导出");
    }

    @PostMapping("/importHouseinfo")
    public boolean addHouseinfo(@RequestParam("file") MultipartFile file) {
        boolean a = false;
        String fileName = file.getOriginalFilename();
        try {
            a = houseService.batchImport(fileName, file);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return a;
    }


}
