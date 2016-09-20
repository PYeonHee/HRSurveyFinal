package com.sanhak.hrsurvey.downloader;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.sanhak.hrsurvey.daoImpl.UploadResDaoImpl;
import com.sanhak.hrsurvey.domain.UploadResDto;

@Component("ExcelDownloadView")
public class ExcelDownloadView extends AbstractExcelView {
	@Autowired
	UploadResDaoImpl excelInfo;
 /*
    private void setExcelContent(WritableSheet ws, List<UploadResDto> list)
            throws RowsExceededException, WriteException {
        for (int i = 1; i < list.size()+1; i++) {
            ws.addCell((new Label(0, i, list.get(i-1).getArticle_num()+"")));
            ws.addCell((new Label(1, i, list.get(i-1).getId()+"")));
            ws.addCell((new Label(2, i, list.get(i-1).getTitle()+"")));
            ws.addCell((new Label(3, i, list.get(i-1).getContent()+"")));
            ws.addCell((new Label(4, i, list.get(i-1).getHit()+"")));
            ws.addCell((new Label(5, i, list.get(i-1).getGroup_id()+"")));
            ws.addCell((new Label(6, i, list.get(i-1).getPos()+"")));
            ws.addCell((new Label(7, i, list.get(i-1).getDepth()+"")));
            ws.addCell((new Label(8, i, list.get(i-1).getWrite_date()+"")));
        }
    }
    */

	@Override
	protected void buildExcelDocument(Map<String, Object> map, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        HSSFSheet sheet = workbook.createSheet();
        HSSFRow header = sheet.createRow(0);
        header.createCell(0).setCellValue("Serial No.");
        header.createCell(1).setCellValue("BR No.");
        header.createCell(2).setCellValue("Hire Type");
        header.createCell(3).setCellValue("ERBP");
        header.createCell(4).setCellValue("OnBoarding date");
        header.createCell(5).setCellValue("Hiring Manager 성명");
        header.createCell(6).setCellValue("Hiring manger Band");
        header.createCell(7).setCellValue("Hiring manger id");
        header.createCell(8).setCellValue("New Hire 성명");
        header.createCell(9).setCellValue("New Hire Band");
        header.createCell(10).setCellValue("New Hire id");
        header.createCell(11).setCellValue("Recruiter 성명");
        header.createCell(12).setCellValue("Recruiter Band");
        header.createCell(13).setCellValue("Recruiter id");
        header.createCell(14).setCellValue("HM-1");
        header.createCell(15).setCellValue("HM-2");
        header.createCell(16).setCellValue("HM-3");
        header.createCell(17).setCellValue("HM-4");
        header.createCell(18).setCellValue("HM-5");
        header.createCell(19).setCellValue("HM-6");
        header.createCell(20).setCellValue("HM-7");
        header.createCell(21).setCellValue("HM-8");
        header.createCell(22).setCellValue("HM-9");
        header.createCell(23).setCellValue("HM-10");
        header.createCell(24).setCellValue("NH-1");
        header.createCell(25).setCellValue("NH-2");
        header.createCell(26).setCellValue("NH-3");
        header.createCell(27).setCellValue("NH-4");
        header.createCell(28).setCellValue("NH-5");
        header.createCell(29).setCellValue("NH-6");
        header.createCell(30).setCellValue("NH-7");
        header.createCell(31).setCellValue("NH-8");
        header.createCell(32).setCellValue("NH-9");
        header.createCell(33).setCellValue("NH-10");

        
        List<UploadResDto> list = excelInfo.showUploadRes();
//        System.out.println(list.isEmpty());
        HSSFRow row = sheet.createRow(1);
        row.createCell(0).setCellValue(list.get(0).getSerialNo());
        row.createCell(1).setCellValue(list.get(0).getBRNo());
        row.createCell(2).setCellValue(list.get(0).getHireType());
        row.createCell(3).setCellValue(list.get(0).getERBP());
        row.createCell(4).setCellValue(list.get(0).getNewHireDate().toString());
        row.createCell(5).setCellValue(list.get(0).getHireManagerName());
        row.createCell(6).setCellValue(list.get(0).getHireManagerBand());
        row.createCell(7).setCellValue(list.get(0).getHMID());
        row.createCell(8).setCellValue(list.get(0).getNewHireName());
        row.createCell(9).setCellValue(list.get(0).getNewHireBand());
        row.createCell(10).setCellValue(list.get(0).getNewHireID());
        row.createCell(11).setCellValue(list.get(0).getRecruiterName());
        row.createCell(12).setCellValue(list.get(0).getRecruiterBand());
        row.createCell(13).setCellValue(list.get(0).getRecruiterID());
	}
}
