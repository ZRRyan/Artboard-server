package com.together.util;

import java.util.UUID;

public class UUIDUtils {
	/**
	 * 获取一个UUID
	 */
	public static String getUUID(){
		UUID uuid = UUID.randomUUID();
		return uuid.toString();
	}
}
