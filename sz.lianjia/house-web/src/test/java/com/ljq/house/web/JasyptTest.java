package com.ljq.house.web;

import org.jasypt.encryption.StringEncryptor;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

/**
 * @Author: ljq
 * @Date: 18-12-28 下午9:04
 */

@RunWith(SpringRunner.class)
@SpringBootTest
@WebAppConfiguration
public class JasyptTest {

    @Autowired
    StringEncryptor encryptor;

    @Test
    public void getResult() {
        String url = encryptor.encrypt("jdbc:mysql://127.0.0.1:3306/houses?useSSL=true&characterEncoding=utf-8" +
                "&zeroDateTimeBehavior=convertToNull&useUnicode=true");
        String name = encryptor.encrypt("root");
        String password = encryptor.encrypt("19981028");
        System.out.println(url);
        System.out.println(name);
        System.out.println(password);
        Assert.assertTrue(name.length() > 0);
        Assert.assertTrue(password.length() > 0);
    }
}
