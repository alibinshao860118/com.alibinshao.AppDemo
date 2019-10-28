/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.zp.entity;

import com.zhonghong.fdp.common.persistence.DataEntity;
import com.zhonghong.fdp.common.utils.excel.annotation.ExcelField;


/**
 * <pre>
 * 对应数据库表(T_ZP_ZPXQ)的实体类
 * </pre>
 * @author  
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 
public class ZpZpxq extends DataEntity<ZpZpxq>{

	private static final long serialVersionUID = 1L;
	
	/** 主键ID */
	private String zpjhId;  //主键ID
	/** 招聘部门ID */
	private String zpbmId;  //招聘部门ID
	/** 招聘部门名称 */
	private String zpbmMc;  //招聘部门名称
	/** 招聘岗位 */
	private String zpGw;  //招聘岗位
	/** 招聘人数 */
	private String zpRs;  //招聘人数
	/** 专业要求 */
	private String zyYq;  //专业要求
	/** 学历要求 */
	private String xlYq;  //学历要求
	/** 年龄要求 */
	private String nlYq;  //年龄要求
	/** 其他要求 */
	private String qtYq;  //其他要求
	/** 联系人及方式 */
	private String lxr;  //联系人及方式
	/** 显示顺序 */
	private Integer showOrder;  //显示顺序
	
	private String zpjhBh;
	private String zpjhMc;

	@ExcelField(title="主键ID", type=1, align=1, sort=1)
	public String getZpjhId(){
		return this.zpjhId;
	}

	@ExcelField(title="招聘部门ID", type=1, align=1, sort=2)
	public String getZpbmId(){
		return this.zpbmId;
	}

	@ExcelField(title="招聘岗位", type=1, align=1, sort=3)
	public String getZpGw(){
		return this.zpGw;
	}

	@ExcelField(title="招聘人数", type=1, align=1, sort=4)
	public String getZpRs(){
		return this.zpRs;
	}

	@ExcelField(title="专业要求", type=1, align=1, sort=5)
	public String getZyYq(){
		return this.zyYq;
	}

	@ExcelField(title="学历要求", type=1, align=1, sort=6)
	public String getXlYq(){
		return this.xlYq;
	}

	@ExcelField(title="年龄要求", type=1, align=1, sort=7)
	public String getNlYq(){
		return this.nlYq;
	}

	@ExcelField(title="其他要求", type=1, align=1, sort=8)
	public String getQtYq(){
		return this.qtYq;
	}

	@ExcelField(title="联系人及方式", type=1, align=1, sort=9)
	public String getLxr(){
		return this.lxr;
	}

	@ExcelField(title="显示顺序", type=1, align=1, sort=10)
	public Integer getShowOrder(){
		return this.showOrder;
	}

	public String getZpbmMc() {
		return zpbmMc;
	}

	public void setZpbmMc(String zpbmMc) {
		this.zpbmMc = zpbmMc;
	}

	public String getZpjhBh() {
		return zpjhBh;
	}

	public void setZpjhBh(String zpjhBh) {
		this.zpjhBh = zpjhBh;
	}

	public String getZpjhMc() {
		return zpjhMc;
	}

	public void setZpjhMc(String zpjhMc) {
		this.zpjhMc = zpjhMc;
	}

	public void setZpjhId(String zpjhId) {
		this.zpjhId = zpjhId;
	}

	public void setZpbmId(String zpbmId) {
		this.zpbmId = zpbmId;
	}

	public void setZpGw(String zpGw) {
		this.zpGw = zpGw;
	}

	public void setZpRs(String zpRs) {
		this.zpRs = zpRs;
	}

	public void setZyYq(String zyYq) {
		this.zyYq = zyYq;
	}

	public void setXlYq(String xlYq) {
		this.xlYq = xlYq;
	}

	public void setNlYq(String nlYq) {
		this.nlYq = nlYq;
	}

	public void setQtYq(String qtYq) {
		this.qtYq = qtYq;
	}

	public void setLxr(String lxr) {
		this.lxr = lxr;
	}

	public void setShowOrder(Integer showOrder) {
		this.showOrder = showOrder;
	}

}
