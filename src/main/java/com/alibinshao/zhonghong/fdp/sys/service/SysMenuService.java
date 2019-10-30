/**
 * Copyright &copy; 2012-2017 <a href="http://www.foresee.com">Foresee</a> All rights reserved.
 */
package com.alibinshao.zhonghong.fdp.sys.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibinshao.zhonghong.fdp.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibinshao.zhonghong.fdp.common.persistence.Page;
import com.alibinshao.zhonghong.fdp.common.service.CrudService;

import com.alibinshao.zhonghong.fdp.sys.entity.SysMenu;
import com.alibinshao.zhonghong.fdp.sys.utils.UserUtils;
import com.alibinshao.zhonghong.fdp.sys.dao.ISysMenuDao;

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
public class SysMenuService extends CrudService<ISysMenuDao,SysMenu>{
	
	public SysMenu get(String id) {
		return super.get(id);
	}
	
	public List<SysMenu> findList(SysMenu entity) {
		return super.findList(entity);
	}
	
	public Page<SysMenu> findPage(SysMenu entity) {
		return super.findPage(entity);
	}
	
	@Transactional(readOnly = false)
	public void save(SysMenu entity) {
		super.save(entity);
	}
	
	@Transactional(readOnly = false)
	public void insert(SysMenu entity) {
		entity.preInsert();
		dao.insert(entity);
	}
	
	@Transactional(readOnly = false)
	public void update(SysMenu entity) {
		entity.preUpdate();
		dao.update(entity);
	}
	
	@Transactional(readOnly = false)
	public void delete(SysMenu entity) {
		super.delete(entity);
	}
	
	/**
	 * 获取登录用户所拥有的菜单
	 * @return Map<String,Object>
	 */
	public List<Map<String,Object>> getMenus(){
		List<Map<String,Object>> resultList = new ArrayList<Map<String,Object>>();
		
		boolean isAdmin = UserUtils.getUser().isAdmin();
		
		SysMenu entity = new SysMenu();
		entity.setParentId("0");
		entity.setMenuType("1");
		entity.setVisible("1");
		
		if(isAdmin){ 
			//超级管理员拥有所有的菜单
			entity.setUserId(null);
		}else{
			//普通用户根据当前登录用户身份来获取可见菜单
			entity.setUserId(UserUtils.getUser().getId());
		}
		
		List<SysMenu> topMenus = dao.findList(entity);
		for (SysMenu sysMenu : topMenus) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("id", sysMenu.getId());
			map.put("title", sysMenu.getName());
			map.put("icon", sysMenu.getImageUrl());
			map.put("isCurrent", true);
			map.put("menu", getChildMenus(sysMenu.getId(),entity.getUserId()));
			resultList.add(map);
		}
		
		return resultList;
	}
	
	private List<Map<String,Object>> getChildMenus(String parentId,String userId){
		List<Map<String,Object>> resultList = new ArrayList<Map<String,Object>>();
		
		SysMenu entity = new SysMenu();
		entity.setParentId(parentId);
		entity.setMenuType("1");
		entity.setVisible("1");
		entity.setUserId(userId);
		List<SysMenu> childMenus = dao.findList(entity);
		for (SysMenu sysMenu : childMenus) {
			Map<String,Object> map2 = new HashMap<String,Object>();
			map2.put("id", sysMenu.getId());
			map2.put("title", sysMenu.getName());
			map2.put("icon", sysMenu.getImageUrl());
			map2.put("href", sysMenu.getUrl());
			map2.put("isCurrent", false);
			resultList.add(map2);
			
			if(StringUtils.equals("1", sysMenu.getMenuType())){
				map2.put("children", getChildMenus(sysMenu.getId(), userId));
			}
		}
		
		return resultList;
	}

}
