/**
 * Copyright &copy; 2012-2017 <a href="http://www.foresee.com">Foresee</a> All rights reserved.
 */
package com.alibinshao.zhonghong.fdp.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibinshao.zhonghong.fdp.common.persistence.Page;
import com.alibinshao.zhonghong.fdp.common.service.CrudService;
import com.alibinshao.zhonghong.fdp.sys.dao.ISysDictDao;
import com.alibinshao.zhonghong.fdp.sys.entity.SysDict;

/**
 * <pre>
 * 数据字典Service服务类
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
public class SysDictService extends CrudService<ISysDictDao,SysDict>{
	
	public SysDict get(String id) {
		return super.get(id);
	}
	
	public List<SysDict> findList(SysDict entity) {
		return super.findList(entity);
	}
	
	public Page<SysDict> findPage(SysDict entity) {
		return super.findPage(entity);
	}
	
	@Transactional(readOnly = false)
	public void save(SysDict entity) {
		super.save(entity);
	}
	
	@Transactional(readOnly = false)
	public void insert(SysDict entity) {
		entity.preInsert();
		dao.insert(entity);
	}
	
	@Transactional(readOnly = false)
	public void update(SysDict entity) {
		entity.preUpdate();
		dao.update(entity);
	}
	
	@Transactional(readOnly = false)
	public void delete(SysDict entity) {
		if(entity.getIds()!=null){
			String[] ids = entity.getIds().split("&amp;");
			for (String id : ids) {
				entity.setId(id);
				super.delete(entity);
			}
		}
		
	}

}
