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

import com.sanhak.hrsurvey.daoImpl.UploadResDaoImpl;
import com.sanhak.hrsurvey.domain.UploadResDto;


@Controller
public class UploadResController {
   
   private final Logger logger = LoggerFactory.getLogger(UploadResController.class);
   
   @Autowired
   UploadResDaoImpl uploadResDaoImpl;
   List<UploadResDto> uploadResDto;
   
   @RequestMapping(value="/ViewUploadRes", method=RequestMethod.POST)
   public String FileUploadRes(Map<String, Object> commandMap) throws Exception
   {
      return "ViewUploadRes";
   }
   
   @ModelAttribute("uploadRes")
   public List<UploadResDto> uploadResList(){
      uploadResDto = uploadResDaoImpl.showUploadRes();
      System.out.println(uploadResDto.size());
      return uploadResDto;
   }
}