/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.rygl.entity;

import com.zhonghong.fdp.common.persistence.DataEntity;
import com.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(t_ry_zcxx)的实体类
 * </pre>
 * @author liangbinbin 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class RyZcxx extends DataEntity<RyZcxx>{

	private static final long serialVersionUID = 1L;
	
	/** 人员基本信息ID */
	private String ryjbxxId;  //人员基本信息ID
	/** 职称 */
	private String zc;  //职称
	/** 批准文号 */
	private String pzwh;  //批准文号
	/** 批准时间 */
	private String pzsj;  //批准时间
	/** 开始时间 */
	private String kssj;  //开始时间
	/** 结束时间 */
	private String jssj;  //结束时间
	/** 备注 */
	private String bz;  //备注

	private String zgbh;
	
	private String name;
	
	/** 部门ID */
	private String orgId;  //部门ID
	/** 部门名称 */
	private String orgName;  //部门名称
	
	private String fullOrgCodes;
	/** 部门名称 */
	private String fullOrgNames;  //部门名称


	@ExcelField(title="职工编号", type=1, align=1, sort=1)
	public String getZgbh(){
		return this.zgbh;
	}
	
	@ExcelField(title="姓名", type=1, align=1, sort=2)
	public String getName(){
		return this.name;
	}

	@ExcelField(title="职称", type=1, align=1, sort=2)
	public String getZc(){
		return this.zc;
	}

	@ExcelField(title="批准文号", type=1, align=1, sort=3)
	public String getPzwh(){
		return this.pzwh;
	}

	@ExcelField(title="批准时间", type=1, align=1, sort=4)
	public String getPzsj(){
		return this.pzsj;
	}

	@ExcelField(title="开始时间", type=1, align=1, sort=5)
	public String getKssj(){
		return this.kssj;
	}

	@ExcelField(title="结束时间", type=1, align=1, sort=6)
	public String getJssj(){
		return this.jssj;
	}

	@ExcelField(title="备注", type=1, align=1, sort=7)
	public String getBz(){
		return this.bz;
	}

}
