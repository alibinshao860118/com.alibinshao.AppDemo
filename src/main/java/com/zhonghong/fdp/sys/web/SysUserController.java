/**
 * Copyright &copy; 2012-2017 <a href="http://www.foresee.com">Foresee</a> All rights reserved.
 */
package com.zhonghong.fdp.sys.web;

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

import org.springframework.util.StringUtils;
import com.zhonghong.fdp.common.persistence.Page;
import com.zhonghong.fdp.common.web.BaseController;
import com.zhonghong.fdp.sys.entity.SysOrg;
import com.zhonghong.fdp.sys.entity.SysOrgUser;
import com.zhonghong.fdp.sys.entity.SysRole;
import com.zhonghong.fdp.sys.entity.SysUser;
import com.zhonghong.fdp.sys.entity.SysUserRole;
import com.zhonghong.fdp.sys.service.SysRoleService;
import com.zhonghong.fdp.sys.service.SysUserService;
import com.zhonghong.fdp.sys.service.SystemService;
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
@RequestMapping(value = "${adminPath}/sys/sysUser")
public class SysUserController extends BaseController{

	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysRoleService sysRoleService;
	
	/**
	 * 进入查询界面
	 * @param sysUser SysUser 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("sys:sysUser:view")
	@RequestMapping(value = {"list"})
	public String list(SysUser sysUser, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("sysUser", sysUser);
		
		SysUser u = UserUtils.getUser();
		model.addAttribute("fullOrgCodes", StringUtils.isEmpty(u.getFullOrgCodes())?topOrgCode:u.getFullOrgCodes());
		model.addAttribute("orgId", StringUtils.isEmpty(u.getOrgId())?topOrgId:u.getOrgId());
		
		return "modules/sys/sysUser/sysUserList";
	}
	
	/**
	 * 查询
	 * @param sysUser SysUser 
	 * @param request
	 * @param response
	 * @return Page<SysUser>
	 */
	@RequiresPermissions("sys:sysUser:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<SysUser> query(SysUser sysUser,HttpServletRequest request, HttpServletResponse response) {
		Page<SysUser> page = this.sysUserService.findPage(sysUser); 
		return page;
	}
	
	/**
	 * 查询
	 * @param sysUser SysUser 
	 * @return SysUser
	 */
	@RequiresPermissions("user")
	@RequestMapping(value = {"get"})
	@ResponseBody
	public SysUser get(SysUser sysUser){
		return this.sysUserService.get(sysUser.getId());
	}
	
	/**
	 * 验证旧密码输入是否正确
	 * @param sysUser SysUser 
	 * @return boolean
	 */
	@RequiresPermissions("user")
	@RequestMapping(value = {"checkPassword"})
	@ResponseBody
	public boolean checkPassword(SysUser sysUser){
		SysUser tempUser = this.sysUserService.get(sysUser.getId());
		return SystemService.validatePassword(sysUser.getPasswd(), tempUser.getPasswd());
	}
	
	/**
	 * 新增
	 * @param sysUser SysUser 
	 * @param model Model
	 * @return Page<SysUser>
	 */
	@RequiresPermissions("sys:sysUser:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(SysUser sysUser, Model model) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.sysUserService.insert(sysUser);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param sysUser SysUser 
	 * @param model Model
	 * @return Page<SysUser>
	 */
	@RequiresPermissions("sys:sysUser:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(SysUser sysUser, Model model) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.sysUserService.update(sysUser);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param sysUser SysUser 
	 * @param redirectAttributes RedirectAttributes
	 * @return String
	 */
	@RequiresPermissions("sys:sysUser:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(SysUser sysUser, RedirectAttributes redirectAttributes) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.sysUserService.delete(sysUser);
		
		return map;
	}
	
	/**
	 * 查询出用户未有拥有的角色
	 * @param sysUserRole SysUserRole 
	 * @return Page<SysRole>
	 */
	@RequiresPermissions("sys:sysUser:view")
	@RequestMapping(value = {"queryNotGrantRoleById"})
	@ResponseBody
	public Page<SysRole> queryNotGrantRoleById(SysUserRole sysUserRole) {
		return this.sysRoleService.queryNotGrantRoleById(sysUserRole); 
	} 
	
	/**
	 * 查询出用户已有拥有的角色
	 * @param sysUserRole SysUserRole 
	 * @return Page<SysRole>
	 */
	@RequiresPermissions("sys:sysUser:view")
	@RequestMapping(value = {"queryGrantRoleById"})
	@ResponseBody
	public List<SysRole> queryGrantRoleById(SysUserRole sysUserRole) {
		return this.sysRoleService.queryGrantRoleById(sysUserRole); 
	}
	
	/**
	 * 重置用户密码
	 * @param sysUser SysUser 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("user")
	@RequestMapping(value = {"resetPwd"})
	@ResponseBody
	public  Map<String,Object> resetPwd(SysUser sysUser){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.sysUserService.updatePasswordById(sysUser);
		
		return map;
	}
	
	/**
	 * 添加用户角色
	 * @param sysUser SysUserRole 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("sys:sysUser:edit")
	@RequestMapping(value = {"addUserRoles"})
	@ResponseBody
	public  Map<String,Object> addUserRoles(SysUserRole sysUser){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.sysUserService.addUserRole(sysUser);
		
		return map;
	}
	
	/**
	 * 移除用户角色
	 * @param sysUser SysUserRole 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("sys:sysUser:edit")
	@RequestMapping(value = {"removeUserRoles"})
	@ResponseBody
	public  Map<String,Object> removeUserRoles(SysUserRole sysUser){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.sysUserService.deleteUserRole(sysUser);
		
		return map;
	}
	
	/**
	 * 查询出用户已有拥有的授权机构
	 * @param sysOrgUser SysOrgUser 
	 * @return Page<SysRole>
	 */
	@RequiresPermissions("sys:sysUser:view")
	@RequestMapping(value = {"queryGrantOrgById"})
	@ResponseBody
	public List<SysOrg> queryGrantOrgById(SysOrgUser sysOrgUser) {
		return this.sysUserService.queryGrantOrgById(sysOrgUser); 
	}
	
	/**
	 * 添加用户授权机构
	 * @param sysOrgUser SysOrgUser 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("sys:sysUser:edit")
	@RequestMapping(value = {"addGrantOrg"})
	@ResponseBody
	public  Map<String,Object> addGrantOrg(SysOrgUser sysOrgUser){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.sysUserService.addOrgUser(sysOrgUser);
		
		return map;
	}
	
	/**
	 * 删除用户授权机构
	 * @param sysOrgUser SysOrgUser 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("sys:sysUser:edit")
	@RequestMapping(value = {"removeGrantOrg"})
	@ResponseBody
	public  Map<String,Object> removeGrantOrg(SysOrgUser sysOrgUser){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.sysUserService.deleteOrgUser(sysOrgUser);
		
		return map;
	}
	
	/**
	 * 检查登录账号是否已经存
	 * @param sysUser SysUser
	 * @return boolean true表示存在
	 */
	@RequiresPermissions("sys:sysUser:edit")
	@RequestMapping(value = {"checkExsit4LoginId"})
	@ResponseBody
	public boolean checkExsit4LoginId(SysUser sysUser){
		SysUser entry = new SysUser();
		entry.setLoginId(sysUser.getLoginId());
		
		List<SysUser> list = this.sysUserService.findList(entry);
		return !list.isEmpty();
	}

}
