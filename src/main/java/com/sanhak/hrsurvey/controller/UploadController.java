package com.sanhak.hrsurvey.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.sanhak.hrsurvey.daoImpl.UploadDaoImpl;
import com.sanhak.hrsurvey.domain.Excel;
import com.sanhak.hrsurvey.domain.SurveyReminderDto;

@Controller
@RequestMapping("/fileUpload")
public class UploadController implements HandlerExceptionResolver {

	@Autowired
	private UploadDaoImpl iUploadService;

	private static List<Excel> list = new ArrayList<Excel>();
	private static List<SurveyReminderDto> list2 = new ArrayList<SurveyReminderDto>();

	@RequestMapping(method = RequestMethod.GET)
	public String showForm(Excel excel, ModelMap model) {
		model.addAttribute("excel", excel);
		return "FileUploadForm";
	}

	@SuppressWarnings("resource")
	@RequestMapping(method = RequestMethod.POST)
	public String processForm(@ModelAttribute("excel") Excel excelFile, MultipartRequest request, BindingResult result) throws Exception {
		if (!result.hasErrors()) {
			CommonsMultipartFile upfile = (CommonsMultipartFile) request.getFile("file");
			excelFile.setFile(upfile);
			String filePath = System.getProperty("java.io.tmpdir") + upfile.getOriginalFilename();
			if (!upfile.isEmpty()) {
				FileOutputStream outputStream = null;

				// save
				outputStream = new FileOutputStream(new File(filePath));
				outputStream.write(excelFile.getFile().getFileItem().get());

				// load
				FileInputStream file = new FileInputStream(new File(filePath));

				XSSFWorkbook workbook = new XSSFWorkbook(file);
				XSSFSheet sheet = workbook.getSheetAt(0);

				Iterator<Row> rowIterator = sheet.iterator();

				HashMap<String, String> map = new HashMap<String, String>();

				while (rowIterator.hasNext()) {
					Row row = rowIterator.next();
					System.out.println(row.getRowNum());
					if (row.getRowNum() == 0) {
						System.out.println("====Excel to DB Insert====");
					} else {

						if (map.containsKey(row.getCell(0).getStringCellValue())) {

						} else {
							list.add(new Excel(row.getCell(0).getStringCellValue(), row.getCell(1).getStringCellValue(),
									row.getCell(2).getStringCellValue(), row.getCell(3).getStringCellValue	(),
									row.getCell(4).getStringCellValue(), row.getCell(5).getStringCellValue(),
									row.getCell(6).getStringCellValue(), row.getCell(7).getStringCellValue(),
									row.getCell(8).getStringCellValue(), row.getCell(9).getStringCellValue(),
									row.getCell(10).getStringCellValue(), row.getCell(11).getStringCellValue(),
									row.getCell(12).getStringCellValue(), row.getCell(13).getStringCellValue()));
							list2.add(new SurveyReminderDto(row.getCell(4).getStringCellValue(),row.getCell(0).getStringCellValue(),row.getCell(5).getStringCellValue(),row.getCell(8).getStringCellValue(),row.getCell(11).getStringCellValue(),row.getCell(7).getStringCellValue(),row.getCell(10).getStringCellValue(),row.getCell(13).getStringCellValue()));
						}
						map.put(row.getCell(1).getStringCellValue(), row.getCell(0).getStringCellValue());

					}
				}
				file.close();

				iUploadService.addExcel(list);
				iUploadService.addReminder(list2);
				
				list.clear();

				return "adminhome";
			}
		}
		return "FileUploadForm";
	}
	
	@Override
	public ModelAndView resolveException(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2,
			Exception exception) {
		Map<Object, Object> model = new HashMap<Object, Object>();
		if (exception instanceof FileNotFoundException) {
			model.put("errors", "FileNotFoundException");
		} 
		else {
			model.put("errors", "Unexpected error: " + exception.getMessage());
		}
		model.put("excel", new Excel());
		return new ModelAndView("/FileUploadForm", (Map) model);
	}
}