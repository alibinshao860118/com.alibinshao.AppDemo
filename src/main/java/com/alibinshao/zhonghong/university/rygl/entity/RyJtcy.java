/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.rygl.entity;

import com.alibinshao.zhonghong.fdp.common.persistence.DataEntity;
import com.alibinshao.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(t_ry_jtcy)的实体类
 * </pre>
 * @author liangbinbin 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class RyJtcy extends DataEntity<RyJtcy>{

	private static final long serialVersionUID = 1L;
	
	/** 人员基本信息ID */
	private String ryjbxxId;  //人员基本信息ID
	/** 家庭成员 */
	private String jtcy;  //家庭成员
	/** 关系 */
	private String gx;  //关系
	/** 家人出生日期 */
	private String csrq;  //家人出生日期
	/** 家人学历 */
	private String xl;  //家人学历
	/** 家人民族 */
	private String mz;  //家人民族
	/** 家人政治面貌 */
	private String zzmm;  //家人政治面貌
	/** 家人工作单位 */
	private String gzdw;  //家人工作单位
	/** 家人户籍所在地 */
	private String hjszd;  //家人户籍所在地
	/** 备注 */
	private String bz;  //备注

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

	@ExcelField(title="家庭成员", type=1, align=1, sort=2)
	public String getJtcy(){
		return this.jtcy;
	}

	@ExcelField(title="关系", type=1, align=1, sort=3)
	public String getGx(){
		return this.gx;
	}

	@ExcelField(title="家人出生日期", type=1, align=1, sort=4)
	public String getCsrq(){
		return this.csrq;
	}

	@ExcelField(title="家人学历", type=1, align=1, sort=5)
	public String getXl(){
		return this.xl;
	}

	@ExcelField(title="家人民族", type=1, align=1, sort=6)
	public String getMz(){
		return this.mz;
	}

	@ExcelField(title="家人政治面貌", type=1, align=1, sort=7)
	public String getZzmm(){
		return this.zzmm;
	}

	@ExcelField(title="家人工作单位", type=1, align=1, sort=8)
	public String getGzdw(){
		return this.gzdw;
	}

	@ExcelField(title="家人户籍所在地", type=1, align=1, sort=9)
	public String getHjszd(){
		return this.hjszd;
	}

	@ExcelField(title="备注", type=1, align=1, sort=10)
	public String getBz(){
		return this.bz;
	}

}
