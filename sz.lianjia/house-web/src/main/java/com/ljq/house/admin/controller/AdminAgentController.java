package com.ljq.house.admin.controller;

import com.ljq.house.biz.service.AgencyService;
import com.ljq.house.biz.service.UserService;
import com.ljq.house.common.model.User;
import com.ljq.house.common.page.PageData;
import com.ljq.house.common.page.PageParams;
import com.ljq.house.common.result.ResultMsg;
import com.ljq.house.common.utils.HashUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: ljq
 * @Date: 19-1-6 上午11:02
 */
@Controller
@RequestMapping("/admin")
public class AdminAgentController {

    @Autowired
    private AgencyService agencyService;

    @Autowired
    private UserService userService;


    @RequestMapping(value = "/adminAgent/list")
    public String agent_list(Integer pageSize, Integer pageNum, ModelMap modelMap) {
        if (pageSize == null) {
            pageSize = 6;
        }
        PageData<User> ps = agencyService.getAllAgent(PageParams.build(pageSize, pageNum));
        Long count = agencyService.selectAgentCount(new User());
        modelMap.put("ps", ps);
        modelMap.put("count", count);
        return "/admin/agent-list";
    }

    @RequestMapping("/adminAgent/toAdd")
    public String agent_toAdd(ModelMap modelMap) {
        modelMap.put("agencyList", agencyService.getAllAgency());
        return "admin/agent-add";
    }

    @RequestMapping("/adminAgent/add")
    public String agent_add(User account, ModelMap modelMap) {
        if (account == null || account.getName() == null) {
            return "admin/agent-add";
        }
        if (userService.addAccount(account)) {
            account.setType(2);
            return "/admin/agent-list";
        } else {
            return "redirect:/admin/agent-list";
        }
    }

    @RequestMapping("/adminAgent/select")
    public String select(@Param("id") long id, ModelMap modelMap) {
        User user = userService.getUserById(id);
        modelMap.put("user",user);
        return "admin/member-show";
    }

    @RequestMapping("/adminAgent/toUpdate")
    public String to_update(@Param("id") long id, ModelMap modelMap) {
        User user = userService.getUserById(id);
        modelMap.put("user",user);
        return "admin/member-update";
    }

    @RequestMapping("/adminAgent/update")
    public String update(@Param("id") long id, ModelMap modelMap) {
        User user = userService.getUserById(id);
        userService.updateUser(user,user.getEmail());
        return "redirect:/admin/adminAgent/list?id="+id+ResultMsg.successMsg("更新成功").asUrlParams();
    }

    @RequestMapping("/adminAgent/toChangepwd")
    public String to_change(@Param("id") long id, ModelMap modelMap) {
        User user = userService.getUserById(id);
        modelMap.put("user",user);
        return "admin/change-password";
    }

    @RequestMapping("/adminAgent/changepwd")
    public String change(@Param("id") long id, ModelMap modelMap) {
        User user = userService.getUserById(id);
        userService.updateUser(user,user.getEmail());
        User user1 = userService.getUserById(id);
        user1.setPasswd(HashUtils.encryPassword(user1.getPasswd()));
        userService.updateUser(user1,user.getEmail());
        return "redirect:/admin/adminAgent/list?id="+id+ResultMsg.successMsg("修改密码成功!").asUrlParams();
    }

    @RequestMapping("/adminAgent/delete")
    public String delete(@Param("id") long id)
    {
        User user = userService.getUserById(id);
        userService.deleteUser(user.getEmail());
        return "redirect:/admin/adminAgent/list?id="+id+ResultMsg.successMsg("删除成功").asUrlParams();
    }



}
