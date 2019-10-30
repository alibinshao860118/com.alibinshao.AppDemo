/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.pxgl.entity;

import com.alibinshao.zhonghong.fdp.common.persistence.DataEntity;
import com.alibinshao.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(t_px_pxb)的实体类
 * </pre>
 * @author liangbinbin 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class PxPxb extends DataEntity<PxPxb>{

	private static final long serialVersionUID = 1L;
	
	/** 计划ID */
	private String pxjhId;  //计划ID
	/** 计划名称 */
	private String pxjhMc; 
	/** 培训班名称 */
	private String pxbMc;  //培训班名称
	/** 招收人数 */
	private Integer jhRs;  //招收人数
	/** 讲师姓名 */
	private String pxDx;  //讲师姓名
	/** 开课时间 */
	private String kkSj;  //开课时间
	/** 结课时间 */
	private String jkSj;  //结课时间
	/** 培训地点 */
	private String pxDd;  //培训地点
	/** 考核合格分数线 */
	private java.math.BigDecimal hgFs;  //考核合格分数线

	@ExcelField(title="计划ID", type=1, align=1, sort=1)
	public String getPxjhId(){
		return this.pxjhId;
	}

	@ExcelField(title="培训班名称", type=1, align=1, sort=2)
	public String getPxbMc(){
		return this.pxbMc;
	}

	@ExcelField(title="招收人数", type=1, align=1, sort=3)
	public Integer getJhRs(){
		return this.jhRs;
	}

	@ExcelField(title="讲师姓名", type=1, align=1, sort=4)
	public String getPxDx(){
		return this.pxDx;
	}

	@ExcelField(title="开课时间", type=1, align=1, sort=5)
	public String getKkSj(){
		return this.kkSj;
	}

	@ExcelField(title="结课时间", type=1, align=1, sort=6)
	public String getJkSj(){
		return this.jkSj;
	}

	@ExcelField(title="培训地点", type=1, align=1, sort=7)
	public String getPxDd(){
		return this.pxDd;
	}

	@ExcelField(title="考核合格分数线", type=1, align=1, sort=8)
	public java.math.BigDecimal getHgFs(){
		return this.hgFs;
	}

}
