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

import com.sanhak.hrsurvey.daoImpl.NhResultDaoImpl;
import com.sanhak.hrsurvey.domain.NhResultDto;


@Controller
public class NhResultController {
	private final Logger logger = LoggerFactory.getLogger(NhResultController.class);
	
	@Autowired
	NhResultDaoImpl nhResultDaoImpl;
	List<NhResultDto> nhResultDto;
	
	@RequestMapping(value="/ViewNhResult", method=RequestMethod.POST)
	public String NhResult(Map<String, Object> commandMap) throws Exception
	{
		return "ViewNhResult";
	}
	
	@ModelAttribute("NhResult")
	public List<NhResultDto> nhResultList()
	{
		nhResultDto = nhResultDaoImpl.showNhResult();
		System.out.println(nhResultDto.size());
		return nhResultDto;
	}
}
