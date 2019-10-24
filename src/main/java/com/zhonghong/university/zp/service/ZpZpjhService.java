/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.zp.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhonghong.fdp.common.persistence.Page;
import com.zhonghong.fdp.common.service.CrudService;

import com.zhonghong.university.zp.entity.ZpZpjh;
import com.zhonghong.university.zp.entity.ZpZpxq;
import com.zhonghong.university.zp.dao.IZpZpjhDao;
import com.zhonghong.university.zp.dao.IZpZpxqDao;

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
public class ZpZpjhService extends CrudService<IZpZpjhDao,ZpZpjh>{
	
	@Autowired
	IZpZpxqDao zpxqDao;
	
	public ZpZpjh get(String id) {
		return super.get(id);
	}
	
	public ZpZpxq getZpxq(String id) {
		return zpxqDao.get(id);
	}
	
	public ZpZpjh getByJhbh(String jhbh) {
		return dao.getByJhbh(jhbh);
	}
	
	public List<ZpZpjh> findList(ZpZpjh entity) {
		return super.findList(entity);
	}
	
	public Page<ZpZpjh> findPage(ZpZpjh entity) {
		return super.findPage(entity);
	}
	
	@Transactional(readOnly = false)
	public void save(ZpZpjh entity) {
		super.save(entity);
	}
	
	@Transactional(readOnly = false)
	public void insert(ZpZpjh entity) {
		entity.preInsert();
		dao.insert(entity);
	}
	
	@Transactional(readOnly = false)
	public void update(ZpZpjh entity) {
		entity.preUpdate();
		dao.update(entity);
	}
	
	@Transactional(readOnly = false)
	public void delete(ZpZpjh entity) {
		if(StringUtils.isNotEmpty(entity.getIds())){
			String[] ids = entity.getIds().split("&amp;");
			for (String id : ids) {
				entity.setId(id);
				super.delete(entity);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public List<ZpZpxq> queryZpxqByZpjh(ZpZpxq entity){
		return zpxqDao.findList(entity);
	}

}
