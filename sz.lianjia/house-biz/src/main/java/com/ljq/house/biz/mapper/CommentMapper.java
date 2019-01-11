package com.ljq.house.biz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ljq.house.common.model.Comment;
import com.ljq.house.common.model.Community;
import com.ljq.house.common.model.House;
import com.ljq.house.common.model.UserMsg;
import com.ljq.house.common.page.PageParams;
import org.apache.ibatis.annotations.Select;

/**
 * @Author: ljq
 * @Date: 18-12-26 下午9:36
 */

public interface CommentMapper {

    List<House> selectHouse(@Param("house") House query, @Param("pageParams") PageParams pageParams);

    Long selectHouseCount(@Param("house") House query);

    List<Community> selectCommunity(Community community);

    int insertUserMsg(UserMsg userMsg);

    int updateHouse(House house);

    int insert(Comment comment);

    List<Comment> selectComments(@Param("houseId") long houseId, @Param("size") int size);

    List<Comment> selectBlogComments(@Param("blogId") long blogId, @Param("size") int size);

    @Select("SELECT * FROM comment")
    List<Comment> selectAllComments();

    @Select("SELECT COUNT(*) FROM comment")
    Long selectCount();

    @Delete("DELETE FROM comment WHERE ID = #{id}")
    void delete(Integer id);
}
