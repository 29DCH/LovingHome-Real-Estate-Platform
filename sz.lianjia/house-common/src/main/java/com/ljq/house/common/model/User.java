package com.ljq.house.common.model;

/**
 * @Author: ljq
 * @Date: 18-12-26 下午9:07
 */

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class User {
    private Long id;

    private String email;

    private String phone;

    private String name;

    private String passwd;

    private String confirmPasswd;

    private Integer type;//普通用户1，经纪人2

    private Date createTime;

    private Integer enable;

    private String avatar;

    private MultipartFile avatarFile;

    private String newPassword;

    private String key;

    private Long agencyId;

    private String aboutme;

    private String agencyName;

    public User() {
    }

    public User(Long id, String email, String phone, String name, String passwd, String confirmPasswd, Integer type,
                Date createTime, Integer enable, String avatar, MultipartFile avatarFile, String newPassword, String
                        key, Long agencyId, String aboutme, String agencyName) {
        this.id = id;
        this.email = email;
        this.phone = phone;
        this.name = name;
        this.passwd = passwd;
        this.confirmPasswd = confirmPasswd;
        this.type = type;
        this.createTime = createTime;
        this.enable = enable;
        this.avatar = avatar;
        this.avatarFile = avatarFile;
        this.newPassword = newPassword;
        this.key = key;
        this.agencyId = agencyId;
        this.aboutme = aboutme;
        this.agencyName = agencyName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getConfirmPasswd() {
        return confirmPasswd;
    }

    public void setConfirmPasswd(String confirmPasswd) {
        this.confirmPasswd = confirmPasswd;
    }

    public String getAboutme() {
        return aboutme;
    }

    public void setAboutme(String aboutme) {
        this.aboutme = aboutme;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getEnable() {
        return enable;
    }

    public void setEnable(Integer enable) {
        this.enable = enable;
    }


    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public MultipartFile getAvatarFile() {
        return avatarFile;
    }

    public void setAvatarFile(MultipartFile avatarFile) {
        this.avatarFile = avatarFile;
    }

    public String getAgencyName() {
        return agencyName;
    }

    public void setAgencyName(String agencyName) {
        this.agencyName = agencyName;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public Long getAgencyId() {
        return agencyId;
    }

    public void setAgencyId(Long agencyId) {
        this.agencyId = agencyId;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", name='" + name + '\'' +
                ", passwd='" + passwd + '\'' +
                ", confirmPasswd='" + confirmPasswd + '\'' +
                ", type=" + type +
                ", createTime=" + createTime +
                ", enable=" + enable +
                ", avatar='" + avatar + '\'' +
                ", avatarFile=" + avatarFile +
                ", newPassword='" + newPassword + '\'' +
                ", key='" + key + '\'' +
                ", agencyId=" + agencyId +
                ", aboutme='" + aboutme + '\'' +
                ", agencyName='" + agencyName + '\'' +
                '}';
    }
}
