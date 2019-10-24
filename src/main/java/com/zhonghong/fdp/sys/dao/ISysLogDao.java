/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zhonghong.fdp.sys.dao;

import com.zhonghong.fdp.common.persistence.CrudDao;
import com.zhonghong.fdp.common.persistence.annotation.MyBatisDao;
import com.zhonghong.fdp.sys.entity.SysLog;

/**
 * 日志DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface ISysLogDao extends CrudDao<SysLog> {

}
