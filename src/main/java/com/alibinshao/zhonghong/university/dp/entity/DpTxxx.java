/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.dp.entity;

import com.alibinshao.zhonghong.fdp.common.persistence.DataEntity;
import com.alibinshao.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(t_dp_txxx)的实体类
 * </pre>
 * @author gulong 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class DpTxxx extends DataEntity<DpTxxx>{

	private static final long serialVersionUID = 1L;
	
	/** 人员ID */
	private String ryId;  //人员ID
	/** 姓名 */
	private String xm;  //姓名
	/** 职工编号 */
	private String zgbh;  //职工编号
	/** 退休年份 */
	private String txYf;  //退休年份
	/** 退休月份 */
	private String txMf;  //退休月份
	/** 退休级别 */
	private String txJb;  //退休级别
	/** 离退休费 */
	private java.math.BigDecimal ltxJe;  //离退休费
	/** 离退补贴 */
	private java.math.BigDecimal ltxbtJe;  //离退补贴

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

	@ExcelField(title="退休年份", type=1, align=1, sort=4)
	public String getTxYf(){
		return this.txYf;
	}

	@ExcelField(title="退休月份", type=1, align=1, sort=5)
	public String getTxMf(){
		return this.txMf;
	}

	@ExcelField(title="退休级别", type=1, align=1, sort=6)
	public String getTxJb(){
		return this.txJb;
	}

	@ExcelField(title="离退休费", type=1, align=1, sort=7)
	public java.math.BigDecimal getLtxJe(){
		return this.ltxJe;
	}

	@ExcelField(title="离退补贴", type=1, align=1, sort=8)
	public java.math.BigDecimal getLtxbtJe(){
		return this.ltxbtJe;
	}

}
