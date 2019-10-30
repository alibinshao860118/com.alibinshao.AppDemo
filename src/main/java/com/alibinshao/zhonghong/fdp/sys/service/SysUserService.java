/**
 * Copyright &copy; 2012-2017 <a href="http://www.foresee.com">Foresee</a> All rights reserved.
 */
package com.alibinshao.zhonghong.fdp.sys.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibinshao.zhonghong.fdp.common.persistence.Page;
import com.alibinshao.zhonghong.fdp.common.service.CrudService;
import com.alibinshao.zhonghong.fdp.common.utils.CacheUtils;
import com.alibinshao.zhonghong.fdp.sys.dao.ISysOrgUserDao;
import com.alibinshao.zhonghong.fdp.sys.dao.ISysUserDao;
import com.alibinshao.zhonghong.fdp.sys.dao.ISysUserRoleDao;
import com.alibinshao.zhonghong.fdp.sys.entity.SysOrg;
import com.alibinshao.zhonghong.fdp.sys.entity.SysOrgUser;
import com.alibinshao.zhonghong.fdp.sys.entity.SysUser;
import com.alibinshao.zhonghong.fdp.sys.entity.SysUserRole;
import com.alibinshao.zhonghong.fdp.sys.utils.UserUtils;

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
public class SysUserService extends CrudService<ISysUserDao,SysUser>{
	
	@Autowired
	private ISysUserRoleDao sysUserRoleDao;
	@Autowired
	private ISysOrgUserDao sysOrgUserDao;
	
	public SysUser get(String id) {
		return super.get(id);
	}
	
	public List<SysUser> findList(SysUser entity) {
		return super.findList(entity);
	}
	
	public Page<SysUser> findPage(SysUser entity) {
		return super.findPage(entity);
	}
	
	@Transactional(readOnly = false)
	public void save(SysUser entity) {
		super.save(entity);
	}
	
	@Transactional(readOnly = false)
	public void insert(SysUser entity) {
		entity.preInsert();
		entity.setPasswd(SystemService.getDefaultPassword());
		dao.insert(entity);
	}
	
	@Transactional(readOnly = false)
	public void update(SysUser entity) {
		entity.preUpdate();
		dao.update(entity);
		
		//清理缓存
		UserUtils.clearCache(entity);
	}
	
	@Transactional(readOnly = false)
	public void delete(SysUser entity) {
		if(StringUtils.isNotEmpty(entity.getIds())){
			String[] ids = entity.getIds().split("&amp;");
			for (String id : ids) {
				entity.setId(id);
				super.delete(entity);
				
				//清理缓存
				UserUtils.clearCache(entity);
			}
			
		}
	}
	
	@Transactional(readOnly = false)
	public void updatePasswordById(SysUser entity) {
		entity.setPasswd(SystemService.entryptPassword(entity.getNewPasswd()));
		dao.updatePasswordById(entity);
		
		//清理缓存
		UserUtils.clearCache(entity);
	}
	
	
	@Transactional(readOnly = false)
	public void addUserRole(SysUserRole entity) {
		if(StringUtils.isNotEmpty(entity.getIds())){
			String[] ids = entity.getIds().split("&amp;");
			for (String id : ids) {
				entity.preInsert();
				entity.setRoleId(id);
				sysUserRoleDao.insert(entity);
			}
			
			CacheUtils.remove(UserUtils.USER_CACHE, UserUtils.USER_CACHE_ID_ + entity.getUserId());
			SysUser user = this.get(entity.getUserId());
			CacheUtils.remove(UserUtils.USER_CACHE, UserUtils.USER_CACHE_LOGIN_NAME_ + user.getLoginId());
		}
	}
	
	@Transactional(readOnly = false)
	public void deleteUserRole(SysUserRole entity) {
		if(StringUtils.isNotEmpty(entity.getIds())){
			String[] ids = entity.getIds().split("&amp;");
			for (String id : ids) {
				entity.setId(null);
				entity.setRoleId(id);
				sysUserRoleDao.delete(entity);
			}
			
			CacheUtils.remove(UserUtils.USER_CACHE, UserUtils.USER_CACHE_ID_ + entity.getUserId());
			SysUser user = this.get(entity.getUserId());
			CacheUtils.remove(UserUtils.USER_CACHE, UserUtils.USER_CACHE_LOGIN_NAME_ + user.getLoginId());
		}
	}
	
	@Transactional(readOnly = false)
	public void addOrgUser(SysOrgUser entity) {
		if(StringUtils.isNotEmpty(entity.getIds())){
			String[] ids = entity.getIds().split("&amp;");
			for (String id : ids) {
				entity.preInsert();
				entity.setOrgId(id);
				sysOrgUserDao.insert(entity);
			}
			
			CacheUtils.remove(UserUtils.USER_CACHE, UserUtils.USER_CACHE_ID_ + entity.getUserId());
			SysUser user = this.get(entity.getUserId());
			CacheUtils.remove(UserUtils.USER_CACHE, UserUtils.USER_CACHE_LOGIN_NAME_ + user.getLoginId());
		}
		
	}
	
	@Transactional(readOnly = false)
	public void deleteOrgUser(SysOrgUser entity) {
		if(StringUtils.isNotEmpty(entity.getIds())){
			String[] ids = entity.getIds().split("&amp;");
			for (String id : ids) {
				entity.setId(null);
				entity.setOrgId(id);
				sysOrgUserDao.delete(entity);
			}
			
			CacheUtils.remove(UserUtils.USER_CACHE, UserUtils.USER_CACHE_ID_ + entity.getUserId());
			SysUser user = this.get(entity.getUserId());
			CacheUtils.remove(UserUtils.USER_CACHE, UserUtils.USER_CACHE_LOGIN_NAME_ + user.getLoginId());
		}
	}
	
	/**
	 * 查询出用户的授权机构
	 * @param sysOrgUser
	 * @return
	 */
	public List<SysOrg> queryGrantOrgById(SysOrgUser sysOrgUser){
		return sysOrgUserDao.queryGrantOrgById(sysOrgUser);
	}

}
