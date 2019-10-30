/**
 * Copyright &copy; 2012-2017 <a href="http://www.foresee.com">Foresee</a> All rights reserved.
 */
package com.alibinshao.zhonghong.fdp.sys.service;

import java.util.List;

import com.alibinshao.zhonghong.fdp.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibinshao.zhonghong.fdp.common.persistence.Page;
import com.alibinshao.zhonghong.fdp.common.service.CrudService;

import com.alibinshao.zhonghong.fdp.sys.entity.SysOrg;
import com.alibinshao.zhonghong.fdp.sys.dao.ISysOrgDao;

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
public class SysOrgService extends CrudService<ISysOrgDao,SysOrg>{
	
	public SysOrg get(String id) {
		return super.get(id);
	}
	
	public List<SysOrg> findList(SysOrg entity) {
		return super.findList(entity);
	}
	
	public Page<SysOrg> findPage(SysOrg entity) {
		return super.findPage(entity);
	}
	
	@Transactional(readOnly = false)
	public void save(SysOrg entity) {
		super.save(entity);
	}
	
	@Transactional(readOnly = false)
	public void insert(SysOrg entity) {
		entity.preInsert();
		
		entity.setFullOrgIds(entity.getFullOrgIds()+","+entity.getId());
		
		dao.insert(entity);
	}
	
	@Transactional(readOnly = false)
	public void update(SysOrg entity) {
		entity.preUpdate();
		dao.update(entity);
		
		//修改下级的FullOrgCodes和FullOrgNames
		if(!StringUtils.equals(entity.getFullOrgCodes(), entity.getOldFullOrgCodes())
				|| !StringUtils.equals(entity.getFullOrgNames(), entity.getOldFullOrgNames())){
			entity.setParentOrgCode(entity.getOrgCode());
			dao.updateFullOrgCodes(entity);
		}
		
	}
	
	@Transactional(readOnly = false)
	public void delete(SysOrg entity) {
		super.delete(entity);
	}

}
