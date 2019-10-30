/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.zp.entity;

import com.alibinshao.zhonghong.fdp.common.persistence.DataEntity;
import com.alibinshao.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(t_zp_zpjh)的实体类
 * </pre>
 * @author gulong 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class ZpZpjh extends DataEntity<ZpZpjh>{

	private static final long serialVersionUID = 1L;
	
	/** 计划编号 */
	private String jhBh;  //计划编号
	/** 计划标题 */
	private String jhBt;  //计划标题
	/** 计划所属年度 */
	private String jhNd;  //计划所属年度
	/** 开始时间 */
	private String jhKssj;  //开始时间
	/** 结束时间 */
	private String jhJssj;  //结束时间
	/** 发布时间 */
	private String fbSj;  //发布时间
	/** 发布人 */
	private String fbrBy;  //发布人
	
	private String fbZt; //0未发布，1已发布

	@ExcelField(title="计划编号", type=1, align=1, sort=1)
	public String getJhBh(){
		return this.jhBh;
	}

	@ExcelField(title="计划标题", type=1, align=1, sort=2)
	public String getJhBt(){
		return this.jhBt;
	}

	@ExcelField(title="计划所属年度", type=1, align=1, sort=3)
	public String getJhNd(){
		return this.jhNd;
	}

	@ExcelField(title="开始时间", type=1, align=1, sort=4)
	public String getJhKssj(){
		return this.jhKssj;
	}

	@ExcelField(title="结束时间", type=1, align=1, sort=5)
	public String getJhJssj(){
		return this.jhJssj;
	}

	@ExcelField(title="发布时间", type=1, align=1, sort=6)
	public String getFbSj(){
		return this.fbSj;
	}

	@ExcelField(title="发布人", type=1, align=1, sort=7)
	public String getFbrBy(){
		return this.fbrBy;
	}

}
