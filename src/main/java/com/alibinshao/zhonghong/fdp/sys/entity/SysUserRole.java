/**
 * Copyright &copy; 2012-2017 <a href="http://www.foresee.com">Foresee</a> All rights reserved.
 */
package com.alibinshao.zhonghong.fdp.sys.entity;

import com.alibinshao.zhonghong.fdp.common.persistence.DataEntity;



/**
 * <pre>
 * 对应数据库表(FBIDP_SYS_USER_ROLE)的实体类
 * </pre>
 * @author gulong 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */

public class SysUserRole extends DataEntity<SysUserRole>{
	private static final long serialVersionUID = 1L;
	
	/** 角色编号（关联fbidp_sec_role表中的id字段） */
	private String roleId;  //角色编号（关联fbidp_sys_role表中的id字段）
	/** 人员编号（关联fbidp_sec_user表中的id字段） */
	private String userId;  //人员编号（关联fbidp_sys_user表中的id字段）
	
	private String code;
	private String name;
	private String orgCode;
	private String orgName;
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOrgCode() {
		return orgCode;
	}
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	
	

}
