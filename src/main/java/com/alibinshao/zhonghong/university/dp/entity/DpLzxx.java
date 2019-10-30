/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.dp.entity;

import com.alibinshao.zhonghong.fdp.common.persistence.DataEntity;
import com.alibinshao.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(t_dp_lzxx)的实体类
 * </pre>
 * @author gulong 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class DpLzxx extends DataEntity<DpLzxx>{

	private static final long serialVersionUID = 1L;
	
	/** 人员ID */
	private String ryId;  //人员ID
	/** 姓名 */
	private String xm;  //姓名
	/** 职工编号 */
	private String zgbh;  //职工编号
	/** 离职类别 */
	private String lzLb;  //离职类别
	/** 离职时间 */
	private String lzSj;  //离职时间
	/** 离职去向 */
	private String lzQx;  //离职去向
	/** 离职单开具时间 */
	private String lzdKjsj;  //离职单开具时间

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

	@ExcelField(title="离职类别", type=1, align=1, sort=4)
	public String getLzLb(){
		return this.lzLb;
	}

	@ExcelField(title="离职时间", type=1, align=1, sort=5)
	public String getLzSj(){
		return this.lzSj;
	}

	@ExcelField(title="离职去向", type=1, align=1, sort=6)
	public String getLzQx(){
		return this.lzQx;
	}

	@ExcelField(title="离职单开具时间", type=1, align=1, sort=7)
	public String getLzdKjsj(){
		return this.lzdKjsj;
	}

}
