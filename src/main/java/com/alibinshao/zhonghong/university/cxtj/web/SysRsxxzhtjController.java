/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.cxtj.web;

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

import com.alibinshao.zhonghong.university.cxtj.entity.SysRsxxzhtj;
import com.alibinshao.zhonghong.university.cxtj.service.SysRsxxzhtjService;

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
@RequestMapping(value = "${adminPath}/cxtj/sysRsxxzhtj")
public class SysRsxxzhtjController extends BaseController{

	@Autowired
	private SysRsxxzhtjService sysRsxxzhtjService;
	
	/**
	 * 进入人事信息综合查询界面
	 * @param sysRsxxzhtj SysRsxxzhtj 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("cxtj:sysRsxxzhtj:view")
	@RequestMapping(value = {"list"})
	public String list(SysRsxxzhtj sysRsxxzhtj, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("sysRsxxzhtj", sysRsxxzhtj);
		return "modules/cxtj/sysRsxxzhtj/sysRsxxzhtjList";
	}
	/**
	 * 进入年龄情况统计查询界面
	 * @param sysRsxxzhtj SysRsxxzhtj 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("cxtj:sysRsxxzhtj:view")
	@RequestMapping(value = {"nlqktjlist"})
	public String nlqktjlist(SysRsxxzhtj sysRsxxzhtj, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("sysRsxxzhtj", sysRsxxzhtj);
		return "modules/cxtj/sysRsxxzhtj/sysNlqktjList";
	}
	/**
	 * 进入年龄情况统计查询界面
	 * @param sysRsxxzhtj SysRsxxzhtj 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("cxtj:sysRsxxzhtj:view")
	@RequestMapping(value = {"xlqktjlist"})
	public String xlqktjlist(SysRsxxzhtj sysRsxxzhtj, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("sysRsxxzhtj", sysRsxxzhtj);
		return "modules/cxtj/sysRsxxzhtj/sysXlqktjList";
	}
	/**
	 * 查询
	 * @param sysRsxxzhtj SysRsxxzhtj 
	 * @param request
	 * @param response
	 * @return Page<SysRsxxzhtj>
	@RequiresPermissions("cxtj:sysRsxxzhtj:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<SysRsxxzhtj> query(SysRsxxzhtj sysRsxxzhtj,HttpServletRequest request, HttpServletResponse response) {
		Page<SysRsxxzhtj> page = this.sysRsxxzhtjService.findPage(sysRsxxzhtj); 
		return page;
	}
	 */
	
    /**
	 * 新增
	 * @param entity SysRsxxzhtj 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("cxtj:sysRsxxzhtj:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(SysRsxxzhtj entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.sysRsxxzhtjService.insert(entity);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity SysRsxxzhtj 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("cxtj:sysRsxxzhtj:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(SysRsxxzhtj entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.sysRsxxzhtjService.update(entity);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param sysRsxxzhtj SysRsxxzhtj 
	 * @return String
	 */
	@RequiresPermissions("cxtj:sysRsxxzhtj:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(SysRsxxzhtj entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.sysRsxxzhtjService.delete(entity);
		
		return map;
	}

}
