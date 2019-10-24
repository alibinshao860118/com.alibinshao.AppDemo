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

import com.zhonghong.university.rygl.entity.RyJtcy;
import com.zhonghong.university.rygl.service.RyJtcyService;

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
@RequestMapping(value = "${adminPath}/rygl/ryJtcy")
public class RyJtcyController extends BaseController{

	@Autowired
	private RyJtcyService ryJtcyService;
	
	/**
	 * 进入查询界面
	 * @param ryJtcy RyJtcy 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("rygl:ryJtcy:view")
	@RequestMapping(value = {"list"})
	public String list(RyJtcy ryJtcy, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("ryJtcy", ryJtcy);
		return "modules/rygl/ryJtcy/ryJtcyList";
	}
	
	/**
	 * 进入查询界面
	 * @param ryJtcy RyJtcy 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("rygl:ryJtcy:view")
	@RequestMapping(value = {"toView"})
	public String toView(RyJtcy ryJtcy, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("ryJtcy", ryJtcy);
		return "modules/rygl/ryJtcy/ryJtcyListView";
	}
	
	/**
	 * 查询
	 * @param ryJtcy RyJtcy 
	 * @param request
	 * @param response
	 * @return Page<RyJtcy>
	 */
	@RequiresPermissions("rygl:ryJtcy:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<RyJtcy> query(RyJtcy ryJtcy,HttpServletRequest request, HttpServletResponse response) {
		Page<RyJtcy> page = this.ryJtcyService.findPage(ryJtcy); 
		return page;
	}
	
    /**
	 * 新增
	 * @param entity RyJtcy 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("rygl:ryJtcy:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(RyJtcy entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.ryJtcyService.insert(entity);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity RyJtcy 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("rygl:ryJtcy:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(RyJtcy entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.ryJtcyService.update(entity);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param ryJtcy RyJtcy 
	 * @return String
	 */
	@RequiresPermissions("rygl:ryJtcy:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(RyJtcy entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.ryJtcyService.delete(entity);
		
		return map;
	}

}
