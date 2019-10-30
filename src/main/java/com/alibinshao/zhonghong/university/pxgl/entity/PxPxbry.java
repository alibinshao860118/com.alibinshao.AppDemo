/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.pxgl.entity;

import com.alibinshao.zhonghong.fdp.common.persistence.DataEntity;
import com.alibinshao.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(t_px_pxbry)的实体类
 * </pre>
 * @author liangbinbin 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class PxPxbry extends DataEntity<PxPxbry>{

	private static final long serialVersionUID = 1L;
	
	/** 培训班ID */
	private String pxbId;  //培训班ID
	private String pxbMc; //培训班名称
	/** 人员ID */
	private String ryId;  //人员ID
	/** 姓名 */
	private String xm;  //姓名
	/** 职工编号 */
	private String zgbh;  //职工编号
	/** 考勤成绩 */
	private java.math.BigDecimal kqFs;  //考勤成绩
	/** 平时成绩(分数) */
	private java.math.BigDecimal psFs;  //平时成绩(分数)
	/** 综合成绩(分数) */
	private java.math.BigDecimal zhFs;  //综合成绩(分数)
	/** 结业证号 */
	private String jyzBh;  //结业证号

	@ExcelField(title="培训班ID", type=1, align=1, sort=1)
	public String getPxbId(){
		return this.pxbId;
	}

	@ExcelField(title="人员ID", type=1, align=1, sort=2)
	public String getRyId(){
		return this.ryId;
	}

	@ExcelField(title="姓名", type=1, align=1, sort=3)
	public String getXm(){
		return this.xm;
	}

	@ExcelField(title="职工编号", type=1, align=1, sort=4)
	public String getZgbh(){
		return this.zgbh;
	}

	@ExcelField(title="考勤成绩", type=1, align=1, sort=5)
	public java.math.BigDecimal getKqFs(){
		return this.kqFs;
	}

	@ExcelField(title="平时成绩(分数)", type=1, align=1, sort=6)
	public java.math.BigDecimal getPsFs(){
		return this.psFs;
	}

	@ExcelField(title="综合成绩(分数)", type=1, align=1, sort=7)
	public java.math.BigDecimal getZhFs(){
		return this.zhFs;
	}

	@ExcelField(title="结业证号", type=1, align=1, sort=8)
	public String getJyzBh(){
		return this.jyzBh;
	}

}
