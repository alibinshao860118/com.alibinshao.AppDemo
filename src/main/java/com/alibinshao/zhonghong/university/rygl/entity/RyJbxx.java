/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.rygl.entity;

import java.util.Date;

import com.alibinshao.zhonghong.fdp.common.persistence.DataEntity;
import com.alibinshao.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(T_RY_JBXX)的实体类
 * </pre>
 * @author liangbinbin 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class RyJbxx extends DataEntity<RyJbxx>{

	private static final long serialVersionUID = 1L;
	
	/** 姓名 */
	private String name;  //姓名
	/** 职工编号 */
	private String zgbh;  //职工编号
	/** 部门ID */
	private String orgId;  //部门ID
	/** 部门名称 */
	private String orgName;  //部门名称
	
	private String fullOrgCodes;
	/** 部门名称 */
	private String fullOrgNames;  //部门名称
	/** 性别(1男2女) */
	private String xb;  //性别(1男2女)
	/** 出生日期 */
	private Date birthdate;  //出生日期
	private String birthdateStr;
	/** 是否结婚 */
	private String sfjh;  //是否结婚
	/** 证件类型(关联字典表) */
	private String zjlx;  //证件类型(关联字典表)
	private String zjlxMc;
	/** 证件号码 */
	private String sfzjhm;  //证件号码
	/** 国籍 */
	private String gj;  //国籍
	/** 民族 */
	private String mz;  //民族
	private String mzMc;
	/** 港澳台侨(1港2澳3台4侨) */
	private String gatq;  //港澳台侨(1港2澳3台4侨)
	/** 政治面貌(关联字典表) */
	private String zzmm;  //政治面貌(关联字典表)
	private String zzmmMc;
	/** 出生地 */
	private String birthaddress;  //出生地
	/** 籍贯 */
	private String jg;  //籍贯
	/** 户籍种类 */
	private String hjzl;  //户籍种类

	@ExcelField(title="姓名", type=1, align=1, sort=1)
	public String getName(){
		return this.name;
	}

	@ExcelField(title="职工编号", type=1, align=1, sort=2)
	public String getZgbh(){
		return this.zgbh;
	}

	@ExcelField(title="部门名称", type=1, align=1, sort=3)
	public String getFullOrgNames(){
		return this.fullOrgNames;
	}

	@ExcelField(title="性别(1男2女)", type=1, align=1, sort=4)
	public String getXb(){
		return this.xb;
	}

	@ExcelField(title="出生日期", type=1, align=1, sort=5)
	public Date getBirthdate(){
		return this.birthdate;
	}

	@ExcelField(title="是否结婚", type=1, align=1, sort=6)
	public String getSfjh(){
		return this.sfjh;
	}

	@ExcelField(title="证件类型(关联字典表)", type=1, align=1, sort=7)
	public String getZjlx(){
		return this.zjlx;
	}

	@ExcelField(title="证件号码", type=1, align=1, sort=8)
	public String getSfzjhm(){
		return this.sfzjhm;
	}

	@ExcelField(title="国籍", type=1, align=1, sort=9)
	public String getGj(){
		return this.gj;
	}

	@ExcelField(title="民族", type=1, align=1, sort=10)
	public String getMz(){
		return this.mz;
	}

	@ExcelField(title="港澳台侨", type=1, align=1, sort=11)
	public String getGatq(){
		return this.gatq;
	}

	@ExcelField(title="政治面貌(关联字典表)", type=1, align=1, sort=12)
	public String getZzmm(){
		return this.zzmm;
	}

	@ExcelField(title="出生地", type=1, align=1, sort=13)
	public String getBirthaddress(){
		return this.birthaddress;
	}

	@ExcelField(title="籍贯", type=1, align=1, sort=14)
	public String getJg(){
		return this.jg;
	}

	@ExcelField(title="户籍种类", type=1, align=1, sort=15)
	public String getHjzl(){
		return this.hjzl;
	}

}
