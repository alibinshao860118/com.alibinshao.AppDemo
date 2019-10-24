/**
 * Copyright &copy; 2012-2017 <a href="http://www.foresee.com">Foresee</a> All rights reserved.
 */
package com.zhonghong.fdp.sys.dao;

import com.zhonghong.fdp.common.persistence.CrudDao;
import com.zhonghong.fdp.common.persistence.annotation.MyBatisDao;
import com.zhonghong.fdp.sys.entity.SysRole;

/**
 * <pre>
 * DAO接口
 * </pre>
 * @author gulong 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @MyBatisDao
public interface ISysRoleDao extends CrudDao<SysRole>{

	public SysRole getByName(SysRole role);
	
	public SysRole getByCode(SysRole role);
	
	/**
	 * 维护角色与菜单权限关系
	 * @param role
	 * @return
	 */
	public int deleteRoleMenu(SysRole role);
	
	public int insertRoleMenu(SysRole role);
	
	/**
	 * 维护角色与公司部门关系
	 * @param role
	 * @return
	 */
	public int deleteRoleOrg(SysRole role);

	public int insertRoleOrg(SysRole role);
	 
}
