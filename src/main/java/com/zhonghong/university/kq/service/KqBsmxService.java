/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.kq.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhonghong.fdp.common.persistence.Page;
import com.zhonghong.fdp.common.service.CrudService;

import com.zhonghong.university.kq.entity.KqBsmx;
import com.zhonghong.university.kq.dao.IKqBsmxDao;

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
public class KqBsmxService extends CrudService<IKqBsmxDao,KqBsmx>{
	
	public KqBsmx get(String id) {
		return super.get(id);
	}
	
	public List<KqBsmx> findList(KqBsmx entity) {
		return super.findList(entity);
	}
	
	public Page<KqBsmx> findPage(KqBsmx entity) {
		return super.findPage(entity);
	}
	
	@Transactional(readOnly = false)
	public void save(KqBsmx entity) {
		super.save(entity);
	}
	
	@Transactional(readOnly = false)
	public void insert(KqBsmx entity) {
		entity.preInsert();
		dao.insert(entity);
	}
	
	@Transactional(readOnly = false)
	public void update(KqBsmx entity) {
		entity.preUpdate();
		dao.update(entity);
	}
	
	@Transactional(readOnly = false)
	public void delete(KqBsmx entity) {
		if(StringUtils.isNotEmpty(entity.getIds())){
			String[] ids = entity.getIds().split("&amp;");
			for (String id : ids) {
				entity.setId(id);
				super.delete(entity);
			}
		}
	}

}
