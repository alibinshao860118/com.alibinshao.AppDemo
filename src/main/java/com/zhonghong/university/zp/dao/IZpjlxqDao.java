package com.zhonghong.university.zp.dao;

import java.util.List;

import com.zhonghong.fdp.common.persistence.annotation.MyBatisDao;
import com.zhonghong.university.zp.entity.Zpjlfj;
import com.zhonghong.university.zp.entity.Zpjlxq;

/**
 * 招聘简历信息DAO接口
 * @author huangqi
 * @version 2017-03-15
 */
@MyBatisDao
public interface IZpjlxqDao {
	
	public List<Zpjlxq> findList(Zpjlxq zpjlxq);
	
	public List<Zpjlxq> findDistinctList(Zpjlxq zpjlxq);
	
	public void insert(Zpjlxq zpjlxq);
	
	public void update(Zpjlxq zpjlxq);
	
	public void delete(Zpjlxq zpjlxq);
	
	public void updateYxbz(Zpjlxq zpjlxq);
	
	public void updateXcqrbz(Zpjlxq zpjlxq);
	
	public void updateZgsc(Zpjlxq zpjlxq);

	public void insertFj(Zpjlfj zpjlfj);
	
	public Zpjlxq get(String id);
	
	public List<Zpjlxq> getByIds(List ids);
	
	public List<Zpjlfj> findJlfjList(Zpjlfj zpjlfj);

}