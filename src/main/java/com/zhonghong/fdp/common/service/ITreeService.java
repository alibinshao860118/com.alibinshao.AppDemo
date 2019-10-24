package com.zhonghong.fdp.common.service;

import java.util.List;
import java.util.Map;


/**
 * 
 * <pre>
 * 节点树服务接口。
 * </pre>
 * 
 * @author gulong
 * @version 1.00.00
 * 
 *          <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容:
 * </pre>
 */
public interface ITreeService{
	
	/**
	 * 获取type。
	 * 
	 * @return String
	 */
	public String getType();

	/**
	 * 载入孩子节点。
	 * 
	 * @param pId
	 *            String
	 * 
	 * @param withSelf
	 *            boolean
	 * 
	 * @param params
	 *            Map<String,String>
	 * 
	 * @return List<Map<String,Object>>
	 */
	public List<Map<String, Object>> loadChildren(String pId, boolean withSelf,
			Map<String, String> params);

	/**
	 * 载入全部。
	 * 
	 * @param rootId
	 *            String
	 * 
	 * @return List<Map<String,Object>>
	 */
	public List<Map<String, Object>> loadAll(String rootId);

	/**
	 * 设置。
	 * 
	 * @return Map<String,Object>
	 */
	public Map<String, Object> config();
}
