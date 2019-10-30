/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.pxgl.web;

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

import com.alibinshao.zhonghong.fdp.common.persistence.Page;
import com.alibinshao.zhonghong.fdp.common.web.BaseController;
import com.alibinshao.zhonghong.university.pxgl.entity.PxPxbry;
import com.alibinshao.zhonghong.university.pxgl.service.PxPxbryService;

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
@RequestMapping(value = "${adminPath}/pxgl/pxPxbry")
public class PxPxbryController extends BaseController{

	@Autowired
	private PxPxbryService pxPxbryService;
	
	/**
	 * 进入查询界面
	 * @param pxPxbry PxPxbry 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("pxgl:pxPxbry:view")
	@RequestMapping(value = {"list"})
	public String list(PxPxbry pxPxbry, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<PxPxbry> pxbList = this.pxPxbryService.selectPxbList();
		model.addAttribute("pxPxbry", pxPxbry);
		model.addAttribute("pxbList", pxbList);
		return "modules/pxgl/pxPxbry/pxPxbryList";
	}
	
	/**
	 * 查询
	 * @param pxPxbry PxPxbry 
	 * @param request
	 * @param response
	 * @return Page<PxPxbry>
	 */
	@RequiresPermissions("pxgl:pxPxbry:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<PxPxbry> query(PxPxbry pxPxbry,HttpServletRequest request, HttpServletResponse response) {
		Page<PxPxbry> page = this.pxPxbryService.findPage(pxPxbry); 
		return page;
	}
	
    /**
	 * 新增
	 * @param entity PxPxbry 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("pxgl:pxPxbry:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(PxPxbry entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.pxPxbryService.insert(entity);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity PxPxbry 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("pxgl:pxPxbry:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(PxPxbry entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.pxPxbryService.update(entity);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param pxPxbry PxPxbry 
	 * @return String
	 */
	@RequiresPermissions("pxgl:pxPxbry:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(PxPxbry entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.pxPxbryService.delete(entity);
		
		return map;
	}

}
