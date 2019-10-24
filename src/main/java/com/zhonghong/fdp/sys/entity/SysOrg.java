/**
 * Copyright &copy; 2012-2017 <a href="http://www.foresee.com">Foresee</a> All rights reserved.
 */
package com.zhonghong.fdp.sys.entity;

import java.util.ArrayList;
import java.util.List;

import com.zhonghong.fdp.common.persistence.DataEntity;
import com.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(fbidp_sys_org)的实体类
 * </pre>
 * @author gulong 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class SysOrg extends DataEntity<SysOrg>{
	private static final long serialVersionUID = 1L;
	
	/** 有业务意义的机构编号 */
	private String orgCode;
	/** 机构名称 */
	private String orgName;
	/** 机构简称 */
	private String orgShortName;
	/** 父机构ID */
	private String parentOrgId;
	/** 父机构CODE */
	private String parentOrgCode;
	/** 父机构名称 */
	private String parentOrgName;
	/** 全路径机构ID */
	private String fullOrgIds;
	/** 全路径机构CODE */
	private String fullOrgCodes;
	/** 全路径机构名称 */
	private String fullOrgNames;
	
	private String orgType;
	private String leaderId;
	private String leaderName;
	private String phone;
	private String address;
	private int showOrder;
	private String status;
	private String userId;
	boolean withSelf;
	
	private String oldOrgCode;
	private String oldOrgName;
	private String oldOrgShortName;
	private String oldFullOrgIds;
	private String oldFullOrgCodes;
	private String oldFullOrgNames;
	
	private List<String> fullOrgCodeList = new ArrayList<String>();
	
	private List<SysOrg> children = new ArrayList<SysOrg>();
	
	private String state;
	
	private int childNum;
	
	private String bzlb; //编制类别
	
	private Integer bzrs; //编制人数
	
	@ExcelField(title="组织代码", type=1, align=1, sort=1)
	public String getOrgCode(){
		return this.orgCode;
	}
	
	@ExcelField(title="组织名称", type=1, align=1, sort=2)
	public String getOrgName(){
		return this.orgName;
	}
	
	@ExcelField(title="组织类型", type=1, align=2, sort=3,dictType="orgType")
	public String getOrgType(){
		return this.orgType;
	}
	
	@ExcelField(title="编制类别", type=1, align=2, sort=4)
	public String getBzlb(){
		return this.bzlb;
	}
	
	@ExcelField(title="编制人数", type=1, align=2, sort=4)
	public Integer getBzrs(){
		return this.bzrs;
	}
	
	@ExcelField(title="负责人", type=1, align=1, sort=4)
	public String getLeaderName(){
		return this.leaderName;
	}
	
	@ExcelField(title="是否有效", type=1, align=2, sort=5,dictType="enableFlag")
	public String getEnableFlag(){
		return this.enableFlag;
	}
	
	@ExcelField(title="排列顺序", type=1, align=2, sort=6)
	public int getShowOrder(){
		return this.showOrder;
	}
	
	@ExcelField(title="备注", type=1, align=1, sort=7)
	public String getRemarks(){
		return this.remarks;
	}

}
