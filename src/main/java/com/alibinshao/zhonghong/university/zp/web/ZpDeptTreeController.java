package com.alibinshao.zhonghong.university.zp.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.util.StringUtil;
import com.alibinshao.zhonghong.fdp.common.web.BaseController;
import com.alibinshao.zhonghong.university.zp.entity.ZidianVo;
import com.alibinshao.zhonghong.university.zp.service.ZidianService;

@Controller
@RequestMapping(value = "${adminPath}/zp")
public class ZpDeptTreeController extends BaseController {

	@Autowired
	protected ZidianService zidianService;
	
	/**
	 * 始初化加载部门树。
	 * @return List
	 */
	@RequestMapping("initDeptTree.do")
	@ResponseBody
	public List<Map<String, Object>> initDeptTree(@RequestParam("id") String id) {
		List<Map<String, Object>> ret = new ArrayList<Map<String, Object>>();
		ZidianVo zidianVo = new ZidianVo();
		
		//一级部门的节点
		if(StringUtil.isEmpty(id)){//零、一级部门
			List<ZidianVo> sjdeptList = zidianService.findDeptSjNameList(zidianVo);
				for(ZidianVo v:sjdeptList){
						Map<String, Object> map = new HashMap<String, Object>();
						map.put("id", v.getSjbianhao());
						//map.put("pId", "@" + v.getSjbianhao());
						map.put("name", v.getSjname());
						map.put("isParent", "true");
						map.put("nocheck", "true");
						map.put("open", "false");
						ret.add(map);
				}
		}else{//二级部门
				//部门的节点
			zidianVo.setSjbianhao(id);
			List<ZidianVo> sjdeptList = zidianService.findDeptSjNameList(zidianVo);
			if(sjdeptList.size()<2){
				ZidianVo userDepts = new ZidianVo();
				userDepts.setDpbianhao(id);
				ZidianVo root = zidianService.findDeptName(userDepts);
				Map<String, Object> map = new HashMap<String, Object>();
				List<ZidianVo> users =zidianService.findUsers(root);
				for(ZidianVo user:users){
					map.put("id", user.getId());
					map.put("pId", root.getId());
					map.put("name", user.getUsername());
					map.put("open", "true");
					map.put("isParent", "false");
					ret.add(map);
				}
				
			}else{
				for(ZidianVo v:sjdeptList){
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", v.getDpbianhao());
					map.put("name", v.getDpname());
					map.put("isParent", "true");
					map.put("nocheck", "true");
					map.put("open", "false");
					ret.add(map);
				}
			}
		}

		return ret;
	}
	
	/**
	 * 始初化加载本级部门树。
	 * @return List
	 */
	@RequestMapping("initBjDeptTree.do")
	@ResponseBody
	public List<Map<String, Object>> initBjDeptTree(@RequestParam("bmid") String bmid) {
		List<Map<String, Object>> sjret = new ArrayList<Map<String, Object>>();
		//根据部门id找出本级部门以及上级部门
		ZidianVo zidianVo = new ZidianVo();
		zidianVo.setId(bmid);
		List<ZidianVo> deptList = zidianService.findDeptListByBmId(zidianVo);
		if(deptList.size()>0){
			Map<String, Object> sjmap = new HashMap<String, Object>();
			for(ZidianVo v:deptList){
				sjmap.put("id", v.getId());
				sjmap.put("name", v.getDpname());
				sjmap.put("open", "true");
				sjmap.put("isParent", "true");
				//构建本级部门树以及下面的人员
				List<Map<String, Object>> bjret = new ArrayList<Map<String, Object>>();
				List<ZidianVo> users =zidianService.findUsers(v);
				Map<String, Object> map = new HashMap<String, Object>();
				for(ZidianVo user:users){
					map.put("id", user.getId());
					map.put("pId", v.getId());
					map.put("name", user.getUsername());
					map.put("open", "true");
					map.put("isParent", "false");
					bjret.add(map);
				}
				sjmap.put("children", bjret);
				sjret.add(sjmap);
			}
			
			
		}
		return sjret;
	}
	
	
}
