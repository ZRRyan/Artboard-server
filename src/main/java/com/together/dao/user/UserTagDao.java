package com.together.dao.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.together.pojo.user.UserTag;

public interface UserTagDao {
	int insertUserTag(UserTag userTag);
	
	List<UserTag> queryUserTags(@Param("uid") Integer uid);
}
