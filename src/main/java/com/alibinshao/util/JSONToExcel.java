package com.alibinshao.util;

import com.alibaba.fastjson.JSONObject;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.io.*;
import java.util.Set;

public class JSONToExcel {
    public static void main(String[] args) throws IOException {
        Set<String> keys = null;
        // 创建HSSFWorkbook对象
        HSSFWorkbook wb = new HSSFWorkbook();
        // 创建HSSFSheet对象
        HSSFSheet sheet = wb.createSheet("sheet0");

        FileReader reader = new FileReader("D:\\eclipse\\sts-4.4.0.RELEASE\\workspace2\\JSONToExcel.txt");
        BufferedReader br = new BufferedReader(reader);
        String str = null;
        int rowNo = 0;//行
        int lineNo = 0;//列
        while ((str = br.readLine()) != null) {
            JSONObject jsonObject = JSONObject.parseObject(str);
            // 创建HSSFRow对象
            HSSFRow row = sheet.createRow(rowNo++);
            // 创建HSSFCell对象
            if (keys == null) {
                //标题
                keys = jsonObject.keySet();
                for (String s : keys) {
                    HSSFCell cell = row.createCell(lineNo++);
                    cell.setCellValue(s);
                    System.out.println(lineNo);
                }
                lineNo = 0;
                row = sheet.createRow(rowNo++);
            }

            for (String s : keys) {
                HSSFCell cell = row.createCell(lineNo++);
                cell.setCellValue(jsonObject.getString(s));
            }
            lineNo = 0;
           

        }

        br.close();
        reader.close();

        // 输出Excel文件
        FileOutputStream output = new FileOutputStream("D:\\eclipse\\sts-4.4.0.RELEASE\\workspace2\\JSONToExcel_target.xls");
        wb.write(output);
        
        output.flush();
        output.close();
    }
}


