package com.ljq.house.common.model;

/**
 * @Author: ljq
 * @Date: 19-1-1 下午11:55
 */
public class Admin {
    private Integer id;
    private String name;
    private String pwd;
    private String phone;
    private String email;
    private String img;
    private String des;
    private String time;

    public Admin() {
    }

    public Admin(Integer id, String name,String pwd, String phone, String email, String img, String des, String time) {
        this.id = id;
        this.name = name;
        this.pwd=pwd;
        this.phone = phone;
        this.email = email;
        this.img = img;
        this.des = des;
        this.time = time;
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

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", pwd='" + pwd + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", img='" + img + '\'' +
                ", des='" + des + '\'' +
                ", time=" + time +
                '}';
    }
}