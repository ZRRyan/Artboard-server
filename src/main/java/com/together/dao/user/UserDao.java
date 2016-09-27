package com.together.dao.user;

import org.apache.ibatis.annotations.Param;

import com.together.pojo.user.User;

public interface UserDao {
	int insertUser(User user);
	
	User login(@Param("tel") String tel,@Param("pass") String pass);
	
	User selectByTel(@Param("tel") String tel);
}
