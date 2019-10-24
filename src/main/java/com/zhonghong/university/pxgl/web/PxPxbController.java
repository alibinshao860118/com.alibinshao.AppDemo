/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.pxgl.web;

import java.util.HashMap;
import java.util.List;
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

import com.zhonghong.university.pxgl.entity.PxPxb;
import com.zhonghong.university.pxgl.service.PxPxbService;

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
@RequestMapping(value = "${adminPath}/pxgl/pxPxb")
public class PxPxbController extends BaseController{

	@Autowired
	private PxPxbService pxPxbService;
	
	/**
	 * 进入查询界面
	 * @param pxPxb PxPxb 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("pxgl:pxPxb:view")
	@RequestMapping(value = {"list"})
	public String list(PxPxb pxPxb, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<PxPxb> pxjhList = this.pxPxbService.selectPxjhList();
		model.addAttribute("pxPxb", pxPxb);
		model.addAttribute("pxjhList", pxjhList);
		return "modules/pxgl/pxPxb/pxPxbList";
	}
	
	/**
	 * 查询
	 * @param pxPxb PxPxb 
	 * @param request
	 * @param response
	 * @return Page<PxPxb>
	 */
	@RequiresPermissions("pxgl:pxPxb:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<PxPxb> query(PxPxb pxPxb,HttpServletRequest request, HttpServletResponse response) {
		Page<PxPxb> page = this.pxPxbService.findPage(pxPxb); 
		return page;
	}
	
    /**
	 * 新增
	 * @param entity PxPxb 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("pxgl:pxPxb:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(PxPxb entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.pxPxbService.insert(entity);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity PxPxb 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("pxgl:pxPxb:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(PxPxb entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.pxPxbService.update(entity);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param pxPxb PxPxb 
	 * @return String
	 */
	@RequiresPermissions("pxgl:pxPxb:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(PxPxb entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.pxPxbService.delete(entity);
		
		return map;
	}

}
