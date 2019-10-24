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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zhonghong.fdp.common.persistence.Page;
import com.zhonghong.fdp.common.web.BaseController;

import com.zhonghong.university.rygl.entity.RyJyjl;
import com.zhonghong.university.rygl.service.RyJyjlService;
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
@RequestMapping(value = "${adminPath}/rygl/ryJyjl")
public class RyJyjlController extends BaseController{

	@Autowired
	private RyJyjlService ryJyjlService;
	@Autowired
	protected ZidianService zidianService;
	/**
	 * 进入查询界面
	 * @param ryJyjl RyJyjl 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("rygl:ryJyjl:view")
	@RequestMapping(value = {"list"})
	public String list(RyJyjl ryJyjl, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("ryJyjl", ryJyjl);
		buildCommonParam(model);
		return "modules/rygl/ryJyjl/ryJyjlList";
	}
	
	/**
	 * 进入查看界面
	 * @param ryJyjl RyJyjl 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("rygl:ryJyjl:view")
	@RequestMapping(value = {"toView"})
	public String toView(RyJyjl ryJyjl, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("ryJyjl", ryJyjl);
		buildCommonParam(model);
		return "modules/rygl/ryJyjl/ryJyjlListView";
	}
	
	/**
	 * 查询
	 * @param ryJyjl RyJyjl 
	 * @param request
	 * @param response
	 * @return Page<RyJyjl>
	 */
	@RequiresPermissions("rygl:ryJyjl:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<RyJyjl> query(RyJyjl ryJyjl,HttpServletRequest request, HttpServletResponse response) {
		Page<RyJyjl> page = this.ryJyjlService.findPage(ryJyjl); 
		return page;
	}
	
    /**
	 * 新增
	 * @param entity RyJyjl 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("rygl:ryJyjl:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(RyJyjl entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.ryJyjlService.insert(entity);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity RyJyjl 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("rygl:ryJyjl:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(RyJyjl entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.ryJyjlService.update(entity);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param ryJyjl RyJyjl 
	 * @return String
	 */
	@RequiresPermissions("rygl:ryJyjl:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(RyJyjl entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.ryJyjlService.delete(entity);
		
		return map;
	}

	/**
	 * 初始化下拉树
	 * @param model
	 */
	private void buildCommonParam(Model model){
		ZidianVo zidianVo = new ZidianVo();
		/*zidianVo.setBianhao("B08"); // 证件类型
		List<ZidianVo> zjlxList = zidianService.findList(zidianVo);

		zidianVo.setBianhao("B09"); // 政治面貌
		List<ZidianVo> zzmmList = zidianService.findList(zidianVo);

		zidianVo.setBianhao("B10"); // 民族
		List<ZidianVo> mzList = zidianService.findList(zidianVo);*/

		zidianVo.setBianhao("B16"); // 学历
		List<ZidianVo> xlList = zidianService.findList(zidianVo);

		zidianVo.setBianhao("B17"); // 学位
		List<ZidianVo> xwList = zidianService.findList(zidianVo);

		/*model.addAttribute("zjlxList", zjlxList);
		model.addAttribute("zzmmList", zzmmList);
		model.addAttribute("mzList", mzList);*/
		model.addAttribute("xlList", xlList);
		model.addAttribute("xwList", xwList);
		
	}
	
}
