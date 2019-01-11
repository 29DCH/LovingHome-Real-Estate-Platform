package com.ljq.house.common.model;

/**
 * @Author: ljq
 * @Date: 18-12-26 下午8:24
 */
public class Agency {
    private Integer id;
    private String  name;
    private String  address;
    private String  phone;
    private String  email;
    private String  aboutUs;
    private String  webSite;
    private String  mobile;

    public Agency() {
    }

    public Agency(Integer id, String name, String address, String phone, String email, String aboutUs, String
            webSite, String mobile) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.aboutUs = aboutUs;
        this.webSite = webSite;
        this.mobile = mobile;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;

    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getAboutUs() {
        return aboutUs;
    }
    public void setAboutUs(String aboutUs) {
        this.aboutUs = aboutUs;
    }
    public String getWebSite() {
        return webSite;
    }
    public void setWebSite(String webSite) {
        this.webSite = webSite;
    }
    public String getMobile() {
        return mobile;
    }
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    @Override
    public String toString() {
        return "Agency{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", aboutUs='" + aboutUs + '\'' +
                ", webSite='" + webSite + '\'' +
                ", mobile='" + mobile + '\'' +
                '}';
    }
}
