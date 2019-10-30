package com.alibinshao.zhonghong.fdp.common.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibinshao.zhonghong.fdp.sys.dao.ISysRoleMenuDao;
import com.alibinshao.zhonghong.fdp.sys.entity.SysMenu;
import com.alibinshao.zhonghong.fdp.sys.entity.SysUser;
import com.alibinshao.zhonghong.fdp.sys.service.SysMenuService;
import com.alibinshao.zhonghong.fdp.sys.utils.UserUtils;

/**
 * <pre>
 * 机构树节点数据的加载
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
public class GrantTreeService implements ITreeService {
	
	//@Autowired(required=false)
	//private SysMenuService sysMenuService1;
	
	@Override
	public String getType() {
		return "grantTree";
	}

	@Override
	public List<Map<String, Object>> loadChildren(String pId, boolean withSelf, Map<String, String> params) {

		List<Map<String, Object>> ret = new ArrayList<Map<String, Object>>();
		
		SysUser currUser = UserUtils.getUser();
		String roleId = params.get("roleId");
		
		//2:找出子机构
		if(StringUtils.isEmpty(pId)){
			ret.add(buildRoot());
			
			buildTreeNodes("0",roleId,withSelf,true,ret);
		}else{
			buildTreeNodes(pId,roleId,withSelf,false,ret);
		}
		
		return ret;
	}
	
	private Map<String, Object> buildRoot(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", "0");
		map.put("pId", "");
		map.put("name", "菜单树");
		map.put("title", "菜单树");
		map.put("childNum", 100);
		map.put("showorder", 0);
		map.put("open", true);
		map.put("isParent", "true");
		return map;
	}

	@Override
	public List<Map<String, Object>> loadAll(String rootId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> config() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("clearable", false);
		return map;
	}
	
	/**
	 * 构建树节点结果集
	 * @param parentId String
	 * @param withSelf boolean
	 * @param findRoot boolean
	 * @param ret List<Map<String, Object>>
	 */
	private void buildTreeNodes(String parentId,String roleId,boolean withSelf, boolean findRoot, List<Map<String, Object>> ret){
		SysMenu entity = new SysMenu();
		//entity.setWithSelf(withSelf);
		entity.setParentId(parentId);
		entity.setRoleId(roleId);
		
		SysUser user = UserUtils.getUser();
		entity.setUserId(user.isAdmin()?null:user.getId());
		
		//List<SysMenu> menuList = sysMenuService1.findList(entity);
		//for (SysMenu sysMenu : menuList) {
		//	Map<String, Object> map = buildTreeNodeMap(sysMenu, findRoot);
		//	ret.add(map);
		//}
	}
	
	/**
	 * 树节点数据组装
	 * @param menu SysMenu
	 * @param findRoot boolean
	 * @return Map<String, Object>
	 */
	private Map<String, Object> buildTreeNodeMap(SysMenu menu, boolean findRoot){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", menu.getId());
		map.put("pId", menu.getParentId());
		map.put("name", menu.getName());
		map.put("fullName", menu.getName());
		map.put("childNum", menu.getChildNum());
		map.put("showorder", menu.getSortNo());
		map.put("checked", StringUtils.equals(menu.getChecked(),"1"));
		
		if(findRoot){
			map.put("open", true);
		}
							
		if(menu.getChildNum()>0){
			map.put("isParent", "true");
		} else {
			map.put("isParent", "false");
		}
		return map;
	}

}
