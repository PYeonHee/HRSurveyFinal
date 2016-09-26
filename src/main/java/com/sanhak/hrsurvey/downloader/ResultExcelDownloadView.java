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

import com.sanhak.hrsurvey.daoImpl.HmResultDaoImpl;
import com.sanhak.hrsurvey.daoImpl.NhResultDaoImpl;
import com.sanhak.hrsurvey.daoImpl.RecResultDaoImpl;
import com.sanhak.hrsurvey.daoImpl.UploadResDaoImpl;
import com.sanhak.hrsurvey.domain.HmResultDto;
import com.sanhak.hrsurvey.domain.NhResultDto;
import com.sanhak.hrsurvey.domain.RecResultDto;
import com.sanhak.hrsurvey.domain.UploadResDto;

@Component("ResultExcelDownloadView")
public class ResultExcelDownloadView extends AbstractExcelView {
	@Autowired
	UploadResDaoImpl excelInfo;
	@Autowired
	HmResultDaoImpl hmdao;
	@Autowired
	NhResultDaoImpl nhdao;
	@Autowired
	RecResultDaoImpl recdao;

	@Override
	protected void buildExcelDocument(Map<String, Object> map, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// Excel Set
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		HSSFSheet sheet = workbook.createSheet();
		HSSFRow header = sheet.createRow(0);
		header.createCell(0).setCellValue("Serial No.");
		header.createCell(1).setCellValue("BR No.");
		header.createCell(2).setCellValue("Hire Type");
		header.createCell(3).setCellValue("ERBP");
		header.createCell(4).setCellValue("OnBoarding date");
		header.createCell(5).setCellValue("Hiring Manager Name");
		header.createCell(6).setCellValue("Hiring manger Band");
		header.createCell(7).setCellValue("Hiring manger id");
		header.createCell(8).setCellValue("New Hire Name");
		header.createCell(9).setCellValue("New Hire Band");
		header.createCell(10).setCellValue("New Hire id");
		header.createCell(11).setCellValue("Recruiter Name");
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
		/*
		 * header.createCell(24).setCellValue("HM-11");
		 * header.createCell(25).setCellValue("HM-12");
		 * header.createCell(26).setCellValue("HM-13");
		 * header.createCell(27).setCellValue("HM-14");
		 * header.createCell(28).setCellValue("HM-15");
		 */

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
		/*
		 * header.createCell(34).setCellValue("NH-11");
		 * header.createCell(35).setCellValue("NH-12");
		 * header.createCell(36).setCellValue("NH-13");
		 * header.createCell(37).setCellValue("NH-14");
		 * header.createCell(38).setCellValue("NH-15");
		 */

		header.createCell(42).setCellValue("RECT-1");
		header.createCell(43).setCellValue("RECT-2");
		header.createCell(44).setCellValue("RECT-3");
		header.createCell(45).setCellValue("RECT-4");
		header.createCell(46).setCellValue("RECT-5");
		header.createCell(47).setCellValue("RECT-6");
		header.createCell(48).setCellValue("RECT-7");
		header.createCell(49).setCellValue("RECT-8");
		header.createCell(50).setCellValue("RECT-9");
		header.createCell(51).setCellValue("RECT-10");
		header.createCell(52).setCellValue("RECT-11");
		header.createCell(53).setCellValue("RECT-12");
		/*
		 * header.createCell(54).setCellValue("RECT-13");
		 * header.createCell(55).setCellValue("RECT-14");
		 * header.createCell(56).setCellValue("RECT-15");
		 */

		/*
		 * header.createCell(29).setCellValue("HM TEXT 1");
		 * header.createCell(30).setCellValue("HM TEXT 2");
		 * header.createCell(31).setCellValue("HM TEXT 3");
		 */
		header.createCell(39).setCellValue("NH TEXT 1");
		header.createCell(40).setCellValue("NH TEXT 2");
		// header.createCell(41).setCellValue("NH TEXT 3");
		header.createCell(57).setCellValue("RECT TEXT 1");
		header.createCell(58).setCellValue("RECT TEXT 2");
		header.createCell(59).setCellValue("RECT TEXT 3");

		List<UploadResDto> list = excelInfo.showUploadRes();
		List<HmResultDto> resultlist_HM = hmdao.showHmResult();
		List<NhResultDto> resultlist_NH = nhdao.showNhResult();
		List<RecResultDto> resultlist_REC = recdao.showRecResult();
		for (int i = 0; i < Math.max(resultlist_HM.size(),
				Math.max(resultlist_NH.size(), resultlist_REC.size())); i++) {
			HSSFRow row = sheet.createRow(i + 1);
			row.createCell(0).setCellValue(list.get(i).getSerialNo());
			row.createCell(1).setCellValue(list.get(i).getBRNo());
			row.createCell(2).setCellValue(list.get(i).getHireType());
			row.createCell(3).setCellValue(list.get(i).getERBP());
			row.createCell(4).setCellValue(list.get(i).getNewHireDate().toString());
			row.createCell(5).setCellValue(list.get(i).getHireManagerName());
			row.createCell(6).setCellValue(list.get(i).getHireManagerBand());
			row.createCell(7).setCellValue(list.get(i).getHMID());
			row.createCell(8).setCellValue(list.get(i).getNewHireName());
			row.createCell(9).setCellValue(list.get(i).getNewHireBand());
			row.createCell(10).setCellValue(list.get(i).getNewHireID());
			row.createCell(11).setCellValue(list.get(i).getRecruiterName());
			row.createCell(12).setCellValue(list.get(i).getRecruiterBand());
			row.createCell(13).setCellValue(list.get(i).getRecruiterID());
			if (resultlist_HM.size() < i + 1) {
			} else {
				row.createCell(14).setCellValue(resultlist_HM.get(i).getHM1());
				row.createCell(15).setCellValue(resultlist_HM.get(i).getHM2());
				row.createCell(16).setCellValue(resultlist_HM.get(i).getHM3());
				row.createCell(17).setCellValue(resultlist_HM.get(i).getHM4());
				row.createCell(18).setCellValue(resultlist_HM.get(i).getHM5());
				row.createCell(19).setCellValue(resultlist_HM.get(i).getHM6());
				row.createCell(20).setCellValue(resultlist_HM.get(i).getHM7());
				row.createCell(21).setCellValue(resultlist_HM.get(i).getHM8());
				row.createCell(22).setCellValue(resultlist_HM.get(i).getHM9());
				row.createCell(23).setCellValue(resultlist_HM.get(i).getHM10());
			}
			if (resultlist_NH.size() < i + 1) {
			} else {
				row.createCell(24).setCellValue(resultlist_NH.get(i).getNH1());
				row.createCell(25).setCellValue(resultlist_NH.get(i).getNH2());
				row.createCell(26).setCellValue(resultlist_NH.get(i).getNH3());
				row.createCell(27).setCellValue(resultlist_NH.get(i).getNH4());
				row.createCell(28).setCellValue(resultlist_NH.get(i).getNH5());
				row.createCell(29).setCellValue(resultlist_NH.get(i).getNH6());
				row.createCell(30).setCellValue(resultlist_NH.get(i).getNH7());
				row.createCell(31).setCellValue(resultlist_NH.get(i).getNH8());
				row.createCell(32).setCellValue(resultlist_NH.get(i).getNH9());
				row.createCell(33).setCellValue(resultlist_NH.get(i).getNH10());
			}
			if (resultlist_REC.size() < i + 1) {
			} else {
				row.createCell(34).setCellValue(resultlist_REC.get(i).getREC1());
				row.createCell(35).setCellValue(resultlist_REC.get(i).getREC2());
				row.createCell(36).setCellValue(resultlist_REC.get(i).getREC3());
				row.createCell(37).setCellValue(resultlist_REC.get(i).getREC4());
				row.createCell(38).setCellValue(resultlist_REC.get(i).getREC5());
				row.createCell(39).setCellValue(resultlist_REC.get(i).getREC6());
				row.createCell(40).setCellValue(resultlist_REC.get(i).getREC7());
				row.createCell(41).setCellValue(resultlist_REC.get(i).getREC8());
				row.createCell(42).setCellValue(resultlist_REC.get(i).getREC9());
				row.createCell(43).setCellValue(resultlist_REC.get(i).getREC10());
				row.createCell(44).setCellValue(resultlist_REC.get(i).getREC11());
				row.createCell(45).setCellValue(resultlist_REC.get(i).getREC12());

			}
			if (resultlist_NH.size() < i + 1) {
			} else {
				if (resultlist_NH.get(i).getNHText1() != null) {
					row.createCell(46).setCellValue(resultlist_NH.get(i).getNHText1());
				}
				if (resultlist_NH.get(i).getNHText2() != null) {
					row.createCell(47).setCellValue(resultlist_NH.get(i).getNHText2());
				}
			}
			if (resultlist_REC.size() < i + 1) {
			} else {
				if (resultlist_REC.get(i).getREC_TEXT1() != null) {
					row.createCell(48).setCellValue(resultlist_REC.get(i).getREC_TEXT1());
				}
				if (resultlist_REC.get(i).getREC_TEXT2() != null) {
					row.createCell(49).setCellValue(resultlist_REC.get(i).getREC_TEXT2());
				}
			}
		}

	}
}