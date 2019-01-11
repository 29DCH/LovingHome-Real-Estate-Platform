package com.ljq.house.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: ljq
 * @Date: 19-1-1 下午5:43
 */

@Controller
@RequestMapping("/admin")
public class AdminHomepageController {

    @RequestMapping("/index")
    public String index(ModelMap modelMap) {
        return "/admin/index";
    }

    @RequestMapping("")
    public String index1(ModelMap modelMap) {
        return "redirect:/admin/index";
    }

    @RequestMapping("index/welcome")
    public String index2(ModelMap modelMap) {
        return "/admin/welcome";
    }
}