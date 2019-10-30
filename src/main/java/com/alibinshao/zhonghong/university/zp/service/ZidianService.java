package com.alibinshao.zhonghong.university.zp.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.alibinshao.zhonghong.fdp.common.persistence.Page;
import com.alibinshao.zhonghong.university.zp.dao.IZidianDao;
import com.alibinshao.zhonghong.university.zp.entity.ZidianVo;

/**
 * 招聘简历信息Service
 * 
 * @author huangqi
 * @version 2017-03-15
 */
@Service
@Transactional(readOnly = true)
public class ZidianService {

	@Autowired
	private IZidianDao zidianDao;

	/**
	 * 简历流程信息查询
	 * 
	 * @param vo
	 * @return
	 */
	public Page<ZidianVo> findPage(ZidianVo zidianVo) {
		Page<ZidianVo> page = new Page<ZidianVo>();

		PageHelper.startPage(zidianVo.getPage().intValue(), zidianVo.getRows().intValue());
		List<ZidianVo> list = zidianDao.findList(zidianVo);
		page.setRows(list);

		PageInfo<ZidianVo> pageInfo = new PageInfo<ZidianVo>(list);
		page.setTotal(pageInfo.getTotal());

		return page;
	}

	public List<ZidianVo> findList(ZidianVo zidianVo) {
		return zidianDao.findList(zidianVo);
	}

	@Transactional(readOnly = false)
	public void save(ZidianVo zidianVo, MultipartFile[] sourceFile) {
		zidianDao.insert(zidianVo);
	}

	@Transactional(readOnly = false)
	public void delete(ZidianVo zidianVo) {
		zidianDao.delete(zidianVo);
	}

	/**
	 * 查询部门树
	 * @param id
	 * @return
	 */
	public List<ZidianVo> findDeptSjNameList(ZidianVo zidianVo) { 
		List<ZidianVo> detpList =new ArrayList<ZidianVo>();
		detpList=zidianDao.findDeptSjNameList(zidianVo);
		return detpList;
	}
	
	public ZidianVo findDeptName(ZidianVo zidianVo) { 
		ZidianVo result = new ZidianVo();
		result=zidianDao.findDeptName(zidianVo);
		return result;
	}

	public List<ZidianVo> findUsers(ZidianVo root) {
		List<ZidianVo> userList =new ArrayList<ZidianVo>();
		userList=zidianDao.findUsers(root);
		return userList;
	}

	/**
	 * @param zidianVo
	 * @return
	 */
	public List<ZidianVo> findDeptListByBmId(ZidianVo zidianVo) {
		List<ZidianVo> detpList =new ArrayList<ZidianVo>();
		detpList=zidianDao.findDeptListByBmId(zidianVo);
		return detpList;
	}
}