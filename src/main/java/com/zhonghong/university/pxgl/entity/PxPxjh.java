/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.pxgl.entity;

import com.zhonghong.fdp.common.persistence.DataEntity;
import com.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(t_px_pxjh)的实体类
 * </pre>
 * @author liangbinbin 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class PxPxjh extends DataEntity<PxPxjh>{

	private static final long serialVersionUID = 1L;
	
	/** 机构ID */
	private String orgId;  //机构ID
	/** 计划名称 */
	private String jhMc;  //计划名称
	/** 计划人数 */
	private Integer jhRs;  //计划人数
	/** 培训对象 */
	private String pxDx;  //培训对象
	/** 培训期数 */
	private Integer psQs;  //培训期数
	/** 每期天数 */
	private Integer mqTs;  //每期天数
	/** 计划年度 */
	private String jhYd;  //计划年度
	/** 计划季度 */
	private String jhJd;  //计划季度
	/** 计划月份 */
	private String jhYf;  //计划月份
	/** 培训地点 */
	private String pxDd;  //培训地点
	/** 预算金额 */
	private java.math.BigDecimal ysJe;  //预算金额

	@ExcelField(title="机构ID", type=1, align=1, sort=1)
	public String getOrgId(){
		return this.orgId;
	}

	@ExcelField(title="计划名称", type=1, align=1, sort=2)
	public String getJhMc(){
		return this.jhMc;
	}

	@ExcelField(title="计划人数", type=1, align=1, sort=3)
	public Integer getJhRs(){
		return this.jhRs;
	}

	@ExcelField(title="培训对象", type=1, align=1, sort=4)
	public String getPxDx(){
		return this.pxDx;
	}

	@ExcelField(title="培训期数", type=1, align=1, sort=5)
	public Integer getPsQs(){
		return this.psQs;
	}

	@ExcelField(title="每期天数", type=1, align=1, sort=6)
	public Integer getMqTs(){
		return this.mqTs;
	}

	@ExcelField(title="计划年度", type=1, align=1, sort=7)
	public String getJhYd(){
		return this.jhYd;
	}

	@ExcelField(title="计划季度", type=1, align=1, sort=8)
	public String getJhJd(){
		return this.jhJd;
	}

	@ExcelField(title="计划月份", type=1, align=1, sort=9)
	public String getJhYf(){
		return this.jhYf;
	}

	@ExcelField(title="培训地点", type=1, align=1, sort=10)
	public String getPxDd(){
		return this.pxDd;
	}

	@ExcelField(title="预算金额", type=1, align=1, sort=11)
	public java.math.BigDecimal getYsJe(){
		return this.ysJe;
	}

}
