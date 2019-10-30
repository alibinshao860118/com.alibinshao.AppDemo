
package com.alibinshao.zhonghong.university.zp.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.alibinshao.zhonghong.fdp.common.persistence.Page;
import com.alibinshao.zhonghong.university.zp.dao.IZpjlxqDao;
import com.alibinshao.zhonghong.university.zp.entity.Zpjlfj;
import com.alibinshao.zhonghong.university.zp.entity.Zpjlxq;

/**
 * 招聘简历信息Service
 * @author huangqi
 * @version 2017-03-15
 */
@Service
@Transactional(readOnly = true)
public class ZpjlxqService {
	
	@Autowired
	private IZpjlxqDao zpjlxqDao;
	
	@Value("${file.path.prefix}")  
	private String filePathPrefix;
	
	@Value("${file.path.tmp}")  
	private String filePathTemp;
	
	public Zpjlxq findById(String id){
		return zpjlxqDao.get(id);
	}
	
	public List findByIds(List ids){
		return zpjlxqDao.getByIds(ids);
	}
	
	/**
	 * 将简历写入Excel导出 
	 * @param os OutputStream
	 * @param vo Zpjlxq
	 * @throws IOException
	 */
	public String geneJlExcel(OutputStream os, Zpjlxq vo) throws IOException{
		List<Zpjlxq> dataList = null;
		if(!StringUtils.isEmpty(vo.getIds())){
			//按传入的ID列表查询出下载数据
			Zpjlxq vo2 = new Zpjlxq();
			//String[] arr = vo.getIds().split("&amp;");
			String[] arr = vo.getIds().split("&");
			vo2.setIds(vo.getIds());
			vo2.setIdList(new ArrayList<String>());
			for (int i = 0; i < arr.length; i++) {
				vo2.getIdList().add(arr[i]);
			}
			vo2.setSsbm(vo.getSsbm());
			vo2.setZpjhBh(vo.getZpjhBh());
			vo2.setYxbz(vo.getYxbz());
			dataList = this.zpjlxqDao.findList(vo2);
		}else{
			//按查询栏中的条件查询下载数据
			dataList = this.zpjlxqDao.findList(vo);
		}
		
		String modelFilePath = this.getClass().getResource("jl.xlsx").getPath();
		FileInputStream fis = new FileInputStream(modelFilePath);
		XSSFWorkbook wb = new XSSFWorkbook(fis);
		
		//1、写花名册
		this.writeExcel4Hmc(wb, dataList);
		
		//2、写简历清单
		//this.writeExcel4Jlqd(wb, dataList);
		
		String fileId = System.currentTimeMillis()+"";
		FileOutputStream fos = new FileOutputStream(filePathTemp + java.io.File.separator + fileId);
		
		wb.write(fos);
		
		return fileId;
	}
	
	/**
	 * 将简历写入Excel导出 
	 * @param os OutputStream
	 * @param vo Zpjlxq
	 * @throws IOException
	 */
	public String geneBmbExcel(OutputStream os, Zpjlxq vo) throws IOException{
		List<Zpjlxq> dataList = null;
		if(!StringUtils.isEmpty(vo.getIds())){
			//按传入的ID列表查询出下载数据
			Zpjlxq vo2 = new Zpjlxq();
			//String[] arr = vo.getIds().split("&amp;");
			String[] arr = vo.getIds().split("&");
			vo2.setIds(vo.getIds());
			vo2.setIdList(new ArrayList<String>());
			for (int i = 0; i < arr.length; i++) {
				vo2.getIdList().add(arr[i]);
			}
			dataList = this.zpjlxqDao.findList(vo2);
		}else{
			//按查询栏中的条件查询下载数据
			dataList = this.zpjlxqDao.findList(vo);
		}
		
		String modelFilePath = this.getClass().getResource("bmb.xlsx").getPath();
		FileInputStream fis = new FileInputStream(modelFilePath);
		XSSFWorkbook wb = new XSSFWorkbook(fis);
		
		//1、写花名册
		//this.writeExcel4Hmc(wb, dataList);
		
		//2、写报名表
		this.writeExcel4Jlqd(wb, dataList);
		
		String fileId = System.currentTimeMillis()+"";
		FileOutputStream fos = new FileOutputStream(filePathTemp + java.io.File.separator + fileId);
		
		wb.write(fos);
		
		return fileId;
	}
	
	/**
	 * 写花名册
	 */
	private void writeExcel4Hmc(XSSFWorkbook wb, List<Zpjlxq> dataList){
		Sheet sheet = wb.getSheetAt(0);
		
		int rownum = 3;
		for (Zpjlxq xq : dataList) {
			Row row = sheet.createRow(rownum++);
			int cellNum = 1;
			setCellValue(wb,row,cellNum++,String.valueOf(rownum-3),CellStyle.ALIGN_CENTER);
			setCellValue(wb,row,cellNum++,xq.getUsername(),CellStyle.ALIGN_LEFT);
			setCellValue(wb,row,cellNum++,xq.getSfzhm(),CellStyle.ALIGN_LEFT);
			setCellValue(wb,row,cellNum++,xq.getXb(),CellStyle.ALIGN_LEFT);
			setCellValue(wb,row,cellNum++,xq.getCsrq(),CellStyle.ALIGN_LEFT);
			setCellValue(wb,row,cellNum++,xq.getZzmmMc(),CellStyle.ALIGN_LEFT);
			setCellValue(wb,row,cellNum++,xq.getJg(),CellStyle.ALIGN_LEFT);
			setCellValue(wb,row,cellNum++,xq.getDyxlxx()+"、"+StringUtils.trimToEmpty(xq.getDyzy())+"、"+xq.getDyxlrxsj()+"/"+xq.getDyxlbysj(),CellStyle.ALIGN_LEFT);
			setCellValue(wb,row,cellNum++,xq.getZgxlMc(),CellStyle.ALIGN_LEFT);
			setCellValue(wb,row,cellNum++,xq.getZgxlxx()+"、"+StringUtils.trimToEmpty(xq.getSxzy())+"、"+xq.getZgxlrxsj()+"/"+xq.getZgxlbysj(),CellStyle.ALIGN_LEFT);
			setCellValue(wb,row,cellNum++,xq.getSj(),CellStyle.ALIGN_LEFT);
			setCellValue(wb,row,cellNum++,xq.getRpzhiwei(),CellStyle.ALIGN_LEFT);
			setCellValue(wb,row,cellNum++,xq.getSsbm(),CellStyle.ALIGN_LEFT);
			setCellValue(wb,row,cellNum++,xq.getZyyq(),CellStyle.ALIGN_LEFT);
			setCellValue(wb,row,cellNum++,xq.getYx(),CellStyle.ALIGN_LEFT);
			setCellValue(wb,row,cellNum++,xq.getXueke(),CellStyle.ALIGN_LEFT);
			setCellValue(wb,row,cellNum++,xq.getBeizhu(),CellStyle.ALIGN_LEFT);

		}
	}
	
	/**
	 * 写简历清单
	 */
	private void writeExcel4Jlqd(XSSFWorkbook wb, List<Zpjlxq> dataList){
		XSSFSheet sheet = (XSSFSheet)wb.getSheetAt(0);
		XSSFSheet sheet2 = wb.getSheetAt(1);
		int rowNum = 0;
		
		for (Zpjlxq xq : dataList) {
			//批量复制单元格
			for (int i = 0; i < 14; i++) {
				XSSFRow toRow = sheet.createRow(rowNum);
				XSSFRow fromRow = sheet2.getRow(i);
				copyRow(wb, fromRow, toRow);
				
				fillCellValue(i, toRow , xq);
				
				rowNum++;
			}
			
			//批量合并单元格
			int tmpRowNum = rowNum-14;
			for (int i = 0; i < sheet2.getNumMergedRegions(); i++) {
				CellRangeAddress  cra = sheet2.getMergedRegion(i);
				
				int firstRowNum = cra.getFirstRow();
				int lastRowNum = cra.getLastRow();
				int firstCellNum = cra.getFirstColumn();
				int lastCellNum = cra.getLastColumn();
				sheet.addMergedRegion(new CellRangeAddress(tmpRowNum+firstRowNum, tmpRowNum+lastRowNum, 
						firstCellNum, lastCellNum));
			}
			
			rowNum += 3;
		}
		
		//批量设置列宽
		for (int i = 1; i < 10; i++) {
			sheet.setColumnWidth(i, sheet2.getColumnWidth(i));
		}
	}
	
	/**
	 * 填充实际值
	 * @param i
	 * @param toRow
	 * @param xq
	 */
	public void fillCellValue(int i, XSSFRow toRow, Zpjlxq xq ){
		//填充内容
		if(i==1){
			XSSFCell cell = toRow.createCell(3);
			cell.setCellValue(xq.getSsbm());
			
			cell = toRow.createCell(6);
			cell.setCellValue(xq.getRpzhiwei());
			
			cell = toRow.createCell(9);
			cell.setCellValue(xq.getId());
		}else if(i==2){
			XSSFCell cell = toRow.getCell(3);
			cell.setCellValue(xq.getUsername());
			
			cell = toRow.getCell(5);
			cell.setCellValue(xq.getXb());
			
			cell = toRow.getCell(7);
			cell.setCellValue(xq.getMz());
		}else if(i==3){
			XSSFCell cell = toRow.getCell(3);
			cell.setCellValue(xq.getCsrq());
			
			cell = toRow.getCell(5);
			cell.setCellValue(xq.getZzmmMc());
			
			cell = toRow.getCell(7);
			cell.setCellValue(xq.getZgxlMc());
		}else if(i==4){
			XSSFCell cell = toRow.getCell(3);
			cell.setCellValue(xq.getZgxlxx());
			
			cell = toRow.getCell(7);
			cell.setCellValue(xq.getSxzy());
		}else if(i==5){
			XSSFCell cell = toRow.getCell(4);
			cell.setCellValue(xq.getZyzg());
			
			cell = toRow.getCell(7);
			cell.setCellValue(xq.getZyzgsj());
		}else if(i==6){
			XSSFCell cell = toRow.getCell(3);
			cell.setCellValue(xq.getHjdz());
			
			cell = toRow.getCell(5);
			cell.setCellValue(xq.getHyzk());
			
			cell = toRow.getCell(7);
			cell.setCellValue(xq.getRsdadw());
		}else if(i==7){
			XSSFCell cell = toRow.getCell(3);
			cell.setCellValue(xq.getSfzhm());
			
			cell = toRow.getCell(7);
			cell.setCellValue(xq.getTc());
		}else if(i==8){
			XSSFCell cell = toRow.getCell(3);
			cell.setCellValue(xq.getTxdz());
			
			cell = toRow.getCell(8);
			cell.setCellValue(xq.getYoubian());
		}else if(i==9){
			XSSFCell cell = toRow.getCell(3);
			cell.setCellValue(xq.getSj());
			
			cell = toRow.getCell(7);
			cell.setCellValue(xq.getYx());
		}else if(i==10){
			XSSFCell cell = toRow.getCell(3);
			cell.setCellValue(xq.getJianli());
		}else if(i==10){
			XSSFCell cell = toRow.getCell(3);
			cell.setCellValue(xq.getChengji());
		}
		
	}
	
	/** 
     * 行复制功能 
     * @param fromRow 
     * @param toRow 
     */  
    private void copyRow(XSSFWorkbook wb,XSSFRow fromRow,XSSFRow toRow){  
    	toRow.setHeight(fromRow.getHeight());
        for (Iterator cellIt = fromRow.cellIterator(); cellIt.hasNext();) {  
        	XSSFCell tmpCell = (XSSFCell) cellIt.next();  
        	XSSFCell newCell = toRow.createCell(tmpCell.getColumnIndex());  
            copyCell(wb,tmpCell, newCell);  
        }  
    }  
    
    /** 
     * 复制单元格 
     * @param srcCell 
     * @param distCell 
     */  
    private void copyCell(XSSFWorkbook wb,XSSFCell srcCell, XSSFCell distCell) {  
        XSSFCellStyle newstyle = wb.createCellStyle();  
        copyCellStyle(srcCell.getCellStyle(), newstyle);  
        //样式  
        distCell.setCellStyle(newstyle);  
        //评论  
        if (srcCell.getCellComment() != null) {  
            distCell.setCellComment(srcCell.getCellComment());  
        }  
        // 不同数据类型处理  
        int srcCellType = srcCell.getCellType();  
        distCell.setCellType(srcCellType);  
        distCell.setCellValue(srcCell.getStringCellValue());
    }  
    
    /** 
     * 复制一个单元格样式到目的单元格样式 
     * @param fromStyle 
     * @param toStyle 
     */  
    private void copyCellStyle(XSSFCellStyle fromStyle,  XSSFCellStyle toStyle) {  
        toStyle.setAlignment(fromStyle.getAlignment());  
        //边框和边框颜色  
        toStyle.setBorderBottom(fromStyle.getBorderBottom());  
        toStyle.setBorderLeft(fromStyle.getBorderLeft());  
        toStyle.setBorderRight(fromStyle.getBorderRight());  
        toStyle.setBorderTop(fromStyle.getBorderTop());  
        toStyle.setTopBorderColor(fromStyle.getTopBorderColor());  
        toStyle.setBottomBorderColor(fromStyle.getBottomBorderColor());  
        toStyle.setRightBorderColor(fromStyle.getRightBorderColor());  
        toStyle.setLeftBorderColor(fromStyle.getLeftBorderColor());  
          
        //背景和前景  
        toStyle.setFillBackgroundColor(fromStyle.getFillBackgroundColor());  
        toStyle.setFillForegroundColor(fromStyle.getFillForegroundColor());  
          
        toStyle.setDataFormat(fromStyle.getDataFormat());  
        toStyle.setFillPattern(fromStyle.getFillPattern());  
//      toStyle.setFont(fromStyle.getFont(null));  
        toStyle.setHidden(fromStyle.getHidden());  
        toStyle.setIndention(fromStyle.getIndention());//首行缩进  
        toStyle.setLocked(fromStyle.getLocked());  
        toStyle.setRotation(fromStyle.getRotation());//旋转  
        toStyle.setVerticalAlignment(fromStyle.getVerticalAlignment());  
        toStyle.setWrapText(fromStyle.getWrapText());  
        
        toStyle.setFont(fromStyle.getFont());
    }  
	
	private void setCellValue(Workbook wb,Row row, int cellNum, String cellValue,short align){
		CellStyle style = wb.createCellStyle();
		style.setAlignment(align);
		style.setBorderRight(CellStyle.BORDER_THIN);
		style.setBorderLeft(CellStyle.BORDER_THIN);
		style.setBorderTop(CellStyle.BORDER_THIN);
		style.setBorderBottom(CellStyle.BORDER_THIN);
		
		Font font = wb.createFont();
		font.setFontHeightInPoints((short) 10);
		style.setFont(font);
		
		Cell cell = row.createCell(cellNum);
		style.setAlignment(align);
		cell.setCellStyle(style);
		cell.setCellValue(cellValue);
	}
	
	
	/**
	 * 简历流程信息查询
	 * @param vo
	 * @return
	 */
	public Page<Zpjlxq> findPage(Zpjlxq vo){
		Page<Zpjlxq> page = new Page<Zpjlxq>();
		
		PageHelper.startPage(vo.getPage().intValue(), vo.getRows().intValue());
		List<Zpjlxq> list = zpjlxqDao.findList(vo);
		page.setRows(list);
		
		PageInfo<Zpjlxq> pageInfo = new PageInfo<Zpjlxq>(list);
        page.setTotal(pageInfo.getTotal());
		
		return page;
	}
	
	public List<Zpjlxq> findList(Zpjlxq zpjianli) {
		return zpjlxqDao.findList(zpjianli);
	}
	
	public List<Zpjlxq> findDistinctList(Zpjlxq zpjianli) {
		return zpjlxqDao.findDistinctList(zpjianli);
	}
	
	@Transactional(readOnly = false)
	public void save(Zpjlxq zpjianli,MultipartFile[] sourceFile) throws Exception {
		Date csrq = new SimpleDateFormat("yyyy-MM-dd").parse(zpjianli.getCsrq());
		int nl = this.getAge(csrq);
		zpjianli.setNl(nl+"");
		
		//根据身份证号码判断简历是否已经存在
		Zpjlxq vo = new Zpjlxq();
		vo.setZpjhid(zpjianli.getZpjhid());
		vo.setSfzhm(zpjianli.getSfzhm());
		List<Zpjlxq> list = zpjlxqDao.findList(vo);
		if(list.isEmpty()){
			zpjianli.setCreateDate(new Date());
			//如果没有重复提交，直接插入
			zpjlxqDao.insert(zpjianli);
		}else{
			zpjianli.setUpdateDate(new Date());
			//如果已有数据存在，则修改
			zpjianli.setId(list.get(0).getId());
			zpjianli.setRdsj(StringUtils.trimToNull(zpjianli.getRdsj()));
			zpjianli.setZyzgsj(StringUtils.trimToNull(zpjianli.getZyzgsj()));
			zpjlxqDao.update(zpjianli);
		}
		
		savefjxx(zpjianli,sourceFile);
	}
	
	@Transactional(readOnly = false)
	public void savefjxx(Zpjlxq zpjianli,MultipartFile[] sourceFile) {
		
		//根据招聘简历ID创建子目录，用于存放此简历对应的附件
		String fileId = zpjianli.getId();
		String path = filePathPrefix + fileId; //TODO:按项目需要替换目录
        File file = new File(path);
        if(!file.exists()) {
        	//file.createNewFile();
        	file.mkdir(); // 如果目录不存在创建目录
        }
		
		for (int i = 0; i < sourceFile.length; i++) {
			
			InputStream stream = null;
			try {
	            MultipartFile multipartFile = sourceFile[i];
	            String fileName = multipartFile.getOriginalFilename();
	            if(StringUtils.isEmpty(fileName)){
	            	continue;
	            }
	            
	            //1、上传文件到服务器磁盘
				stream = multipartFile.getInputStream();
				
		        FileOutputStream fs=new FileOutputStream( path + File.separator + fileName );
		        byte[] buffer =new byte[1024*1024];
		        int bytesum = 0;
		        int byteread = 0; 
		        while ((byteread = stream.read(buffer))!=-1){
		           bytesum+=byteread;
		           fs.write(buffer,0,byteread);
		           fs.flush();
		        } 
		        fs.close();
		        
		        
		        //2、往附表中插入数据
		        Zpjlfj zpjlfj = new Zpjlfj();
		        zpjlfj.setZpjlid(zpjianli.getId());
		        zpjlfj.setFjmc(fileName);
		        zpjlfj.setFjlj(path);
		        zpjlxqDao.insertFj(zpjlfj);
			}catch (IOException e) {
				throw new RuntimeException(e);
			}finally{
				try {
					if(stream!=null)
						stream.close();
				} catch (IOException e) {
					throw new RuntimeException(e);
				}     
			}
	    }
	}
	
	@Transactional(readOnly = false)
	public void delete(Zpjlxq zpjianli) {
		zpjlxqDao.delete(zpjianli);
	}
	
	@Transactional(readOnly = false)
	public void updateYxbz(Zpjlxq zpjianli,String ids) {
		for (String id : ids.split("&amp;")) {
			zpjianli.setId(id);
			zpjlxqDao.updateYxbz(zpjianli);
		}
	}
	
	@Transactional(readOnly = false)
	public void updateXcqrbz(Zpjlxq zpjianli,String ids) {
		for (String id : ids.split("&")) {
			zpjianli.setId(id);
			zpjlxqDao.updateXcqrbz(zpjianli);
		}
	}
	
	@Transactional(readOnly = false)
	public void updateZgsc(Zpjlxq zpjianli,String ids) {
		for (String id : ids.split("&")) {
			zpjianli.setId(id);
			zpjlxqDao.updateZgsc(zpjianli);
		}
	}
	
	/**
	 * 简历附件信息查询
	 * @param vo
	 * @return
	 */
	public Page<Zpjlfj> findJlfjList(Zpjlfj vo){
		Page<Zpjlfj> page = new Page<Zpjlfj>();
		
		PageHelper.startPage(vo.getPage().intValue(), vo.getRows().intValue());
		List<Zpjlfj> list = zpjlxqDao.findJlfjList(vo);
		page.setRows(list);
		
		PageInfo<Zpjlfj> pageInfo = new PageInfo<Zpjlfj>(list);
        page.setTotal(pageInfo.getTotal());
		
		return page;
	}
	
	public int getAge(Date birthDay) throws Exception { 
        //获取当前系统时间
        Calendar cal = Calendar.getInstance(); 
        //如果出生日期大于当前时间，则抛出异常
        if (cal.before(birthDay)) { 
            throw new IllegalArgumentException( 
                "The birthDay is before Now.It's unbelievable!"); 
        } 
        //取出系统当前时间的年、月、日部分
        int yearNow = cal.get(Calendar.YEAR); 
        int monthNow = cal.get(Calendar.MONTH); 
        int dayOfMonthNow = cal.get(Calendar.DAY_OF_MONTH); 
         
        //将日期设置为出生日期
        cal.setTime(birthDay); 
        //取出出生日期的年、月、日部分  
        int yearBirth = cal.get(Calendar.YEAR); 
        int monthBirth = cal.get(Calendar.MONTH); 
        int dayOfMonthBirth = cal.get(Calendar.DAY_OF_MONTH); 
        //当前年份与出生年份相减，初步计算年龄
        int age = yearNow - yearBirth; 
        //当前月份与出生日期的月份相比，如果月份小于出生月份，则年龄上减1，表示不满多少周岁
        if (monthNow <= monthBirth) { 
            //如果月份相等，在比较日期，如果当前日，小于出生日，也减1，表示不满多少周岁
            if (monthNow == monthBirth) { 
                if (dayOfMonthNow < dayOfMonthBirth) age--; 
            }else{ 
                age--; 
            } 
        } 
        return age; 
    }
	
}