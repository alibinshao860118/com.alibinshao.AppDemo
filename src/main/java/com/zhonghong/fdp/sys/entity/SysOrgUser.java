/**
 * Copyright &copy; 2012-2017 <a href="http://www.foresee.com">Foresee</a> All rights reserved.
 */
package com.zhonghong.fdp.sys.entity;

import com.zhonghong.fdp.common.persistence.DataEntity;



/**
 * <pre>
 * 对应数据库表(FBIDP_SYS_ORG_USER)的实体类
 * </pre>
 * @author  
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 
public class SysOrgUser extends DataEntity<SysOrgUser>{
	private static final long serialVersionUID = 1L;
	
	/** 机构ID */
	private String orgId;  //机构ID
	/** 用户ID */
	private String userId;  //用户ID
	
	private String ids;

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

}
