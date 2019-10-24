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

import com.zhonghong.university.dp.entity.DpCgxx;
import com.zhonghong.university.dp.service.DpCgxxService;

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
@RequestMapping(value = "${adminPath}/dp/dpCgxx")
public class DpCgxxController extends BaseController{

	@Autowired
	private DpCgxxService dpCgxxService;
	
	/**
	 * 进入查询界面
	 * @param dpCgxx DpCgxx 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("dp:dpCgxx:view")
	@RequestMapping(value = {"list"})
	public String list(DpCgxx dpCgxx, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("dpCgxx", dpCgxx);
		return "modules/dp/dpCgxx/dpCgxxList";
	}
	
	/**
	 * 查询
	 * @param dpCgxx DpCgxx 
	 * @param request
	 * @param response
	 * @return Page<DpCgxx>
	 */
	@RequiresPermissions("dp:dpCgxx:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<DpCgxx> query(DpCgxx dpCgxx,HttpServletRequest request, HttpServletResponse response) {
		Page<DpCgxx> page = this.dpCgxxService.findPage(dpCgxx); 
		return page;
	}
	
    /**
	 * 新增
	 * @param entity DpCgxx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("dp:dpCgxx:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(DpCgxx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.dpCgxxService.insert(entity);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity DpCgxx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("dp:dpCgxx:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(DpCgxx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.dpCgxxService.update(entity);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param dpCgxx DpCgxx 
	 * @return String
	 */
	@RequiresPermissions("dp:dpCgxx:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(DpCgxx entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.dpCgxxService.delete(entity);
		
		return map;
	}

}
