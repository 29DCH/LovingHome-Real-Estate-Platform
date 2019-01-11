package com.ljq.house.web;

import com.ljq.house.biz.service.RecommendService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.test.context.junit4.SpringRunner;

import com.ljq.house.biz.service.UserService;
import com.ljq.house.common.model.User;

/**
 * @Author: ljq
 * @Date: 18-12-26 下午8:05
 */
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = WebEnvironment.DEFINED_PORT)
public class AuthTest {
    @Autowired
    private UserService userService;

    /*@Test
    public void testAuth() {
        User user = userService.auth("jgcs12345@163.com", "1234567");
        assert user != null;
        System.out.println(user.getAboutme());
    }*/

    @Autowired
    private RecommendService recommendService;

    @Test
    public void test()
    {
        System.out.println(recommendService.getPercentage(10));
    }
}
