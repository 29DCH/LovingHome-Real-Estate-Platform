package com.ljq.house.admin.controller;

import com.ljq.house.biz.service.UserService;
import com.ljq.house.common.model.User;
import com.ljq.house.common.result.ResultMsg;
import com.ljq.house.common.utils.HashUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * @Author: ljq
 * @Date: 19-1-3 上午9:05
 */
@Controller
@RequestMapping("/admin")
public class AdminUserController {
    @Autowired
    private UserService userService;

    @Value("${file.prefix}")
    private String imgPrefix;

    @RequestMapping(value = "/user/list", method = {RequestMethod.POST, RequestMethod.GET})
    public String user_list(ModelMap modelMap) {
        List<User> user = userService.getUsers();
        user.forEach(u -> {
            u.setAvatar(imgPrefix + u.getAvatar());
        });
        long count = userService.getUserCount();
        modelMap.put("user", user);
        modelMap.put("count", count);
        return "/admin/member-list";
    }

    @RequestMapping("/user/select")
    public String select(@Param("id") long id, ModelMap modelMap) {
        User user = userService.getUserById(id);
        modelMap.put("user",user);
        return "admin/member-show";
    }

    @RequestMapping("/user/toUpdate")
    public String to_update(@Param("id") long id, ModelMap modelMap) {
        User user = userService.getUserById(id);
        modelMap.put("user",user);
        return "admin/member-update";
    }

    @RequestMapping("/user/update")
    public String update(@Param("id") long id, ModelMap modelMap) {
        User user = userService.getUserById(id);
        userService.updateUser(user,user.getEmail());
        return "redirect:/admin/user/list?id="+id+ResultMsg.successMsg("更新成功").asUrlParams();
    }

    @RequestMapping("/user/toChangepwd")
    public String to_change(@Param("id") long id, ModelMap modelMap) {
        User user = userService.getUserById(id);
        modelMap.put("user",user);
        return "admin/change-password";
    }

    @RequestMapping("/user/changepwd")
    public String change(@Param("id") long id, ModelMap modelMap) {
        User user = userService.getUserById(id);
        userService.updateUser(user,user.getEmail());
        User user1 = userService.getUserById(id);
        user1.setPasswd(HashUtils.encryPassword(user1.getPasswd()));
        userService.updateUser(user1,user.getEmail());
        return "redirect:/admin/user/list?id="+id+ResultMsg.successMsg("修改密码成功!").asUrlParams();
    }

    @RequestMapping("/user/delete")
    public String delete(@Param("id") long id)
    {
        User user = userService.getUserById(id);
        userService.deleteUser(user.getEmail());
        return "redirect:/admin/user/list?id="+id+ResultMsg.successMsg("删除成功").asUrlParams();
    }


}
