package com.ljq.house.common.model;

/**
 * @Author: ljq
 * @Date: 18-12-26 下午9:04
 */

import java.util.Date;

public class HouseUser {
    private Long id;
    private Long houseId;
    private Long userId;
    private Date createTime;
    private Integer type;

    public HouseUser() {
    }

    public HouseUser(Long id, Long houseId, Long userId, Date createTime, Integer type) {
        this.id = id;
        this.houseId = houseId;
        this.userId = userId;
        this.createTime = createTime;
        this.type = type;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getHouseId() {
        return houseId;
    }

    public void setHouseId(Long houseId) {
        this.houseId = houseId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "HouseUser{" +
                "id=" + id +
                ", houseId=" + houseId +
                ", userId=" + userId +
                ", createTime=" + createTime +
                ", type=" + type +
                '}';
    }
}
