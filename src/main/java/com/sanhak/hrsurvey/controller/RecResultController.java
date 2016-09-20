package com.sanhak.hrsurvey.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sanhak.hrsurvey.daoImpl.RecResultDaoImpl;
import com.sanhak.hrsurvey.domain.RecResultDto;

//Rec 설문 결과 조회
@Controller
public class RecResultController {
	private final Logger logger = LoggerFactory.getLogger(RecResultController.class);
	
	@Autowired
	RecResultDaoImpl recResultDaoImpl;
	List<RecResultDto> recResultDto;
	
	@RequestMapping(value="/ViewRecResult", method=RequestMethod.POST)
	public String RecResult(Map<String, Object> commandMap) throws Exception
	{
		return "ViewRecResult";
	}
	
	@ModelAttribute("RecResult")
	public List<RecResultDto> recResultList()
	{
		recResultDto = recResultDaoImpl.showRecResult();
		System.out.println(recResultDto.size());
		return recResultDto;
	}
}
