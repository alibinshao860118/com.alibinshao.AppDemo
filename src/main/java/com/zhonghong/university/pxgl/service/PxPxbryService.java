/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.pxgl.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhonghong.fdp.common.persistence.Page;
import com.zhonghong.fdp.common.service.CrudService;

import com.zhonghong.university.pxgl.entity.PxPxbry;
import com.zhonghong.university.pxgl.dao.IPxPxbryDao;

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
public class PxPxbryService extends CrudService<IPxPxbryDao,PxPxbry>{
	
	public PxPxbry get(String id) {
		return super.get(id);
	}
	
	public List<PxPxbry> findList(PxPxbry entity) {
		return super.findList(entity);
	}
	
	public Page<PxPxbry> findPage(PxPxbry entity) {
		return super.findPage(entity);
	}
	
	@Transactional(readOnly = false)
	public void save(PxPxbry entity) {
		super.save(entity);
	}
	
	@Transactional(readOnly = false)
	public void insert(PxPxbry entity) {
		entity.preInsert();
		dao.insert(entity);
	}
	
	@Transactional(readOnly = false)
	public void update(PxPxbry entity) {
		entity.preUpdate();
		dao.update(entity);
	}
	
	@Transactional(readOnly = false)
	public void delete(PxPxbry entity) {
		if(StringUtils.isNotEmpty(entity.getIds())){
			String[] ids = entity.getIds().split("&amp;");
			for (String id : ids) {
				entity.setId(id);
				super.delete(entity);
			}
		}
	}

	/**
	 * 培训班下拉控件
	 * @return
	 */
	public List<PxPxbry> selectPxbList() {
		List<PxPxbry> list = dao.selectPxbList();
		return list;
	}
}
