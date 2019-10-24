package com.zhonghong.university.zp.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhonghong.fdp.common.web.BaseController;
import com.zhonghong.university.common.msg.MsgSendService;
/**
 * 招聘发送短信控制器
 * @author liangbinbin
 *
 */

@Controller
@RequestMapping(value = "${adminPath}/zp")
public class ZpMsgSendController extends BaseController{

	@Autowired
	protected MsgSendService msgSendService;
	
	/**
	 * 始初化加载部门树。
	 * @return List
	 */
	@RequestMapping("zpMsgSend.do")
	@ResponseBody
	public String sendMsg(@RequestParam("sjhm") String sjhm,
			@RequestParam("templateId") String templateId,
			@RequestParam("dxnr") String dxnr	) {
		String msg = msgSendService.sendDx(sjhm, templateId, dxnr);
		return msg;
	}
	
	
	
	
}
