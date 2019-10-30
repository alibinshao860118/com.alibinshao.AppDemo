package com.alibinshao.zhonghong.university.zp.web;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.util.StringUtil;
import com.alibinshao.zhonghong.fdp.common.persistence.Page;
import com.alibinshao.zhonghong.fdp.common.web.BaseController;
import com.alibinshao.zhonghong.university.zp.entity.ZpjlsxlcVo;
import com.alibinshao.zhonghong.university.zp.service.ZpjlsxlcService;
/**
 * 
 * 筛选流程控制器
 *
 */
@Controller
@RequestMapping(value = "${adminPath}/zp/zpjlsxlc")
public class ZpjlsxlcController extends BaseController{

	@Autowired
	protected ZpjlsxlcService zpjlsxlcService;
	
	/**
	 * 简历筛选
	 * @param req
	 * @return
	 */
	@RequestMapping("init.do")
	public String init(HttpServletRequest req) {
		return "zp/jianlisx";
	}
	/**
	 * 简历筛选--批量删除
	 * @param req
	 * @return
	 */
	@RequestMapping("bathUpdate.do")
	@ResponseBody
	public String bathUpdate(ZpjlsxlcVo vo, @RequestParam("ids") String ids) {
		zpjlsxlcService.bathUpdate(vo,ids);
		return "SUCCESS";
	}
	/**
	 * 简历筛选流程管理
	 * @param req
	 * @return
	 */
	@RequestMapping(value="jianlisxlcgl.do")
	public String jianlisxlcgl(HttpServletRequest req,ModelMap model,ZpjlsxlcVo vo) {
		
/*		User user = (User) req.getSession().getAttribute("user");
		vo.setFbren(user.getUsername());
		vo.setFbrenId(user.getId());
		vo.setSsbm(user.getSsbm());
		vo.setSsbmId(user.getSsbmid());
		vo.setFqsj(DateFormatUtils.format(new Date(), "yyyy年MM月dd日"));
		vo.setZwxmid(user.getId());
		//如果是修改的页面
		if(StringUtil.isNotEmpty(vo.getId())){
			vo=this.initFqlcxx(vo);
		}
		model.put("vo", vo);
		//招聘计划下拉
		List<ZpjlsxlcVo> jhList = zpjlsxlcService.findList(vo);
		model.put("jhList", jhList);*/
		return "zp/jianlisxlcgl";
	}
	/**
	 * 初始化流程处理或者查看页面等信息
	 * @param vo
	 */
	private ZpjlsxlcVo initFqlcxx(ZpjlsxlcVo vo) {
		//TODO查找发起人和部门信息
		ZpjlsxlcVo lcxx = new ZpjlsxlcVo();
		lcxx =zpjlsxlcService.initFqlcxx(vo);
		return lcxx;
	}

	/**
	 * 简历筛选流程管理查询
	 * @param req
	 * @return
	 */
	@RequestMapping(value="queryZpjlsxlcByPage.do")
	@ResponseBody
	public Page<ZpjlsxlcVo> queryZpjlsxlcByPage(HttpServletRequest req,ZpjlsxlcVo vo) {
		Page<ZpjlsxlcVo> page =zpjlsxlcService.queryZpjlsxlcByPage(vo);
		return page;
	}
	
	/**
	 * 简历筛选流程管理--保存表单信息
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "saveFlowInstance.do")
	@ResponseBody
	public String save(@RequestParam Map map, Model model, RedirectAttributes redirectAttributes)
			throws IllegalAccessException, InvocationTargetException {
		ZpjlsxlcVo vo = new ZpjlsxlcVo();
		BeanUtils.populate(vo, map); 
		zpjlsxlcService.saveFlowInstance(vo);
		return vo.getId();
	}
	/**
	 * 简历筛选流程-简历信息查看页面
	 * @param req
	 * @return
	 */
	@RequestMapping(value="jianlidy.do")
	public String jianlidy(HttpServletRequest req,ModelMap model) {
		return "zp/jianlidy";
	}
	/**
	 * 简历筛选流程筛选的简历信息的查询
	 * @param req
	 * @return
	 */
	@RequestMapping(value="queryZpjlxxByPage.do")
	@ResponseBody
	public Page<ZpjlsxlcVo> queryZpjlxxByPage(HttpServletRequest req,ZpjlsxlcVo vo) {
		Page<ZpjlsxlcVo> page =zpjlsxlcService.queryZpjlxxByPage(vo);
		return page;
	}
	/**
	 * 环节意见信息的查询
	 * @param req
	 * @return
	 */
	@RequestMapping(value="queryHjyjxxByPage.do")
	@ResponseBody
	public Page<ZpjlsxlcVo> queryHjyjxxByPage(HttpServletRequest req,ZpjlsxlcVo vo) {
		Page<ZpjlsxlcVo> page =zpjlsxlcService.queryHjyjxxByPage(vo);
		return page;
	}
	/**
	 * 流程筛选日志的查询
	 * @param req
	 * @return
	 */
	@RequestMapping(value="queryLcsxrzByPage.do")
	@ResponseBody
	public Page<ZpjlsxlcVo> queryLcsxrzByPage(HttpServletRequest req,ZpjlsxlcVo vo) {
		Page<ZpjlsxlcVo> page =zpjlsxlcService.queryHjyjxxByPage(vo);
		return page;
	}
	
	/**
	 * 筛选意见(筛选简历信息)的保存
	 * @param req
	 * @return
	 */
	@RequestMapping(value="saveSxyj.do")
	@ResponseBody
	public String saveSxyj(@RequestParam Map map, Model model, RedirectAttributes redirectAttributes) 
			throws IllegalAccessException, InvocationTargetException {
		ZpjlsxlcVo vo = new ZpjlsxlcVo();
		BeanUtils.populate(vo, map); 
		String id =zpjlsxlcService.saveSxyj(vo);
		return vo.getId();
	}
	
	/**
	 * 筛选流程的提交
	 * @param req
	 * @return
	 */
	@RequestMapping(value="processSubmit.do")
	@ResponseBody
	public String processSubmit(@RequestParam Map map, Model model, RedirectAttributes redirectAttributes) 
			throws IllegalAccessException, InvocationTargetException {
		ZpjlsxlcVo vo = new ZpjlsxlcVo();
		BeanUtils.populate(vo, map); 
		String message =zpjlsxlcService.processSubmit(vo);
		return message;
	}
	/**
	 * 我的代办任务页面
	 * @param req
	 * @return
	 */
	@RequestMapping("initDbrw.do")
	public String initDbrw(HttpServletRequest req) {
		return "zp/initDbrw";
	}
	
	/**
	 * 我的代办分页查询
	 * @param req
	 * @return
	 */
	@RequestMapping(value="queryDbrwByPage.do")
	@ResponseBody
	public Page<ZpjlsxlcVo> queryDbrwByPage(HttpServletRequest req,ZpjlsxlcVo vo) {
		/*User user = (User) req.getSession().getAttribute("user");
		vo.setFbren(user.getUsername());
		vo.setFbrenId(user.getId());*/
		Page<ZpjlsxlcVo> page =zpjlsxlcService.queryDbrwByPage(vo);
		return page;
	}
	
	/**
	 * 简历筛选流程处理页面
	 * @param req
	 * @return
	 */
	@RequestMapping(value="jianlisxlcgl_cl.do")
	public String jianlisxlcgl_cl(HttpServletRequest req,ModelMap model,ZpjlsxlcVo vo) {
		
		/*User user = (User) req.getSession().getAttribute("user");
		vo.setFbren(user.getUsername());
		vo.setFbrenId(user.getId());
		vo.setSsbm(user.getSsbm());
		vo.setSsbmId(user.getSsbmid());
		vo.setZwxmid(user.getId());*/
		//修改以及查看的页面共用的查询逻辑
		ZpjlsxlcVo clxx = new ZpjlsxlcVo();
		clxx=this.initFqlcxx(vo);
		model.put("vo", clxx);
		//招聘计划下拉
		List<ZpjlsxlcVo> jhList = zpjlsxlcService.findList(vo);
		model.put("jhList", jhList);
		return "zp/jianlisxlcgl_cl";
	}
	/**
	 * 我的已办任务页面
	 * @param req
	 * @return
	 */
	@RequestMapping("initYbrw.do")
	public String initYbrw(HttpServletRequest req,ModelMap model) {
		
		return "zp/initYbrw";
	}
	
	/**
	 * 我的已办分页查询
	 * @param req
	 * @return
	 */
	@RequestMapping(value="queryYbrwByPage.do")
	@ResponseBody
	public Page<ZpjlsxlcVo> queryYbrwByPage(HttpServletRequest req,ZpjlsxlcVo vo) {
		/*User user = (User) req.getSession().getAttribute("user");
		vo.setZwxmid(user.getId());*/
		Page<ZpjlsxlcVo> page =zpjlsxlcService.queryYbrwByPage(vo);
		return page;
	}
	
	/**
	 * 简历筛选流程管理查看页面
	 * @param req
	 * @return
	 */
	@RequestMapping(value="jianlisxlcgl_view.do")
	public String jianlisxlcgl_view(HttpServletRequest req,@RequestParam("pageGoBack") String pageGoBack,
			ModelMap model,ZpjlsxlcVo vo) {
		/*User user = (User) req.getSession().getAttribute("user");
		vo.setZwxmid(user.getId());*/
		//如果是修改的页面
		if(StringUtil.isNotEmpty(vo.getId())){
			vo=this.initFqlcxx(vo);
		}
		model.put("vo", vo);
		//招聘计划下拉
		List<ZpjlsxlcVo> jhList = zpjlsxlcService.findList(vo);
		model.put("jhList", jhList);
		model.put("pageGoBack", pageGoBack);
		return "zp/jianlisxlcgl_view";
	}
	/**
	 * 简历筛选--批量筛选简历
	 * @param req
	 * @return
	 */
	@RequestMapping("bathUpdateZpjlxq.do")
	@ResponseBody
	public String bathUpdateZpjlxq(HttpServletRequest req,ZpjlsxlcVo vo, 
			@RequestParam("ids") String ids) {
		/*User user = (User) req.getSession().getAttribute("user");
		vo.setZwxm(user.getUsername());
		vo.setZwxmid(user.getId());*/
		vo.setCzsj(new Date());
		zpjlsxlcService.bathUpdateZpjlxq(vo,ids);
		return "SUCCESS";
	}
}
