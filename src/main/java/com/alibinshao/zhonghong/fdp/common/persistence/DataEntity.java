
package com.alibinshao.zhonghong.fdp.common.persistence;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;

import com.alibinshao.zhonghong.fdp.common.config.Global;
import com.alibinshao.zhonghong.fdp.common.utils.IdGen;
import com.alibinshao.zhonghong.fdp.sys.entity.SysUser;
import com.alibinshao.zhonghong.fdp.sys.utils.UserUtils;


/**
 * 数据Entity类
 * @author gulong
 * @version 2014-05-16
 */

public abstract class DataEntity<T> implements Serializable {

	private static final long serialVersionUID = 1L;
	
	protected String id;
	protected String ids;
	protected String remarks;	// 备注
	protected String createBy;	// 创建者
	protected Date createDate;	// 创建日期
	protected String updateBy;	// 更新者
	protected Date updateDate;	// 更新日期
	protected String delFlag; 	// 删除标记（0：正常；1：删除；2：审核）
	protected String enableFlag;   //启用状态（0、启用，1、禁用）
	protected Long start;
	protected Long limit;
	protected Long count;
	

	protected Long page;
	protected Long rows;
	
	private String dbName;
	
	/**
	 * 删除标记（0：正常；1：删除；）
	 */
	public static final String DEL_FLAG_NORMAL = "0";
	public static final String DEL_FLAG_DELETE = "1";
	/**
	 * 激活标记（0：禁用；1：有效；）
	 */
	public static final String ENABLE_FLAG_NORMAL = "1";
	public static final String ENABLE_FLAG_DISABLED = "0";
	
	public DataEntity() {
		super();
		this.delFlag = DEL_FLAG_NORMAL;
		this.enableFlag = ENABLE_FLAG_NORMAL;
		this.dbName = Global.getConfig("jdbc.type");
	}
	
	/**
	 * 插入之前执行方法，需要手动调用
	 */
	public void preInsert(){
		this.setId(IdGen.uuid());
		SysUser user = UserUtils.getUser();
		if (StringUtils.isNotBlank(user.getId())){
			this.updateBy = user.getId();
			this.createBy = user.getId();
		}
		this.updateDate = new Date();
		this.createDate = this.updateDate;
	}
	
	/**
	 * 更新之前执行方法，需要手动调用
	 */
	public void preUpdate(){
		SysUser user = UserUtils.getUser();
		if (StringUtils.isNotBlank(user.getId())){
			this.updateBy = user.getId();
		}
		this.updateDate = new Date();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public String getEnableFlag() {
		return enableFlag;
	}

	public void setEnableFlag(String enableFlag) {
		this.enableFlag = enableFlag;
	}

	public Long getStart() {
		return start;
	}

	public void setStart(Long start) {
		this.start = start;
	}

	public Long getLimit() {
		return limit;
	}

	public void setLimit(Long limit) {
		this.limit = limit;
	}

	public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}

	public Long getPage() {
		return page;
	}

	public void setPage(Long page) {
		this.page = page;
	}

	public Long getRows() {
		return rows;
	}

	public void setRows(Long rows) {
		this.rows = rows;
	}

	public String getDbName() {
		return dbName;
	}

	public void setDbName(String dbName) {
		this.dbName = dbName;
	}
}

