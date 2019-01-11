package com.ljq.house.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogFilter implements Filter {
    private Logger logger = LoggerFactory.getLogger(LogFilter.class);

    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
//        logger.info("Request--coming");
        chain.doFilter(request, response);
    }

    public void destroy() {

    }

}
