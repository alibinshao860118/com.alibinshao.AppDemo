/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.dp.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibinshao.zhonghong.fdp.common.persistence.Page;
import com.alibinshao.zhonghong.fdp.common.service.CrudService;

import com.alibinshao.zhonghong.university.dp.entity.DpCgxx;
import com.alibinshao.zhonghong.university.dp.dao.IDpCgxxDao;

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
public class DpCgxxService extends CrudService<IDpCgxxDao,DpCgxx>{
	
	public DpCgxx get(String id) {
		return super.get(id);
	}
	
	public List<DpCgxx> findList(DpCgxx entity) {
		return super.findList(entity);
	}
	
	public Page<DpCgxx> findPage(DpCgxx entity) {
		return super.findPage(entity);
	}
	
	@Transactional(readOnly = false)
	public void save(DpCgxx entity) {
		super.save(entity);
	}
	
	@Transactional(readOnly = false)
	public void insert(DpCgxx entity) {
		entity.preInsert();
		dao.insert(entity);
	}
	
	@Transactional(readOnly = false)
	public void update(DpCgxx entity) {
		entity.preUpdate();
		dao.update(entity);
	}
	
	@Transactional(readOnly = false)
	public void delete(DpCgxx entity) {
		if(StringUtils.isNotEmpty(entity.getIds())){
			String[] ids = entity.getIds().split("&amp;");
			for (String id : ids) {
				entity.setId(id);
				super.delete(entity);
			}
		}
	}

}
