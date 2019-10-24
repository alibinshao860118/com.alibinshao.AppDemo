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
public class Zpjlfj extends DataEntity<Zpjlfj> {
	
	String id;
	String zpjlid ;
	String fjmc; // 名称
	String fjlj; // 编号
}