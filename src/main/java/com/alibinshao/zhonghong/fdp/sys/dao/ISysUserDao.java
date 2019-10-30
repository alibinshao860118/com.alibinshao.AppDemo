/**
 * Copyright &copy; 2012-2017 <a href="http://www.foresee.com">Foresee</a> All rights reserved.
 */
package com.alibinshao.zhonghong.fdp.sys.dao;

import java.util.List;

import com.alibinshao.zhonghong.fdp.common.persistence.CrudDao;
import com.alibinshao.zhonghong.fdp.common.persistence.annotation.MyBatisDao;
import com.alibinshao.zhonghong.fdp.sys.entity.SysUser;

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
public interface ISysUserDao extends CrudDao<SysUser>{

	/**
	 * 根据登录名称查询用户
	 * @param loginName
	 * @return
	 */
	public SysUser getByLoginName(SysUser user);
	
	/**
	 * 更新用户密码
	 * @param user
	 * @return
	 */
	public int updatePasswordById(SysUser user);
	
	/**
	 * 更新登录信息，如：登录IP、登录时间
	 * @param user
	 * @return
	 */
	public int updateLoginInfo(SysUser user);
	
	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	public int updateUserInfo(SysUser user);
	
	/**
	 * 插入用户角色关联数据
	 * @param user
	 * @return
	 */
	public int insertUserRole(SysUser user);
	
	/**
	 * 删除用户角色关联数据
	 * @param user
	 * @return
	 */
	public int deleteUserRole(SysUser user);
	
	/**
	 * 通过orgId获取用户列表，仅返回用户id和name（树查询用户时用）
	 * @param user
	 * @return
	 */
	public List<SysUser> findUserByOrgId(SysUser user);
	
}
