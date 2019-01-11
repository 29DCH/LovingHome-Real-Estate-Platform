package com.ljq.house.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ljq.house.common.utils.FileUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ljq.house.biz.service.AgencyService;
import com.ljq.house.biz.service.UserService;
import com.ljq.house.common.constants.CommonConstants;
import com.ljq.house.common.model.User;
import com.ljq.house.common.result.ResultMsg;
import com.ljq.house.common.utils.HashUtils;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private AgencyService agencyService;

    /**
     * 注册提交:1.注册验证 2 发送邮件 3验证失败重定向到注册页面 注册页获取:根据account对象为依据判断是否注册页获取请求
     *
     * @param account
     * @param modelMap
     * @return
     */
    @RequestMapping("accounts/register")
    public String accountsRegister(User account, ModelMap modelMap) {
        if (account == null || account.getName() == null) {
            modelMap.put("agencyList", agencyService.getAllAgency());
            return "/user/accounts/register";
        }
        // 用户验证
        ResultMsg resultMsg = com.ljq.house.web.controller.UserHelper.validate(account);
        if (resultMsg.isSuccess() && userService.addAccount(account)) {
            modelMap.put("email", account.getEmail());
            return "/user/accounts/registerSubmit";
        } else {
            return "redirect:/accounts/register?" + resultMsg.asUrlParams();
        }
    }

    @RequestMapping("accounts/verify")
    public String verify(String key) {
        boolean result = userService.enable(key);
        if (result) {
            return "redirect:/index?" + ResultMsg.successMsg("激活成功").asUrlParams();
        } else {
            return "redirect:/accounts/register?" + ResultMsg.errorMsg("激活失败,请确认链接是否过期");
        }
    }

    //登录流程

    /**
     * 登录接口
     */
    @RequestMapping("/accounts/signin")
    public String signin(HttpServletRequest req) {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String target = req.getParameter("target");
        if (username == null || password == null) {
            req.setAttribute("target", target);
            return "/user/accounts/signin";
        }
        User user = userService.auth(username, password);
        if (user == null) {
            return "redirect:/accounts/signin?" + "target=" + target + "&username=" + username + "&"
                    + ResultMsg.errorMsg("用户名或密码错误").asUrlParams();
        } else {
            HttpSession session = req.getSession(true);
            session.setAttribute(CommonConstants.USER_ATTRIBUTE, user);
            // session.setAttribute(CommonConstants.PLAIN_USER_ATTRIBUTE, user);
            return StringUtils.isNoneBlank(target) ? "redirect:" + target : "redirect:/index";
        }
    }

    /**
     * 登出操作
     *
     * @param request
     * @return
     */
    @RequestMapping("accounts/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);//防止创建Session
        if (session != null) {
            session.removeAttribute(CommonConstants.USER_ATTRIBUTE);
            session.invalidate();
        }
        return "redirect:/index";
    }

    //个人信息页

    /**
     * 1.能够提供页面信息 2.更新用户信息
     *
     * @param updateUser
     * @param model
     * @return
     */
    @RequestMapping("accounts/profile")
    public String profile(HttpServletRequest req, User updateUser, ModelMap model) {
        if (updateUser.getEmail() == null) {
            return "/user/accounts/profile";
        }
        userService.updateUser(updateUser, updateUser.getEmail());
        User query = new User();
        query.setEmail(updateUser.getEmail());
        List<User> users = userService.getUserByQuery(query);
        req.getSession(true).setAttribute(CommonConstants.USER_ATTRIBUTE, users.get(0));
        return "redirect:/accounts/profile?" + ResultMsg.successMsg("更新成功").asUrlParams();
    }

    /**
     * 修改密码操作
     *
     * @param email
     * @param password
     * @param newPassword
     * @param confirmPassword
     * @param mode
     * @return
     */
    @RequestMapping("accounts/changePassword")
    public String changePassword(String email, String password, String newPassword,
                                 String confirmPassword, ModelMap mode) {
        User user = userService.auth(email, password);
        if (user == null || !confirmPassword.equals(newPassword)) {
            return "redirct:/accounts/profile?" + ResultMsg.errorMsg("密码错误").asUrlParams();
        }
        User updateUser = new User();
        updateUser.setPasswd(HashUtils.encryPassword(newPassword));
        userService.updateUser(updateUser, email);
        return "redirect:/accounts/profile?" + ResultMsg.successMsg("更新成功").asUrlParams();
    }


    /**
     * 忘记密码
     *
     * @param username
     * @param modelMap
     * @return
     */
    @RequestMapping("accounts/remember")
    public String remember(String username, ModelMap modelMap) {
        if (StringUtils.isBlank(username)) {
            return "redirect:/accounts/signin?" + ResultMsg.errorMsg("邮箱不能为空").asUrlParams();
        }
        userService.resetNotify(username);
        modelMap.put("email", username);
        return "/user/accounts/remember";
    }

    @RequestMapping("accounts/reset")
    public String reset(String key, ModelMap modelMap) {
        String email = userService.getResetEmail(key);
        if (StringUtils.isBlank(email)) {
            return "redirect:/accounts/signin?" + ResultMsg.errorMsg("重置链接已过期").asUrlParams();
        }
        modelMap.put("email", email);
        modelMap.put("success_key", key);
        return "/user/accounts/reset";
    }

    @RequestMapping(value = "accounts/resetSubmit")
    public String resetSubmit(HttpServletRequest req, User user) {
        ResultMsg retMsg = com.ljq.house.web.controller.UserHelper.validateResetPassword(user.getKey(), user
                .getPasswd(), user.getConfirmPasswd());
        if (!retMsg.isSuccess()) {
            String suffix = "";
            if (StringUtils.isNotBlank(user.getKey())) {
                suffix = "email=" + userService.getResetEmail(user.getKey()) + "&key=" + user.getKey() + "&";
            }
            return "redirect:/accounts/reset?" + suffix + retMsg.asUrlParams();
        }
        User updatedUser = userService.reset(user.getKey(), user.getPasswd());
        req.getSession(true).setAttribute(CommonConstants.USER_ATTRIBUTE, updatedUser);
        return "redirect:/index?" + retMsg.asUrlParams();
    }

    @RequestMapping("/exportUserinfo")
    public void exportUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userService.getUsers();
        // 创建工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 创建表
        HSSFSheet sheet = workbook.createSheet("用户信息导出excel");
        // 创建行
        HSSFRow row = sheet.createRow(0);
        // 创建单元格样式
        HSSFCellStyle cellStyle = workbook.createCellStyle();
        // 表头
        String[] head = {"id", "用户名", "电话", "邮箱", "个人介绍", "密码", "头像地址", "类型", "加入时间", "是否激活", "经纪机构id"};
        HSSFCell cell;
        // 设置表头
        for (int iHead = 0; iHead < head.length; iHead++) {
            cell = row.createCell(iHead);
            cell.setCellValue(head[iHead]);
            cell.setCellStyle(cellStyle);
        }
        // 设置表格内容
        for (int iBody = 0; iBody < userList.size(); iBody++) {
            row = sheet.createRow(iBody + 1);
            User u = userList.get(iBody);
            String[] userArray = new String[11];
            userArray[0] = u.getId() + "";
            userArray[1] = u.getName();
            userArray[2] = u.getPhone();
            userArray[3] = u.getEmail();
            userArray[4] = u.getAboutme();
            userArray[5] = u.getPasswd();
            userArray[6] = u.getAvatar();
            userArray[7] = u.getType() == 1 ? "普通用户" : "经纪人";
            userArray[8] = u.getCreateTime() + "";
            userArray[9] = u.getEnable() == 1 ? "已激活" : "未激活";
            userArray[10] = u.getAgencyId() + "";
            for (int iArray = 0; iArray < userArray.length; iArray++) {
                row.createCell(iArray).setCellValue(userArray[iArray]);
            }
        }
        // 生成Excel文件
        FileUtil.createFile(response, workbook, "用户信息数据导出");
    }
}
