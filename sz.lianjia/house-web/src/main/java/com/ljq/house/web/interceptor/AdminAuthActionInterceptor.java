package com.ljq.house.web.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import com.ljq.house.common.model.Admin;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;

/**
 * @Author: ljq
 * @Date: 19-1-3 下午1:48
 */
@Component
public class AdminAuthActionInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        Admin admin = AdminContext.getAdmin();
        if (admin == null) {
            String msg = URLEncoder.encode("请先登录", "utf-8");
            String target = URLEncoder.encode(request.getRequestURL().toString(), "utf-8");
            if ("GET".equalsIgnoreCase(request.getMethod())) {
                response.sendRedirect("/admin/login?errorMsg=" + msg + "&target=" + target);
                return false;
            } else {
                response.sendRedirect("/admin/login?errorMsg=" + msg);
                return false;
            }
        }
        return true;

    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {

    }

}
