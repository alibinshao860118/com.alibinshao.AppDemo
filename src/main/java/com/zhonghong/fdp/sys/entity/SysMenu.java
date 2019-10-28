/**
 * Copyright &copy; 2012-2017 <a href="http://www.foresee.com">Foresee</a> All rights reserved.
 */
package com.zhonghong.fdp.sys.entity;

import java.util.ArrayList;
import java.util.List;

import com.zhonghong.fdp.common.persistence.DataEntity;



/**
 * <pre>
 * 对应数据库表(Fbidp_sys_menu)的实体类
 * </pre>
 * @author  
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */

public class SysMenu extends DataEntity<SysMenu>{
	private static final long serialVersionUID = 1L;
	
	/** 菜单名称 */
	private String name;  //菜单名称
	/** 菜单访问地址 */
	private String url;  //菜单访问地址
	/** 上级菜单ID */
	private String parentId;  //上级菜单ID
	/** 菜单显示时的排列次序，按照其值的大小进行排序，序号小的显示时排在前面，序号不必是连续的 */
	private java.math.BigDecimal sortNo;  //菜单显示时的排列次序，按照其值的大小进行排序，序号小的显示时排在前面，序号不必是连续的
	/** 菜单图标 */
	private String imageUrl;  //菜单图标
	/** 是否相对路径 */
	private String contextRelative;  //是否相对路径
	/** 菜单路径所在框架名，_blank、_self、_parent、_top */
	private String target;  //菜单路径所在框架名，_blank、_self、_parent、_top
	/** 菜单是否可见 (1-可见,0-隐藏) */
	private String visible;  //菜单是否可见 (1-可见,0-隐藏)
	/** 菜单提示信息 */
	private String tooltip;  //菜单提示信息
	/** 菜单类型（1菜单；2按钮或链接） */
	private String menuType;  //菜单类型（1菜单；2按钮或链接）
	/** 按钮操作权限标识 */
	private String permission;  //按钮操作权限标识
	
	private String userId;
	
	private boolean hasChild;
	
	private List<SysMenu> children = new ArrayList<SysMenu>();
	
	private SysMenu parent;
	
	private String parentIds;
	
	private String state;
	
	private int childNum;
	
	private String checked;
	
	private String roleId;
	
	public static String getRootId(){
		return "1";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public java.math.BigDecimal getSortNo() {
		return sortNo;
	}

	public void setSortNo(java.math.BigDecimal sortNo) {
		this.sortNo = sortNo;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getContextRelative() {
		return contextRelative;
	}

	public void setContextRelative(String contextRelative) {
		this.contextRelative = contextRelative;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getVisible() {
		return visible;
	}

	public void setVisible(String visible) {
		this.visible = visible;
	}

	public String getTooltip() {
		return tooltip;
	}

	public void setTooltip(String tooltip) {
		this.tooltip = tooltip;
	}

	public String getMenuType() {
		return menuType;
	}

	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public boolean isHasChild() {
		return hasChild;
	}

	public void setHasChild(boolean hasChild) {
		this.hasChild = hasChild;
	}

	public List<SysMenu> getChildren() {
		return children;
	}

	public void setChildren(List<SysMenu> children) {
		this.children = children;
	}

	public SysMenu getParent() {
		return parent;
	}

	public void setParent(SysMenu parent) {
		this.parent = parent;
	}

	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getChildNum() {
		return childNum;
	}

	public void setChildNum(int childNum) {
		this.childNum = childNum;
	}

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

}
