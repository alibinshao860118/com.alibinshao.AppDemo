/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.kq.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.zhonghong.fdp.common.persistence.DataEntity;
import com.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(t_kq_bsxx)的实体类
 * </pre>
 * @author gulong 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class KqBsxx extends DataEntity<KqBsxx>{

	private static final long serialVersionUID = 1L;
	
	/** 机构ID */
	private String orgId;  //机构ID
	/** 考勤年份 */
	private String kqYf;  //考勤年份
	/** 考勤月份 */
	private String kqMf;  //考勤月份
	/** 考勤状态，0未提交，1已提交 */
	private String kqZt;  //考勤状态，0未提交，1已提交
	
	protected String createNameBy;	// 创建者
	protected String createDateStr;	// 创建日期
	
	private String orgCode;
	private String orgName;
	
	private String fullOrgCodes;
	private String fullOrgNames;
	
	private List<KqBsmx> bsmxList = new ArrayList<KqBsmx>();

	@ExcelField(title="考勤部门", type=1, align=1, sort=1)
	public String getOrgName(){
		return this.orgName;
	}

	@ExcelField(title="考勤年份", type=1, align=1, sort=2)
	public String getKqYf(){
		return this.kqYf;
	}

	@ExcelField(title="考勤月份", type=1, align=1, sort=3)
	public String getKqMf(){
		return this.kqMf;
	}

	@ExcelField(title="报送人", type=1, align=1, sort=4)
	public String getCreateNameBy(){
		return this.createNameBy;
	}
	
	@ExcelField(title="报送时间", type=1, align=1, sort=5)
	public String getCreateDateStr(){
		return this.createDateStr;
	}

}
