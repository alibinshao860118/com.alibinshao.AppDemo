/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.kq.dao;

import com.zhonghong.fdp.common.persistence.CrudDao;
import com.zhonghong.fdp.common.persistence.annotation.MyBatisDao;
import com.zhonghong.university.kq.entity.KqBsmx;

/**
 * <pre>
 * DAO接口
 * </pre>
 * @author gulong 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @MyBatisDao
public interface IKqBsmxDao extends CrudDao<KqBsmx>{

	 /**
	  * 根据报送ID物理删除
	  * @param bsId String
	  */
	 public void deleteByBsId(String bsId);

}
