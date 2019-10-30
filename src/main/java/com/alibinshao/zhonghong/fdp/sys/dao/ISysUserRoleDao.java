/**
 * Copyright &copy; 2012-2017 <a href="http://www.foresee.com">Foresee</a> All rights reserved.
 */
package com.alibinshao.zhonghong.fdp.sys.dao;

import java.util.List;

import com.alibinshao.zhonghong.fdp.common.persistence.CrudDao;
import com.alibinshao.zhonghong.fdp.common.persistence.annotation.MyBatisDao;
import com.alibinshao.zhonghong.fdp.sys.entity.SysRole;
import com.alibinshao.zhonghong.fdp.sys.entity.SysUserRole;

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
public interface ISysUserRoleDao extends CrudDao<SysUserRole>{

	/**
	 * 查询出用户未被授权的的角色
	 * @param entity SysUserRole
	 * @return Page<SysRole>
	 */
	 public List<SysRole> queryNotGrantRoleById(SysUserRole entity);
	 
	/**
	 * 查询出用户已被授权的的角色
	 * @param entity SysUserRole
	 * @return Page<SysRole>
	 */
	 public List<SysRole> queryGrantRoleById(SysUserRole entity);
	 
	 /**
	  * 根据用户ID物理删除
	  * @param entity SysUserRole
	  */
	 public void deleteByUserId(SysUserRole entity);
	 
}
