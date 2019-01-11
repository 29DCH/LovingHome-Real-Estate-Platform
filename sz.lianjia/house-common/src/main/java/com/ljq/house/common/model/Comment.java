package com.ljq.house.common.model;

import java.util.Date;

/**
 * @Author: ljq
 * @Date: 18-12-26 下午8:32
 */
public class Comment {
    private Long id;
    private String content;
    private Long houseId;
    private Date createTime;
    private Integer blogId;
    private Integer type;
    private Long userId;
    private String userName;
    private String avatar;

    public Comment() {
    }

    public Comment(Long id, String content, Long houseId, Date createTime, Integer blogId, Integer type, Long userId,
                   String userName, String avatar) {
        this.id = id;
        this.content = content;
        this.houseId = houseId;
        this.createTime = createTime;
        this.blogId = blogId;
        this.type = type;
        this.userId = userId;
        this.userName = userName;
        this.avatar = avatar;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getBlogId() {
        return blogId;
    }

    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", houseId=" + houseId +
                ", createTime=" + createTime +
                ", blogId=" + blogId +
                ", type=" + type +
                ", userId=" + userId +
                ", userName='" + userName + '\'' +
                ", avatar='" + avatar + '\'' +
                '}';
    }
}
