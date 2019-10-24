/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.dp.entity;

import com.zhonghong.fdp.common.persistence.DataEntity;
import com.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(t_dp_cgxx)的实体类
 * </pre>
 * @author gulong 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class DpCgxx extends DataEntity<DpCgxx>{

	private static final long serialVersionUID = 1L;
	
	/** 人员ID */
	private String ryId;  //人员ID
	/** 姓名 */
	private String xm;  //姓名
	/** 职工编号 */
	private String zgbh;  //职工编号
	/** 出国类别 */
	private String cgLb;  //出国类别
	/** 出国国别 */
	private String cgGb;  //出国国别
	/** 出国任务 */
	private String cgRw;  //出国任务
	/** 出国方式 */
	private String cgFs;  //出国方式
	/** 出国日期 */
	private String cgRq;  //出国日期
	/** 应回国日期 */
	private String yhgRq;  //应回国日期
	/** 实回国日期 */
	private String hgRq;  //实回国日期

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

	@ExcelField(title="出国类别", type=1, align=1, sort=4)
	public String getCgLb(){
		return this.cgLb;
	}

	@ExcelField(title="出国国别", type=1, align=1, sort=5)
	public String getCgGb(){
		return this.cgGb;
	}

	@ExcelField(title="出国任务", type=1, align=1, sort=6)
	public String getCgRw(){
		return this.cgRw;
	}

	@ExcelField(title="出国方式", type=1, align=1, sort=7)
	public String getCgFs(){
		return this.cgFs;
	}

	@ExcelField(title="出国日期", type=1, align=1, sort=8)
	public String getCgRq(){
		return this.cgRq;
	}

	@ExcelField(title="应回国日期", type=1, align=1, sort=9)
	public String getYhgRq(){
		return this.yhgRq;
	}

	@ExcelField(title="实回国日期", type=1, align=1, sort=10)
	public String getHgRq(){
		return this.hgRq;
	}

}
