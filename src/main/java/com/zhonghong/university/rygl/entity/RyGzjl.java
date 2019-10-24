/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.rygl.entity;

import com.zhonghong.fdp.common.persistence.DataEntity;
import com.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(t_ry_gzjl)的实体类
 * </pre>
 * @author liangbinbin 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class RyGzjl extends DataEntity<RyGzjl>{

	private static final long serialVersionUID = 1L;
	
	/** 人员基本信息ID */
	private String ryjbxxId;  //人员基本信息ID
	/** 开始时间 */
	private String kssj;  //开始时间
	/** 结束日期 */
	private String jsrq;  //结束日期
	/** 工作单位 */
	private String gzdw;  //工作单位
	/** 职务 */
	private String zw;  //职务
	/** 岗位 */
	private String gw;  //岗位
	/** 工作内容 */
	private String gznr;  //工作内容
	/** 离职原因 */
	private String lzyr;  //离职原因

	private String zgbh;
	
	private String name;
	
	/** 部门ID */
	private String orgId;  //部门ID
	/** 部门名称 */
	private String orgName;  //部门名称
	
	private String fullOrgCodes;
	/** 部门名称 */
	private String fullOrgNames;  //部门名称


	@ExcelField(title="职工编号", type=1, align=1, sort=1)
	public String getZgbh(){
		return this.zgbh;
	}
	
	@ExcelField(title="姓名", type=1, align=1, sort=2)
	public String getName(){
		return this.name;
	}

	@ExcelField(title="开始时间", type=1, align=1, sort=2)
	public String getKssj(){
		return this.kssj;
	}

	@ExcelField(title="结束日期", type=1, align=1, sort=3)
	public String getJsrq(){
		return this.jsrq;
	}

	@ExcelField(title="工作单位", type=1, align=1, sort=4)
	public String getGzdw(){
		return this.gzdw;
	}

	@ExcelField(title="职务", type=1, align=1, sort=5)
	public String getZw(){
		return this.zw;
	}

	@ExcelField(title="岗位", type=1, align=1, sort=6)
	public String getGw(){
		return this.gw;
	}

	@ExcelField(title="工作内容", type=1, align=1, sort=7)
	public String getGznr(){
		return this.gznr;
	}

	@ExcelField(title="离职原因", type=1, align=1, sort=8)
	public String getLzyr(){
		return this.lzyr;
	}

}
