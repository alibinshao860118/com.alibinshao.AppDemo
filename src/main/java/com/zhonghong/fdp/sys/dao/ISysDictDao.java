/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zhonghong.fdp.sys.dao;

import java.util.List;

import com.zhonghong.fdp.common.persistence.CrudDao;
import com.zhonghong.fdp.common.persistence.annotation.MyBatisDao;
import com.zhonghong.fdp.sys.entity.SysDict;


/**
 * 字典DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface ISysDictDao extends CrudDao<SysDict> {

	public List<String> findTypeList(SysDict dict);
	
}
