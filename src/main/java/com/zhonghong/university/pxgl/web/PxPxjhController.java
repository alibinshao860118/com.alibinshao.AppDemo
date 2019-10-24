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

import com.zhonghong.university.pxgl.entity.PxPxjh;
import com.zhonghong.university.pxgl.service.PxPxjhService;

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
@RequestMapping(value = "${adminPath}/pxgl/pxPxjh")
public class PxPxjhController extends BaseController{

	@Autowired
	private PxPxjhService pxPxjhService;
	
	/**
	 * 进入查询界面
	 * @param pxPxjh PxPxjh 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("pxgl:pxPxjh:view")
	@RequestMapping(value = {"list"})
	public String list(PxPxjh pxPxjh, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("pxPxjh", pxPxjh);
		return "modules/pxgl/pxPxjh/pxPxjhList";
	}
	
	/**
	 * 查询
	 * @param pxPxjh PxPxjh 
	 * @param request
	 * @param response
	 * @return Page<PxPxjh>
	 */
	@RequiresPermissions("pxgl:pxPxjh:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<PxPxjh> query(PxPxjh pxPxjh,HttpServletRequest request, HttpServletResponse response) {
		Page<PxPxjh> page = this.pxPxjhService.findPage(pxPxjh); 
		return page;
	}
	
    /**
	 * 新增
	 * @param entity PxPxjh 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("pxgl:pxPxjh:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(PxPxjh entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.pxPxjhService.insert(entity);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity PxPxjh 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("pxgl:pxPxjh:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(PxPxjh entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.pxPxjhService.update(entity);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param pxPxjh PxPxjh 
	 * @return String
	 */
	@RequiresPermissions("pxgl:pxPxjh:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(PxPxjh entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.pxPxjhService.delete(entity);
		
		return map;
	}

}
