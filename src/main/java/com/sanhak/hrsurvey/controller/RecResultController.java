package com.sanhak.hrsurvey.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sanhak.hrsurvey.daoImpl.RecResultDaoImpl;
import com.sanhak.hrsurvey.domain.RecResultDto;
import com.sanhak.hrsurvey.domain.RecResultDateDto;


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
   @RequestMapping(value="/recpickDate", method=RequestMethod.POST)
   public ModelAndView RecDateResult(HttpServletRequest request) throws Exception
   {
      RecResultDateDto dateDto = new RecResultDateDto();
      dateDto.setfDate(request.getParameter("fdate"));
      dateDto.settDate(request.getParameter("tdate"));
      ModelAndView mav = new ModelAndView();
      List<RecResultDto> recDateResultDto = recResultDaoImpl.showRecDateResult(dateDto);
      mav.addObject("RecResult", recDateResultDto);
      mav.setViewName("ViewRecResult");
      return mav;
   }
}