package com.alibinshao.zhonghong.university.zp.entity;

import com.alibinshao.zhonghong.fdp.common.persistence.DataEntity;

import lombok.Data;

/**
 * 招聘简历信息Entity
 * 
 * @author huangqi
 * @version 2017-03-15
 */

@Data
public class Zpjlfj extends DataEntity<Zpjlfj> {
	
	String id;
	String zpjlid ;
	String fjmc; // 名称
	String fjlj; // 编号
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getZpjlid() {
		return zpjlid;
	}
	public void setZpjlid(String zpjlid) {
		this.zpjlid = zpjlid;
	}
	public String getFjmc() {
		return fjmc;
	}
	public void setFjmc(String fjmc) {
		this.fjmc = fjmc;
	}
	public String getFjlj() {
		return fjlj;
	}
	public void setFjlj(String fjlj) {
		this.fjlj = fjlj;
	}
}