/**
 * Copyright &copy; 2012-2017 <a href="http://www.foresee.com">Foresee</a> All rights reserved.
 */
package com.zhonghong.fdp.sys.web;

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

import org.springframework.util.StringUtils;
import com.zhonghong.fdp.common.persistence.Page;
import com.zhonghong.fdp.common.web.BaseController;
import com.zhonghong.fdp.sys.entity.SysRole;
import com.zhonghong.fdp.sys.entity.SysRoleMenu;
import com.zhonghong.fdp.sys.entity.SysUser;
import com.zhonghong.fdp.sys.service.SysRoleService;
import com.zhonghong.fdp.sys.utils.UserUtils;

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
@RequestMapping(value = "${adminPath}/sys/sysRole")
public class SysRoleController extends BaseController{

	@Autowired
	private SysRoleService sysRoleService;
	
	/**
	 * 进入查询界面
	 * @param sysRole SysRole 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("sys:sysRole:view")
	@RequestMapping(value = {"list"})
	public String list(SysRole sysRole, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("sysRole", sysRole);
		
		SysUser u = UserUtils.getUser();
		model.addAttribute("fullOrgCodes", StringUtils.isEmpty(u.getFullOrgCodes())?topOrgCode:u.getFullOrgCodes());
		model.addAttribute("orgId", StringUtils.isEmpty(u.getOrgId())?topOrgId:u.getOrgId());
		
		return "modules/sys/sysRole/sysRoleList";
	}
	
	/**
	 * 查询
	 * @param sysRole SysRole 
	 * @param request
	 * @param response
	 * @return Page<SysRole>
	 */
	@RequiresPermissions("sys:sysRole:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<SysRole> query(SysRole sysRole,HttpServletRequest request, HttpServletResponse response) {
		Page<SysRole> page = this.sysRoleService.findPage(sysRole); 
		return page;
	}
	
	/**
	 * 新增
	 * @param sysRole SysRole 
	 * @param model Model
	 * @return Page<SysRole>
	 */
	@RequiresPermissions("sys:sysRole:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(SysRole sysRole, Model model) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.sysRoleService.insert(sysRole);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param sysRole SysRole 
	 * @param model Model
	 * @return Page<SysRole>
	 */
	@RequiresPermissions("sys:sysRole:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(SysRole sysRole, Model model) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.sysRoleService.update(sysRole);
		
		return result;
	}
	
	/**
	 * 保存角色与菜单的关联关系
	 * @param sysRoleMenu SysRoleMenu 
	 * @param model Model
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("sys:sysRole:edit")
	@RequestMapping(value = "saveRoleMenu")
	@ResponseBody
	public Map<String,Object> saveRoleMenu(SysRoleMenu sysRoleMenu, Model model) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.sysRoleService.saveRoleMenu(sysRoleMenu);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param sysRole SysRole 
	 * @param redirectAttributes RedirectAttributes
	 * @return String
	 */
	@RequiresPermissions("sys:sysRole:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(SysRole sysRole, RedirectAttributes redirectAttributes) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.sysRoleService.delete(sysRole);
		
		return map;
	}

}
