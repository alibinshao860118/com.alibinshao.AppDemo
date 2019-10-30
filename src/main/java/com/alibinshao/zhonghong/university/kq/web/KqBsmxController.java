/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.kq.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibinshao.zhonghong.fdp.common.persistence.Page;
import com.alibinshao.zhonghong.fdp.common.web.BaseController;
import com.alibinshao.zhonghong.university.kq.entity.KqBsmx;
import com.alibinshao.zhonghong.university.kq.service.KqBsmxService;

/**
 * <pre>
 * Controller控制层类
 * </pre>
 * @author gulong 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
@Controller
@RequestMapping(value = "${adminPath}/kq/kqBsmx")
public class KqBsmxController extends BaseController{

	@Autowired
	private KqBsmxService kqBsmxService;
	
	/**
	 * 进入查询界面
	 * @param kqBsmx KqBsmx 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("kq:kqBsmx:view")
	@RequestMapping(value = {"list"})
	public String list(KqBsmx kqBsmx, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("kqBsmx", kqBsmx);
		return "modules/kq/kqBsmx/kqBsmxList";
	}
	
	/**
	 * 查询
	 * @param kqBsmx KqBsmx 
	 * @param request
	 * @param response
	 * @return Page<KqBsmx>
	 */
	@RequiresPermissions("kq:kqBsmx:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<KqBsmx> query(KqBsmx kqBsmx,HttpServletRequest request, HttpServletResponse response) {
		Page<KqBsmx> page = this.kqBsmxService.findPage(kqBsmx); 
		return page;
	}
	
    /**
	 * 新增
	 * @param entity KqBsmx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("kq:kqBsmx:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(KqBsmx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.kqBsmxService.insert(entity);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity KqBsmx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("kq:kqBsmx:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(KqBsmx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.kqBsmxService.update(entity);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param kqBsmx KqBsmx 
	 * @return String
	 */
	@RequiresPermissions("kq:kqBsmx:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(KqBsmx entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.kqBsmxService.delete(entity);
		
		return map;
	}

}
