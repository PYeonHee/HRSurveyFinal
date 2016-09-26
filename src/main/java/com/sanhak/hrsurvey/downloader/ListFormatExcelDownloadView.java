package com.sanhak.hrsurvey.downloader;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractExcelView;

@Component("ListFormatExcelDownloadView")
public class ListFormatExcelDownloadView extends AbstractExcelView{

   @Override
   protected void buildExcelDocument(Map<String, Object> map, HSSFWorkbook workbook, HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      //Excel Set
         DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
           HSSFSheet sheet = workbook.createSheet();
           HSSFRow header = sheet.createRow(0);
           header.createCell(0).setCellValue("Serial No.");
           header.createCell(1).setCellValue("BR No.");
           header.createCell(2).setCellValue("Hire Type");
           header.createCell(3).setCellValue("ERBP");
           header.createCell(4).setCellValue("New Hire-date");
           header.createCell(5).setCellValue("Hiring Manager Name");
           header.createCell(6).setCellValue("Hiring manger Band");
           header.createCell(7).setCellValue("Hiring manger id");
           header.createCell(8).setCellValue("New hire Name");
           header.createCell(9).setCellValue("New hire Band");
           header.createCell(10).setCellValue("New hire ID");
           header.createCell(11).setCellValue("Recruiter Name");
           header.createCell(12).setCellValue("Recruiter Band");
           header.createCell(13).setCellValue("Recruiter ID");
      
   }

}