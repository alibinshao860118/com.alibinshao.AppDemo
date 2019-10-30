/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">Zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.sys.web;

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

import com.alibinshao.zhonghong.fdp.common.persistence.Page;
import com.alibinshao.zhonghong.fdp.common.web.BaseController;
import com.alibinshao.zhonghong.university.sys.entity.SysXxxx;
import com.alibinshao.zhonghong.university.sys.service.SysXxxxService;

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
@RequestMapping(value = "${adminPath}/sys/sysXxxx")
public class SysXxxxController extends BaseController{

	@Autowired
	private SysXxxxService sysXxxxService;
	
	/**
	 * 进入查询界面
	 * @param sysXxxx SysXxxx 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("sys:sysXxxx:view")
	@RequestMapping(value = {"list"})
	public String list(SysXxxx sysXxxx, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<SysXxxx> list = sysXxxxService.findList(new SysXxxx());
		if(!list.isEmpty()){
			model.addAttribute("sysXxxx", list.get(0));
		}else{
			model.addAttribute("sysXxxx", new SysXxxx());
		}
		return "modules/sys/sysXxxx/sysXxxxList";
	}
	
	/**
	 * 查询
	 * @param sysXxxx SysXxxx 
	 * @param request
	 * @param response
	 * @return Page<SysXxxx>
	 */
	@RequiresPermissions("sys:sysXxxx:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<SysXxxx> query(SysXxxx sysXxxx,HttpServletRequest request, HttpServletResponse response) {
		Page<SysXxxx> page = this.sysXxxxService.findPage(sysXxxx); 
		return page;
	}
	
    /**
	 * 新增
	 * @param entity SysXxxx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("sys:sysXxxx:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(SysXxxx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.sysXxxxService.insert(entity);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity SysXxxx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("sys:sysXxxx:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(SysXxxx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.sysXxxxService.update(entity);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param sysXxxx SysXxxx 
	 * @return String
	 */
	@RequiresPermissions("sys:sysXxxx:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(SysXxxx entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.sysXxxxService.delete(entity);
		
		return map;
	}

}
