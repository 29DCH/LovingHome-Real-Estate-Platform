package com.ljq.house.admin.controller;

import com.ljq.house.biz.service.AdminService;
import com.ljq.house.biz.service.UserService;
import com.ljq.house.common.constants.CommonConstants;
import com.ljq.house.common.model.Admin;
import com.ljq.house.common.model.Community;
import com.ljq.house.common.result.ResultMsg;
import com.ljq.house.common.utils.HashUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Author: ljq
 * @Date: 19-1-1 下午11:50
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/adminuser/list", method = {RequestMethod.POST, RequestMethod.GET})
    public String admin_list(ModelMap modelMap) {
        List<Admin> admin = adminService.getAdmins();
        long count = adminService.getAdminCount();
        modelMap.put("admin", admin);
        modelMap.put("count", count);
        return "/admin/admin-list";
    }

    @RequestMapping("/adminuser/toAdd")
    public String admin_toAdd(ModelMap modelMap) {
        return "admin/admin-add";
    }

    @RequestMapping("/adminuser/add")
    public String admin_add(Admin admin, ModelMap modelMap) {
        if (adminService.addAdmin(admin)) {
            return "redirect:/admin/adminuser/list";
        } else {
            return "redirect:/admin/adminuser/add?" + ResultMsg.errorMsg("管理员名称等信息已存在").asUrlParams();
        }
    }

    @RequestMapping("/login")
    public String admin_login(HttpServletRequest req, ModelMap modelMap) {
        String name = req.getParameter("name");
        String pwd = req.getParameter("pwd");
        if (name == null || pwd == null) {
            return "/admin/login";
        }
        Admin admin = adminService.auth(name, pwd);
        if (admin == null) {
            return "redirect:/admin/login?" + "&name=" + name + "&"
                    + ResultMsg.errorMsg("用户名或密码错误").asUrlParams();
        } else {
            HttpSession session = req.getSession(true);
            session.setAttribute(CommonConstants.ADMIN_ATTRIBUTE, admin);
            modelMap.put("admin", admin);
            return "redirect:/admin/index";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        session.invalidate();
        return "redirect:/admin/login";
    }

    @RequestMapping("/adminuser/toUpdate")
    public String to_update(@Param("id") Integer id, ModelMap modelMap) {
        Admin admin = adminService.getAdminById(id);
        modelMap.put("admin", admin);
        return "admin/admin-update";
    }

    @RequestMapping("/adminuser/update")
    public String update(@Param("id") Integer id, ModelMap modelMap, HttpServletRequest req) {
        Admin admin = adminService.getAdminById(id);
        adminService.updateAdmin(admin, id);
        Admin admin1 = adminService.getAdminById(id);
        admin1.setPwd(HashUtils.encryPassword(admin1.getPwd()));
        adminService.updateAdmin(admin1, id);
        /*HttpSession session = req.getSession(true);
        if(((Admin)session.getAttribute(CommonConstants.ADMIN_ATTRIBUTE)).equals(admin))
        {
            session.setAttribute(CommonConstants.ADMIN_ATTRIBUTE,adminService.getAdminById(id));
        }*/
        return "redirect:/admin/adminuser/list?id=" + id + ResultMsg.successMsg("更新成功").asUrlParams();
    }

    @RequestMapping("/adminuser/delete")
    public String delete(@Param("id") Integer id) {
        Admin admin = adminService.getAdminById(id);
        adminService.deleteAdmin(admin);
        return "redirect:/admin/adminuser/list?id=" + id + ResultMsg.successMsg("删除成功").asUrlParams();
    }

    @RequestMapping("/adminuser/toChangepwd")
    public String to_change(@Param("id") Integer id, ModelMap modelMap) {
        Admin admin = adminService.getAdminById(id);
        modelMap.put("admin", admin);
        return "admin/admin-password-edit";
    }

    @RequestMapping("/adminuser/changepwd")
    public String change(@Param("id") Integer id, ModelMap modelMap) {
        Admin admin = adminService.getAdminById(id);
        adminService.updateAdmin(admin, id);
        Admin admin1 = adminService.getAdminById(id);
        admin1.setPwd(HashUtils.encryPassword(admin1.getPwd()));
        adminService.updateAdmin(admin1, id);
        return "redirect:/admin/adminuser/list?id=" + id + ResultMsg.successMsg("修改密码成功!").asUrlParams();
    }

    @RequestMapping("/admincommunity/list")
    public String selectCommunity(ModelMap modelMap) {
        List<Community> communities = userService.selectAllCommunity();
        Long count = userService.selectCount();
        modelMap.put("community", communities);
        modelMap.put("count", count);
        return "/admin/community-list";
    }

    @RequestMapping("/admincommunity/toAdd")
    public String community_toAdd(ModelMap modelMap) {
        return "admin/community-add";
    }

    @RequestMapping("/admincommunity/add")
    public String community_add(Community community, ModelMap modelMap) {
        userService.insertcommunity(community);
        return "redirect:/admin/admincommunity/list";
    }

    @RequestMapping("/admincommunity/toUpdate")
    public String to_update1(@Param("id") Integer id, ModelMap modelMap) {
        Community community = userService.getCommunity(id);
        modelMap.put("community", community);
        return "admin/community-update";
    }

    @RequestMapping("/admincommunity/update")
    public String update1(@Param("id") Integer id, ModelMap modelMap) {
        Community community = userService.getCommunity(id);
        userService.updateCommunity(community);
        return "redirect:/admin/admincommunity/list?id=" + id + ResultMsg.successMsg("更新成功").asUrlParams();
    }

    @RequestMapping("/admincommunity/delete")
    public String deletecommunity(@Param("id") Integer id) {
        userService.deleteCommunity(id);
        return "redirect:/admin/admincommunity/list?id=" + id + ResultMsg.successMsg("删除成功").asUrlParams();
    }

    @RequestMapping(value = "/adminuser/search")
    public String admin_search(ModelMap modelMap,String name) {
        List<Admin> admin = adminService.searchAdminByName(name);
        long count = adminService.searchAdminCount(name);
        modelMap.put("admin", admin);
        modelMap.put("count", count);
        return "redirect:/admin/admin-list";
    }

}
