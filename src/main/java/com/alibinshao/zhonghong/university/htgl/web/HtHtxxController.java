/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.htgl.web;

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

import com.alibinshao.zhonghong.university.htgl.entity.HtHtxx;
import com.alibinshao.zhonghong.university.htgl.service.HtHtxxService;

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
@RequestMapping(value = "${adminPath}/htgl/htHtxx")
public class HtHtxxController extends BaseController{

	@Autowired
	private HtHtxxService htHtxxService;
	
	/**
	 * 进入新签合同查询界面
	 * @param htHtxx HtHtxx 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("htgl:htHtxx:view")
	@RequestMapping(value = {"list"})
	public String list(HtHtxx htHtxx, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("htHtxx", htHtxx);
		return "modules/htgl/htHtxx/htHtxxList";
	}
	/**
	 * 进入续签合同查询界面
	 * @param htHtxx HtHtxx 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("htgl:htHtxx:view")
	@RequestMapping(value = {"xqHtxxList"})
	public String xqHtxxList(HtHtxx htHtxx, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("htHtxx", htHtxx);
		return "modules/htgl/htHtxx/xqHtxxList";
	}
	/**
	 * 进入终止合同查询界面
	 * @param htHtxx HtHtxx 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("htgl:htHtxx:view")
	@RequestMapping(value = {"zzHtxxList"})
	public String zzHtxxList(HtHtxx htHtxx, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("htHtxx", htHtxx);
		return "modules/htgl/htHtxx/zzHtxxList";
	}
	/**
	 * 进入合同查询界面
	 * @param htHtxx HtHtxx 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("htgl:htHtxx:view")
	@RequestMapping(value = {"queryHtxxList"})
	public String queryHtxxList(HtHtxx htHtxx, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("htHtxx", htHtxx);
		return "modules/htgl/htHtxx/queryHtxxList";
	}
	/**
	 * 查询
	 * @param htHtxx HtHtxx 
	 * @param request
	 * @param response
	 * @return Page<HtHtxx>
	 */
	@RequiresPermissions("htgl:htHtxx:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<HtHtxx> query(HtHtxx htHtxx,HttpServletRequest request, HttpServletResponse response) {
		Page<HtHtxx> page = this.htHtxxService.findPage(htHtxx); 
		return page;
	}
	
    /**
	 * 新增
	 * @param entity HtHtxx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("htgl:htHtxx:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(HtHtxx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.htHtxxService.insert(entity);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity HtHtxx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("htgl:htHtxx:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(HtHtxx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.htHtxxService.update(entity);
		
		return result;
	}
	/**
	 * 终止或还原合同
	 * @param entity HtHtxx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("htgl:htHtxx:edit")
	@RequestMapping(value = "updateHtzt")
	@ResponseBody
	public Map<String,Object> updateHtzt(HtHtxx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		this.htHtxxService.updateHtzt(entity);
		return result;
	}
	
	/**
	 * 删除
	 * @param htHtxx HtHtxx 
	 * @return String
	 */
	@RequiresPermissions("htgl:htHtxx:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(HtHtxx entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.htHtxxService.delete(entity);
		
		return map;
	}

}
