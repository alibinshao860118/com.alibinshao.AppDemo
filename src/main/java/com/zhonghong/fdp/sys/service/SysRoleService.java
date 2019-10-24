/**
 * Copyright &copy; 2012-2017 <a href="http://www.foresee.com">Foresee</a> All rights reserved.
 */
package com.zhonghong.fdp.sys.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhonghong.fdp.common.persistence.Page;
import com.zhonghong.fdp.common.service.CrudService;

import com.zhonghong.fdp.sys.entity.SysRole;
import com.zhonghong.fdp.sys.entity.SysRoleMenu;
import com.zhonghong.fdp.sys.entity.SysUserRole;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhonghong.fdp.sys.dao.ISysRoleDao;
import com.zhonghong.fdp.sys.dao.ISysRoleMenuDao;
import com.zhonghong.fdp.sys.dao.ISysUserRoleDao;

/**
 * <pre>
 * Service服务类
 * </pre>
 * @author gulong 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
@Service
@Transactional(readOnly = true)
public class SysRoleService extends CrudService<ISysRoleDao,SysRole>{
	
	@Autowired
	private ISysRoleMenuDao sysRoleMenuDao;
	@Autowired
	private ISysUserRoleDao sysUserRoleDao;
	
	public SysRole get(String id) {
		return super.get(id);
	}
	
	public List<SysRole> findList(SysRole entity) {
		return super.findList(entity);
	}
	
	public Page<SysRole> findPage(SysRole entity) {
		return super.findPage(entity);
	}
	
	@Transactional(readOnly = false)
	public void save(SysRole entity) {
		super.save(entity);
	}
	
	@Transactional(readOnly = false)
	public void insert(SysRole entity) {
		entity.preInsert();
		dao.insert(entity);
	}
	
	@Transactional(readOnly = false)
	public void update(SysRole entity) {
		entity.preUpdate();
		dao.update(entity);
	}
	
	@Transactional(readOnly = false)
	public void delete(SysRole entity) {
		if(StringUtils.isNotEmpty(entity.getIds())){
			String[] ids = entity.getIds().split("&amp;");
			for (String id : ids) {
				entity.setId(id);
				super.delete(entity);
			}
			
		}
		
	}
	
	@Transactional(readOnly = false)
	public void saveRoleMenu(SysRoleMenu sysRoleMenu){
		//1:先删除角色已关联的菜单关联
		sysRoleMenuDao.deleteByRoleId(sysRoleMenu.getRoleId());
		
		//2:插入新的关联关系
		if(StringUtils.isNotEmpty(sysRoleMenu.getMenuIds())){
			String[] menuIds = sysRoleMenu.getMenuIds().split("&amp;");
			for (String menuId : menuIds) {
				SysRoleMenu entity = new SysRoleMenu();
				entity.preInsert();
				entity.setRoleId(sysRoleMenu.getRoleId());
				entity.setMenuId(menuId);
				sysRoleMenuDao.insert(entity);
			}
		}
	}
	
	/**
	 * 查询出用户未被授权的的角色
	 * @param entity SysUserRole
	 * @return Page<SysRole>
	 */
	public Page<SysRole> queryNotGrantRoleById(SysUserRole entity){
		Page<SysRole> page = new Page<SysRole>();
		
		PageHelper.startPage(entity.getPage().intValue(), entity.getRows().intValue());
		List<SysRole> list = sysUserRoleDao.queryNotGrantRoleById(entity);
		page.setRows(list);
		
		PageInfo<SysRole> pageInfo = new PageInfo<SysRole>(list);
        page.setTotal(pageInfo.getTotal());
        
        page.setEntity(new SysRole());
		
		return page;
	}
	
	/**
	 * 查询出用户未被授权的的角色
	 * @param entity SysUserRole
	 * @return List<SysRole>
	 */
	public List<SysRole> queryGrantRoleById(SysUserRole entity){
		return sysUserRoleDao.queryGrantRoleById(entity);
	}
}
