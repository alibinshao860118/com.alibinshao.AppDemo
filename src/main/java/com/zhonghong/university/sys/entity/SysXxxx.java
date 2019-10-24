/**
 * Copyright &copy; 2012-2017 <a href="http://www.foresee.com">Foresee</a> All rights reserved.
 */
package com.zhonghong.university.sys.entity;

import com.zhonghong.fdp.common.persistence.DataEntity;
import com.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(t_sys_xxxx)的实体类
 * </pre>
 * @author gulong 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class SysXxxx extends DataEntity<SysXxxx>{

	private static final long serialVersionUID = 1L;
	
	/** 学校介绍 */
	private String xxJs;  //学校介绍

	@ExcelField(title="学校介绍", type=1, align=1, sort=1)
	public String getXxJs(){
		return this.xxJs;
	}

}
