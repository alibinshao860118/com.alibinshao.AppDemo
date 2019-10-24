/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.sys.web;

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

import com.zhonghong.university.sys.entity.SysZzjgbmgz;
import com.zhonghong.university.sys.service.SysZzjgbmgzService;

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
@RequestMapping(value = "${adminPath}/sys/sysZzjgbmgz")
public class SysZzjgbmgzController extends BaseController{

	@Autowired
	private SysZzjgbmgzService sysZzjgbmgzService;
	
	/**
	 * 进入查询界面
	 * @param sysZzjgbmgz SysZzjgbmgz 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("sys:sysZzjgbmgz:view")
	@RequestMapping(value = {"list"})
	public String list(SysZzjgbmgz sysZzjgbmgz, HttpServletRequest request, HttpServletResponse response, Model model) {
		sysZzjgbmgz = this.sysZzjgbmgzService.get(sysZzjgbmgz);
		model.addAttribute("sysZzjgbmgz", sysZzjgbmgz);
		return "modules/sys/sysZzjgbmgz/sysZzjgbmgzList";
	}
	
	/**
	 * 查询
	 * @param sysZzjgbmgz SysZzjgbmgz 
	 * @param request
	 * @param response
	 * @return Page<SysZzjgbmgz>
	 */
	@RequiresPermissions("sys:sysZzjgbmgz:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<SysZzjgbmgz> query(SysZzjgbmgz sysZzjgbmgz,HttpServletRequest request, HttpServletResponse response) {
		Page<SysZzjgbmgz> page = this.sysZzjgbmgzService.findPage(sysZzjgbmgz); 
		return page;
	}
	
    /**
	 * 新增
	 * @param entity SysZzjgbmgz 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("sys:sysZzjgbmgz:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(SysZzjgbmgz entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.sysZzjgbmgzService.insert(entity);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity SysZzjgbmgz 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("sys:sysZzjgbmgz:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(SysZzjgbmgz entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.sysZzjgbmgzService.update(entity);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param sysZzjgbmgz SysZzjgbmgz 
	 * @return String
	 */
	@RequiresPermissions("sys:sysZzjgbmgz:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(SysZzjgbmgz entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.sysZzjgbmgzService.delete(entity);
		
		return map;
	}

}
