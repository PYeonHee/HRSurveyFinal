package com.sanhak.hrsurvey.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sanhak.hrsurvey.daoImpl.SurveyReminderDaoImpl;
import com.sanhak.hrsurvey.domain.SurveyReminderDto;

@Controller
public class SurveyReminderController {
   
   @Autowired
   SurveyReminderDaoImpl surveyReminderDaoImpl;
   
   List<SurveyReminderDto> surveyReminderDto;
   
   @RequestMapping(value="/SurveyReminder", method=RequestMethod.POST)
   public String SurveyList(Map<String, Object> commandMap) throws Exception
   {
      return "SurveyReminder";
   }
   
   @ModelAttribute("showList")
   public List<SurveyReminderDto> SurveyRemind()
   {
      surveyReminderDto = surveyReminderDaoImpl.showList();
      return surveyReminderDto;
   }
}