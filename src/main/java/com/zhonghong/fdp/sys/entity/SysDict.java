package com.zhonghong.fdp.sys.entity;

import com.zhonghong.fdp.common.persistence.DataEntity;
import com.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;


/**
 * 字典Entity
 * @author gulong
 * @version 2013-05-15
 */
@Data
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

	
}