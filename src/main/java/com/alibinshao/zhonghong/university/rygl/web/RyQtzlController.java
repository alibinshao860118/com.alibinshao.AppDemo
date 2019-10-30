/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.rygl.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibinshao.zhonghong.fdp.common.persistence.Page;
import com.alibinshao.zhonghong.fdp.common.web.BaseController;

import com.alibinshao.zhonghong.university.rygl.entity.RyQtzl;
import com.alibinshao.zhonghong.university.rygl.service.RyQtzlService;

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
@RequestMapping(value = "${adminPath}/rygl/ryQtzl")
public class RyQtzlController extends BaseController{

	@Autowired
	private RyQtzlService ryQtzlService;
	
	/**
	 * 进入查询界面
	 * @param ryQtzl RyQtzl 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("rygl:ryQtzl:view")
	@RequestMapping(value = {"list"})
	public String list(RyQtzl ryQtzl, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("ryQtzl", ryQtzl);
		return "modules/rygl/ryQtzl/ryQtzlList";
	}
	
	/**
	 * 查询
	 * @param ryQtzl RyQtzl 
	 * @param request
	 * @param response
	 * @return Page<RyQtzl>
	 */
	@RequiresPermissions("rygl:ryQtzl:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<RyQtzl> query(RyQtzl ryQtzl,HttpServletRequest request, HttpServletResponse response) {
		Page<RyQtzl> page = this.ryQtzlService.findPage(ryQtzl); 
		return page;
	}
	
    /**
	 * 新增
	 * @param entity RyQtzl 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("rygl:ryQtzl:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(RyQtzl entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.ryQtzlService.insert(entity);
		
		return result;
	}
	/**
	 * 保存资料信息以及附件
	 * 
	 * @param map
	 * @param sourceFile
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "save")
	@ResponseBody
	public Map<String,Object> save(@RequestParam Map map, @RequestParam MultipartFile[] sourceFile)
			throws Exception {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", true);
		
		//数据入库
		RyQtzl entity = new RyQtzl();
		BeanUtils.populate(entity, map);
		ryQtzlService.save(entity, sourceFile);
				
		return result;
	}
	
	/**
	 * 修改
	 * @param entity RyQtzl 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("rygl:ryQtzl:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(RyQtzl entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.ryQtzlService.update(entity);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param ryQtzl RyQtzl 
	 * @return String
	 */
	@RequiresPermissions("rygl:ryQtzl:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(RyQtzl entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.ryQtzlService.delete(entity);
		
		return map;
	}

}
