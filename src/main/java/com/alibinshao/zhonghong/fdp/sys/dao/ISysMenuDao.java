/**
 * Copyright &copy; 2012-2017 <a href="http://www.foresee.com">Foresee</a> All rights reserved.
 */
package com.alibinshao.zhonghong.fdp.sys.dao;

import java.util.List;


import com.alibinshao.zhonghong.fdp.common.persistence.CrudDao;
import com.alibinshao.zhonghong.fdp.common.persistence.annotation.MyBatisDao;
import com.alibinshao.zhonghong.fdp.sys.entity.SysMenu;

/**
 * <pre>
 * menu DAO接口
 * </pre>
 * @author  
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
@MyBatisDao
public interface ISysMenuDao extends CrudDao<SysMenu>{

	 /**
	  * 获取用户所拥有的角色菜单
	  * @param menu SysMenu
	  * @return List<SysMenu>
	  */
	public List<SysMenu> findByUserId(SysMenu menu);
	
	public List<SysMenu> findMenuByParentId(SysMenu menu);
	
	public List<SysMenu> findByParentIdsLike(SysMenu menu);
	
	public int updateParentIds(SysMenu menu);
	
	public int updateSort(SysMenu menu);

}
