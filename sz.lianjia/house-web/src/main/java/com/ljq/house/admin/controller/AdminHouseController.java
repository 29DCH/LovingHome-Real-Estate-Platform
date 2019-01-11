package com.ljq.house.admin.controller;

import com.ljq.house.biz.service.HouseService;
import com.ljq.house.common.constants.CommonConstants;
import com.ljq.house.common.model.House;
import com.ljq.house.common.model.User;
import com.ljq.house.common.result.ResultMsg;
import com.ljq.house.web.interceptor.UserContext;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @Author: ljq
 * @Date: 19-1-8 下午5:23
 */
@Controller
@RequestMapping("/admin")
public class AdminHouseController {

    @Autowired
    private HouseService houseService;

    @Value("${file.prefix}")
    private String imgPrefix;

    @RequestMapping("/adminhouse/list")
    public String houseList(ModelMap modelMap) {
        List<House> house = houseService.getHouses();
        house.forEach(h -> {
            h.setFirstImg(imgPrefix + h.getFirstImg());
        });
        int count = houseService.getHouseCount();
        modelMap.put("count", count);
        modelMap.put("house", house);
        return "admin/house-list";
    }

    @RequestMapping("/adminhouse/toAdd")
    public String toAdd(ModelMap modelMap) {
        return "admin/house-add";
    }

    @RequestMapping("/adminhouse/add")
    public String doAdd(House house) {
        houseService.inserthouse(house);
        return "redirect:/adminhouse/list";
    }

    @RequestMapping("/adminhouse/delete")
    public String deletehouse(@Param("id") Integer id) {
        houseService.delete(id);
        return "redirect:/admin/adminhouse/list?id=" + id + ResultMsg.successMsg("删除成功").asUrlParams();
    }

}
