/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.sys.entity;

import com.alibinshao.zhonghong.fdp.common.persistence.DataEntity;
import com.alibinshao.zhonghong.fdp.common.utils.excel.annotation.ExcelField;

import lombok.Data;

/**
 * <pre>
 * 对应数据库表(T_SYS_ZZJGBMGZ)的实体类
 * </pre>
 * @author liangbinbin 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @Data
public class SysZzjgbmgz extends DataEntity<SysZzjgbmgz>{

	private static final long serialVersionUID = 1L;
	
	/** 行政机构编码前缀 */
	private String xzjgQz;  //行政机构编码前缀
	/** 行政机构编码递增值 */
	private Integer xzjgDz;  //行政机构编码递增值
	/** 教学单位编码前缀 */
	private String jxdwQz;  //教学单位编码前缀
	/** 教学单位编码递增值 */
	private Integer jxdwDz;  //教学单位编码递增值
	/** 科研单位编码前缀 */
	private String kydwQz;  //科研单位编码前缀
	/** 科研单位编码递增值 */
	private Integer kydwDz;  //科研单位编码递增值
	/** 教辅单位编码前缀 */
	private String jfdwQz;  //教辅单位编码前缀
	/** 教辅单位编码递增值 */
	private Integer jfdwDz;  //教辅单位编码递增值
	/** 群团组织编码前缀 */
	private String qtzzQz;  //群团组织编码前缀
	/** 群团组织编码递增值 */
	private Integer qtzzDz;  //群团组织编码递增值

	@ExcelField(title="行政机构编码前缀", type=1, align=1, sort=1)
	public String getXzjgQz(){
		return this.xzjgQz;
	}

	@ExcelField(title="行政机构编码递增值", type=1, align=1, sort=2)
	public Integer getXzjgDz(){
		return this.xzjgDz;
	}

	@ExcelField(title="教学单位编码前缀", type=1, align=1, sort=3)
	public String getJxdwQz(){
		return this.jxdwQz;
	}

	@ExcelField(title="教学单位编码递增值", type=1, align=1, sort=4)
	public Integer getJxdwDz(){
		return this.jxdwDz;
	}

	@ExcelField(title="科研单位编码前缀", type=1, align=1, sort=5)
	public String getKydwQz(){
		return this.kydwQz;
	}

	@ExcelField(title="科研单位编码递增值", type=1, align=1, sort=6)
	public Integer getKydwDz(){
		return this.kydwDz;
	}

	@ExcelField(title="教辅单位编码前缀", type=1, align=1, sort=7)
	public String getJfdwQz(){
		return this.jfdwQz;
	}

	@ExcelField(title="教辅单位编码递增值", type=1, align=1, sort=8)
	public Integer getJfdwDz(){
		return this.jfdwDz;
	}

	@ExcelField(title="群团组织编码前缀", type=1, align=1, sort=9)
	public String getQtzzQz(){
		return this.qtzzQz;
	}

	@ExcelField(title="群团组织编码递增值", type=1, align=1, sort=10)
	public Integer getQtzzDz(){
		return this.qtzzDz;
	}

}
