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

import com.zhonghong.university.dp.entity.DpTqtx;
import com.zhonghong.university.dp.service.DpTqtxService;

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
@RequestMapping(value = "${adminPath}/dp/dpTqtx")
public class DpTqtxController extends BaseController{

	@Autowired
	private DpTqtxService dpTqtxService;
	
	/**
	 * 进入查询界面
	 * @param dpTqtx DpTqtx 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("dp:dpTqtx:view")
	@RequestMapping(value = {"list"})
	public String list(DpTqtx dpTqtx, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("dpTqtx", dpTqtx);
		return "modules/dp/dpTqtx/dpTqtxList";
	}
	
	/**
	 * 查询
	 * @param dpTqtx DpTqtx 
	 * @param request
	 * @param response
	 * @return Page<DpTqtx>
	 */
	@RequiresPermissions("dp:dpTqtx:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<DpTqtx> query(DpTqtx dpTqtx,HttpServletRequest request, HttpServletResponse response) {
		Page<DpTqtx> page = this.dpTqtxService.findPage(dpTqtx); 
		return page;
	}
	
    /**
	 * 新增
	 * @param entity DpTqtx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("dp:dpTqtx:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(DpTqtx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.dpTqtxService.insert(entity);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity DpTqtx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("dp:dpTqtx:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(DpTqtx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.dpTqtxService.update(entity);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param dpTqtx DpTqtx 
	 * @return String
	 */
	@RequiresPermissions("dp:dpTqtx:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(DpTqtx entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.dpTqtxService.delete(entity);
		
		return map;
	}

}
