package com.ljq.house.admin.controller;

import com.ljq.house.biz.service.HouseService;
import com.ljq.house.biz.service.RecommendService;
import com.ljq.house.common.model.House;
import com.ljq.house.common.utils.OnLineCount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.*;
import java.net.URLEncoder;
import java.util.List;

@Controller
@RequestMapping("/admin/statistics")
public class AdminStatistics {
    @Autowired
    private RecommendService recommendService;

    @Autowired
    private HouseService houseService;

    @RequestMapping(value = "/hot")
    public String getHot(ModelMap modelMap) {
        List<House> hotHouses = recommendService.getHotHouse(8);
        List<Double> data = recommendService.getPercentage(8);
        for (int i = 0; i < hotHouses.size(); i++)
            hotHouses.get(i).setHot(data.get(i));
        modelMap.put("hotHouses", hotHouses);
        return "/admin/charts-hot";
    }

    @RequestMapping(value = "/price")
    public String getPrice(ModelMap modelMap) {
        List<House> hs = houseService.getHouses();
        modelMap.put("house", hs);
        return "/admin/charts-price";
    }

    @RequestMapping(value = "/rating")
    public String getRating(ModelMap modelMap) {
        List<House> hs = houseService.getHouses();
        modelMap.put("house", hs);
        return "/admin/charts-rating";
    }

    @RequestMapping(value = "/export")
    public String getExport(ModelMap modelMap) {
        return "/admin/export";
    }

    @RequestMapping(value = "/NationalMap")
    public String getNationalMap(ModelMap modelMap) {
        List<String> nation = houseService.selectNationCount();
        modelMap.put("nation", nation);
        return "/admin/charts-NationalMap";
    }

    @RequestMapping(value = "/TreeMap")
    public String getTreeMap(ModelMap modelMap) {
        return "/admin/charts-treemap";
    }

    @RequestMapping(value = "/realtime")
    public String getRealtimepeople(ModelMap modelMap) {
        return "/admin/realtime";
    }

    @RequestMapping("/realtime/onlinecount")
    @ResponseBody
    public int number(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
        try {  //把sessionId记录在浏览器
            Cookie c = new Cookie("JSESSIONID", URLEncoder.encode(httpServletRequest.getSession().getId(), "utf-8"));
            c.setPath("/");
            //先设置cookie有效期为2天
            c.setMaxAge(60 * 60);
            httpServletResponse.addCookie(c);
        } catch (Exception e) {
            e.printStackTrace();
        }
/*
        HttpSession session = httpServletRequest.getSession(false);
        Object count = session.getServletContext().getAttribute("count");*/
        return OnLineCount.count;
    }

}
