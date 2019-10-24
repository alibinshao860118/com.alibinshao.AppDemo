package com.zhonghong.fdp.common.persistence;

import java.io.Serializable;
import java.util.List;

import lombok.Data;

/**
 * 分页类
 * @author Gulong
 * @version 2017-03-14
 * @param <T>
 */
@Data
public class Page<T> implements Serializable {
	
	private Long total;
	
	private List<T> rows;
	
	private List<T> footer;
	
	private T entity;
	
	public Class getEntityClass(){
		if(entity!=null){
			return entity.getClass();
        }else{
        	return this.getClass();
        }
		
	}

	
}
