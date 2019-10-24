/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.rygl.web;

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

import com.zhonghong.university.rygl.entity.RyGzjl;
import com.zhonghong.university.rygl.service.RyGzjlService;

/**
 * <pre>
 * Controller控制层类
 * </pre>
 * @author liangbinbin 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
@Controller
@RequestMapping(value = "${adminPath}/rygl/ryGzjl")
public class RyGzjlController extends BaseController{

	@Autowired
	private RyGzjlService ryGzjlService;
	
	/**
	 * 进入查询界面
	 * @param ryGzjl RyGzjl 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("rygl:ryGzjl:view")
	@RequestMapping(value = {"list"})
	public String list(RyGzjl ryGzjl, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("ryGzjl", ryGzjl);
		return "modules/rygl/ryGzjl/ryGzjlList";
	}
	
	/**
	 * 进入查询界面
	 * @param ryGzjl RyGzjl 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("rygl:ryGzjl:view")
	@RequestMapping(value = {"toView"})
	public String toView(RyGzjl ryGzjl, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("ryGzjl", ryGzjl);
		return "modules/rygl/ryGzjl/ryGzjlListView";
	}
	
	/**
	 * 查询
	 * @param ryGzjl RyGzjl 
	 * @param request
	 * @param response
	 * @return Page<RyGzjl>
	 */
	@RequiresPermissions("rygl:ryGzjl:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<RyGzjl> query(RyGzjl ryGzjl,HttpServletRequest request, HttpServletResponse response) {
		Page<RyGzjl> page = this.ryGzjlService.findPage(ryGzjl); 
		return page;
	}
	
    /**
	 * 新增
	 * @param entity RyGzjl 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("rygl:ryGzjl:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(RyGzjl entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.ryGzjlService.insert(entity);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity RyGzjl 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("rygl:ryGzjl:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(RyGzjl entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.ryGzjlService.update(entity);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param ryGzjl RyGzjl 
	 * @return String
	 */
	@RequiresPermissions("rygl:ryGzjl:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(RyGzjl entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.ryGzjlService.delete(entity);
		
		return map;
	}

}
