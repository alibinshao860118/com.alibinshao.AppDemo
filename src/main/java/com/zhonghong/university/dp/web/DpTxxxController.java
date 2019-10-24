/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.dp.web;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zhonghong.fdp.common.persistence.Page;
import com.zhonghong.fdp.common.web.BaseController;

import com.zhonghong.university.dp.entity.DpTxxx;
import com.zhonghong.university.dp.service.DpTxxxService;

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
@RequestMapping(value = "${adminPath}/dp/dpTxxx")
public class DpTxxxController extends BaseController{

	@Autowired
	private DpTxxxService dpTxxxService;
	
	/**
	 * 进入查询界面
	 * @param dpTxxx DpTxxx 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("dp:dpTxxx:view")
	@RequestMapping(value = {"list"})
	public String list(DpTxxx dpTxxx, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("dpTxxx", dpTxxx);
		return "modules/dp/dpTxxx/dpTxxxList";
	}
	
	/**
	 * 查询
	 * @param dpTxxx DpTxxx 
	 * @param request
	 * @param response
	 * @return Page<DpTxxx>
	 */
	@RequiresPermissions("dp:dpTxxx:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<DpTxxx> query(DpTxxx dpTxxx,HttpServletRequest request, HttpServletResponse response) {
		Page<DpTxxx> page = this.dpTxxxService.findPage(dpTxxx); 
		return page;
	}
	
    /**
	 * 新增
	 * @param entity DpTxxx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("dp:dpTxxx:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(DpTxxx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.dpTxxxService.insert(entity);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity DpTxxx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("dp:dpTxxx:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(DpTxxx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.dpTxxxService.update(entity);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param dpTxxx DpTxxx 
	 * @return String
	 */
	@RequiresPermissions("dp:dpTxxx:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(DpTxxx entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.dpTxxxService.delete(entity);
		
		return map;
	}

}
