/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.rygl.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhonghong.fdp.common.persistence.Page;
import com.zhonghong.fdp.common.web.BaseController;
import com.zhonghong.university.rygl.entity.RyJbxx;
import com.zhonghong.university.rygl.entity.RyOrgrygx;
import com.zhonghong.university.rygl.service.RyJbxxService;
import com.zhonghong.university.zp.entity.ZidianVo;
import com.zhonghong.university.zp.service.ZidianService;

/**
 * <pre>
 * Controller控制层类
 * </pre>
 * @author liangbinbin 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
@Controller
@RequestMapping(value = "${adminPath}/rygl/ryJbxx")
public class RyJbxxController extends BaseController{

	@Autowired
	private RyJbxxService ryJbxxService;
	@Autowired
	protected ZidianService zidianService;
	/**
	 * 进入查询界面
	 * @param ryJbxx RyJbxx 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("rygl:ryJbxx:view")
	@RequestMapping(value = {"list"})
	public String list(RyJbxx ryJbxx, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("ryJbxx", ryJbxx);
		return "modules/rygl/ryJbxx/ryJbxxList";
	}
	
	/**
	 * 查询
	 * @param ryJbxx RyJbxx 
	 * @param request
	 * @param response
	 * @return Page<RyJbxx>
	 */
	@RequiresPermissions("rygl:ryJbxx:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<RyJbxx> query(RyJbxx ryJbxx,HttpServletRequest request, HttpServletResponse response) {
		Page<RyJbxx> page = this.ryJbxxService.findPage(ryJbxx); 
		return page;
	}
	
	/**
	 * 查询机构已关联的人员
	 * @param ryJbxx RyJbxx 
	 * @param request
	 * @param response
	 * @return Page<RyJbxx>
	 */
	@RequiresPermissions("rygl:ryJbxx:view")
	@RequestMapping(value = {"findExistOrgUser"})
	@ResponseBody
	public Page<RyOrgrygx> findExistOrgUser(RyOrgrygx ryJbxx,HttpServletRequest request, HttpServletResponse response) {
		Page<RyOrgrygx> page = this.ryJbxxService.findPage(ryJbxx); 
		return page;
	}
	
	/**
	 * 查询机构未关联的人员
	 * @param ryJbxx RyJbxx 
	 * @param request
	 * @param response
	 * @return Page<RyJbxx>
	 */
	@RequiresPermissions("rygl:ryJbxx:view")
	@RequestMapping(value = {"findNotExistOrgUser"})
	@ResponseBody
	public Page<RyOrgrygx> findNotExistOrgUser(RyOrgrygx ryJbxx,HttpServletRequest request, HttpServletResponse response) {
		Page<RyOrgrygx> page = this.ryJbxxService.findNotExistOrgUser(ryJbxx); 
		return page;
	}
	
	
	/**
	 * 进入新增页面
	 * @param ryJbxx RyJbxx 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("rygl:ryJbxx:edit")
	@RequestMapping(value = {"toAdd"})
	public String toAdd(RyJbxx ryJbxx, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("ryJbxx", ryJbxx);
		buildCommonParam(model);
		return "modules/rygl/ryJbxx/ryxxList";
	}
	
	/**
	 * 进入修改页面
	 * @param ryJbxx RyJbxx 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("rygl:ryJbxx:edit")
	@RequestMapping(value = {"toUpdate"})
	public String toUpdate(RyJbxx ryJbxx, HttpServletRequest request, HttpServletResponse response, Model model) {
		//查询出基本信息
		ryJbxx=this.ryJbxxService.get(ryJbxx.getId());
		model.addAttribute("ryJbxx", ryJbxx);
		buildCommonParam(model);
		return "modules/rygl/ryJbxx/ryxxList";
	}
	
	
    /**
	 * 新增
	 * @param entity RyJbxx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("rygl:ryJbxx:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(RyJbxx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		String id=this.ryJbxxService.saveRyjbxx(entity);
		result.put("id", id);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity RyJbxx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("rygl:ryJbxx:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(RyJbxx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.ryJbxxService.update(entity);
		result.put("id", entity.getId());
		
		return result;
	}
	
	/**
	 * 删除
	 * @param ryJbxx RyJbxx 
	 * @return String
	 */
	@RequiresPermissions("rygl:ryJbxx:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(RyJbxx entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.ryJbxxService.delete(entity);
		
		return map;
	}
	
	/**
	 * 删除机构人员关系
	 * @param ryJbxx RyJbxx 
	 * @return String
	 */
	@RequiresPermissions("rygl:ryJbxx:edit")
	@RequestMapping(value = "deleteOrgRy")
	@ResponseBody
	public Map<String,Object> deleteOrgRy(RyOrgrygx entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.ryJbxxService.deleteBy(entity);
		
		return map;
	}
	
    /**
	 * 新增机构人员关系
	 * @param entity RyJbxx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("rygl:ryJbxx:edit")
	@RequestMapping(value = "insertOrgRy")
	@ResponseBody
	public Map<String,Object> insertOrgRy(@RequestBody List<RyOrgrygx> list) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.ryJbxxService.insertOrgRy(list);
		
		return result;
	}
	/**
	 * 初始化下拉树
	 * @param model
	 */
	private void buildCommonParam(Model model){
		ZidianVo zidianVo = new ZidianVo();
		zidianVo.setBianhao("B08"); // 证件类型
		List<ZidianVo> zjlxList = zidianService.findList(zidianVo);

		zidianVo.setBianhao("B09"); // 政治面貌
		List<ZidianVo> zzmmList = zidianService.findList(zidianVo);

		zidianVo.setBianhao("B10"); // 民族
		List<ZidianVo> mzList = zidianService.findList(zidianVo);

		/*zidianVo.setBianhao("B16"); // 学历
		List<ZidianVo> xlList = zidianService.findList(zidianVo);

		zidianVo.setBianhao("B17"); // 学位
		List<ZidianVo> xwList = zidianService.findList(zidianVo);

		zidianVo.setBianhao("B18"); // 第一外语
		List<ZidianVo> dywyjList = zidianService.findList(zidianVo);

		zidianVo.setBianhao("B20"); // 第一外语等级
		List<ZidianVo> dywydjjList = zidianService.findList(zidianVo);

		zidianVo.setBianhao("B25"); // 岗位等级
		List<ZidianVo> gwdjList = zidianService.findList(zidianVo);*/

		model.addAttribute("zjlxList", zjlxList);
		model.addAttribute("zzmmList", zzmmList);
		model.addAttribute("mzList", mzList);
		/*model.addAttribute("xlList", xlList);
		model.addAttribute("xwList", xwList);
		model.addAttribute("dywy", dywyjList);
		model.addAttribute("dywydj", dywydjjList);
		model.addAttribute("gwdj", gwdjList);*/
	}
}
