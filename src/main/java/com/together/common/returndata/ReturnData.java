package com.together.common.returndata;

import java.io.Serializable;
import java.util.Date;

public class ReturnData implements Serializable {
	private Object data;
	private String msg;
	private Integer code;
	private Date date;
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
}
