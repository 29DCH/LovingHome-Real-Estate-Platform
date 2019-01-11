package com.ljq.house.biz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ljq.house.common.model.Agency;
import com.ljq.house.common.model.User;
import com.ljq.house.common.page.PageParams;

/**
 * @Author: ljq
 * @Date: 18-12-26 下午9:44
 */
public interface AgencyMapper {

    List<Agency> select(Agency agency);

    int insert(Agency agency);

    List<User> selectAgent(@Param("user") User user, @Param("pageParams") PageParams pageParams);

    Long selectAgentCount(@Param("user") User user);
}
