/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.zp.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhonghong.fdp.common.persistence.Page;
import com.zhonghong.fdp.common.web.BaseController;
import com.zhonghong.university.sys.entity.SysXxxx;
import com.zhonghong.university.sys.service.SysXxxxService;
import com.zhonghong.university.zp.entity.ZpZpjh;
import com.zhonghong.university.zp.entity.ZpZpxq;
import com.zhonghong.university.zp.entity.Zpjlxq;
import com.zhonghong.university.zp.service.ZpZpjhService;
import com.zhonghong.university.zp.service.ZpjlxqService;

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
@RequestMapping(value = "${adminPath}/zp/zpZpjh")
public class ZpZpjhController extends BaseController{

	@Autowired
	private ZpZpjhService zpZpjhService;
	@Autowired
	private SysXxxxService sysXxxxService;
	@Autowired
	private ZpjlxqService zpjlxqService;
	
	/**
	 * 进入查询界面
	 * @param zpZpjh ZpZpjh 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("zp:zpZpjh:view")
	@RequestMapping(value = {"list"})
	public String list(ZpZpjh zpZpjh, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("zpZpjh", zpZpjh);
		return "modules/zp/zpZpjh/zpZpjhList";
	}
	
	/**
	 * 查询
	 * @param zpZpjh ZpZpjh 
	 * @param request
	 * @param response
	 * @return Page<ZpZpjh>
	 */
	@RequiresPermissions("zp:zpZpjh:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<ZpZpjh> query(ZpZpjh zpZpjh,HttpServletRequest request, HttpServletResponse response) {
		Page<ZpZpjh> page = this.zpZpjhService.findPage(zpZpjh); 
		return page;
	}
	
    /**
	 * 新增
	 * @param entity ZpZpjh 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("zp:zpZpjh:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(ZpZpjh entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.zpZpjhService.insert(entity);
		result.put("id", entity.getId());
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity ZpZpjh 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("zp:zpZpjh:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(ZpZpjh entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.zpZpjhService.update(entity);
		result.put("id", entity.getId());
		
		return result;
	}
	
	/**
	 * 删除
	 * @param zpZpjh ZpZpjh 
	 * @return String
	 */
	@RequiresPermissions("zp:zpZpjh:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(ZpZpjh entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.zpZpjhService.delete(entity);
		
		return map;
	}

	/**
	 * 进行新增或者修改页面
	 * @param entity ZpZpjh
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("zp:zpZpjh:edit")
	@RequestMapping(value = "toEdit")
	public String toEdit(ZpZpjh entity,Model model){
		if(StringUtils.isNotEmpty(entity.getId())){
			entity = this.zpZpjhService.get(entity.getId());
		}else{
			entity = new ZpZpjh();
		}
		
		model.addAttribute("zpjh", entity);
		
		return "modules/zp/zpZpjh/zpZpjhmxList";
	}
	
	/**
	 * 根据招聘计划查询招聘需求
	 * @param entity ZpZpxq 
	 * @return List<ZpZpxq>
	 */
	@RequiresPermissions("zp:zpZpjh:view,zp:zpZpjh:edit")
	@RequestMapping(value = {"queryZpxqByZpjh"})
	@ResponseBody
	public List<ZpZpxq> queryZpxqByZpjh(ZpZpxq entity) {
		return this.zpZpjhService.queryZpxqByZpjh(entity);
		
	}
	
	/**
	 * 预览招聘计划
	 * @param jhBh
	 * @param model
	 * @param request
	 * @return
	 */
	@RequiresPermissions("user")
	@RequestMapping("preview")
	public String preview(String jhBh, Model model,HttpServletRequest request) {
		
		//1:招聘计划信息
		ZpZpjh zpjh = zpZpjhService.getByJhbh(jhBh);
		model.addAttribute("zpjh", zpjh);
		
		//2:学校简介
		List<SysXxxx> list = sysXxxxService.findList(new SysXxxx());
		if(!list.isEmpty()){
			model.addAttribute("xxxx", list.get(0));
		}else{
			model.addAttribute("xxxx", new SysXxxx());
		}
		
		//3:招聘需求
		ZpZpxq xq = new ZpZpxq();
		xq.setZpjhId(zpjh.getId());
		List<ZpZpxq> zpxqList = this.zpZpjhService.queryZpxqByZpjh(xq);
		model.addAttribute("zpxqList", zpxqList);
		
		//4:从会话中获取录入的身份证号码和姓名，用来判断是否有投递简历
		HttpSession session = request.getSession();
		Object username = session.getAttribute("username");
		Object sfzhm = session.getAttribute("sfzhm");
		if(sfzhm!=null){
			Zpjlxq vo = new Zpjlxq();
			vo.setZpjhid(zpjh.getId());
			vo.setSfzhm((String)sfzhm);
			List<Zpjlxq> tmpList = zpjlxqService.findList(vo);
			if(!tmpList.isEmpty()){
				model.addAttribute("zpjlxq", tmpList.get(0));
			}
		}
		
		return "modules/zp/zpZpjh/zpnrView";
	}
	
	/**
	 * 验证是否已经投递简历
	 * @param entity Zpjlxq
	 * @param model Model
	 * @param request HttpServletRequest
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("user")
	@RequestMapping("checkSfzhm")
	@ResponseBody
	public Map<String,Object> checkSfzhm(Zpjlxq entity,Model model,HttpServletRequest request){
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("isExsits", false);
		
		Zpjlxq vo = new Zpjlxq();
		vo.setZpjhid(entity.getZpjhid());
		vo.setSfzhm(entity.getSfzhm());
		List<Zpjlxq> tmpList = zpjlxqService.findList(vo);
		if(!tmpList.isEmpty()){
			resultMap.put("isExsits", true);
			resultMap.put("msg", "您之前已有应聘一个岗位，不能再次应聘！");
			
			model.addAttribute("zpjlxq", tmpList.get(0));
			request.getSession().setAttribute("zpjlxq", tmpList.get(0));
		}else{
			request.getSession().setAttribute("zpjlxq", entity);
			request.getSession().setAttribute("username", entity.getUsername());
			request.getSession().setAttribute("sfzhm", entity.getSfzhm());
		}
		
		return resultMap;
	}
	
	/**
	 * 从会话中清除身份信息
	 * @param request HttpServletRequest
	 */
	@RequiresPermissions("user")
	@RequestMapping("clearSessionData")
	@ResponseBody
	public Map<String,Object> clearSessionData(HttpServletRequest request){
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("success", true);
		
		request.getSession().removeAttribute("zpjlxq");
		request.getSession().removeAttribute("username");
		request.getSession().removeAttribute("sfzhm");
		
		return resultMap;
	}
	
	/**
	 * 终止报名
	 * @param zpZpjh ZpZpjh 
	 * @return String
	 */
	@RequiresPermissions("zp:zpZpjh:edit")
	@RequestMapping(value = "stop")
	@ResponseBody
	public Map<String,Object> stop(ZpZpjh entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		entity = this.zpZpjhService.get(entity.getId());
		entity.setEnableFlag("0");
		this.zpZpjhService.update(entity);
		
		return map;
	}
	
	/**
	 * 恢复继续报名
	 * @param zpZpjh ZpZpjh 
	 * @return String
	 */
	@RequiresPermissions("zp:zpZpjh:edit")
	@RequestMapping(value = "active")
	@ResponseBody
	public Map<String,Object> active(ZpZpjh entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		entity = this.zpZpjhService.get(entity.getId());
		entity.setEnableFlag("1");
		this.zpZpjhService.update(entity);
		
		return map;
	}
	
	/**
	 * 检查是否已经终止报名
	 * @param entity Zpjlxq
	 * @param model Model
	 * @param request HttpServletRequest
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("user")
	@RequestMapping("checkStop")
	@ResponseBody
	public Map<String,Object> checkStop(Zpjlxq entity,Model model,HttpServletRequest request){
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("isExsits", false);
		
		ZpZpjh zpjh = this.zpZpjhService.get(entity.getZpjhid());
		if(zpjh!=null && StringUtils.equals("0", zpjh.getEnableFlag())){
			resultMap.put("isExsits", true);
			resultMap.put("msg", "报名已经截止！");
		}
		return resultMap;
	}
}
