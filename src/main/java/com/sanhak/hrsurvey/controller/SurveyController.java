package com.sanhak.hrsurvey.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sanhak.hrsurvey.daoImpl.HmQuestionDaoImpl;
import com.sanhak.hrsurvey.daoImpl.HmSurveyDaoImpl;
import com.sanhak.hrsurvey.daoImpl.NhQuestionDaoImpl;
import com.sanhak.hrsurvey.daoImpl.NhSurveyDaoImpl;
import com.sanhak.hrsurvey.daoImpl.RecQuestionDaoImpl;
import com.sanhak.hrsurvey.daoImpl.RecSurveyDaoImpl;
import com.sanhak.hrsurvey.daoImpl.SurveyReminderDaoImpl;
import com.sanhak.hrsurvey.domain.HmQEn;
import com.sanhak.hrsurvey.domain.HmQKr;
import com.sanhak.hrsurvey.domain.HmResultDto;
import com.sanhak.hrsurvey.domain.NhQEn;
import com.sanhak.hrsurvey.domain.NhQKr;
import com.sanhak.hrsurvey.domain.NhResultDto;
import com.sanhak.hrsurvey.domain.RecQEn;
import com.sanhak.hrsurvey.domain.RecQKr;
import com.sanhak.hrsurvey.domain.RecResultDto;

@Controller
public class SurveyController {

	@Autowired
	HmSurveyDaoImpl hmSrvyDaoImpl;
	@Autowired
	NhSurveyDaoImpl nhSrvyDaoImpl;
	@Autowired
	RecSurveyDaoImpl recSrvyDaoImpl;
	@Autowired
	HmQuestionDaoImpl hmQDaoImpl;
	@Autowired
	NhQuestionDaoImpl nhQDaoImpl;
	@Autowired
	RecQuestionDaoImpl recQDaoImpl;
	@Autowired
	SurveyReminderDaoImpl srDaoImpl;

	/* Hm 占쏙옙占쏙옙占쏙옙占� 占쏙옙占쏙옙 */
	@RequestMapping(value = "/hmSrvyAct", method = RequestMethod.POST)
	public String insertHm(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HmResultDto hmSrvydto = new HmResultDto();
		hmSrvydto.setSerialNo(request.getParameter("serialnum"));
		for (int i = 0; i < 15; i++) {
			System.out.println(request.getParameter("radios_" + i));
		}
		if (request.getParameter("radios_1") != null) {
			hmSrvydto.setHM1(request.getParameter("radios_1"));
		}
		if (request.getParameter("radios_2") != null) {
			hmSrvydto.setHM2(request.getParameter("radios_2"));
		}
		if (request.getParameter("radios_3") != null) {
			hmSrvydto.setHM3(request.getParameter("radios_3"));
		}
		if (request.getParameter("radios_4") != null) {
			hmSrvydto.setHM4(request.getParameter("radios_4"));
		}
		if (request.getParameter("radios_5") != null) {
			hmSrvydto.setHM5(request.getParameter("radios_5"));
		}
		if (request.getParameter("radios_6") != null) {
			hmSrvydto.setHM6(request.getParameter("radios_6"));
		}
		if (request.getParameter("radios_7") != null) {
			hmSrvydto.setHM7(request.getParameter("radios_7"));
		}
		if (request.getParameter("radios_8") != null) {
			hmSrvydto.setHM8(request.getParameter("radios_8"));
		}
		if (request.getParameter("radios_9") != null) {
			hmSrvydto.setHM9(request.getParameter("radios_9"));
		}
		if (request.getParameter("radios_10") != null) {
			hmSrvydto.setHM10(request.getParameter("radios_10"));
		}
		if (request.getParameter("radios_11") != null) {
			hmSrvydto.setHM11(request.getParameter("radios_11"));
		}
		if (request.getParameter("radios_12") != null) {
			hmSrvydto.setHM12(request.getParameter("radios_12"));
		}
		if (request.getParameter("radios_13") != null) {
			hmSrvydto.setHM13(request.getParameter("radios_13"));
		}
		if (request.getParameter("radios_14") != null) {
			hmSrvydto.setHM14(request.getParameter("radios_14"));
		}
		if (request.getParameter("radios_15") != null) {
			hmSrvydto.setHM15(request.getParameter("radios_15"));
		}
		if (request.getParameter("data1") != null) {
			hmSrvydto.setHMText1(request.getParameter("data1"));
		}
		if (request.getParameter("data2") != null) {
			hmSrvydto.setHMText2(request.getParameter("data2"));
		}
		if (request.getParameter("data3") != null) {
			hmSrvydto.setHMText3(request.getParameter("data3"));
		}
		hmSrvyDaoImpl.hmSrvyInsert(hmSrvydto);
		srDaoImpl.resultCheckHM(request.getParameter("serialnum"));
		/*
		 * PrintWriter out = response.getWriter(); response.setContentType(
		 * "text/html; charset=UTF-8"); out.println(
		 * "<script>alert('Survey Done.'); </script>"); out.flush();
		 */
		return "SurveyDone";
	}

	/* Nh 占쏙옙占쏙옙占쏙옙占� 占쏙옙占쏙옙 */
	@RequestMapping(value = "/nhSrvyAct", method = RequestMethod.POST)
	public String insertNh(HttpServletRequest request, HttpServletResponse response) throws IOException {
		NhResultDto nhSrvydto = new NhResultDto();
		nhSrvydto.setSerialNo(request.getParameter("serialnum"));
		if (request.getParameter("radios_1") != null) {
			nhSrvydto.setNH1(request.getParameter("radios_1"));
		}
		if (request.getParameter("radios_2") != null) {
			nhSrvydto.setNH2(request.getParameter("radios_2"));
		}
		if (request.getParameter("radios_3") != null) {
			nhSrvydto.setNH3(request.getParameter("radios_3"));
		}
		if (request.getParameter("radios_4") != null) {
			nhSrvydto.setNH4(request.getParameter("radios_4"));
		}
		if (request.getParameter("radios_5") != null) {
			nhSrvydto.setNH5(request.getParameter("radios_5"));
		}
		if (request.getParameter("radios_6") != null) {
			nhSrvydto.setNH6(request.getParameter("radios_6"));
		}
		if (request.getParameter("radios_7") != null) {
			nhSrvydto.setNH7(request.getParameter("radios_7"));
		}
		if (request.getParameter("radios_8") != null) {
			nhSrvydto.setNH8(request.getParameter("radios_8"));
		}
		if (request.getParameter("radios_9") != null) {
			nhSrvydto.setNH9(request.getParameter("radios_9"));
		}
		if (request.getParameter("radios_10") != null) {
			nhSrvydto.setNH10(request.getParameter("radios_10"));
		}
		if (request.getParameter("radios_11") != null) {
			nhSrvydto.setNH11(request.getParameter("radios_11"));
		}
		if (request.getParameter("radios_12") != null) {
			nhSrvydto.setNH12(request.getParameter("radios_12"));
		}
		if (request.getParameter("radios_13") != null) {
			nhSrvydto.setNH13(request.getParameter("radios_13"));
		}
		if (request.getParameter("radios_14") != null) {
			nhSrvydto.setNH14(request.getParameter("radios_14"));
		}
		if (request.getParameter("radios_15") != null) {
			nhSrvydto.setNH15(request.getParameter("radios_15"));
		}
		if (request.getParameter("data1") != null) {
			nhSrvydto.setNHText1(request.getParameter("data1"));
		}
		if (request.getParameter("data2") != null) {
			nhSrvydto.setNHText2(request.getParameter("data2"));
		}
		if (request.getParameter("data3") != null) {
			nhSrvydto.setNHText3(request.getParameter("data3"));
		}

		nhSrvyDaoImpl.nhSrvyInsert(nhSrvydto);
		srDaoImpl.resultCheckNH(request.getParameter("serialnum"));
		/*
		 * PrintWriter out = response.getWriter(); response.setContentType(
		 * "text/html; charset=UTF-8"); out.println(
		 * "<script>alert('Survey Done.');</script>"); out.flush();
		 */
		return "SurveyDone";
	}

	/* Rec 占쏙옙占쏙옙占쏙옙占� 占쏙옙占쏙옙 */
	@RequestMapping(value = "/recSrvyAct", method = RequestMethod.POST)
	public String insertRec(HttpServletRequest request, HttpServletResponse response, String checks_10)
			throws IOException {
		RecResultDto recSrvydto = new RecResultDto();
		recSrvydto.setSerialNo(request.getParameter("serialnum"));
		if (request.getParameter("radios_1") != null) {
			recSrvydto.setREC1(request.getParameter("radios_1"));
		}
		if (request.getParameter("radios_2") != null) {
			recSrvydto.setREC2(request.getParameter("radios_2"));
		}
		if (request.getParameter("radios_3") != null) {
			recSrvydto.setREC3(request.getParameter("radios_3"));
		}
		if (request.getParameter("radios_4") != null) {
			recSrvydto.setREC4(request.getParameter("radios_4"));
		}
		if (request.getParameter("radios_5") != null) {
			recSrvydto.setREC5(request.getParameter("radios_5"));
		}
		if (request.getParameter("radios_6") != null) {
			recSrvydto.setREC6(request.getParameter("radios_6"));
		}
		if (request.getParameter("radios_7") != null) {
			recSrvydto.setREC7(request.getParameter("radios_7"));
		}
		if (request.getParameter("radios_8") != null) {
			recSrvydto.setREC8(request.getParameter("radios_8"));
		}
		if (request.getParameter("radios_9") != null) {
			recSrvydto.setREC9(request.getParameter("radios_9"));
		}
		recSrvydto.setREC10(checks_10);
		if (request.getParameter("radios_11") != null) {
			recSrvydto.setREC11(request.getParameter("radios_11"));
		}
		if (request.getParameter("radios_12") != null) {
			recSrvydto.setREC12(request.getParameter("radios_12"));
		}
		if (request.getParameter("radios_13") != null) {
			recSrvydto.setREC13(request.getParameter("radios_13"));
		}
		if (request.getParameter("radios_14") != null) {
			recSrvydto.setREC14(request.getParameter("radios_14"));
		}
		if (request.getParameter("radios_15") != null) {
			recSrvydto.setREC15(request.getParameter("radios_15"));
		}
		if (request.getParameter("data1") != null) {
			recSrvydto.setREC_TEXT1(request.getParameter("data1"));
		}
		if (request.getParameter("data2") != null) {
			recSrvydto.setREC_TEXT2(request.getParameter("data2"));
		}
		if (request.getParameter("data3") != null) {
			recSrvydto.setREC_TEXT3(request.getParameter("data3"));
		}
		if (request.getParameter("data4") != null) {
			recSrvydto.setREC_TEXT4(request.getParameter("data4"));
		}
		recSrvyDaoImpl.recSrvyInsert(recSrvydto);
		srDaoImpl.resultCheckREC(request.getParameter("serialnum"));
		/*
		 * PrintWriter out = response.getWriter(); response.setContentType(
		 * "text/html; charset=UTF-8"); out.println(
		 * "<script>alert('Survey Done.');</script>"); out.flush();
		 */
		return "SurveyDone";
	}

	@RequestMapping(value = "/hmQKrMod", method = RequestMethod.POST)
	public String hmQKrModify(HttpServletRequest request) {
		List<HmQKr> list = new ArrayList<HmQKr>();
		List<HmQEn> list2 = new ArrayList<HmQEn>();
		int ind = Integer.parseInt(request.getParameter("hmqkrcnt"));
		hmQDaoImpl.delHmQKr();
		hmQDaoImpl.delHmQEn();
		int cnt = 0;
		for (int i = 1; i <= ind; i++) {
			if (request.getParameter("hmqKr" + i) == null) {

			} else {
				HmQKr hmq = new HmQKr();
				HmQEn hmq2 = new HmQEn();
				hmq.setHmQNum(++cnt);
				hmq2.setHmQNum(cnt);
				hmq.setHmQKr(request.getParameter("hmqKr" + i));
				hmq2.setHmQEn(request.getParameter("hmqEn" + i));
				hmq.setHmQType(request.getParameter("hmqType" + i));
				hmq2.setHmQType(request.getParameter("hmqType" + i));
				list.add(hmq);
				list2.add(hmq2);
			}
		}
		hmQDaoImpl.insertHmQKr(list);
		hmQDaoImpl.insertHmQEn(list2);
		return "adminhome";
	}

	@RequestMapping(value = "/nhQKrMod", method = RequestMethod.POST)
	public String nhQKrModify(HttpServletRequest request) {
		List<NhQKr> list = new ArrayList<NhQKr>();
		List<NhQEn> list2 = new ArrayList<NhQEn>();
		int ind = Integer.parseInt(request.getParameter("nhqkrcnt"));
		nhQDaoImpl.delNhQKr();
		nhQDaoImpl.delNhQEn();
		int cnt = 0;
		for (int i = 1; i <= ind; i++) {
			if (request.getParameter("nhqKr" + i) == null) {

			} else {
				NhQKr nhq = new NhQKr();
				NhQEn nhq2 = new NhQEn();
				nhq.setNhQNum(++cnt);
				nhq2.setNhQNum(cnt);
				nhq.setNhQKr(request.getParameter("nhqKr" + i));
				nhq2.setNhQEn(request.getParameter("nhqEn" + i));
				nhq.setNhQType(request.getParameter("nhqType" + i));
				nhq2.setNhQType(request.getParameter("nhqType" + i));
				list.add(nhq);
				list2.add(nhq2);
			}
		}
		nhQDaoImpl.insertNhQKr(list);
		nhQDaoImpl.insertNhQEn(list2);
		return "adminhome";
	}

	@RequestMapping(value = "/recQKrMod", method = RequestMethod.POST)
	public String recQKrModify(HttpServletRequest request) {
		List<RecQKr> list = new ArrayList<RecQKr>();
		List<RecQEn> list2 = new ArrayList<RecQEn>();
		int ind = Integer.parseInt(request.getParameter("recqkrcnt"));
		recQDaoImpl.delRecQKr();
		recQDaoImpl.delRecQEn();
		int cnt = 0;
		for (int i = 1; i <= ind; i++) {
			if (request.getParameter("recqKr" + i) == null) {

			} else {
				RecQKr recq = new RecQKr();
				RecQEn recq2 = new RecQEn();
				recq.setRecQNum(++cnt);
				recq2.setRecQNum(cnt);
				recq.setRecQKr(request.getParameter("recqKr" + i));
				recq2.setRecQEn(request.getParameter("recqEn" + i));
				recq.setRecQType(request.getParameter("recqType" + i));
				recq2.setRecQType(request.getParameter("recqType" + i));
				System.out.println(request.getParameter("recqType" + i));
				list.add(recq);
				list2.add(recq2);
			}
		}
		recQDaoImpl.insertRecQKr(list);
		recQDaoImpl.insertRecQEn(list2);
		return "adminhome";
	}
}