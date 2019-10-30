/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.rygl.entity;

import java.util.Date;

import com.alibinshao.zhonghong.fdp.common.persistence.DataEntity;
import com.alibinshao.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(t_ry_jyjl)的实体类
 * </pre>
 * @author liangbinbin 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class RyJyjl extends DataEntity<RyJyjl>{

	private static final long serialVersionUID = 1L;
	
	/** 人员基本信息ID */
	private String ryjbxxId;  //人员基本信息ID
	/** 学位 */
	private String xw;  //学位
	private String xwMc;
	/** 学位获取时间 */
	private String xwhqsj;  //学位获取时间
	/** 学历 */
	private String xl;  //学历
	private String xlMc;
	/** 学历获取时间 */
	private String xlhqsj;  //学历获取时间
	/** 开始时间 */
	private String kssj;  //开始时间
	/** 毕业时间 */
	private String bysj;  //毕业时间
	/** 专业 */
	private String zy;  //专业
	/** 学制 */
	private String xz;  //学制
	/** 毕业学校 */
	private String byxx;  //毕业学校
	/** 学校所在国家 */
	private String xxszgj;  //学校所在国家
	/** 学校地址 */
	private String xxdz;  //学校地址
	/** 是否海外学历 */
	private String sfhwxl;  //是否海外学历
	
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
	
	@ExcelField(title="学位", type=1, align=1, sort=2)
	public String getXw(){
		return this.xw;
	}

	@ExcelField(title="学位获取时间", type=1, align=1, sort=3)
	public String getXwhqsj(){
		return this.xwhqsj;
	}

	@ExcelField(title="学历", type=1, align=1, sort=4)
	public String getXl(){
		return this.xl;
	}

	@ExcelField(title="学历获取时间", type=1, align=1, sort=5)
	public String getXlhqsj(){
		return this.xlhqsj;
	}

	@ExcelField(title="开始时间", type=1, align=1, sort=6)
	public String getKssj(){
		return this.kssj;
	}

	@ExcelField(title="毕业时间", type=1, align=1, sort=7)
	public String getBysj(){
		return this.bysj;
	}

	@ExcelField(title="专业", type=1, align=1, sort=8)
	public String getZy(){
		return this.zy;
	}

	@ExcelField(title="学制", type=1, align=1, sort=9)
	public String getXz(){
		return this.xz;
	}

	@ExcelField(title="毕业学校", type=1, align=1, sort=10)
	public String getByxx(){
		return this.byxx;
	}

	@ExcelField(title="学校所在国家", type=1, align=1, sort=11)
	public String getXxszgj(){
		return this.xxszgj;
	}


}
