/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.htgl.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibinshao.zhonghong.fdp.common.persistence.Page;
import com.alibinshao.zhonghong.fdp.common.service.CrudService;
import com.alibinshao.zhonghong.fdp.common.utils.DateUtils;
import com.alibinshao.zhonghong.university.htgl.entity.HtHtxx;
import com.alibinshao.zhonghong.university.htgl.dao.IHtHtxxDao;

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
public class HtHtxxService extends CrudService<IHtHtxxDao,HtHtxx>{
	
	public HtHtxx get(String id) {
		return super.get(id);
	}
	
	public List<HtHtxx> findList(HtHtxx entity) {
		return super.findList(entity);
	}
	
	public Page<HtHtxx> findPage(HtHtxx entity) {
		return super.findPage(entity);
	}
	
	@Transactional(readOnly = false)
	public void save(HtHtxx entity) {
		super.save(entity);
	}
	
	@Transactional(readOnly = false)
	public void insert(HtHtxx entity) {
		entity.preInsert();
		dao.insert(entity);
	}
	
	@Transactional(readOnly = false)
	public void update(HtHtxx entity) {
		entity.preUpdate();
		if(StringUtils.isNotEmpty(entity.getIds())){
			String[] ids = entity.getIds().split("&amp;");
			for (String id : ids) {
				entity.setId(id);
				dao.update(entity);
			}
		}else{
			dao.update(entity);
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(HtHtxx entity) {
		if(StringUtils.isNotEmpty(entity.getIds())){
			String[] ids = entity.getIds().split("&amp;");
			for (String id : ids) {
				entity.setId(id);
				super.delete(entity);
			}
		}
	}

	/**
	 * 还原或者终止合同
	 * @param entity
	 */
	@Transactional(readOnly = false)
	public void updateHtzt(HtHtxx entity) {
		if(StringUtils.isNotEmpty(entity.getIds())){
			entity.preUpdate();
			if("0".equals(entity.getHtZt())){
				//终止合同时，传入终止日期
				entity.setZzRq(DateUtils.formatDate(entity.getUpdateDate(), "yyyy-MM-dd"));
			}else{
				entity.setZzRq("");
			}
			String[] ids = entity.getIds().split("&amp;");
			for (String id : ids) {
				entity.setId(id);
				dao.updateHtzt(entity);
			}
		}
		
	}

}
