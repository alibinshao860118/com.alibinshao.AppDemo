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

import com.zhonghong.university.dp.entity.DpDdxx;
import com.zhonghong.university.dp.service.DpDdxxService;

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
@RequestMapping(value = "${adminPath}/dp/dpDdxx")
public class DpDdxxController extends BaseController{

	@Autowired
	private DpDdxxService dpDdxxService;
	
	/**
	 * 进入查询界面
	 * @param dpDdxx DpDdxx 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("dp:dpDdxx:view")
	@RequestMapping(value = {"list"})
	public String list(DpDdxx dpDdxx, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("dpDdxx", dpDdxx);
		return "modules/dp/dpDdxx/dpDdxxList";
	}
	
	/**
	 * 查询
	 * @param dpDdxx DpDdxx 
	 * @param request
	 * @param response
	 * @return Page<DpDdxx>
	 */
	@RequiresPermissions("dp:dpDdxx:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<DpDdxx> query(DpDdxx dpDdxx,HttpServletRequest request, HttpServletResponse response) {
		Page<DpDdxx> page = this.dpDdxxService.findPage(dpDdxx); 
		return page;
	}
	
    /**
	 * 新增
	 * @param entity DpDdxx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("dp:dpDdxx:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(DpDdxx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.dpDdxxService.insert(entity);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity DpDdxx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("dp:dpDdxx:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(DpDdxx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.dpDdxxService.update(entity);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param dpDdxx DpDdxx 
	 * @return String
	 */
	@RequiresPermissions("dp:dpDdxx:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(DpDdxx entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.dpDdxxService.delete(entity);
		
		return map;
	}

}
