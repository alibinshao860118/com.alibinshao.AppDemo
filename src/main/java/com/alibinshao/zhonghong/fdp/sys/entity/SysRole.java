/**
 * Copyright &copy; 2012-2017 <a href="http://www.foresee.com">Foresee</a> All rights reserved.
 */
package com.alibinshao.zhonghong.fdp.sys.entity;

import java.util.ArrayList;
import java.util.List;

import com.alibinshao.zhonghong.fdp.common.persistence.DataEntity;
import com.alibinshao.zhonghong.fdp.common.utils.excel.annotation.ExcelField;



/**
 * <pre>
 * 对应数据库表(fbidp_sys_role)的实体类
 * </pre>
 * @author gulong 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */

public class SysRole extends DataEntity<SysRole>{
	private static final long serialVersionUID = 1L;
	
	/** 有业务意义的角色编号 */
	private String code;  //有业务意义的角色编号
	/** 角色名称 */
	private String name;  //角色名称
	/** 组织机构ID */
	private String orgId;  //组织机构ID
	/** 显示顺序 */
	private Integer showOrder;  //显示顺序
	/** 角色的作用范围,0-全省可用,1-机关下可用 */
	private String scope;  //角色的作用范围,0-全省可用,1-机关下可用
	
	private String ids;
	
	private String orgCode;
	private String orgName;
	private String fullOrgCodes;
	private String fullOrgNames;
	private String userId;
	
	private SysUser user;
	
	private List<SysMenu> menuList = new ArrayList<SysMenu>();
	
	public SysRole(){
		
	}
	
	public SysRole(SysUser user){
		this.user = user;
	}
	
	@ExcelField(title="角色编码", type=1, align=1, sort=1)
	public String getCode(){
		return this.code;
	}
	
	@ExcelField(title="角色名称", type=1, align=1, sort=2)
	public String getName(){
		return this.name;
	}
	
	@ExcelField(title="所属机构", type=1, align=1, sort=3)
	public String getFullOrgNames(){
		return this.fullOrgNames;
	}
	
	@ExcelField(title="是否有效", type=1, align=2, sort=5,dictType="enableFlag")
	public String getEnableFlag(){
		return this.enableFlag;
	}
	
	@ExcelField(title="显示顺序", type=1, align=1, sort=6)
	public Integer getShowOrder(){
		return this.showOrder;
	}
	
	@ExcelField(title="备注", type=1, align=1, sort=20)
	public String getRemarks(){
		return this.remarks;
	}

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public String getScope() {
		return scope;
	}

	public void setScope(String scope) {
		this.scope = scope;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
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

	public String getFullOrgCodes() {
		return fullOrgCodes;
	}

	public void setFullOrgCodes(String fullOrgCodes) {
		this.fullOrgCodes = fullOrgCodes;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public SysUser getUser() {
		return user;
	}

	public void setUser(SysUser user) {
		this.user = user;
	}

	public List<SysMenu> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<SysMenu> menuList) {
		this.menuList = menuList;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setShowOrder(Integer showOrder) {
		this.showOrder = showOrder;
	}

	public void setFullOrgNames(String fullOrgNames) {
		this.fullOrgNames = fullOrgNames;
	}

}
