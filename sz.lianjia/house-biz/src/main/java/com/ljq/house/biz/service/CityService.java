package com.ljq.house.biz.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.ljq.house.common.model.City;

/**
 * @Author: ljq
 * @Date: 18-12-27 下午3:29
 */
@Service
public class CityService {
    public List<City> getAllCitys() {
        City city = new City();
        city.setCityCode("110000");
        city.setCityName("深圳市");
        city.setId(1);
        return Lists.newArrayList(city);
    }

}
