package com.ljq.house.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class Errorhandler {
    private static final Logger logger = LoggerFactory.getLogger(Errorhandler.class);

    @ExceptionHandler(value = {Exception.class, RuntimeException.class})
    public String error500(HttpServletRequest request, Exception e) {
        logger.error(e.getMessage(), e);
        logger.error(request.getRequestURL() + "encounter 500");
        return "error/500";
    }
}
