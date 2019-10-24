
package com.zhonghong.university.zp.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.util.StringUtil;
import com.zhonghong.fdp.common.persistence.Page;
import com.zhonghong.fdp.common.web.BaseController;
import com.zhonghong.university.util.FileUtil;
import com.zhonghong.university.zp.entity.ZidianVo;
import com.zhonghong.university.zp.entity.ZpZpjh;
import com.zhonghong.university.zp.entity.ZpZpxq;
import com.zhonghong.university.zp.entity.Zpjlfj;
import com.zhonghong.university.zp.entity.Zpjlxq;
import com.zhonghong.university.zp.service.ZidianService;
import com.zhonghong.university.zp.service.ZpZpjhService;
import com.zhonghong.university.zp.service.ZpjlxqService;

import lombok.extern.slf4j.Slf4j;

/**
 * 招聘简历信息Controller
 * 
 * @author huangqi
 * @version 2017-03-15
 */
@Slf4j
@Controller
@RequestMapping(value = "${adminPath}/zpjlxq")
public class ZpjlxqController extends BaseController{
	
	Log log = LogFactory.getLog(ZpjlxqController.class);

	@Autowired
	private ZpjlxqService zpjlxqService;
	@Autowired
	protected ZidianService zidianService;
	@Value("${file.path.prefix}")
	private String filePathPrefix;
	@Value("${file.path.tmp}")  
	private String filePathTemp;
	@Autowired
	protected ZpZpjhService zpjhService;
	
	/**
	 * 批量生成简历花名册下载（Excel）
	 * @param zpjlxq
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "batchGenJlFile")
	@ResponseBody
	public String batchGenJlFile(Zpjlxq zpjlxq, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return zpjlxqService.geneJlExcel(response.getOutputStream(), zpjlxq);
	}
	
	/**
	 * 批量报名表下载（Excel）
	 * @param zpjlxq
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "batchGenBmb")
	@ResponseBody
	public String batchGenBmb(Zpjlxq zpjlxq, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return zpjlxqService.geneBmbExcel(response.getOutputStream(), zpjlxq);
	}

	/**
	 * 批量简历下载（Excel）
	 * 
	 * @param zpjlxq
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "batchDownloadJl")
	public void batchDownloadJl(Zpjlxq zpjlxq, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Cache-Control", "max-age=0");
		String fileName = new String("应聘简历花名册及清单.xlsx".getBytes("GBK"), "ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
		
		String fileId = request.getParameter("fileId");

		ServletOutputStream out = null;   
        File file = new File(this.filePathTemp+File.separator+fileId);   
  
        try {   
            FileInputStream inputStream = new FileInputStream(file);   
  
            //3.通过response获取ServletOutputStream对象(out)   
            out = response.getOutputStream();   
  
            int b = 0;   
            byte[] buffer = new byte[512];   
            while (b != -1){   
                b = inputStream.read(buffer);   
                //4.写到输出流(out)中   
                out.write(buffer,0,b);   
            }   
            
            inputStream.close();   
        } catch (IOException e) {   
        	log.error("", e);
        }  finally{
        	out.close();   
            out.flush();  
        }
	}

	/**
	 * 简历附件下载
	 */
	@RequestMapping(value = "downloadJlFj")
	public void downloadJlFj(Zpjlfj zpjlfj, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("application/x-download");
		response.setHeader("Cache-Control", "max-age=0");
		String fileName = new String(zpjlfj.getFjmc().getBytes("GBK"),"ISO8859_1");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
		OutputStream outputStream = response.getOutputStream();

		File file = new File(zpjlfj.getFjlj()+File.separator+zpjlfj.getFjmc());

		FileInputStream fis = new FileInputStream(file);
		BufferedInputStream inputStream = new BufferedInputStream(fis);
		BufferedOutputStream out = new BufferedOutputStream(outputStream);

		byte[] buffer = new byte[1024];
		int i = -1;
		while ((i = inputStream.read(buffer)) != -1) {
			out.write(buffer, 0, i);
		}
		out.flush();
		inputStream.close();
		outputStream.close();
		out.close();
	}

	/**
	 * 批量简历附件下载
	 * 
	 * @param zpjlfj
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "downloadJlFjById")
	public void downloadJlFjById(String id, HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 临时路径
		String tempDir = filePathPrefix + UUID.randomUUID().toString() + "//";
		// 临时文件名.zip
		String fileName = id + ".zip";
		// 临时文件名.zip
		String filePath = tempDir + fileName;

		//压缩文件到临时目录
		FileUtil.doZip(filePathPrefix + id, tempDir,filePath);
		//下载压缩文件
		FileUtil.downFile(res, filePath, fileName);
		res.getOutputStream().flush();
		res.getOutputStream().close();
		//删除临时路径
		FileUtil.deleteDirectory(tempDir);
	}

	/**
	 * 批量简历附件下载
	 * 
	 * @param zpjlfj
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "downloadJlFjByIds")
	public void downloadJlFjByIds(String ids, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		String uuid =  UUID.randomUUID().toString().replaceAll("-",	"");
		// 临时文件名.zip
		String fileName = uuid + ".zip";
		// 临时路径
		String tempDestDir = filePathPrefix + uuid + "//";
		
		String zipFilePath = filePathPrefix + fileName;

		// 复制目录到临时目录
		List<String> list = Arrays.asList(ids.split(","));
		for (String id : list) {
			String srcPath = filePathPrefix + id;
			FileUtil.copyPath(srcPath, tempDestDir);
		}
		//压缩文件
		FileUtil.doZip(tempDestDir, tempDestDir,zipFilePath);
		//下载压缩文件
		FileUtil.downFile(res, zipFilePath, fileName);
		
		res.getOutputStream().flush();
		res.getOutputStream().close();
		//删除临时路径
		FileUtil.deleteDirectory(tempDestDir);
		FileUtil.deleteFile(zipFilePath);
	}

	/**
	 * 简历管理查询
	 * 
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "findPage")
	@ResponseBody
	public Page<Zpjlxq> findPage(HttpServletRequest req, Zpjlxq zpjlxq) {
		// 可以传多值时进行处理,年龄处理
		if (!StringUtil.isEmpty(zpjlxq.getNl())) {
			String[] nls = zpjlxq.getNl().split(",");
			zpjlxq.setMinNl(Integer.parseInt(nls[0]));
			zpjlxq.setMaxNl(Integer.parseInt(nls[1]));
		}
		// 可以传多值时进行处理,最高学历处理
		if (!StringUtil.isEmpty(zpjlxq.getZgxlxw())) {
			List<String> list = Arrays.asList(zpjlxq.getZgxlxw().split(","));
			zpjlxq.setZgxlxws(list);
		}
		// 可以传多值时进行处理,第一学历处理
		if (!StringUtil.isEmpty(zpjlxq.getDyxlxw())) {
			List<String> list = Arrays.asList(zpjlxq.getDyxlxw().split(","));
			zpjlxq.setDyxlxws(list);
		}
		Page<Zpjlxq> page = zpjlxqService.findPage(zpjlxq);
		return page;
	}

	/**
	 * 简历打印
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping("toView")
	public String toView(HttpServletRequest req, ModelMap model) {
		String id = req.getParameter("id");
		// 查询出简历详情
		Zpjlxq vo = zpjlxqService.findById(id);
		model.addAttribute("vo", vo);

		return "modules/zp/jianlidy";
	}
	
	/**
	 * 简历详情查看
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping("toJlView")
	public String toJlView(HttpServletRequest req, ModelMap model) {
		String id = req.getParameter("id");
		// 查询出简历详情
		Zpjlxq vo = zpjlxqService.findById(id);
		ZpZpjh zpjh = zpjhService.get(vo.getZpjhid());
		
		vo.setZpjhBh(zpjh.getJhBh());
		model.addAttribute("vo", vo);
		model.addAttribute("src", req.getParameter("src"));
		
		buildCommonParam(model);
		
		Zpjlfj zpjlfj = new Zpjlfj();
		zpjlfj.setZpjlid(id);
		zpjlfj.setPage(1L);
		zpjlfj.setRows(100L);
		Page<Zpjlfj> page = zpjlxqService.findJlfjList(zpjlfj);
		
		model.addAttribute("fjList", page.getRows());

		return "modules/zp/jianliView";
	}
	
	/**
	 * 简历详情查看
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping("toJlUpdate")
	public String toJlUpdate(HttpServletRequest req, ModelMap model) {
		String id = req.getParameter("id");
		// 查询出简历详情
		Zpjlxq vo = zpjlxqService.findById(id);
		ZpZpjh zpjh = zpjhService.get(vo.getZpjhid());
		
		vo.setZpjhBh(zpjh.getJhBh());
		model.addAttribute("vo", vo);
		model.addAttribute("src", req.getParameter("src"));
		
		buildCommonParam(model);
		
		Zpjlfj zpjlfj = new Zpjlfj();
		zpjlfj.setZpjlid(id);
		zpjlfj.setPage(1L);
		zpjlfj.setRows(100L);
		Page<Zpjlfj> page = zpjlxqService.findJlfjList(zpjlfj);
		
		model.addAttribute("fjList", page.getRows());

		return "modules/zp/jianlitj";
	}
	
	/**
	 * 根据ID查询简历详情
	 * @param req
	 * @param model
	 * @return Zpjlxq
	 */
	@RequestMapping("findById")
	@ResponseBody
	public Zpjlxq findById(HttpServletRequest req, ModelMap model) {
		String id = req.getParameter("id");
		// 查询出简历详情
		Zpjlxq vo = zpjlxqService.findById(id);

		return vo;
	}

	/**
	 * 批量打印简历
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping("toPldy")
	public String toPldy(HttpServletRequest req, ModelMap model) {

		String id = req.getParameter("ids");
		List<String> ids = Arrays.asList(id.split(","));
		// 查询出简历详情
		List<Zpjlxq> listZpjlxq = zpjlxqService.findByIds(ids);
		model.addAttribute("list", listZpjlxq);
		return "modules/zp/jlpldy";
	}

	/**
	 * 打印花名册
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping("dyhmc")
	public String dyhmc(HttpServletRequest req, ModelMap model) {

		String id = req.getParameter("ids");
		List<String> ids = Arrays.asList(id.split(","));
		// 查询出简历详情
		List<Zpjlxq> listZpjlxq = zpjlxqService.findByIds(ids);
		model.addAttribute("list", listZpjlxq);
		return "modules/zp/dyhmc";
	}
	
	/**
	 * 查询简历列表
	 * @param entity ZpZpxq
	 * @param model ModelMap
	 * @param req HttpServletRequest
	 * @return
	 */
	@RequestMapping("jianlitjList2")
	public String jianlitjList2(@RequestParam String zpjhid,@RequestParam String gwlx, 
			@RequestParam String rpzhiwei,@RequestParam String ssbm,
			@RequestParam String ssbmid,@RequestParam String zyYq,@RequestParam String src,
			ModelMap model,HttpServletRequest req) {
		
		
		Zpjlxq vo = new Zpjlxq();
		vo.setZpxqid("1");
		vo.setRpzhiwei(rpzhiwei);
		vo.setSsbmid(ssbmid);
		vo.setSsbm(ssbm);
		vo.setZpjhid(zpjhid);
		/*vo.setZpjhBh(zpxq.getZpjhBh());*/
		/*vo.setZpjhmc(zpxq.getZpjhMc());*/
		vo.setZyyq(zyYq);
		//vo.setGwlx(req.getParameter("gwlx"));
		
		Object sfzhm = req.getSession().getAttribute("sfzhm");
		if(sfzhm!=null){
			vo.setSfzhm((String) sfzhm);
		}
		Object username = req.getSession().getAttribute("username");
		if(username!=null){
			vo.setUsername((String) username);
		}

		model.addAttribute("vo", vo);
		model.addAttribute("src", src);

		buildCommonParam(model);

		return "modules/zp/jianlitj";
	}

	/**
	 * 查询简历列表
	 * @param entity ZpZpxq
	 * @param model ModelMap
	 * @param req HttpServletRequest
	 * @return
	 */
	@RequestMapping("jianlitjList")
	public String jianlitjList(ZpZpxq entity, ModelMap model,HttpServletRequest req) {
		
		ZpZpxq zpxq = this.zpjhService.getZpxq(entity.getId());
		
		Zpjlxq vo = new Zpjlxq();
		vo.setZpxqid(entity.getId());
		vo.setRpzhiwei(zpxq.getZpGw());
		vo.setSsbmid(zpxq.getZpbmId());
		vo.setSsbm(zpxq.getZpbmMc());
		vo.setZpjhid(zpxq.getZpjhId());
		vo.setZpjhBh(zpxq.getZpjhBh());
		vo.setZpjhmc(zpxq.getZpjhMc());
		vo.setZyyq(zpxq.getZyYq());
		//vo.setGwlx(req.getParameter("gwlx"));
		
		Object sfzhm = req.getSession().getAttribute("sfzhm");
		if(sfzhm!=null){
			vo.setSfzhm((String) sfzhm);
		}
		Object username = req.getSession().getAttribute("username");
		if(username!=null){
			vo.setUsername((String) username);
		}

		model.addAttribute("vo", vo);

		buildCommonParam(model);

		return "modules/zp/jianlitj";
	}
	
	private void buildCommonParam(ModelMap model){
		ZidianVo zidianVo = new ZidianVo();
		zidianVo.setBianhao("B08"); // 身份证件类型
		List<ZidianVo> sfzList = zidianService.findList(zidianVo);

		zidianVo.setBianhao("B09"); // 政治面貌
		List<ZidianVo> zzmmList = zidianService.findList(zidianVo);

		zidianVo.setBianhao("B10"); // 民族
		List<ZidianVo> mzList = zidianService.findList(zidianVo);

		zidianVo.setBianhao("B16"); // 学历
		List<ZidianVo> xlList = zidianService.findList(zidianVo);

		zidianVo.setBianhao("B17"); // 学位
		List<ZidianVo> xwList = zidianService.findList(zidianVo);

		zidianVo.setBianhao("B18"); // 第一外语
		List<ZidianVo> dywyjList = zidianService.findList(zidianVo);

		zidianVo.setBianhao("B20"); // 第一外语等级
		List<ZidianVo> dywydjjList = zidianService.findList(zidianVo);

		zidianVo.setBianhao("B25"); // 岗位等级
		List<ZidianVo> gwdjList = zidianService.findList(zidianVo);

		model.addAttribute("mz", mzList);
		model.addAttribute("sfzlx", sfzList);
		model.addAttribute("zzmm", zzmmList);
		model.addAttribute("xw", xwList);
		model.addAttribute("xl", xlList);
		model.addAttribute("dywy", dywyjList);
		model.addAttribute("dywydj", dywydjjList);
		model.addAttribute("gwdj", gwdjList);
	}

	/**
	 * 更新简历及附件
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
		
		Zpjlxq zpjlxq = new Zpjlxq();
		BeanUtils.populate(zpjlxq, map);
		
		//1:判断是否有提交给多个岗位
		Zpjlxq vo = new Zpjlxq();
		vo.setZpjhid(zpjlxq.getZpjhid());
		vo.setSfzhm(zpjlxq.getSfzhm());
		List<Zpjlxq> list = zpjlxqService.findDistinctList(vo);
		if(!list.isEmpty() && list.size()>0){
			if(!StringUtils.equals(list.get(0).getSsbmid(),
					zpjlxq.getSsbmid())){
				result.put("success", false);
				result.put("msg", "您之前已填报一个岗位，不能再次申请！");
				return result;
			}
		}
		
		//2:数据入库
		zpjlxqService.save(zpjlxq, sourceFile);
		
		return result;
	}

	/**
	 * 保存附件
	 * 
	 * @param map
	 * @param sourceFile
	 * @return
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 */
	@RequestMapping(value = "saveFj")
	@ResponseBody
	public String saveFj(@RequestParam Map map, @RequestParam MultipartFile[] sourceFile)
			throws IllegalAccessException, InvocationTargetException {
		Zpjlxq zpjlxq = new Zpjlxq();
		BeanUtils.populate(zpjlxq, map);
		zpjlxqService.savefjxx(zpjlxq, sourceFile);
		return "SUCCESS";
	}

	/**
	 * 更新简历及附件
	 * 
	 * @param zpjlxq
	 * @param sourceFile
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "update")
	@ResponseBody
	public String update(Zpjlxq zpjlxq, @RequestParam MultipartFile[] sourceFile) throws Exception {
		zpjlxqService.save(zpjlxq, sourceFile);
		return "SUCCESS";
	}

	/**
	 * 删除简历
	 * 
	 * @param zpjlxq
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "delete")
	@ResponseBody
	public String delete(Zpjlxq zpjlxq, RedirectAttributes redirectAttributes) {
		zpjlxqService.delete(zpjlxq);
		return "SUCCESS";
	}

	/**
	 * 批量更新有效标志
	 * 
	 * @param zpjlxq
	 * @param ids
	 * @return
	 */
	@RequestMapping("updateYxbz")
	@ResponseBody
	public String updateYxbz(Zpjlxq zpjlxq, @RequestParam("ids") String ids) {
		zpjlxqService.updateYxbz(zpjlxq, ids);
		return "SUCCESS";
	}

	/**
	 * 批量更新现场确认标志
	 * 
	 * @param zpjlxq
	 * @param ids
	 * @return
	 */
	@RequestMapping("updateXcqrbz")
	@ResponseBody
	public String updateXcqrbz(Zpjlxq zpjlxq, @RequestParam("ids") String ids) {
		zpjlxqService.updateXcqrbz(zpjlxq, ids);
		return "SUCCESS";
	}

	/**
	 * 批量更新资格审查
	 * 
	 * @param zpjlxq
	 * @param ids
	 * @return
	 */
	@RequestMapping("updateZgsc")
	@ResponseBody
	public String updateZgsc(Zpjlxq zpjlxq, @RequestParam("ids") String ids) {
		zpjlxqService.updateZgsc(zpjlxq, ids);
		return "SUCCESS";
	}

	/**
	 * 简历附件查询
	 * 
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "findJlfjList")
	@ResponseBody
	public Page<Zpjlfj> findJlfjList(HttpServletRequest req, Zpjlfj zpjlfj) {
		Page<Zpjlfj> page = zpjlxqService.findJlfjList(zpjlfj);
		return page;
	}
}