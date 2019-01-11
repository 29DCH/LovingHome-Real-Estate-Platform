package com.ljq.house.biz.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.ljq.house.common.model.User;

import java.util.List;

/**
 * @Author: ljq
 * @Date: 18-12-26 下午7:50
 */

public interface UserMapper {

    public List<User> selectUsers();

    public int insert(User account);

    public void delete(String email);

    public int update(User updateUser);

    public List<User> selectUsersByQuery(User user);

    public long selectUserCount();
}
