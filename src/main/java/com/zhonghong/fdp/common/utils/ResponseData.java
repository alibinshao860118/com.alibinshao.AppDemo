package com.zhonghong.fdp.common.utils;

import lombok.Data;

@Data
public class ResponseData {
	public static final String SYSTEM_EXCEPTION = "Please contact the administrator.";
	public static final String MSG_ERROR_APPROVE_COMMENTS = "msg error approve comments";

	public void findMessage() {
		
	}

	// 返回信息
	private String msg;
	
	private boolean success = true;
	
	

}
