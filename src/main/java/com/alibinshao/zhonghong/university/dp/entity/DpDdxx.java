/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.dp.entity;

import com.alibinshao.zhonghong.fdp.common.persistence.DataEntity;
import com.alibinshao.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(t_dp_ddxx)的实体类
 * </pre>
 * @author gulong 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class DpDdxx extends DataEntity<DpDdxx>{

	private static final long serialVersionUID = 1L;
	
	/** 人员ID */
	private String ryId;  //人员ID
	/** 姓名 */
	private String xm;  //姓名
	/** 职工编号 */
	private String zgbh;  //职工编号
	/** 调动类型 */
	private String ddLx;  //调动类型
	/** 调动时间 */
	private String ddSj;  //调动时间
	/** 新机构ID */
	private String xorgId;  //新机构ID
	/** 新机构名称 */
	private String xorgMc;  //新机构名称

	@ExcelField(title="人员ID", type=1, align=1, sort=1)
	public String getRyId(){
		return this.ryId;
	}

	@ExcelField(title="姓名", type=1, align=1, sort=2)
	public String getXm(){
		return this.xm;
	}

	@ExcelField(title="职工编号", type=1, align=1, sort=3)
	public String getZgbh(){
		return this.zgbh;
	}

	@ExcelField(title="调动类型", type=1, align=1, sort=4)
	public String getDdLx(){
		return this.ddLx;
	}

	@ExcelField(title="调动时间", type=1, align=1, sort=5)
	public String getDdSj(){
		return this.ddSj;
	}

	@ExcelField(title="新机构ID", type=1, align=1, sort=6)
	public String getXorgId(){
		return this.xorgId;
	}

	@ExcelField(title="新机构名称", type=1, align=1, sort=7)
	public String getXorgMc(){
		return this.xorgMc;
	}

}
