package com.ljq.house.web.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ljq.house.common.model.Admin;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.base.Joiner;
import com.ljq.house.common.constants.CommonConstants;
import com.ljq.house.common.model.User;

@Component
public class AuthInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        Map<String, String[]> map = request.getParameterMap();
        map.forEach((k, v) -> {
            if (k.equals("errorMsg") || k.equals("successMsg") || k.equals("target")) {
                request.setAttribute(k, Joiner.on(",").join(v));
            }
        });
        String reqUri = request.getRequestURI();
        if (reqUri.startsWith("/static") || reqUri.startsWith("/error")) {
            return true;
        }
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute(CommonConstants.USER_ATTRIBUTE);
        Admin admin =(Admin) session.getAttribute(CommonConstants.ADMIN_ATTRIBUTE);
        if (user != null) {
            UserContext.setUser(user);
        }
        if(admin != null){
            AdminContext.setAdmin(admin);
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
        UserContext.remove();
        AdminContext.remove();
    }


}
