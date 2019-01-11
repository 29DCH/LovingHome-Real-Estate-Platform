package com.ljq.house.web.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class WebMvcConf extends WebMvcConfigurerAdapter {

    @Autowired
    private AuthActionInterceptor authActionInterceptor;

    @Autowired
    private AuthInterceptor authInterceptor;

    @Autowired
    private AdminAuthActionInterceptor adminAuthActionInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authInterceptor).excludePathPatterns("/static").addPathPatterns("/**");
        registry
                .addInterceptor(authActionInterceptor).addPathPatterns("/house/toAdd")
                .addPathPatterns("/accounts/profile").addPathPatterns("/accounts/profileSubmit")
                .addPathPatterns("/house/bookmarked").addPathPatterns("/house/del")
                .addPathPatterns("/house/ownlist").addPathPatterns("/house/add")
                .addPathPatterns("/house/toAdd").addPathPatterns("/agency/agentMsg")
                .addPathPatterns("/comment/leaveComment").addPathPatterns("/comment/leaveBlogComment");
        registry
                .addInterceptor(adminAuthActionInterceptor).addPathPatterns("/admin/adminuser/toUpdate").addPathPatterns("/admin/adminuser/update")
                .addPathPatterns("/admin/adminuser/delete").addPathPatterns("/admin/adminuser/toChangepwd")
                .addPathPatterns("/admin/adminuser/changepwd").addPathPatterns("/admin/admincommunity/list")
                .addPathPatterns("/admin/admincommunity/toAdd").addPathPatterns("/admin/admincommunity/toUpdate")
                .addPathPatterns("/admin/admincommunity/update").addPathPatterns("/admin/admincommunity/delete")
                .addPathPatterns("/admin/adminuser/search").addPathPatterns("/admin/index")
                .addPathPatterns("/admin/index/welcome").addPathPatterns("/admin/adminhouse/list")
                .addPathPatterns("/admin/adminhouse/toAdd").addPathPatterns("/admin/adminhouse/add")
                .addPathPatterns("/admin/adminhouse/delete").addPathPatterns("/admin/statistics/hot")
                 .addPathPatterns("/admin/user/list")
                .addPathPatterns("/admin/user/select").addPathPatterns("/admin/user/toUpdate")
                .addPathPatterns("/admin/user/update").addPathPatterns("/admin/user/toChangepwd")
                .addPathPatterns("/admin/user/changepwd").addPathPatterns("/admin/user/delete");
        super.addInterceptors(registry);
    }


}
