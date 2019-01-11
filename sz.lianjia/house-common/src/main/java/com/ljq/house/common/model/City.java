package com.ljq.house.common.model;

/**
 * @Author: ljq
 * @Date: 18-12-26 下午8:30
 */

public class City {
    private Integer id;
    private String  cityName;
    private String  cityCode;

    public City() {
    }

    public City(Integer id, String cityName, String cityCode) {
        this.id = id;
        this.cityName = cityName;
        this.cityCode = cityCode;
    }

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getCityName() {
        return cityName;
    }
    public void setCityName(String cityName) {
        this.cityName = cityName;
    }
    public String getCityCode() {
        return cityCode;
    }
    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    @Override
    public String toString() {
        return "City{" +
                "id=" + id +
                ", cityName='" + cityName + '\'' +
                ", cityCode='" + cityCode + '\'' +
                '}';
    }
}
