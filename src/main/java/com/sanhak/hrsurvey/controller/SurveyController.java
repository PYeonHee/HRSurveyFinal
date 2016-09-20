package com.sanhak.hrsurvey.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sanhak.hrsurvey.daoImpl.HmQuestionDaoImpl;
import com.sanhak.hrsurvey.daoImpl.HmSurveyDaoImpl;
import com.sanhak.hrsurvey.daoImpl.NhQuestionDaoImpl;
import com.sanhak.hrsurvey.daoImpl.NhSurveyDaoImpl;
import com.sanhak.hrsurvey.daoImpl.RecQuestionDaoImpl;
import com.sanhak.hrsurvey.daoImpl.RecSurveyDaoImpl;
import com.sanhak.hrsurvey.domain.HmResultDto;
import com.sanhak.hrsurvey.domain.NhResultDto;
import com.sanhak.hrsurvey.domain.RecResultDto;

@Controller
public class SurveyController {

	@Autowired
	HmSurveyDaoImpl hmSrvyDaoImpl;
	@Autowired
	NhSurveyDaoImpl nhSrvyDaoImpl;
	@Autowired
	RecSurveyDaoImpl recSrvyDaoImpl;

	
	/* Hm ������� ���� */
	@RequestMapping(value = "/hmSrvyAct", method = RequestMethod.POST)
	public String insertHm(HttpServletRequest request, HttpServletResponse response, String radios_1, String radios_2, String radios_3,
			String radios_4, String radios_5, String radios_6, String radios_7, String radios_8, String radios_9,
			String radios_10, String data) throws IOException {
		HmResultDto hmSrvydto = new HmResultDto();
		hmSrvydto.setHM1(radios_1);
		hmSrvydto.setHM2(radios_2);
		hmSrvydto.setHM3(radios_3);
		hmSrvydto.setHM4(radios_4);
		hmSrvydto.setHM5(radios_5);
		hmSrvydto.setHM6(radios_6);
		hmSrvydto.setHM7(radios_7);
		hmSrvydto.setHM8(radios_8);
		hmSrvydto.setHM9(radios_9);
		hmSrvydto.setHM10(radios_10);
		
		hmSrvyDaoImpl.hmSrvyInsert(hmSrvydto);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		out.println("<script>alert('Survey Done.'); </script>");
		out.flush();
		return "AdminLogin";
	}

	/* Nh ������� ���� */
	@RequestMapping(value = "/nhSrvyAct", method = RequestMethod.POST)
	public String insertNh(HttpServletRequest request, HttpServletResponse response,String radios_1, String radios_2, String radios_3,
			String radios_4, String radios_5, String radios_6, String radios_7, String radios_8, String radios_9,
			String radios_10, String data1, String data2) throws IOException {
		NhResultDto nhSrvydto = new NhResultDto();
		nhSrvydto.setNH1(radios_1);
		nhSrvydto.setNH2(radios_2);
		nhSrvydto.setNH3(radios_3);
		nhSrvydto.setNH4(radios_4);
		nhSrvydto.setNH5(radios_5);
		nhSrvydto.setNH6(radios_6);
		nhSrvydto.setNH7(radios_7);
		nhSrvydto.setNH8(radios_8);
		nhSrvydto.setNH9(radios_9);
		nhSrvydto.setNH10(radios_10);
		nhSrvydto.setNHText1(data1);
		nhSrvydto.setNHText2(data2);

		nhSrvyDaoImpl.nhSrvyInsert(nhSrvydto);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		out.println("<script>alert('Survey Done.');</script>");
		out.flush();
		return "AdminLogin";
	}

	/* Rec ������� ���� */
	@RequestMapping(value = "/recSrvyAct", method = RequestMethod.POST)
	public String insertRec(HttpServletRequest request, HttpServletResponse response,String radios_1, String radios_2, String radios_3,
			String radios_4, String radios_5, String radios_6, String radios_7, String radios_8, String radios_9,
			String checks_10, String data1, String data2, String data3, String data4) throws IOException {
		System.out.println("reec controller:"+radios_1+ radios_2+ radios_3+radios_4+ radios_5+radios_6+radios_7+radios_8+radios_9+checks_10+data1+data2+data3+data4);
		RecResultDto recSrvydto = new RecResultDto();
		recSrvydto.setREC1(radios_1);
		recSrvydto.setREC2(radios_2);
		recSrvydto.setREC3(radios_3);
		recSrvydto.setREC4(radios_4);
		recSrvydto.setREC5(radios_5);
		recSrvydto.setREC6(radios_6);
		recSrvydto.setREC7(radios_7);
		recSrvydto.setREC8(radios_8);
		recSrvydto.setREC9(radios_9);
		recSrvydto.setREC10(checks_10);
		recSrvydto.setREC_TEXT1(data1);
		recSrvydto.setREC_TEXT2(data2);
		recSrvydto.setREC_TEXT3(data3);
		recSrvydto.setREC_TEXT4(data4);
		
		recSrvyDaoImpl.recSrvyInsert(recSrvydto);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		out.println("<script>alert('Survey Done.');</script>");
		out.flush();
		return "AdminLogin";
	}

}