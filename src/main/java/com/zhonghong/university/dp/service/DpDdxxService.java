/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.dp.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhonghong.fdp.common.persistence.Page;
import com.zhonghong.fdp.common.service.CrudService;

import com.zhonghong.university.dp.entity.DpDdxx;
import com.zhonghong.university.dp.dao.IDpDdxxDao;

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
public class DpDdxxService extends CrudService<IDpDdxxDao,DpDdxx>{
	
	public DpDdxx get(String id) {
		return super.get(id);
	}
	
	public List<DpDdxx> findList(DpDdxx entity) {
		return super.findList(entity);
	}
	
	public Page<DpDdxx> findPage(DpDdxx entity) {
		return super.findPage(entity);
	}
	
	@Transactional(readOnly = false)
	public void save(DpDdxx entity) {
		super.save(entity);
	}
	
	@Transactional(readOnly = false)
	public void insert(DpDdxx entity) {
		entity.preInsert();
		dao.insert(entity);
	}
	
	@Transactional(readOnly = false)
	public void update(DpDdxx entity) {
		entity.preUpdate();
		dao.update(entity);
	}
	
	@Transactional(readOnly = false)
	public void delete(DpDdxx entity) {
		if(StringUtils.isNotEmpty(entity.getIds())){
			String[] ids = entity.getIds().split("&amp;");
			for (String id : ids) {
				entity.setId(id);
				super.delete(entity);
			}
		}
	}

}
