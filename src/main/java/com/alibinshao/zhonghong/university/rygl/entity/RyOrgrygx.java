/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.rygl.entity;

import com.alibinshao.zhonghong.fdp.common.persistence.DataEntity;
import com.alibinshao.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(T_RY_ORGRYGX)的实体类
 * </pre>
 * @author gulong 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class RyOrgrygx extends DataEntity<RyOrgrygx>{

	private static final long serialVersionUID = 1L;
	
	/** 组织机构ID */
	private String orgId;  //组织机构ID
	/** 人员ID */
	private String ryId;  //人员ID
	/** 姓名 */
	private String name;  //姓名
	/** 职工编号 */
	private String zgbh;  //职工编号
	/** 性别(1男2女) */
	private String xb;  //性别(1男2女)
	/** 是否结婚 */
	private String sfjh;  //是否结婚
	/** 证件类型(关联字典表) */
	private String zjlx;  //证件类型(关联字典表)
	/** 证件号码 */
	private String sfzjhm;  //证件号码

	@ExcelField(title="组织机构ID", type=1, align=1, sort=1)
	public String getOrgId(){
		return this.orgId;
	}

	@ExcelField(title="人员ID", type=1, align=1, sort=2)
	public String getRyId(){
		return this.ryId;
	}

}
