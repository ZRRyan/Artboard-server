package com.together.service;

import java.util.List;

import com.together.pojo.user.User;


public interface UserService {
	
	
	public void addUser(String tel, String pass, String code, String nickName, String birthday, Integer sex, Integer provinceId, Integer cityId, Integer regionId, Integer avatarId, String[] tags);
	

	public User login(String tel, String pass);
	
	public Boolean checkToken(Integer uid, String token);
	
	public User getUser(String tel);
}
