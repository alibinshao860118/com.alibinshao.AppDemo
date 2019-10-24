/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.cxtj.entity;

import com.zhonghong.fdp.common.persistence.DataEntity;
import com.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(T_SYS_rsxxzhtj)的实体类
 * </pre>
 * @author liangbinbin 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class SysRsxxzhtj extends DataEntity<SysRsxxzhtj>{

	private static final long serialVersionUID = 1L;
	
	/** 年龄数 */
	private Integer nls;  //年龄数
	/** 学历数 */
	private Integer xls;  //学历数
	/** 性别数 */
	private Integer xbs;  //性别数

	@ExcelField(title="年龄数", type=1, align=1, sort=1)
	public Integer getNls(){
		return this.nls;
	}

	@ExcelField(title="学历数", type=1, align=1, sort=2)
	public Integer getXls(){
		return this.xls;
	}

	@ExcelField(title="性别数", type=1, align=1, sort=3)
	public Integer getXbs(){
		return this.xbs;
	}

}
