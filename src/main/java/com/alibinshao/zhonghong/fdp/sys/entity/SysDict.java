package com.alibinshao.zhonghong.fdp.sys.entity;

import com.alibinshao.zhonghong.fdp.common.persistence.DataEntity;
import com.alibinshao.zhonghong.fdp.common.utils.excel.annotation.ExcelField;




/**
 * 字典Entity
 * @author 
 * @version 2013-05-15
 */

public class SysDict extends DataEntity<SysDict> {

	private static final long serialVersionUID = 1L;
	private String value;	// 数据值
	private String label;	// 标签名
	private String type;	// 类型
	private String description;// 描述
	private int sort;	// 排序
	private String parentId;//父Id
	
	private String ids;
	
	@ExcelField(title="类型", type=1, align=1, sort=1)
	public String getType(){
		return this.type;
	}
	
	@ExcelField(title="类型描述", type=1, align=1, sort=2)
	public String getDescription(){
		return this.description;
	}
	
	@ExcelField(title="标签", type=1, align=1, sort=4)
	public String getLabel(){
		return this.label;
	}
	
	@ExcelField(title="键值", type=1, align=1, sort=3)
	public String getValue(){
		return this.value;
	}
	
	@ExcelField(title="排序", type=1, align=1, sort=5)
	public int getSort(){
		return this.sort;
	}
	
	@ExcelField(title="备注", type=1, align=1, sort=6)
	public String getRemarks(){
		return this.remarks;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	
}