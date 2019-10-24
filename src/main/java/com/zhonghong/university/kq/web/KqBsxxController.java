/**
] * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.kq.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.util.StringUtils;
import com.zhonghong.fdp.common.persistence.Page;
import com.zhonghong.fdp.common.web.BaseController;
import com.zhonghong.university.kq.entity.KqBsmx;
import com.zhonghong.university.kq.entity.KqBsxx;
import com.zhonghong.university.kq.service.KqBsxxService;

/**
 * <pre>
 * Controller控制层类
 * </pre>
 * @author gulong 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
@Controller
@RequestMapping(value = "${adminPath}/kq/kqBsxx")
public class KqBsxxController extends BaseController{

	@Autowired
	private KqBsxxService kqBsxxService;
	
	/**
	 * 进入查询界面
	 * @param kqBsxx KqBsxx 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("kq:kqBsxx:view")
	@RequestMapping(value = {"list"})
	public String list(KqBsxx kqBsxx, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("kqBsxx", kqBsxx);
		return "modules/kq/kqBsxx/kqBsxxList";
	}
	
	/**
	 * 查询
	 * @param kqBsxx KqBsxx 
	 * @param request
	 * @param response
	 * @return Page<KqBsxx>
	 */
	@RequiresPermissions("kq:kqBsxx:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<KqBsxx> query(KqBsxx kqBsxx,HttpServletRequest request, HttpServletResponse response) {
		Page<KqBsxx> page = this.kqBsxxService.findPage(kqBsxx); 
		return page;
	}
	
	/**
	 * 查询
	 * @param kqBsxx KqBsxx 
	 * @param request
	 * @param response
	 * @return Page<KqBsxx>
	 */
	@RequiresPermissions("kq:kqBsxx:edit")
	@RequestMapping(value = {"getBsmxBy"})
	@ResponseBody
	public List<KqBsmx> getBsmxBy(KqBsxx kqBsxx,HttpServletRequest request, HttpServletResponse response) {
		List<KqBsmx> list = new ArrayList<KqBsmx>();
		
		if(StringUtils.isEmpty(kqBsxx.getId()) 
				&& StringUtils.isEmpty(kqBsxx.getOrgId())){
			return list;
		}
		
		list = this.kqBsxxService.getBsmxBy(kqBsxx);
		
		return list;
	}
	
    /**
	 * 新增
	 * @param entity KqBsxx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("kq:kqBsxx:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(@RequestBody KqBsxx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.kqBsxxService.insert(entity);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity KqBsxx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("kq:kqBsxx:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(@RequestBody KqBsxx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.kqBsxxService.update(entity);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param kqBsxx KqBsxx 
	 * @return String
	 */
	@RequiresPermissions("kq:kqBsxx:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(KqBsxx entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.kqBsxxService.delete(entity);
		
		return map;
	}

}
