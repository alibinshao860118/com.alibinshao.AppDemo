/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.pxgl.web;

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

import com.zhonghong.university.pxgl.entity.PxglGnjxgl;
import com.zhonghong.university.pxgl.service.PxglGnjxglService;

/**
 * <pre>
 * 国内进修管理控制层类
 * </pre>
 * @author liangbinbin 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
@Controller
@RequestMapping(value = "${adminPath}/pxgl/pxglGnjxgl")
public class PxglGnjxglController extends BaseController{

	@Autowired
	private PxglGnjxglService pxglGnjxglService;
	
	/**
	 * 进入查询界面
	 * @param pxglGnjxgl PxglGnjxgl 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("pxgl:pxglGnjxgl:view")
	@RequestMapping(value = {"list"})
	public String list(PxglGnjxgl pxglGnjxgl, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("pxglGnjxgl", pxglGnjxgl);
		return "modules/pxgl/pxglGnjxgl/pxglGnjxglList";
	}
	
	/**
	 * 查询
	 * @param pxglGnjxgl PxglGnjxgl 
	 * @param request
	 * @param response
	 * @return Page<PxglGnjxgl>
	 */
	@RequiresPermissions("pxgl:pxglGnjxgl:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<PxglGnjxgl> query(PxglGnjxgl pxglGnjxgl,HttpServletRequest request, HttpServletResponse response) {
		Page<PxglGnjxgl> page = this.pxglGnjxglService.findPage(pxglGnjxgl); 
		return page;
	}
	
    /**
	 * 新增
	 * @param entity PxglGnjxgl 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("pxgl:pxglGnjxgl:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(PxglGnjxgl entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.pxglGnjxglService.insert(entity);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity PxglGnjxgl 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("pxgl:pxglGnjxgl:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(PxglGnjxgl entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.pxglGnjxglService.update(entity);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param pxglGnjxgl PxglGnjxgl 
	 * @return String
	 */
	@RequiresPermissions("pxgl:pxglGnjxgl:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(PxglGnjxgl entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.pxglGnjxglService.delete(entity);
		
		return map;
	}

}
