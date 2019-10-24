/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.rygl.entity;

import com.zhonghong.fdp.common.persistence.DataEntity;
import com.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(t_ry_qtzl)的实体类
 * </pre>
 * @author liangbinbin 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class RyQtzl extends DataEntity<RyQtzl>{

	private static final long serialVersionUID = 1L;
	
	/** 人员基本信息ID */
	private String ryjbxxId;  //人员基本信息ID
	/** 资料名称 */
	private String zlmc;  //资料名称
	/** 资料说明 */
	private String zlsm;  //资料说明
	/** 附件名称 */
	private String fjmc;  //附件名称
	/** 附件链接 */
	private String fjlj;  //附件链接
	/** 附件ID */
	private String fjId;  //附件ID

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

	@ExcelField(title="资料名称", type=1, align=1, sort=2)
	public String getZlmc(){
		return this.zlmc;
	}

	@ExcelField(title="资料说明", type=1, align=1, sort=3)
	public String getZlsm(){
		return this.zlsm;
	}

	@ExcelField(title="附件名称", type=1, align=1, sort=4)
	public String getFjmc(){
		return this.fjmc;
	}

	@ExcelField(title="附件链接", type=1, align=1, sort=5)
	public String getFjlj(){
		return this.fjlj;
	}

	@ExcelField(title="附件ID", type=1, align=1, sort=6)
	public String getFjId(){
		return this.fjId;
	}

}
