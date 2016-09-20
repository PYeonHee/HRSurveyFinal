package com.sanhak.hrsurvey.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sanhak.hrsurvey.daoImpl.HmQuestionDaoImpl;
import com.sanhak.hrsurvey.daoImpl.NhQuestionDaoImpl;
import com.sanhak.hrsurvey.daoImpl.RecQuestionDaoImpl;
import com.sanhak.hrsurvey.domain.HmQEn;
import com.sanhak.hrsurvey.domain.HmQKr;
import com.sanhak.hrsurvey.domain.HmQuestion;
import com.sanhak.hrsurvey.domain.NhQEn;
import com.sanhak.hrsurvey.domain.NhQKr;
import com.sanhak.hrsurvey.domain.NhQuestion;
import com.sanhak.hrsurvey.domain.RecQEn;
import com.sanhak.hrsurvey.domain.RecQKr;
import com.sanhak.hrsurvey.domain.RecQuestion;
 
@Controller
public class HomeController {
     
private final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	HmQuestionDaoImpl hmQDaoImpl;
	@Autowired
	NhQuestionDaoImpl nhQDaoImpl;
	@Autowired
	RecQuestionDaoImpl recQDaoImpl;

	List<HmQKr> hmkrdtos;
	List<HmQEn> hmendtos;
	List<NhQKr> nhkrdtos;
	List<NhQEn> nhendtos;
	List<RecQKr> reckrdtos;
	List<RecQEn> recendtos;
	
	/* ó�� ������ �ε� */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String start(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
	
		return "AdminLogin";
	}
	
	@RequestMapping(value = "/adminhome", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
	
		return "adminhome";
	}
	/* �ѱ� or ���� ���� ���� ��ȸ */
	@RequestMapping(value="/HmQuestionKr", method=RequestMethod.POST)
	public String ViewhmQKr(HttpServletRequest request){
		request.setAttribute("lang","1");
		return "HmQuestion";
	}
	@RequestMapping(value="/HmQuestionEn", method=RequestMethod.POST)
	public String ViewhmQEn(HttpServletRequest request){
		request.setAttribute("lang","2");
		return "HmQuestion";
	}
	@RequestMapping(value="/NhQuestionKr", method=RequestMethod.POST)
	public String ViewnhQKr(HttpServletRequest request){
		request.setAttribute("lang","1");
		return "NhQuestion";
	}
	@RequestMapping(value="/NhQuestionEn", method=RequestMethod.POST)
	public String ViewnhQEn(HttpServletRequest request){
		request.setAttribute("lang","2");
		return "NhQuestion";
	}
	@RequestMapping(value="/RecQuestionKr", method=RequestMethod.POST)
	public String ViewrecQKr(HttpServletRequest request){
		request.setAttribute("lang","1");
		return "RecQuestion";
	}
	@RequestMapping(value="/RecQuestionEn", method=RequestMethod.POST)
	public String ViewrecQEn(HttpServletRequest request){
		request.setAttribute("lang","2");
		return "RecQuestion";
	}
	
	
	/* �ѱ� or ���� ���� ���� ���� ������ */
	@RequestMapping(value="/hmQAct", method=RequestMethod.POST)
	   public String hmQ(){
	      return "adminHmKr";
	   }
	   
	   @RequestMapping(value="/nhQAct", method=RequestMethod.POST)
	   public String nhQ(){
	      return "adminNhKr";
	   }
	   
	   @RequestMapping(value="/recQAct", method=RequestMethod.POST)
	   public String recQ(){
	      return "adminRecKr";
	   }
	   
	   @RequestMapping(value="/hmEnQAct", method=RequestMethod.POST)
	   public String hmEnQ(){
	      return "adminHmEn";
	   }
	   
	   @RequestMapping(value="/nhEnQAct", method=RequestMethod.POST)
	   public String nhEnQ(){
	      return "adminNhEn";
	   }
	   
	   @RequestMapping(value="/recEnQAct", method=RequestMethod.POST)
	   public String recEnQ(){
	      return "adminRecEn";
	   }
	
	   /* 설문 문항 DB에서 가져온 것을 화면에 보이기 위함 */
	   @ModelAttribute("hmqkr")
	   public List<HmQKr> viewHmQKr() {
	      hmkrdtos = hmQDaoImpl.showHmQKr();
	      System.out.println("hmkrdtos size : "+hmkrdtos.size());
	      return hmkrdtos;
	   }
	   @ModelAttribute("hmqen")
	   public List<HmQEn> viewHmQEn() {
	      hmendtos = hmQDaoImpl.showHmQEn();
	      return hmendtos;
	   }

	   @ModelAttribute("nhqkr")
	   public List<NhQKr> viewNhQKr() {
	      nhkrdtos = nhQDaoImpl.showNhQKr();
	      System.out.println("nhkrdtos size : "+nhkrdtos.size());
	      return nhkrdtos;
	   }
	   @ModelAttribute("nhqen")
	   public List<NhQEn> viewNhQEn() {
	      nhendtos = nhQDaoImpl.showNhQEn();
	      return nhendtos;
	   }

	   @ModelAttribute("recqkr")
	   public List<RecQKr> viewRecQKr() {
	      reckrdtos = recQDaoImpl.showRecQKr();
	      return reckrdtos;
	   }
	   @ModelAttribute("recqen")
	   public List<RecQEn> viewRecQEn() {
	      recendtos = recQDaoImpl.showRecQEn();
	      return recendtos;
	   }
}
