package com.zhonghong.university.zp.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zhonghong.fdp.common.web.BaseController;
import com.zhonghong.university.sys.entity.SysXxxx;
import com.zhonghong.university.sys.service.SysXxxxService;
import com.zhonghong.university.zp.entity.ZidianVo;
import com.zhonghong.university.zp.entity.ZpZpjh;
import com.zhonghong.university.zp.entity.ZpZpxq;
import com.zhonghong.university.zp.entity.Zpjlxq;
import com.zhonghong.university.zp.service.ZidianService;
import com.zhonghong.university.zp.service.ZpZpjhService;
import com.zhonghong.university.zp.service.ZpjlxqService;

@Controller
@RequestMapping(value = "${adminPath}/zp/zprn")
public class ZpnrController extends BaseController{

	@Autowired
	protected ZidianService zidianService;
	@Autowired
	private ZpZpjhService zpjhService;
	@Autowired
	private SysXxxxService sysXxxxService;
	
	@RequestMapping("init")
	public String init(HttpServletRequest req) {
		return "modules/zp/zpnr";
	}
	/**
	 * 增加简历补录
	 * @param req
	 * @return
	 */
	@RequestMapping("init_yfb")
	public String init_yfb(HttpServletRequest req) {
		return "modules/zp/zpnr_yfb";
	}	
	
	@RequestMapping("jianligl")
	public String jianligl(HttpServletRequest req, Model model) {
		ZidianVo zidianVo = new ZidianVo();
		zidianVo.setBianhao("B09"); //政治面貌
		List<ZidianVo> zzmmList = zidianService.findList(zidianVo);
		
		zidianVo.setBianhao("B16"); // 学历
		List<ZidianVo> xlList = zidianService.findList(zidianVo);
		
		model.addAttribute("zzmm", zzmmList);
		model.addAttribute("xl", xlList);
		
		//TODO:找出最新招聘计划编号
		ZpZpjh entity = new ZpZpjh();
		//entity.setEnableFlag("1");
		List<ZpZpjh> list = zpjhService.findList(entity);
		if(list.size()>0){
			model.addAttribute("zpjhBh", list.get(0).getJhBh());
		}
		
		return "modules/zp/jianligl";
	}
	
	@RequestMapping("jianliqr")
	public String jianliqr(HttpServletRequest req, Model model) {
		ZidianVo zidianVo = new ZidianVo();
		zidianVo.setBianhao("B09"); //政治面貌
		List<ZidianVo> zzmmList = zidianService.findList(zidianVo);
		
		zidianVo.setBianhao("B16"); // 学历
		List<ZidianVo> xlList = zidianService.findList(zidianVo);
		
		model.addAttribute("zzmm", zzmmList);
		model.addAttribute("xl", xlList);
		
		return "modules/zp/jianliqr";
	}
	
	@RequestMapping("jianlizgsh")
	public String jianlizgsh(HttpServletRequest req, Model model) {
		ZidianVo zidianVo = new ZidianVo();
		zidianVo.setBianhao("B09"); //政治面貌
		List<ZidianVo> zzmmList = zidianService.findList(zidianVo);
		
		zidianVo.setBianhao("B16"); // 学历
		List<ZidianVo> xlList = zidianService.findList(zidianVo);
		
		model.addAttribute("zzmm", zzmmList);
		model.addAttribute("xl", xlList);
		
		return "modules/zp/jianlizgsh";
	}
	
	
}
