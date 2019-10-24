package com.zhonghong.university.zp.dao;

import java.util.List;

import com.zhonghong.fdp.common.persistence.annotation.MyBatisDao;
import com.zhonghong.university.zp.entity.ZidianVo;

/**
 * 招聘简历信息DAO接口
 * @author huangqi
 * @version 2017-03-15
 */
@MyBatisDao
public interface IZidianDao {
	
	public List<ZidianVo> findList(ZidianVo zidianVo);
	
	public void insert(ZidianVo zidianVo);
	
	public void delete(ZidianVo zidianVo);

	/**
	 * 查询部门树
	 * @param id
	 * @return
	 */
	public List<ZidianVo> findDeptSjNameList(ZidianVo vo);

	public ZidianVo findDeptName(ZidianVo vo);

	public List<ZidianVo> findUsers(ZidianVo root);

	/**
	 * @param zidianVo
	 * @return
	 */
	public List<ZidianVo> findDeptListByBmId(ZidianVo zidianVo);
}