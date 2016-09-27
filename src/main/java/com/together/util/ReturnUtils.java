package com.together.util;


import java.util.Date;

import com.together.common.returndata.ReturnData;

public class ReturnUtils {
	
	public static void setData(ReturnData returnData,Object obj,int code){
		returnData.setData(obj);
		returnData.setDate(new Date());
		returnData.setCode(code);
	}
}
