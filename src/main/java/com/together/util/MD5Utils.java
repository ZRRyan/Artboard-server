package com.together.util;

import java.io.UnsupportedEncodingException;
import sun.misc.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Utils {
	public static String EncoderByMd5(String str) {
		// 确定计算方法
		MessageDigest md5;
		String newstr ="";
		try {
			md5 = MessageDigest.getInstance("MD5");
		
			BASE64Encoder base64en = new BASE64Encoder();
		// 加密后的字符串
			newstr= base64en.encode(md5.digest(str.getBytes("utf-8")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newstr;
	}
}
