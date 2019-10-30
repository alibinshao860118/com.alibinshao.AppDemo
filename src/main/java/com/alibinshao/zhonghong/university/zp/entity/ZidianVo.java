package com.alibinshao.zhonghong.university.zp.entity;

import com.alibinshao.zhonghong.fdp.common.persistence.DataEntity;



/**
 * 招聘简历信息Entity
 * 
 * @author 
 * @version 2017-03-15
 */


public class ZidianVo extends DataEntity<ZidianVo> {
	
	String id;
	String name; // 名称
	String bianhao; // 编号
	String sjbianhao;
	String sjname;//上级部门名称
	String dpbianhao;
	String dpname;//部门名称
	String username;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBianhao() {
		return bianhao;
	}
	public void setBianhao(String bianhao) {
		this.bianhao = bianhao;
	}
	public String getSjbianhao() {
		return sjbianhao;
	}
	public void setSjbianhao(String sjbianhao) {
		this.sjbianhao = sjbianhao;
	}
	public String getSjname() {
		return sjname;
	}
	public void setSjname(String sjname) {
		this.sjname = sjname;
	}
	public String getDpbianhao() {
		return dpbianhao;
	}
	public void setDpbianhao(String dpbianhao) {
		this.dpbianhao = dpbianhao;
	}
	public String getDpname() {
		return dpname;
	}
	public void setDpname(String dpname) {
		this.dpname = dpname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
}