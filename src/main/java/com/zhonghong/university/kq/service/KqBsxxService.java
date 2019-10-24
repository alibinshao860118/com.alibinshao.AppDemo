/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.kq.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhonghong.fdp.common.persistence.Page;
import com.zhonghong.fdp.common.service.CrudService;
import com.zhonghong.university.kq.entity.KqBsmx;
import com.zhonghong.university.kq.entity.KqBsxx;
import com.zhonghong.university.kq.dao.IKqBsmxDao;
import com.zhonghong.university.kq.dao.IKqBsxxDao;

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
public class KqBsxxService extends CrudService<IKqBsxxDao,KqBsxx>{
	
	@Autowired
	IKqBsmxDao kqBsmxDao;
	
	public KqBsxx get(String id) {
		return super.get(id);
	}
	
	public List<KqBsmx> getBsmxBy(KqBsxx kqBsxx){
		return this.dao.getBsmxBy(kqBsxx);
	}
	
	public List<KqBsxx> findList(KqBsxx entity) {
		return super.findList(entity);
	}
	
	public Page<KqBsxx> findPage(KqBsxx entity) {
		return super.findPage(entity);
	}
	
	@Transactional(readOnly = false)
	public void save(KqBsxx entity) {
		super.save(entity);
	}
	
	@Transactional(readOnly = false)
	public void insert(KqBsxx entity) {
		entity.preInsert();
		dao.insert(entity);
		
		if(entity.getBsmxList()!=null){
			for (KqBsmx kqBsmx : entity.getBsmxList()) {
				kqBsmx.preInsert();
				kqBsmx.setBsId(entity.getId());
				kqBsmx.setOrgId(entity.getOrgId());
				kqBsmx.setKqYf(entity.getKqYf());
				kqBsmx.setKqMf(entity.getKqMf());
				kqBsmxDao.insert(kqBsmx);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void update(KqBsxx entity) {
		entity.preUpdate();
		dao.update(entity);
		
		kqBsmxDao.deleteByBsId(entity.getId());
		
		if(entity.getBsmxList()!=null){
			for (KqBsmx kqBsmx : entity.getBsmxList()) {
				kqBsmx.preInsert();
				kqBsmx.setBsId(entity.getId());
				kqBsmx.setOrgId(entity.getOrgId());
				kqBsmx.setKqYf(entity.getKqYf());
				kqBsmx.setKqMf(entity.getKqMf());
				kqBsmxDao.insert(kqBsmx);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(KqBsxx entity) {
		if(StringUtils.isNotEmpty(entity.getIds())){
			String[] ids = entity.getIds().split("&amp;");
			for (String id : ids) {
				entity.setId(id);
				super.delete(entity);
			}
		}
	}

}
