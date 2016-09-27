package com.together.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.BeanUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

public class ParamUtils {
	public static List<Object> getList(Object obj, String... keys) {
		List<Object> list =new ArrayList<Object>();
		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			request.setCharacterEncoding("UTF-8");
			BufferedReader br = new BufferedReader(
					new InputStreamReader((ServletInputStream) request.getInputStream(), "UTF-8"));
			String line = null;
			StringBuilder sb = new StringBuilder();
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}
			String reqBody = sb.toString();
			System.out.println("reqbody" + reqBody);
			if (reqBody != null && !"".equals(reqBody)) {
//				String replace = reqBody.replace("\\", "");
				Object obj1 = JSON.parseObject(reqBody, obj.getClass());
				BeanUtils.copyProperties(obj1, obj);
			}
			JSONObject jsonObj = JSON.parseObject(reqBody);
			if (jsonObj != null) {
					for (String key : keys) {
						Object jsonArray = jsonObj.get(key);
						list.add(jsonArray);
					}
				
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
