
package com.alibinshao.zhonghong.university.common.msg;

import java.util.HashMap;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cloopen.rest.sdk.CCPRestSDK;
import com.github.pagehelper.util.StringUtil;

/** 
* 发送短信的service
* @author liangbinbin 
* @version 创建时间：2017年4月12日 下午4:34:10 
*
*/
@Service
@Transactional(readOnly = false)
public class MsgSendService {
	/**
	 * 通过properties配置的信息
	 */
	@Value("${msg.weburl}")  
	private String weburl;
	@Value("${msg.port}")  
	private String port;
	@Value("${msg.accountSid}")  
	private String accountSid;
	@Value("${msg.accountToken}")  
	private String accountToken;
	@Value("${msg.appId}")  
	private String appId;
	@Value("${msg.templateId}")  
	private String templateId;
	
	private static final Log log =LogFactory.getLog(MsgSendService.class);
	/**
	 * 
	 * @param sjhm
	 * @param dxnr
	 */
	public String sendDx(String sjhm,String templateId1,String dxnr){
		String msg="";//接受发送短信的消息内容
		HashMap<String, Object> result = null;

		CCPRestSDK restAPI = new CCPRestSDK();
		restAPI.init(weburl, port);// 初始化服务器地址和端口，格式如下，服务器地址不需要写https://
		restAPI.setAccount(accountSid,accountToken);// 初始化主帐号和主帐号TOKEN
		restAPI.setAppId(appId);// 初始化应用ID
		String[] dxnrTemplate=new String[]{dxnr};
		if(StringUtil.isEmpty(templateId1)){
			templateId1=templateId;//如果页面没传模板id,则用配置文件的模板
		}
		result = restAPI.sendTemplateSMS(sjhm,templateId1,dxnrTemplate);

		log.info("SDKTestSendTemplateSMS result=" + result);
		
		if("000000".equals(result.get("statusCode"))){
			//正常返回输出data包体信息（map）
			HashMap<String,Object> data = (HashMap<String, Object>) result.get("data");
			Set<String> keySet = data.keySet();
			for(String key:keySet){
				Object object = data.get(key);
				log.info(key +" = "+object);
			}
			msg="发送成功！";
		}else{
			//异常返回输出错误码和错误信息
			msg="错误码=" + result.get("statusCode") +" 错误信息= "+result.get("statusMsg");
			log.info(msg);
		}
		return msg;
	}

	
}
