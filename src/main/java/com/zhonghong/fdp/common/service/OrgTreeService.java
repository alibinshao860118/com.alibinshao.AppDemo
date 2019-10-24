package com.zhonghong.fdp.common.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhonghong.fdp.sys.entity.SysOrg;
import com.zhonghong.fdp.sys.entity.SysUser;
import com.zhonghong.fdp.sys.service.SysOrgService;
import com.zhonghong.fdp.sys.utils.UserUtils;

/**
 * <pre>
 * 机构树节点数据的加载(该机构树的实现不支持异步加载)
 * </pre>
 * @author gulong 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
@Service
@Transactional(readOnly = true)
public class OrgTreeService implements ITreeService {
	
	@Value("${fbidp.top.orgCode}")
	private String topOrgCode;
	@Value("${fbidp.top.manageOrgCode}")
	private String manageOrgCode;
	@Autowired
	private SysOrgService orgService;

	@Override
	public String getType() {
		return "orgTree";
	}

	@Override
	public List<Map<String, Object>> loadChildren(String pId, boolean withSelf, Map<String, String> params) {
		List<Map<String, Object>> ret = new ArrayList<Map<String, Object>>();
		
		SysUser currUser = UserUtils.getUser();
		boolean isManageOrg = false;
		
		//1:判断是否为管理部门
		for(String orgCode : currUser.getOrgCodeList()){
			 if(StringUtils.equals(manageOrgCode,orgCode)){ 
				 isManageOrg = true;
				 break;
			 }
		}
		
		if(currUser.isAdmin() || isManageOrg){
			//2：超级管理员和管理部门可以看见整棵组织机关树
			SysOrg entity = new SysOrg();
			//entity.setFullOrgCodes(topOrgCode);
			List<SysOrg> orgList = orgService.findList(entity);
			for (SysOrg sysOrg : orgList) {
				Map<String, Object> map = buildTreeNodeMap(sysOrg, StringUtils.equals(sysOrg.getOrgCode(), topOrgCode),true);
				ret.add(map);
			}
			
		}else{ 
			//3: 普通用户
			//用户的所属机构
			SysOrg entity = new SysOrg();
			entity.setFullOrgCodes(currUser.getFullOrgCodes());
			List<SysOrg> orgList = orgService.findList(entity);
			for (SysOrg sysOrg : orgList) {
				Map<String, Object> map = buildTreeNodeMap(sysOrg, false,true);
				ret.add(map);
			}
			
			//用户的授权机构
			entity.setFullOrgCodes(null);
			entity.setFullOrgCodeList(currUser.getFullOrgCodeList());
			orgList = orgService.findList(entity);
			for (SysOrg sysOrg : orgList) {
				Map<String, Object> map = buildTreeNodeMap(sysOrg, false,true);
				
				boolean isExsit = false;
				for (Map<String, Object> node : ret) {
					if(sysOrg.getId().equals(node.get("id").toString())){
						isExsit = true;
						break;
					}
				}
				
				if(!isExsit){
					ret.add(map);
				}
			}
			
			//没有权限的上级节点也一并展现出来
			Set<String> orgCodeSet = new HashSet<String>();
			String[] orgCodes = currUser.getFullOrgCodes().split(",");
			for (int i = 0; i < orgCodes.length-1; i++) {
				//if(!StringUtils.equals(orgCode, currUser.getOrgCode())){
					orgCodeSet.add(orgCodes[i]);
				//}
			}
				
			for (String orgCode : orgCodeSet) {
				SysOrg sysOrg = new SysOrg();
				sysOrg.setOrgCode(orgCode);
				List<SysOrg> tmpOrgList = orgService.findList(sysOrg);
				for (SysOrg org : tmpOrgList) {
					Map<String, Object> map = buildTreeNodeMap(org, true, false);
					
					boolean isExsit = false;
					for (Map<String, Object> node : ret) {
						if(org.getId().equals(node.get("id").toString())){
							map.put("canSelect", node.get("canSelect"));
							map.put("otherParam", node.get("otherParam"));
							ret.remove(node);
							ret.add(map);
							isExsit = true;
							break;
						}
					}
					
					if(!isExsit){
						ret.add(map);
					}
				}
			}
			
		}
		
		return ret;
	}
	
	@Override
	public List<Map<String, Object>> loadAll(String rootId) {
		return null;
	}

	@Override
	public Map<String, Object> config() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("clearable", false);
		return map;
	}
	
	/**
	 * 树节点数据组装
	 * @param org SysOrg
	 * @param findRoot boolean
	 * @return Map<String, Object>
	 */
	private Map<String, Object> buildTreeNodeMap(SysOrg org, boolean open,boolean canSelect){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", org.getId());
		map.put("pId", org.getParentOrgId());
		map.put("name", org.getOrgShortName());
		map.put("title", org.getOrgShortName() + "(" + org.getOrgCode() + ")");
		map.put("fullName", org.getOrgName());
		map.put("childNum", org.getChildNum());
		map.put("showorder", org.getShowOrder());
		
		Map<String,String> otherParam = new HashMap<String,String>();
		otherParam.put("fullOrgCodes", org.getFullOrgCodes());
		otherParam.put("canSelect", String.valueOf(canSelect));
		map.put("otherParam", otherParam);
		map.put("canSelect", String.valueOf(canSelect));
		
		map.put("open", open);
							
		if(org.getChildNum()>0){
			map.put("isParent", "true");
		} else {
			map.put("isParent", "false");
		}
		return map;
	}

}
