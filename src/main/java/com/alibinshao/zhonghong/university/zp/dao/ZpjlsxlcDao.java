package com.alibinshao.zhonghong.university.zp.dao;

import java.util.List;

import com.alibinshao.zhonghong.fdp.common.persistence.annotation.MyBatisDao;
import com.alibinshao.zhonghong.university.zp.entity.ZpjlsxlcVo;

@MyBatisDao
public interface ZpjlsxlcDao {
	
	/**
	 * 查询简历流程记录数
	 * @param vo Zp4JlsxVO
	 * @return Long
	 */
	public Long queryZpjlsxlcCount(ZpjlsxlcVo vo);

	/**
	 * 查询简历流程信息
	 * @param vo
	 * @return List<Zp4JlsxVO>
	 */
	public List<ZpjlsxlcVo> queryZpjlsxlc(ZpjlsxlcVo vo);
	/**
	 * 查询单条信息
	 * @param vo
	 * @return
	 */
	public ZpjlsxlcVo initFqlcxx(ZpjlsxlcVo vo);
	/**
	 * 保存简历流程信息
	 * @param vo
	 */
	public void insertZpjlsxlc(ZpjlsxlcVo vo);
	/**
	 * 修改简历流程信息
	 * @param vo
	 */
	public void updateZpjlsxlc(ZpjlsxlcVo vo);

	/**
	 * 新增流程日志
	 * @param vo
	 */
	public void insertZpjllcrz(ZpjlsxlcVo vo);

	/**
	 * 修改流程日志
	 * @param vo
	 */
	public void updateZpjllcrz(ZpjlsxlcVo vo);
	/**
	 * 查询招聘简历信息
	 * @param vo
	 * @return
	 */
	public List<ZpjlsxlcVo> queryZpjlxx(ZpjlsxlcVo vo);

	/**
	 * 招聘计划下拉
	 * @param vo
	 * @return
	 */
	public List<ZpjlsxlcVo> findList(ZpjlsxlcVo vo);

	/**
	 * 环节意见
	 * @param vo
	 * @return
	 */
	public List<ZpjlsxlcVo> queryHjyjxx(ZpjlsxlcVo vo);
	/**
	 * 环节意见插入
	 * @param vo
	 * @return
	 */
	public void insertHjyjxx(ZpjlsxlcVo vo);
	/**
	 * 环节意见插入修改
	 * @param vo
	 * @return
	 */
	public void updateHjyjxx(ZpjlsxlcVo vo);
	/**
	 * 保存简历的筛选日志
	 * @param vo
	 */
	public void saveSxyj(ZpjlsxlcVo vo);

	/**
	 * 批量删除操作
	 * @param vo
	 */
	public void bathUpdate(ZpjlsxlcVo vo);

	/**
	 * 插入工作流程表
	 * @param vo
	 */
	public void insertWorkItem(ZpjlsxlcVo vo);

	/**
	 * 我的代办
	 * @param vo
	 * @return
	 */
	public List<ZpjlsxlcVo> queryDbrwByPage(ZpjlsxlcVo vo);

	/**
	 * 我的代办
	 * @param vo
	 * @return
	 */
	public List<ZpjlsxlcVo> queryYbrwByPage(ZpjlsxlcVo vo);

	/**批量筛选简历
	 * @param vo
	 */
	public void bathUpdateZpjlxq(ZpjlsxlcVo vo);

	/**查询简历日志信息
	 * @param vo
	 * @return
	 */
	public List<ZpjlsxlcVo> selectZpjllcrz(ZpjlsxlcVo vo);

	
}
