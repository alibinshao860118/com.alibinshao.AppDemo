package com.zhonghong.university.zp.service;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.util.StringUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import com.zhonghong.fdp.common.persistence.Page;
import com.zhonghong.university.zp.dao.ZpjlsxlcDao;
import com.zhonghong.university.zp.entity.ZpjlsxlcVo;

@Service
@Transactional(readOnly = false)
public class ZpjlsxlcService {

	@Autowired
	private ZpjlsxlcDao zpjlsxlcDao;
	
	/**
	 * 简历流程信息查询
	 * @param vo
	 * @return
	 */
	public Page<ZpjlsxlcVo> queryZpjlsxlcByPage(ZpjlsxlcVo vo){
		Page<ZpjlsxlcVo> page = new Page<ZpjlsxlcVo>();
		
		PageHelper.startPage(vo.getPage().intValue(), vo.getRows().intValue());
		List<ZpjlsxlcVo> list = zpjlsxlcDao.queryZpjlsxlc(vo);
		page.setRows(list);
		
		PageInfo<ZpjlsxlcVo> pageInfo = new PageInfo<ZpjlsxlcVo>(list);
        page.setTotal(pageInfo.getTotal());
		
		return page;
		
	}
	//查询单条的简历流程信息
	public ZpjlsxlcVo initFqlcxx(ZpjlsxlcVo vo) {
		ZpjlsxlcVo lcxx = zpjlsxlcDao.initFqlcxx(vo);
		return lcxx;
	}
	/**
	 * 保存或者修改流程信息
	 * @param vo
	 * @return
	 */
	public ZpjlsxlcVo saveFlowInstance(ZpjlsxlcVo vo){
		vo.setFbsj(new Date());
		vo.setCzsj(new Date());
		vo.setZwxm(vo.getFbren());
		vo.setZwxmid(vo.getFbrenId());
		if(StringUtil.isEmpty(vo.getId())){//插入
			String id=this.getUUID();
			vo.setId(id);
			zpjlsxlcDao.insertZpjlsxlc(vo);
			if(StringUtil.isNotEmpty(vo.getCzyj())){
				//插入意见
				vo.setZplcid(Integer.valueOf(id));
				vo.setCzjd(vo.getCzjd()==null?"1":vo.getCzjd());
				zpjlsxlcDao.insertHjyjxx(vo);
			}
		}else{//修改筛选信息
			zpjlsxlcDao.updateZpjlsxlc(vo);
			if(StringUtil.isNotEmpty(vo.getCzyj())){
				List<ZpjlsxlcVo> list=zpjlsxlcDao.queryHjyjxx(vo);
				if(list !=null &&list.size()>0){//表示已有值
					zpjlsxlcDao.updateHjyjxx(vo);
				}else{//保存了筛选信息再保存意见的
					vo.setZplcid(Integer.valueOf(vo.getId()));
					vo.setCzjd(vo.getCzjd()==null?"1":vo.getCzjd());
					zpjlsxlcDao.insertHjyjxx(vo);
				}
			}
		}
		
		return vo;
	}
	
	/**
	 * 简历筛选流程筛选的简历信息的查询
	 * @param vo
	 * @return
	 */
	public Page<ZpjlsxlcVo> queryZpjlxxByPage(ZpjlsxlcVo vo){
		Page<ZpjlsxlcVo> page = new Page<ZpjlsxlcVo>();
		
		PageHelper.startPage(vo.getPage().intValue(), vo.getRows().intValue());
		List<ZpjlsxlcVo> list = zpjlsxlcDao.queryZpjlxx(vo);
		page.setRows(list);
		
		PageInfo<ZpjlsxlcVo> pageInfo = new PageInfo<ZpjlsxlcVo>(list);
        page.setTotal(pageInfo.getTotal());
		
		return page;
		
	}

	/**
	 * 招聘计划下拉
	 * @param vo
	 * @return
	 */
	public List<ZpjlsxlcVo> findList(ZpjlsxlcVo vo) {
		return zpjlsxlcDao.findList(vo);
	}
	
	/**
	 * 环境意见信息的查询
	 * @param vo
	 * @return
	 */
	public Page<ZpjlsxlcVo> queryHjyjxxByPage(ZpjlsxlcVo vo){
		Page<ZpjlsxlcVo> page = new Page<ZpjlsxlcVo>();
		
		PageHelper.startPage(vo.getPage().intValue(), vo.getRows().intValue());
		List<ZpjlsxlcVo> list = zpjlsxlcDao.queryHjyjxx(vo);
		page.setRows(list);
		
		PageInfo<ZpjlsxlcVo> pageInfo = new PageInfo<ZpjlsxlcVo>(list);
        page.setTotal(pageInfo.getTotal());
		
		return page;
		
	}

	/**
	 * 保存或者修改筛选意见
	 * @param vo
	 */
	public String saveSxyj(ZpjlsxlcVo vo){
		if(StringUtil.isEmpty(vo.getId())){//插入
			String id=this.getUUID();
			vo.setId(id);
			if(StringUtil.isEmpty(vo.getCzyj())){
				vo.setCzyj("yes");
			}
			//插入流程日志表
			zpjlsxlcDao.insertZpjllcrz(vo);
		}else{
			//修改流程日志表
			if(StringUtil.isNotEmpty(vo.getCzyj())){
				zpjlsxlcDao.updateZpjllcrz(vo);
			}
		}
		return vo.getId();
	}
	
	//批量删除操作
		public void bathUpdate(ZpjlsxlcVo vo, String ids) {
			for (String id : ids.split("&")) {
				vo.setId(id);
				zpjlsxlcDao.bathUpdate(vo);
			}
			
		}
	
	/**
	 * 获取10位数的id
	 * @return
	 */
	private String getUUID(){
		Long currenTime=System.currentTimeMillis();
		String id=new DecimalFormat("0000000000").format(currenTime);
		if(id.length()>10){
			id=id.substring(0, 10);
		}
		return id;
	}
	/**
	 * 筛选流程的提交
	 * @param req
	 * @return
	 */
	public String processSubmit(ZpjlsxlcVo vo) {
		ZpjlsxlcVo processVO=this.saveFlowInstance(vo);
		//修改流程的状态(1暂存2处理中3已完结)
		if(vo.getZt()!=null&&vo.getZt().equals("3")){
			//已完结的则修改意见的操作时间
			zpjlsxlcDao.updateHjyjxx(processVO);
			processVO.setZt("3");
			zpjlsxlcDao.updateZpjlsxlc(processVO);
		}else{
			processVO.setZt("2");
			processVO.setFbrenId(vo.getBlr());
			zpjlsxlcDao.updateZpjlsxlc(processVO);
			//修改已经筛选的简历的待办处理人
			String ids =vo.getZpjlid();
			if(!StringUtils.isEmpty(ids)){
				for (String jlid : ids.split(",")){
					processVO.setZpjlid(jlid);
					zpjlsxlcDao.bathUpdateZpjlxq(processVO);
				}
			}
			
		}
		return "success";
		
	}
	/**
	 * 我的代办分页查询
	 * @param req
	 * @return
	 */
	public Page<ZpjlsxlcVo> queryDbrwByPage(ZpjlsxlcVo vo) {
		Page<ZpjlsxlcVo> page = new Page<ZpjlsxlcVo>();
		PageHelper.startPage(vo.getPage().intValue(), vo.getRows().intValue());
		List<ZpjlsxlcVo> list = zpjlsxlcDao.queryDbrwByPage(vo);
		page.setRows(list);
		PageInfo<ZpjlsxlcVo> pageInfo = new PageInfo<ZpjlsxlcVo>(list);
        page.setTotal(pageInfo.getTotal());
		return page;
	}
	
	/**
	 * 我的已办分页查询
	 * @param req
	 * @return
	 */
	public Page<ZpjlsxlcVo> queryYbrwByPage(ZpjlsxlcVo vo) {
		Page<ZpjlsxlcVo> page = new Page<ZpjlsxlcVo>();
		PageHelper.startPage(vo.getPage().intValue(), vo.getRows().intValue());
		List<ZpjlsxlcVo> list = zpjlsxlcDao.queryYbrwByPage(vo);
		page.setRows(list);
		PageInfo<ZpjlsxlcVo> pageInfo = new PageInfo<ZpjlsxlcVo>(list);
        page.setTotal(pageInfo.getTotal());
		return page;
	}
	
	/**批量筛选简历
	 * @param vo
	 * @param ids
	 */
	public void bathUpdateZpjlxq(ZpjlsxlcVo vo, String ids) {
		if(ids.length()>0){
			for (String id : ids.split(",")) {
				vo.setZpjlid(id);
				zpjlsxlcDao.bathUpdateZpjlxq(vo);
				//根据zpjlid查找出日志信息，如果没有则插入一行
				List<ZpjlsxlcVo> list =zpjlsxlcDao.selectZpjllcrz(vo);
				if(list.isEmpty()){
					zpjlsxlcDao.insertZpjllcrz(vo);
				}
				zpjlsxlcDao.updateZpjllcrz(vo);
			}
		}
		
	}

	/**
	 * 流程筛选日志的分页查询
	 * @param req
	 * @return
	 */
	public Page<ZpjlsxlcVo> queryLcsxrzByPage(ZpjlsxlcVo vo) {
		Page<ZpjlsxlcVo> page = new Page<ZpjlsxlcVo>();
		PageHelper.startPage(vo.getPage().intValue(), vo.getRows().intValue());
		List<ZpjlsxlcVo> list = zpjlsxlcDao.selectZpjllcrz(vo);
		page.setRows(list);
		PageInfo<ZpjlsxlcVo> pageInfo = new PageInfo<ZpjlsxlcVo>(list);
        page.setTotal(pageInfo.getTotal());
		return page;
	}

}