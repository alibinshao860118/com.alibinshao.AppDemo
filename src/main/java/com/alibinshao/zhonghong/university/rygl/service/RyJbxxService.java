/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.rygl.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.alibinshao.zhonghong.fdp.common.persistence.Page;
import com.alibinshao.zhonghong.fdp.common.service.CrudService;

import com.alibinshao.zhonghong.university.rygl.entity.RyJbxx;
import com.alibinshao.zhonghong.university.rygl.entity.RyOrgrygx;
import com.alibinshao.zhonghong.university.rygl.dao.IRyJbxxDao;
import com.alibinshao.zhonghong.university.rygl.dao.IRyOrgrygxDao;

/**
 * <pre>
 * Service服务类
 * </pre>
 * @author liangbinbin 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
@Service
@Transactional(readOnly = true)
public class RyJbxxService extends CrudService<IRyJbxxDao,RyJbxx>{
	
	@Autowired
	IRyOrgrygxDao ryOrgrygxDao;
	
	public RyJbxx get(String id) {
		return super.get(id);
	}
	
	public List<RyJbxx> findList(RyJbxx entity) {
		return super.findList(entity);
	}
	
	public Page<RyJbxx> findPage(RyJbxx entity) {
		return super.findPage(entity);
	}
	
	public Page<RyOrgrygx> findPage(RyOrgrygx entity) {
		Page<RyOrgrygx> page = new Page<RyOrgrygx>();
		
		PageHelper.startPage(entity.getPage().intValue(), entity.getRows().intValue());
		List<RyOrgrygx> list = ryOrgrygxDao.findList(entity);
		page.setRows(list);
		
		PageInfo<RyOrgrygx> pageInfo = new PageInfo<RyOrgrygx>(list);
        page.setTotal(pageInfo.getTotal());
        
        page.setEntity(entity);
		
		return page;
	}
	
	public Page<RyOrgrygx> findNotExistOrgUser(RyOrgrygx entity) {
		Page<RyOrgrygx> page = new Page<RyOrgrygx>();
		
		PageHelper.startPage(entity.getPage().intValue(), entity.getRows().intValue());
		List<RyOrgrygx> list = ryOrgrygxDao.findNotExistOrgUser(entity);
		page.setRows(list);
		
		PageInfo<RyOrgrygx> pageInfo = new PageInfo<RyOrgrygx>(list);
        page.setTotal(pageInfo.getTotal());
        
        page.setEntity(entity);
		
		return page;
	}
	
	@Transactional(readOnly = false)
	public void save(RyJbxx entity) {
		super.save(entity);
	}
	
	@Transactional(readOnly = false)
	public String saveRyjbxx(RyJbxx entity) {
		entity.preInsert();
		String id=entity.getId();
		dao.insert(entity);
		return id;
	}
	
	@Transactional(readOnly = false)
	public void update(RyJbxx entity) {
		entity.preUpdate();
		dao.update(entity);
	}
	
	@Transactional(readOnly = false)
	public void delete(RyJbxx entity) {
		if(StringUtils.isNotEmpty(entity.getIds())){
			String[] ids = entity.getIds().split("&amp;");
			for (String id : ids) {
				entity.setId(id);
				super.delete(entity);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void deleteBy(RyOrgrygx entity) {
		if(StringUtils.isNotEmpty(entity.getIds())){
			String[] ids = entity.getIds().split("&amp;");
			for (String id : ids) {
				ryOrgrygxDao.deleteById(id);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void insertOrgRy(List<RyOrgrygx> list) {
		for (RyOrgrygx entity : list) {
			entity.preInsert();
			ryOrgrygxDao.insert(entity);
		}
	}

}
