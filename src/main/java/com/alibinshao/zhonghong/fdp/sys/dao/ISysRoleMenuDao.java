/**
 * Copyright &copy; 2012-2017 <a href="http://www.foresee.com">Foresee</a> All rights reserved.
 */
package com.alibinshao.zhonghong.fdp.sys.dao;

import com.alibinshao.zhonghong.fdp.common.persistence.CrudDao;
import com.alibinshao.zhonghong.fdp.common.persistence.annotation.MyBatisDao;
import com.alibinshao.zhonghong.fdp.sys.entity.SysRoleMenu;

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
public interface ISysRoleMenuDao extends CrudDao<SysRoleMenu>{

	 /**
	  * 根据角色ID物理删除
	  * @param roleId String
	  */
	 public void deleteByRoleId(String roleId);

}
