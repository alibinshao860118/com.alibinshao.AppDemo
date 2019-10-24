package com.zhonghong.university.zp.entity;

import com.zhonghong.fdp.common.persistence.DataEntity;

import lombok.Data;

/**
 * 招聘简历信息Entity
 * 
 * @author huangqi
 * @version 2017-03-15
 */

@Data
public class ZidianVo extends DataEntity<ZidianVo> {
	
	String id;
	String name; // 名称
	String bianhao; // 编号
	String sjbianhao;
	String sjname;//上级部门名称
	String dpbianhao;
	String dpname;//部门名称
	String username;
}