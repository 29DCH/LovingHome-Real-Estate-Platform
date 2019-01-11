package com.ljq.house.common.model;

/**
 * @Author: ljq
 * @Date: 18-12-26 下午8:34
 */
public class Community {
    private Integer id;
    private String cityCode;
    private String cityName;
    private String name;

    public Community() {
    }

    public Community(Integer id, String cityCode, String cityName, String name) {
        this.id = id;
        this.cityCode = cityCode;
        this.cityName = cityName;
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCityCode() {
        return cityCode;
    }

    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Community{" +
                "id=" + id +
                ", cityCode='" + cityCode + '\'' +
                ", cityName='" + cityName + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
