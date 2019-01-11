package com.ljq.house.common.utils;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * @Author: ljq
 * @Date: 19-1-8 下午11:44
 */
@WebListener
public class OnLineCount implements HttpSessionListener {
    public static int count = 0;//记录session的数量

    //监听session的创建,synchronized防并发bug
    public synchronized void sessionCreated(HttpSessionEvent arg0) {
        count++;
        arg0.getSession().getServletContext().setAttribute("count", count);
    }

    @Override
    public synchronized void sessionDestroyed(HttpSessionEvent arg0) {//监听session的撤销
        count--;
        arg0.getSession().getServletContext().setAttribute("count", count);
    }
}
