package com.ljq.house.biz.service;

import java.util.List;

import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import com.ljq.house.biz.mapper.BlogMapper;
import com.ljq.house.common.model.Blog;
import com.ljq.house.common.page.PageData;
import com.ljq.house.common.page.PageParams;

/**
 * @Author: ljq
 * @Date: 18-12-27 下午3:29
 */

@Service
public class BlogService {
    @Autowired
    private BlogMapper blogMapper;

    public PageData<Blog> queryBlog(Blog query, PageParams params) {
        List<Blog> blogs = blogMapper.selectBlog(query, params);
        populate(blogs);
        Long count = blogMapper.selectBlogCount(query);
        return PageData.buildPage(blogs, count, params.getPageSize(), params.getPageNum());
    }

    private void populate(List<Blog> blogs) {
        if (!blogs.isEmpty()) {
            blogs.stream().forEach(item -> {
                String stripped = Jsoup.parse(item.getContent()).text();
                item.setDigest(stripped.substring(0, Math.min(stripped.length(), 40)));
                String tags = item.getTags();
                item.getTagList().addAll(Lists.newArrayList(Splitter.on(",").split(tags)));
            });
        }
    }

    public Blog queryOneBlog(int id) {
        Blog query = new Blog();
        query.setId(id);
        List<Blog> blogs = blogMapper.selectBlog(query, new PageParams(1, 1));
        if (!blogs.isEmpty()) {
            return blogs.get(0);
        }
        return null;
    }

    public void deleteBlogById(Integer id) {
        blogMapper.delete(id);
    }

    public Integer insertblog(Blog blog) {
        return blogMapper.insert(blog);
    }

    public Long getCount() {
        return blogMapper.selectCount();
    }

    public List<Blog> getAllBlog() {
        return blogMapper.selectAllBlog();
    }
}
