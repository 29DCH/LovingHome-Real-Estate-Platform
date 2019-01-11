package com.ljq.house.common.model;

/**
 * @Author: ljq
 * @Date: 18-12-26 下午8:28
 */

import java.util.Date;
import java.util.List;

import com.google.common.collect.Lists;

public class Blog {
    private Integer id;
    private String tags;
    private String content;
    private String title;
    private Date createTime;
    private String digest;

    private List<String> tagList = Lists.newArrayList();

    public Blog() {
    }

    public Blog(Integer id, String tags, String content, String title, Date createTime, String digest, List<String>
            tagList) {
        this.id = id;
        this.tags = tags;
        this.content = content;
        this.title = title;
        this.createTime = createTime;
        this.digest = digest;
        this.tagList = tagList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getDigest() {
        return digest;
    }

    public void setDigest(String digest) {
        this.digest = digest;
    }

    public List<String> getTagList() {
        return tagList;
    }

    public void setTagList(List<String> tagList) {
        this.tagList = tagList;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "id=" + id +
                ", tags='" + tags + '\'' +
                ", content='" + content + '\'' +
                ", title='" + title + '\'' +
                ", createTime=" + createTime +
                ", digest='" + digest + '\'' +
                ", tagList=" + tagList +
                '}';
    }
}
