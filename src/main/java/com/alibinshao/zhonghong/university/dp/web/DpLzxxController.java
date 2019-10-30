/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.dp.web;

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

import com.alibinshao.zhonghong.fdp.common.persistence.Page;
import com.alibinshao.zhonghong.fdp.common.web.BaseController;

import com.alibinshao.zhonghong.university.dp.entity.DpLzxx;
import com.alibinshao.zhonghong.university.dp.service.DpLzxxService;

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
@RequestMapping(value = "${adminPath}/dp/dpLzxx")
public class DpLzxxController extends BaseController{

	@Autowired
	private DpLzxxService dpLzxxService;
	
	/**
	 * 进入查询界面
	 * @param dpLzxx DpLzxx 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("dp:dpLzxx:view")
	@RequestMapping(value = {"list"})
	public String list(DpLzxx dpLzxx, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("dpLzxx", dpLzxx);
		return "modules/dp/dpLzxx/dpLzxxList";
	}
	
	/**
	 * 查询
	 * @param dpLzxx DpLzxx 
	 * @param request
	 * @param response
	 * @return Page<DpLzxx>
	 */
	@RequiresPermissions("dp:dpLzxx:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<DpLzxx> query(DpLzxx dpLzxx,HttpServletRequest request, HttpServletResponse response) {
		Page<DpLzxx> page = this.dpLzxxService.findPage(dpLzxx); 
		return page;
	}
	
    /**
	 * 新增
	 * @param entity DpLzxx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("dp:dpLzxx:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(DpLzxx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.dpLzxxService.insert(entity);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity DpLzxx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("dp:dpLzxx:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(DpLzxx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.dpLzxxService.update(entity);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param dpLzxx DpLzxx 
	 * @return String
	 */
	@RequiresPermissions("dp:dpLzxx:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(DpLzxx entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.dpLzxxService.delete(entity);
		
		return map;
	}

}
