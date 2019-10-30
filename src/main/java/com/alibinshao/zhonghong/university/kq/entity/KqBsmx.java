/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.kq.entity;

import com.alibinshao.zhonghong.fdp.common.persistence.DataEntity;
import com.alibinshao.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(t_kq_bsmx)的实体类
 * </pre>
 * @author gulong 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class KqBsmx extends DataEntity<KqBsmx>{

	private static final long serialVersionUID = 1L;
	
	/** 机构ID */
	private String orgId;  //机构ID
	/** 考勤报送ID */
	private String bsId;  //考勤报送ID
	/** 考勤年份 */
	private String kqYf;  //考勤年份
	/** 考勤月份 */
	private String kqMf;  //考勤月份
	/** 人员ID */
	private String ryId;  //人员ID
	/** 姓名 */
	private String xm;  //姓名
	/** 职工编号 */
	private String zgbh;  //职工编号
	/** 病假天数 */
	private Integer bjTs;  //病假天数
	/** 事假天数 */
	private Integer sjTs;  //事假天数
	/** 探亲假天数 */
	private Integer tqjTs;  //探亲假天数
	/** 婚丧假天数 */
	private Integer hsjTs;  //婚丧假天数
	/** 产假天数 */
	private Integer cjTs;  //产假天数
	/** 其他天数 */
	private Integer qtTs;  //其他天数
	
	private String orgCode;
	private String orgName;
	
	private String fullOrgCodes;
	private String fullOrgNames;

	@ExcelField(title="考勤部门", type=1, align=1, sort=1)
	public String getOrgName(){
		return this.orgName;
	}
	
	@ExcelField(title="考勤年份", type=1, align=1, sort=2)
	public String getKqYf(){
		return this.kqYf;
	}

	@ExcelField(title="考勤月份", type=1, align=1, sort=3)
	public String getKqMf(){
		return this.kqMf;
	}

	@ExcelField(title="姓名", type=1, align=1, sort=4)
	public String getXm(){
		return this.xm;
	}

	@ExcelField(title="职工编号", type=1, align=1, sort=5)
	public String getZgbh(){
		return this.zgbh;
	}

	@ExcelField(title="病假天数", type=1, align=1, sort=6)
	public Integer getBjTs(){
		return this.bjTs;
	}

	@ExcelField(title="事假天数", type=1, align=1, sort=6)
	public Integer getSjTs(){
		return this.sjTs;
	}

	@ExcelField(title="探亲假天数", type=1, align=1, sort=7)
	public Integer getTqjTs(){
		return this.tqjTs;
	}

	@ExcelField(title="婚丧假天数", type=1, align=1, sort=8)
	public Integer getHsjTs(){
		return this.hsjTs;
	}

	@ExcelField(title="产假天数", type=1, align=1, sort=9)
	public Integer getCjTs(){
		return this.cjTs;
	}

	@ExcelField(title="其他天数", type=1, align=1, sort=10)
	public Integer getQtTs(){
		return this.qtTs;
	}

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public String getBsId() {
		return bsId;
	}

	public void setBsId(String bsId) {
		this.bsId = bsId;
	}

	public String getRyId() {
		return ryId;
	}

	public void setRyId(String ryId) {
		this.ryId = ryId;
	}

	public String getOrgCode() {
		return orgCode;
	}

	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}

	public String getFullOrgCodes() {
		return fullOrgCodes;
	}

	public void setFullOrgCodes(String fullOrgCodes) {
		this.fullOrgCodes = fullOrgCodes;
	}

	public String getFullOrgNames() {
		return fullOrgNames;
	}

	public void setFullOrgNames(String fullOrgNames) {
		this.fullOrgNames = fullOrgNames;
	}

	public void setKqYf(String kqYf) {
		this.kqYf = kqYf;
	}

	public void setKqMf(String kqMf) {
		this.kqMf = kqMf;
	}

	public void setXm(String xm) {
		this.xm = xm;
	}

	public void setZgbh(String zgbh) {
		this.zgbh = zgbh;
	}

	public void setBjTs(Integer bjTs) {
		this.bjTs = bjTs;
	}

	public void setSjTs(Integer sjTs) {
		this.sjTs = sjTs;
	}

	public void setTqjTs(Integer tqjTs) {
		this.tqjTs = tqjTs;
	}

	public void setHsjTs(Integer hsjTs) {
		this.hsjTs = hsjTs;
	}

	public void setCjTs(Integer cjTs) {
		this.cjTs = cjTs;
	}

	public void setQtTs(Integer qtTs) {
		this.qtTs = qtTs;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

}
