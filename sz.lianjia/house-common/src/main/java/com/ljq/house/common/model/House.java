package com.ljq.house.common.model;

/**
 * @Author: ljq
 * @Date: 18-12-26 下午8:36
 */

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.google.common.base.Joiner;
import com.google.common.base.Splitter;
import com.google.common.base.Strings;
import com.google.common.collect.Lists;

public class House {
    private Long id;
    private Integer type;
    private Integer price;
    private String name;
    private String images;
    private Integer area;
    private Integer beds;
    private Integer baths;
    private Double rating;

    private Integer roundRating = 0;
    private String remarks;
    private String properties;
    private String floorPlan;
    private String tags;
    private Date createTime;
    private Integer cityId;
    private Integer communityId;
    private String address;

    private String firstImg;

    private List<String> imageList = Lists.newArrayList();


    private List<String> floorPlanList = Lists.newArrayList();
    private List<String> featureList = Lists.newArrayList();

    private List<MultipartFile> houseFiles;

    private List<MultipartFile> floorPlanFiles;


    private String priceStr;

    private String typeStr;


    private Long userId;

    private boolean bookmarked;

    private Integer state;

    private List<Long> ids;

    private Double hot;

    private String sort = "time_desc";//price_desc,price_asc,time_desc

    public House() {
    }

    public House(Long id, Integer type, Integer price, String name, String images, Integer area, Integer beds,
                 Integer baths, Double rating, Integer roundRating, String remarks, String properties, String
                         floorPlan, String tags, Date createTime, Integer cityId, Integer communityId, String
                         address, String firstImg, List<String> imageList, List<String> floorPlanList, List<String>
                         featureList, List<MultipartFile> houseFiles, List<MultipartFile> floorPlanFiles, String
                         priceStr, String typeStr, Long userId, boolean bookmarked, Integer state, List<Long> ids, Double hot, String sort) {
        this.id = id;
        this.type = type;
        this.price = price;
        this.name = name;
        this.images = images;
        this.area = area;
        this.beds = beds;
        this.baths = baths;
        this.rating = rating;
        this.roundRating = roundRating;
        this.remarks = remarks;
        this.properties = properties;
        this.floorPlan = floorPlan;
        this.tags = tags;
        this.createTime = createTime;
        this.cityId = cityId;
        this.communityId = communityId;
        this.address = address;
        this.firstImg = firstImg;
        this.imageList = imageList;
        this.floorPlanList = floorPlanList;
        this.featureList = featureList;
        this.houseFiles = houseFiles;
        this.floorPlanFiles = floorPlanFiles;
        this.priceStr = priceStr;
        this.typeStr = typeStr;
        this.userId = userId;
        this.bookmarked = bookmarked;
        this.state = state;
        this.ids = ids;
        this.hot = hot;
        this.sort = sort;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
        if (type.equals(1)) {
            this.typeStr = "For Sale";
        } else {
            this.typeStr = "For Rent";
        }
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
        this.priceStr = this.price + "万";
    }

    public Integer getArea() {
        return area;
    }

    public void setArea(Integer area) {
        this.area = area;
    }

    public Integer getBaths() {
        return baths;
    }

    public void setBaths(Integer baths) {
        this.baths = baths;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getProperties() {
        return properties;
    }

    public void setProperties(String properties) {
        this.properties = properties;
        this.featureList = Splitter.on(",").splitToList(properties);
    }

    public String getFloorPlan() {
        return floorPlan;
    }

    public void setFloorPlan(String floorPlan) {
        this.floorPlan = floorPlan;
        if (!Strings.isNullOrEmpty(floorPlan)) {
            this.floorPlanList = Splitter.on(",").splitToList(floorPlan);
        }

    }

    public boolean isBookmarked() {
        return bookmarked;
    }

    public void setBookmarked(boolean bookmarked) {
        this.bookmarked = bookmarked;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public List<Long> getIds() {
        return ids;
    }

    public void setIds(List<Long> ids) {
        this.ids = ids;
    }

    public List<String> getImageList() {
        return imageList;
    }

    public void setImageList(List<String> imageList) {
        this.imageList = imageList;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getFirstImg() {
        return firstImg;
    }

    public void setFirstImg(String firstImg) {
        this.firstImg = firstImg;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
        if (!Strings.isNullOrEmpty(images)) {
            List<String> list = Splitter.on(",").splitToList(images);
            if (list.size() > 0) {
                this.firstImg = list.get(0);
                this.imageList = list;
            }
        }
    }

    public List<MultipartFile> getFloorPlanFiles() {
        return floorPlanFiles;
    }

    public void setFloorPlanFiles(List<MultipartFile> floorPlanFiles) {
        this.floorPlanFiles = floorPlanFiles;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    public Integer getCommunityId() {
        return communityId;
    }

    public void setCommunityId(Integer communityId) {
        this.communityId = communityId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPriceStr() {
        return priceStr;
    }

    public void setPriceStr(String priceStr) {
        this.priceStr = priceStr;
    }

    public String getTypeStr() {
        return typeStr;
    }

    public void setTypeStr(String typeStr) {
        this.typeStr = typeStr;
    }

    public Integer getBeds() {
        return beds;
    }

    public void setBeds(Integer beds) {
        this.beds = beds;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public List<String> getFloorPlanList() {
        return floorPlanList;
    }

    public void setFloorPlanList(List<String> floorPlanList) {
        this.floorPlanList = floorPlanList;
    }

    public List<String> getFeatureList() {
        return featureList;
    }

    public void setFeatureList(List<String> featureList) {
        this.featureList = featureList;
        this.properties = Joiner.on(",").join(featureList);
    }

    public Double getRating() {
        return rating;
    }

    public void setRating(Double rating) {
        this.rating = rating;
        this.roundRating = (int) Math.round(rating);
    }

    public Integer getRoundRating() {
        return roundRating;
    }

    public void setRoundRating(Integer roundRating) {
        this.roundRating = roundRating;
    }

    public List<MultipartFile> getHouseFiles() {
        return houseFiles;
    }

    public void setHouseFiles(List<MultipartFile> houseFiles) {
        this.houseFiles = houseFiles;
    }

    public Double getHot() {
        return hot;
    }

    public void setHot(Double hot) {
        this.hot = hot;
    }

    @Override
    public String toString() {
        return "House{" +
                "id=" + id +
                ", type=" + type +
                ", price=" + price +
                ", name='" + name + '\'' +
                ", images='" + images + '\'' +
                ", area=" + area +
                ", beds=" + beds +
                ", baths=" + baths +
                ", rating=" + rating +
                ", roundRating=" + roundRating +
                ", remarks='" + remarks + '\'' +
                ", properties='" + properties + '\'' +
                ", floorPlan='" + floorPlan + '\'' +
                ", tags='" + tags + '\'' +
                ", createTime=" + createTime +
                ", cityId=" + cityId +
                ", communityId=" + communityId +
                ", address='" + address + '\'' +
                ", firstImg='" + firstImg + '\'' +
                ", imageList=" + imageList +
                ", floorPlanList=" + floorPlanList +
                ", featureList=" + featureList +
                ", houseFiles=" + houseFiles +
                ", floorPlanFiles=" + floorPlanFiles +
                ", priceStr='" + priceStr + '\'' +
                ", typeStr='" + typeStr + '\'' +
                ", userId=" + userId +
                ", bookmarked=" + bookmarked +
                ", state=" + state +
                ", ids=" + ids +
                ", hot=" + hot +
                ", sort='" + sort + '\'' +
                '}';
    }
}
