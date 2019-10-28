package com.zhonghong.fdp.common.persistence;

import java.io.Serializable;
import java.util.List;



/**
 * 分页类
 * @author Gulong
 * @version 2017-03-14
 * @param <T>
 */

public class Page<T> implements Serializable {
	
	private Long total;
	
	private List<T> rows;
	
	private List<T> footer;
	
	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	public List<T> getFooter() {
		return footer;
	}

	public void setFooter(List<T> footer) {
		this.footer = footer;
	}

	public T getEntity() {
		return entity;
	}

	public void setEntity(T entity) {
		this.entity = entity;
	}

	private T entity;
	
	public Class getEntityClass(){
		if(entity!=null){
			return entity.getClass();
        }else{
        	return this.getClass();
        }
		
	}

	
}
