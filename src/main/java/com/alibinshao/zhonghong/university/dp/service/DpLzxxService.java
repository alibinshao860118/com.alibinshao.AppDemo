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

import com.alibinshao.zhonghong.university.dp.entity.DpLzxx;
import com.alibinshao.zhonghong.university.dp.dao.IDpLzxxDao;

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
public class DpLzxxService extends CrudService<IDpLzxxDao,DpLzxx>{
	
	public DpLzxx get(String id) {
		return super.get(id);
	}
	
	public List<DpLzxx> findList(DpLzxx entity) {
		return super.findList(entity);
	}
	
	public Page<DpLzxx> findPage(DpLzxx entity) {
		return super.findPage(entity);
	}
	
	@Transactional(readOnly = false)
	public void save(DpLzxx entity) {
		super.save(entity);
	}
	
	@Transactional(readOnly = false)
	public void insert(DpLzxx entity) {
		entity.preInsert();
		dao.insert(entity);
	}
	
	@Transactional(readOnly = false)
	public void update(DpLzxx entity) {
		entity.preUpdate();
		dao.update(entity);
	}
	
	@Transactional(readOnly = false)
	public void delete(DpLzxx entity) {
		if(StringUtils.isNotEmpty(entity.getIds())){
			String[] ids = entity.getIds().split("&amp;");
			for (String id : ids) {
				entity.setId(id);
				super.delete(entity);
			}
		}
	}

}
