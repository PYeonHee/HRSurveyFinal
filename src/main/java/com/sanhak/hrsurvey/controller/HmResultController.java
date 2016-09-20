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

import com.sanhak.hrsurvey.daoImpl.HmResultDaoImpl;
import com.sanhak.hrsurvey.domain.HmResultDto;

@Controller
public class HmResultController {
	private final Logger logger = LoggerFactory.getLogger(HmResultController.class);
	
	@Autowired
	HmResultDaoImpl hmResultDaoImpl;
	List<HmResultDto> hmResultDto;
	
	@RequestMapping(value="/ViewHmResult", method=RequestMethod.POST)
	public String HmResult(Map<String, Object> commandMap) throws Exception
	{
		return "ViewHmResult";
	}
	
	@ModelAttribute("HmResult")
	public List<HmResultDto> hmResultList()
	{
		hmResultDto = hmResultDaoImpl.showHmResult();
		System.out.println(hmResultDto.size());
		return hmResultDto;
	}
}
