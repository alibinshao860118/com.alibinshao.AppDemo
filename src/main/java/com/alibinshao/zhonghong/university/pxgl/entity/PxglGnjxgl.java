/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.pxgl.entity;

import com.alibinshao.zhonghong.fdp.common.persistence.DataEntity;
import com.alibinshao.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(t_px_gnjx)的实体类
 * </pre>
 * @author liangbinbin 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class PxglGnjxgl extends DataEntity<PxglGnjxgl>{

	private static final long serialVersionUID = 1L;
	
	private String ryId;
	/** 姓名 */
	private String xm;  //姓名
	/** 职工编号 */
	private String zgbh;  //职工编号
	/** 业务类型 */
	private String ywlx;  //业务类型
	/** 报考类别 */
	private String bklb;  //报考类别
	/** 申请日期 */
	private String sqrq;  //申请日期
	/** 来校时间 */
	private String lxsj;  //来校时间
	/** 报考学校 */
	private String bkxx;  //报考学校
	/** 报考院校 */
	private String bkyx;  //报考院校
	/** 报考专业 */
	private String bkzy;  //报考专业
	/** 学历 */
	private String xl;  //学历
	/** 开始日期 */
	private String ksrq;  //开始日期
	/** 截止日期 */
	private String jzrq;  //截止日期
	/** 学习类型 */
	private String xxlx;  //学习类型
	/** 减免学费 */
	private Double jmxf;  //减免学费
	/** 协议详情 */
	private String xyxq;  //协议详情

	@ExcelField(title="姓名", type=1, align=1, sort=1)
	public String getXm(){
		return this.xm;
	}

	@ExcelField(title="职工编号", type=1, align=1, sort=2)
	public String getZgbh(){
		return this.zgbh;
	}

	@ExcelField(title="业务类型", type=1, align=1, sort=3)
	public String getYwlx(){
		return this.ywlx;
	}

	@ExcelField(title="报考类别", type=1, align=1, sort=4)
	public String getBklb(){
		return this.bklb;
	}

	@ExcelField(title="申请日期", type=1, align=1, sort=5)
	public String getSqrq(){
		return this.sqrq;
	}

	@ExcelField(title="来校时间", type=1, align=1, sort=6)
	public String getLxsj(){
		return this.lxsj;
	}

	@ExcelField(title="报考学校", type=1, align=1, sort=7)
	public String getBkxx(){
		return this.bkxx;
	}

	@ExcelField(title="报考院校", type=1, align=1, sort=8)
	public String getBkyx(){
		return this.bkyx;
	}

	@ExcelField(title="报考专业", type=1, align=1, sort=9)
	public String getBkzy(){
		return this.bkzy;
	}

	@ExcelField(title="学历", type=1, align=1, sort=10)
	public String getXl(){
		return this.xl;
	}

	@ExcelField(title="开始日期", type=1, align=1, sort=11)
	public String getKsrq(){
		return this.ksrq;
	}

	@ExcelField(title="截止日期", type=1, align=1, sort=12)
	public String getJzrq(){
		return this.jzrq;
	}

	@ExcelField(title="学习类型", type=1, align=1, sort=13)
	public String getXxlx(){
		return this.xxlx;
	}

	@ExcelField(title="减免学费", type=1, align=1, sort=14)
	public Double getJmxf(){
		return this.jmxf;
	}

	@ExcelField(title="协议详情", type=1, align=1, sort=15)
	public String getXyxq(){
		return this.xyxq;
	}

}
