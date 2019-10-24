/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.pxgl.entity;

import com.zhonghong.fdp.common.persistence.DataEntity;
import com.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(t_px_jszgz)的实体类
 * </pre>
 * @author liangbinbin 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class PxJszgz extends DataEntity<PxJszgz>{

	private static final long serialVersionUID = 1L;
	
	/** 人员ID */
	private String ryId;  //人员ID
	/** 姓名 */
	private String xm;  //姓名
	/** 职工编号 */
	private String zgbh;  //职工编号
	/** 岗前培训成绩(分数) */
	private java.math.BigDecimal gqpxFs;  //岗前培训成绩(分数)
	/** 技能测试成绩(分数) */
	private java.math.BigDecimal jncsFs;  //技能测试成绩(分数)
	/** 普通话等级 */
	private String pthDj;  //普通话等级
	/** 体检结果 */
	private String tjZg;  //体检结果
	/** 资格证号 */
	private String zgzBh;  //资格证号

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

	@ExcelField(title="岗前培训成绩(分数)", type=1, align=1, sort=4)
	public java.math.BigDecimal getGqpxFs(){
		return this.gqpxFs;
	}

	@ExcelField(title="技能测试成绩(分数)", type=1, align=1, sort=5)
	public java.math.BigDecimal getJncsFs(){
		return this.jncsFs;
	}

	@ExcelField(title="普通话等级", type=1, align=1, sort=6)
	public String getPthDj(){
		return this.pthDj;
	}

	@ExcelField(title="体检结果", type=1, align=1, sort=7)
	public String getTjZg(){
		return this.tjZg;
	}

	@ExcelField(title="资格证号", type=1, align=1, sort=8)
	public String getZgzBh(){
		return this.zgzBh;
	}

}
