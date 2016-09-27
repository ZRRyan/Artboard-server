package com.together.service.impl;

import java.util.Date;
import java.util.List;

import org.hamcrest.core.IsEqual;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.together.dao.user.UserDao;
import com.together.dao.user.UserTagDao;
import com.together.pojo.user.User;
import com.together.pojo.user.UserTag;
import com.together.service.UserService;
import com.together.util.MD5Utils;
import com.together.util.UUIDUtils;

import redis.clients.jedis.Jedis;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	@Autowired
	private UserTagDao userTagDao;
	@Autowired
	private Jedis jedis;
	
	public void addUser(String tel, String pass, String code, String nickName, String birthday, Integer sex, Integer provinceId, Integer cityId, Integer regionId, Integer avatarId, String[] tags) {
		
		
		User user = new User();
		user.setTelephone(tel);
		user.setPassword(MD5Utils.EncoderByMd5(pass));
		user.setNickname(nickName);
		user.setBirthday(birthday);
		user.setSex(sex);
		user.setProvince_id(provinceId);
		user.setCity_id(cityId);
		user.setRegion_id(regionId);
		user.setAvatar(avatarId);
		user.setAdd_time(new Date());

		
		userDao.insertUser(user);
		Integer uid = user.getUid();
		if	(tags != null && tags.length > 0 && uid != null) {
			for (String tag : tags) {
				UserTag userTag = new UserTag();
				userTag.setTag(tag);
				userTag.setUid(uid);
				userTagDao.insertUserTag(userTag);
			}
		}	
	}
	
	
	public User login(String tel, String pass) {
		String md5Pass = MD5Utils.EncoderByMd5(pass);
		User user = userDao.login(tel, md5Pass);
		if (user != null) {
			jedis.set(user.getUid() + "", user.getUid() + "");
			String token = UUIDUtils.getUUID();
			jedis.set(user.getUid() + ":token", token);
			jedis.expire(user.getUid() + ":token", 30 * 24 * 60 * 60);
			user.setToken(token);			
			
			List<String>userTags = user.getTags();
			
			Integer uid = user.getUid();
			List<UserTag> tags = userTagDao.queryUserTags(uid);
			
			for (UserTag userTag : tags) {
				String tagName = userTag.getTag();
				userTags.add(tagName);
			}
			
		}
		return user;
	}
	
	
	public Boolean checkToken(Integer uid, String token) {
		String oldToken = jedis.get(uid + ":token");
		
		if (token.equals(oldToken)) {
			return true;
		}	
		return false;
	}

	public User getUser(String tel) {
		User user = userDao.selectByTel(tel);
		return user;
		
	}
	
	
}
