package com.ljq.house.common.model;

/**
 * @Author: ljq
 * @Date: 18-12-26 下午9:09
 */
import java.util.Date;
public class UserMsg {
    private Long id;
    private String msg;
    private Long  userId;
    private Date  createTime;
    private Long  agentId;
    private Long  houseId;
    private String email;

    private String userName;

    public UserMsg() {
    }

    public UserMsg(Long id, String msg, Long userId, Date createTime, Long agentId, Long houseId, String email,
                   String userName) {
        this.id = id;
        this.msg = msg;
        this.userId = userId;
        this.createTime = createTime;
        this.agentId = agentId;
        this.houseId = houseId;
        this.email = email;
        this.userName = userName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
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

    public Long getAgentId() {
        return agentId;
    }

    public void setAgentId(Long agentId) {
        this.agentId = agentId;
    }

    public Long getHouseId() {
        return houseId;
    }

    public void setHouseId(Long houseId) {
        this.houseId = houseId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String toString() {
        return "UserMsg{" +
                "id=" + id +
                ", msg='" + msg + '\'' +
                ", userId=" + userId +
                ", createTime=" + createTime +
                ", agentId=" + agentId +
                ", houseId=" + houseId +
                ", email='" + email + '\'' +
                ", userName='" + userName + '\'' +
                '}';
    }
}
