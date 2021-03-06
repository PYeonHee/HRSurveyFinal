package com.sanhak.hrsurvey.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sanhak.hrsurvey.daoImpl.UploadResDaoImpl;
import com.sanhak.hrsurvey.domain.UploadResDto;

@Controller
public class DownloadController {
	   @RequestMapping(value = "/DownResultExcel", method = RequestMethod.POST)
	   public String resultDownLoading() {
	      return "ResultExcelDownloadView";
	   }
	   
	   @RequestMapping(value = "/DownFormExcel", method = RequestMethod.POST)
	   public String ListFormDownLoading() {
	      return "ListFormatExcelDownloadView";
	   }

}
