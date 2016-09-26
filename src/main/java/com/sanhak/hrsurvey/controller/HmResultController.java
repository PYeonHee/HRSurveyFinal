package com.sanhak.hrsurvey.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sanhak.hrsurvey.daoImpl.HmResultDaoImpl;
import com.sanhak.hrsurvey.domain.HmResultDto;
import com.sanhak.hrsurvey.domain.RecResultDto;
import com.sanhak.hrsurvey.domain.HmResultDateDto;


@Controller
public class HmResultController {
   private final Logger logger = LoggerFactory.getLogger(HmResultController.class);
   
   @Autowired
   HmResultDaoImpl hmResultDaoImpl;
   
   
   @RequestMapping(value="/ViewHmResult", method=RequestMethod.POST)
   public ModelAndView HmResult(Map<String, Object> commandMap) throws Exception
   {
      ModelAndView mav = new ModelAndView();
      List<HmResultDto> hmResultDto = hmResultDaoImpl.showHmResult();
      mav.addObject("HmResult", hmResultDto);
      mav.setViewName("ViewHmResult");
      return mav;
   }
   @RequestMapping(value="/hmpickDate", method=RequestMethod.POST)
   public ModelAndView HmDateResult(HttpServletRequest request) throws Exception
   {
      HmResultDateDto dateDto = new HmResultDateDto();
      dateDto.setfDate(request.getParameter("fdate"));
      dateDto.settDate(request.getParameter("tdate"));
      ModelAndView mav = new ModelAndView();
      List<HmResultDto> hmDateResultDto = hmResultDaoImpl.showHmDateResult(dateDto);
      mav.addObject("HmResult", hmDateResultDto);
      mav.setViewName("ViewHmResult");
      return mav;
   }
   
}