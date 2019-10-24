/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.htgl.entity;

import com.zhonghong.fdp.common.persistence.DataEntity;
import com.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(t_ht_htxx)的实体类
 * </pre>
 * @author liangbinbin 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class HtHtxx extends DataEntity<HtHtxx>{

	private static final long serialVersionUID = 1L;
	
	/** 人员ID */
	private String ryId;  //人员ID
	/** 姓名 */
	private String xm;  //姓名
	/** 职工编号 */
	private String zgbh;  //职工编号
	/** 合同编号 */
	private String htBh;  //合同编号
	/** 合同类型 */
	private String htLx;  //合同类型
	/** 合同状态(0终止；1正常；) */
	private String htZt;  //合同状态(0终止；1正常；)
	/** 是否固定期限（1是；0否） */
	private String sfGdqx;  //是否固定期限（1是；0否）
	/** 试用期月数 */
	private Integer syqYs;  //试用期月数
	/** 开始日期 */
	private String ksRq;  //开始日期
	/** 到期日期 */
	private String dqRq;  //到期日期
	/** 续签标志，1新签，2续签 */
	private String xqFlag;  //续签标志，1新签，2续签
	/** 续签日期 */
	private String xqRq;  //续签日期
	/** 终止日期 */
	private String zzRq;  //终止日期
	
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

	@ExcelField(title="合同编号", type=1, align=1, sort=4)
	public String getHtBh(){
		return this.htBh;
	}

	@ExcelField(title="合同类型", type=1, align=1, sort=5)
	public String getHtLx(){
		return this.htLx;
	}

	@ExcelField(title="合同状态(0终止；1正常；)", type=1, align=1, sort=6)
	public String getHtZt(){
		return this.htZt;
	}

	@ExcelField(title="是否固定期限（1是；0否）", type=1, align=1, sort=7)
	public String getSfGdqx(){
		return this.sfGdqx;
	}

	@ExcelField(title="试用期月数", type=1, align=1, sort=8)
	public Integer getSyqYs(){
		return this.syqYs;
	}

	@ExcelField(title="开始日期", type=1, align=1, sort=9)
	public String getKsRq(){
		return this.ksRq;
	}

	@ExcelField(title="到期日期", type=1, align=1, sort=10)
	public String getDqRq(){
		return this.dqRq;
	}
	@ExcelField(title="续签标志，1新签，2续签", type=1, align=1, sort=11)
	public String getXqFlag(){
		return this.xqFlag;
	}

	@ExcelField(title="续签日期", type=1, align=1, sort=12)
	public String getXqRq(){
		return this.xqRq;
	}

	@ExcelField(title="终止日期", type=1, align=1, sort=13)
	public String getZzRq(){
		return this.zzRq;
	}
}
