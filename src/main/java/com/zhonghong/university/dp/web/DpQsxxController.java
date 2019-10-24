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

import com.zhonghong.university.dp.entity.DpQsxx;
import com.zhonghong.university.dp.service.DpQsxxService;

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
@RequestMapping(value = "${adminPath}/dp/dpQsxx")
public class DpQsxxController extends BaseController{

	@Autowired
	private DpQsxxService dpQsxxService;
	
	/**
	 * 进入查询界面
	 * @param dpQsxx DpQsxx 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("dp:dpQsxx:view")
	@RequestMapping(value = {"list"})
	public String list(DpQsxx dpQsxx, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("dpQsxx", dpQsxx);
		return "modules/dp/dpQsxx/dpQsxxList";
	}
	
	/**
	 * 查询
	 * @param dpQsxx DpQsxx 
	 * @param request
	 * @param response
	 * @return Page<DpQsxx>
	 */
	@RequiresPermissions("dp:dpQsxx:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<DpQsxx> query(DpQsxx dpQsxx,HttpServletRequest request, HttpServletResponse response) {
		Page<DpQsxx> page = this.dpQsxxService.findPage(dpQsxx); 
		return page;
	}
	
    /**
	 * 新增
	 * @param entity DpQsxx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("dp:dpQsxx:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(DpQsxx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.dpQsxxService.insert(entity);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity DpQsxx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("dp:dpQsxx:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(DpQsxx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.dpQsxxService.update(entity);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param dpQsxx DpQsxx 
	 * @return String
	 */
	@RequiresPermissions("dp:dpQsxx:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(DpQsxx entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.dpQsxxService.delete(entity);
		
		return map;
	}

}
