package com.ljq.house.admin.controller;

import com.ljq.house.biz.service.BlogService;
import com.ljq.house.common.model.Blog;
import com.ljq.house.common.page.PageData;
import com.ljq.house.common.page.PageParams;
import com.ljq.house.common.result.ResultMsg;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


/**
 * @Author: ljq
 * @Date: 19-1-7 下午8:56
 */
@Controller
@RequestMapping("/admin")
public class AdminBlogController {

    @Autowired
    private BlogService blogService;

    @RequestMapping(value = "/adminblog/list")
    public String bloglist(ModelMap modelMap) {
        List<Blog> ps = blogService.getAllBlog();
        Long count = blogService.getCount();
        modelMap.put("ps", ps);
        modelMap.put("count", count);
        return "admin/blog-list";
    }

    @RequestMapping("/adminblog/delete")
    public String deleteblog(@Param("id") Integer id) {
        blogService.deleteBlogById(id);
        return "redirect:/admin/adminblog/list?id=" + id + ResultMsg.successMsg("删除成功").asUrlParams();
    }

    @RequestMapping("/adminblog/toAdd")
    public String blog_toAdd(ModelMap modelMap) {
        return "admin/blog-add";
    }

    @RequestMapping("/adminblog/add")
    public String blog_add(Blog blog, ModelMap modelMap) {
        blogService.insertblog(blog);
        return "redirect:/admin/adminblog/list";
    }
}
