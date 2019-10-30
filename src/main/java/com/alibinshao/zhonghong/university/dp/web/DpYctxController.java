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

import com.alibinshao.zhonghong.university.dp.entity.DpYctx;
import com.alibinshao.zhonghong.university.dp.service.DpYctxService;

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
@RequestMapping(value = "${adminPath}/dp/dpYctx")
public class DpYctxController extends BaseController{

	@Autowired
	private DpYctxService dpYctxService;
	
	/**
	 * 进入查询界面
	 * @param dpYctx DpYctx 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("dp:dpYctx:view")
	@RequestMapping(value = {"list"})
	public String list(DpYctx dpYctx, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("dpYctx", dpYctx);
		return "modules/dp/dpYctx/dpYctxList";
	}
	
	/**
	 * 查询
	 * @param dpYctx DpYctx 
	 * @param request
	 * @param response
	 * @return Page<DpYctx>
	 */
	@RequiresPermissions("dp:dpYctx:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<DpYctx> query(DpYctx dpYctx,HttpServletRequest request, HttpServletResponse response) {
		Page<DpYctx> page = this.dpYctxService.findPage(dpYctx); 
		return page;
	}
	
    /**
	 * 新增
	 * @param entity DpYctx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("dp:dpYctx:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(DpYctx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.dpYctxService.insert(entity);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity DpYctx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("dp:dpYctx:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(DpYctx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.dpYctxService.update(entity);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param dpYctx DpYctx 
	 * @return String
	 */
	@RequiresPermissions("dp:dpYctx:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(DpYctx entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.dpYctxService.delete(entity);
		
		return map;
	}

}
