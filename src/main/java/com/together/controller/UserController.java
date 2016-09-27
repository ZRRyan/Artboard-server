package com.together.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.fabric.xmlrpc.base.Param;
import com.together.common.returndata.ReturnData;
import com.together.common.web.Constants;
import com.together.pojo.user.User;
import com.together.pojo.user.UserTag;
import com.together.service.UserService;
import com.together.util.ReturnUtils;

import redis.clients.jedis.Jedis;

@Controller
@RequestMapping(value = "/api/User")
public class UserController {

	@Autowired
	private Jedis jedis;
	@Autowired
	private UserService userService;

	Param param = new Param();
	
	public Param getParam() {
		return param;
	}

	public void setParam(Param param) {
		this.param = param;
	}

	@RequestMapping("/register.do")
	public @ResponseBody ReturnData register(String tel, String pass, String code, String nickName, String birthday, Integer sex, Integer provinceId, Integer cityId, Integer regionId, Integer avatarId, String[] tags) {
		
		ReturnData returnData = new ReturnData();
		
		if (tel == null || pass == null || code == null || nickName == null || birthday == null || sex == null) {
			returnData.setCode(Constants.ARTBORARD_RETURN_PARAM_ERROR);
			returnData.setMsg("参数错误");
			returnData.setDate(new Date());
			return returnData;
		}
		
		User user = userService.getUser(tel);
		if (user != null) {
			returnData.setMsg("该手机号已经被注册");
			ReturnUtils.setData(returnData, null, Constants.ARTBORARD_RETURN_OTHER_ERROR);
			return returnData;
		}
		
		
		userService.addUser(tel, pass, code, nickName, birthday, sex, provinceId, cityId, regionId, avatarId, tags);
	
		ReturnUtils.setData(returnData, null, Constants.ARTBORARD_RETURN_SUCESS);
		
		return returnData;
	}

	@RequestMapping("/login.do")
	public @ResponseBody ReturnData login(String tel, String pass) {
		
		ReturnData returnData = new ReturnData();
		
		if (tel == null || pass == null) {
			returnData.setCode(Constants.ARTBORARD_RETURN_PARAM_ERROR);
			returnData.setMsg("参数错误");
			returnData.setDate(new Date());
			return returnData;
		}
		
		
		User user = userService.login(tel, pass);
		
		if(user == null) {
			returnData.setMsg("手机号或密码不正确");
			returnData.setDate(new Date());
			returnData.setCode(Constants.ARTBORARD_RETURN_OTHER_ERROR);
		} else {
			Map<String, Object> totalData = new HashMap<String, Object>();
			
			totalData.put("uid", user.getUid());
			totalData.put("nickName", user.getNickname());
			totalData.put("token", user.getToken());
			totalData.put("sex", user.getSex());
			totalData.put("avatar", user.getAvatar());
			totalData.put("signature", user.getSignature());
			totalData.put("birthday", user.getBirthday());
			totalData.put("tel", user.getTelephone());
			totalData.put("region", "天津");
			ReturnUtils.setData(returnData, totalData, Constants.ARTBORARD_RETURN_SUCESS);
		}
		
		return returnData;
	}
	
	@RequestMapping("checkToken.do")
	public @ResponseBody ReturnData checkToken (Integer uid, String token) {
		ReturnData returnData = new ReturnData();
		
	    Boolean tokenxpired = userService.checkToken(uid, token);
	    
	    if	(tokenxpired) {
	    	ReturnUtils.setData(returnData, null, Constants.ARTBORARD_RETURN_SUCESS);
	    } else {
	    	returnData.setMsg("token过期");
	 	    ReturnUtils.setData(returnData, null, Constants.ARTBORARD_RETURN_TOKEN_ERROR);
	 	   return returnData;
	    }
	    
	    return returnData;
	}
	
	@RequestMapping("modifyPass.do")
	public @ResponseBody ReturnData modifyPass (Integer uid, String token, String oldPass, String newPass) {
		ReturnData returnData = new ReturnData();
		
		if (uid == null || token == null || oldPass == null || newPass == null) {
			returnData.setMsg("参数错误");
	 	    ReturnUtils.setData(returnData, null, Constants.ARTBORARD_RETURN_PARAM_ERROR);
	 	    return returnData;	
		}
		
		if (!userService.checkToken(uid, token)) { // token不正确，过期
			returnData.setMsg("token过期");
	 	    ReturnUtils.setData(returnData, null, Constants.ARTBORARD_RETURN_TOKEN_ERROR);
	 	    return returnData;
		} 
		
		return returnData;	
	}
	
	@RequestMapping("resetPass.do")
	public @ResponseBody ReturnData resetPass (String tel, String code, String newPass) {
		ReturnData returnData = new ReturnData();
		
		return returnData;	
	}
	
	@RequestMapping("/modifyInfomation.do")
	public @ResponseBody ReturnData modifyInfomation(Integer uid, String token, String tel, String pass, String nickName, String birthday, Integer sex, Integer provinceId, Integer cityId, Integer regionId, Integer avatarId) {
		ReturnData returnData = new ReturnData();
		
		if (uid == null || token == null) {
			returnData.setMsg("参数错误");
	 	    ReturnUtils.setData(returnData, null, Constants.ARTBORARD_RETURN_PARAM_ERROR);
	 	    return returnData;	
		}
		
		if (!userService.checkToken(uid, token)) { // token不正确，过期
			returnData.setMsg("token过期");
	 	    ReturnUtils.setData(returnData, null, Constants.ARTBORARD_RETURN_TOKEN_ERROR);
	 	    return returnData;	
		} 
		
		return returnData;	
	}
	
	@RequestMapping("/modifyUserTag.do")
	public @ResponseBody ReturnData modifyUserTag(Integer uid, String token, String[] tags) {
		ReturnData returnData = new ReturnData();
		
		if (uid == null || token == null) {
			returnData.setMsg("参数错误");
	 	    ReturnUtils.setData(returnData, null, Constants.ARTBORARD_RETURN_PARAM_ERROR);
	 	    return returnData;	
		}
		
		if (!userService.checkToken(uid, token)) { // token不正确，过期
			returnData.setMsg("token过期");
	 	    ReturnUtils.setData(returnData, null, Constants.ARTBORARD_RETURN_TOKEN_ERROR);
	 	    return returnData;
		} 
		
		return returnData;	
	}
	
}
