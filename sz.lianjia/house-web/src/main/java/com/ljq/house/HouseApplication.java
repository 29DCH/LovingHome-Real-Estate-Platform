package com.ljq.house;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.scheduling.annotation.EnableAsync;


@SpringBootApplication
@com.ljq1.house.autoconfig.EnableHttpClient
@EnableAsync
@MapperScan(basePackages = {"com.ljq.house.biz.mapper"})
@ServletComponentScan
public class HouseApplication {
    public static void main(String[] args) {
        SpringApplication.run(HouseApplication.class, args);
    }
}
