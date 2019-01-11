package com.ljq.house.common.page;

import java.util.List;

/**
 * @Author: ljq
 * @Date: 18-12-26 下午9:16
 */
public class PageData<T> {
    private List<T> list;
    private Pagination pagination;//pageNum,pageSize,page list

    public PageData(Pagination pagination, List<T> list) {
        this.pagination = pagination;
        this.list = list;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public static <T> PageData<T> buildPage(List<T> list, Long count, Integer pageSize, Integer pageNum) {
        Pagination _pagination = new Pagination(pageSize, pageNum, count);
        return new PageData<>(_pagination, list);
    }
}