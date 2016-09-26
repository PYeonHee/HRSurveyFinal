package com.sanhak.hrsurvey.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sanhak.hrsurvey.daoImpl.HmQuestionDaoImpl;
import com.sanhak.hrsurvey.daoImpl.HmQuestionHistoryDaoImpl;
import com.sanhak.hrsurvey.daoImpl.NhQuestionDaoImpl;
import com.sanhak.hrsurvey.daoImpl.NhQuestionHistoryDaoImpl;
import com.sanhak.hrsurvey.daoImpl.RecQuestionDaoImpl;
import com.sanhak.hrsurvey.daoImpl.RecQuestionHistoryDaoImpl;
import com.sanhak.hrsurvey.domain.HmQEn;
import com.sanhak.hrsurvey.domain.HmQKr;
import com.sanhak.hrsurvey.domain.HmQuestionHistory;
import com.sanhak.hrsurvey.domain.NhQEn;
import com.sanhak.hrsurvey.domain.NhQKr;
import com.sanhak.hrsurvey.domain.NhQuestionHistory;
import com.sanhak.hrsurvey.domain.RecQEn;
import com.sanhak.hrsurvey.domain.RecQKr;
import com.sanhak.hrsurvey.domain.RecQuestionHistory;

@Controller
public class HomeController {

	private final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	HmQuestionDaoImpl hmQDaoImpl;
	@Autowired
	NhQuestionDaoImpl nhQDaoImpl;
	@Autowired
	RecQuestionDaoImpl recQDaoImpl;
	@Autowired
	HmQuestionHistoryDaoImpl hmQhistDaoImpl;
	@Autowired
	NhQuestionHistoryDaoImpl nhQhistDaoImpl;
	@Autowired
	RecQuestionHistoryDaoImpl recQhistDaoImpl;

	List<HmQKr> hmkrdtos;
	List<HmQEn> hmendtos;
	List<NhQKr> nhkrdtos;
	List<NhQEn> nhendtos;
	List<RecQKr> reckrdtos;
	List<RecQEn> recendtos;
	List<HmQuestionHistory> hmqhist;
	List<NhQuestionHistory> nhqhist;
	List<RecQuestionHistory> recqhist;
	
	  int Version = 0;
	/* 처占쏙옙 占쏙옙占쏙옙占쏙옙 占싸듸옙 */
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

	@RequestMapping(value = "/HmQuestion", method = {RequestMethod.GET, RequestMethod.POST})
	public String ViewhmQKr(HttpServletRequest request) {
		return "HmQuestion";
	}

	@RequestMapping(value = "/NhQuestion", method = {RequestMethod.GET, RequestMethod.POST})
	public String ViewnhQEn(HttpServletRequest request) {
		return "NhQuestion";
	}

	@RequestMapping(value = "/RecQuestion", method = {RequestMethod.GET, RequestMethod.POST})
	public String ViewrecQEn(HttpServletRequest request) {
		return "RecQuestion";
	}

	@RequestMapping(value = "/hmQAct")
	public String hmQ() {
		return "adminHmKr";
	}

	@RequestMapping(value = "/nhQAct")
	public String nhQ() {
		return "adminNhKr";
	}

	@RequestMapping(value = "/recQAct")
	public String recQ() {
		return "adminRecKr";
	}

	@RequestMapping(value = "/hmEnQAct")
	public String hmEnQ() {
		return "adminHmEn";
	}

	@RequestMapping(value = "/nhEnQAct")
	public String nhEnQ() {
		return "adminNhEn";
	}

	@RequestMapping(value = "/recEnQAct")
	public String recEnQ() {
		return "adminRecEn";
	}

	@ModelAttribute("hmqkr")
	public List<HmQKr> viewHmQKr() {
		hmkrdtos = hmQDaoImpl.showHmQKr();
		System.out.println("hmkrdtos size : " + hmkrdtos.size());
		return hmkrdtos;
	}

	@ModelAttribute("hmqen")
	public List<HmQEn> viewHmQEn() {
		hmendtos = hmQDaoImpl.showHmQEn();
		return hmendtos;
	}

	@ModelAttribute("cnthmqkr")
	public int cntHmQKr() {
		return hmQDaoImpl.cntHmQKr();
	}

	@ModelAttribute("nhqkr")
	public List<NhQKr> viewNhQKr() {
		nhkrdtos = nhQDaoImpl.showNhQKr();
		System.out.println("nhkrdtos size : " + nhkrdtos.size());
		return nhkrdtos;
	}

	@ModelAttribute("nhqen")
	public List<NhQEn> viewNhQEn() {
		nhendtos = nhQDaoImpl.showNhQEn();
		return nhendtos;
	}

	@ModelAttribute("cntnhqkr")
	public int cntNhQKr() {
		return nhQDaoImpl.cntNhQKr();
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

	@ModelAttribute("cntrecqkr")
	public int cntRecQKr() {
		return recQDaoImpl.cntRecQKr();
	}

	@RequestMapping(value = "/MHmQuestion", method = {RequestMethod.GET, RequestMethod.POST})
	public String ViewMhmQEn(HttpServletRequest request) {
		return "mHmQuestion";
	}

	@RequestMapping(value = "/MNhQuestion", method = {RequestMethod.GET, RequestMethod.POST})
	public String ViewMnhQKr(HttpServletRequest request) {
		return "mNhQuestion?serial="+request.getParameter("number");
	}

	@RequestMapping(value = "/MRecQuestion", method = {RequestMethod.GET, RequestMethod.POST})
	public String ViewMrecQKr(HttpServletRequest request) {
		return "mRecQuestion";
	}
	@RequestMapping(value = "/askMoreMod")
	public String AskMoreMod() {
		return "askMoreMod";
	}
	    @ModelAttribute("hmqhist")
	     public List<HmQuestionHistory> viewHmQHistory() {
	        hmqhist = hmQhistDaoImpl.showHmQhistory();
	        return hmqhist;
	     }
	    @ModelAttribute("nhqhist")
	     public List<NhQuestionHistory> viewNhQHistory() {
	        nhqhist = nhQhistDaoImpl.showNhQhistory();
	        return nhqhist;
	     }
	    @ModelAttribute("recqhist")
	     public List<RecQuestionHistory> viewRecQHistory() {
	        recqhist = recQhistDaoImpl.showRecQhistory();
	        return recqhist;
	     }
	    @RequestMapping(value = "/viewHistory")
	    public String viewHistoryList() {
	      return "HistoryList";
	    }
	    
	    @RequestMapping(value = "/setHistory")
	    public String setHistory() {
	      return "setHistory";
	    }
	    
	    @RequestMapping("showDetailHistory")
	   public ModelAndView hmHistoryList(HttpServletRequest request) throws Exception{
	       String idx = request.getParameter("idx");       
	       HmQuestionHistory history = new HmQuestionHistory();
	       NhQuestionHistory history2 = new NhQuestionHistory();
	       RecQuestionHistory history3 = new RecQuestionHistory();
	       history= hmQhistDaoImpl.searchHistoryByVersion(idx);
	       history2= nhQhistDaoImpl.searchHistoryByVersion(idx);
	       history3= recQhistDaoImpl.searchHistoryByVersion(idx);
	      ModelAndView mav = new ModelAndView("history");
	      mav.addObject("history", history);
	      mav.addObject("history2", history2);
	      mav.addObject("history3", history3);
	      return mav;
	   }

	    @RequestMapping(value = "/saveHistory", method = {RequestMethod.GET, RequestMethod.POST})
	    public String saveHistory(HttpServletRequest request) {
	      SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy.MM.dd", Locale.KOREA );
	      Date currentTime = new Date ( );
	      String mTime = mSimpleDateFormat.format ( currentTime );
	      int Version = 0;
	      
	      if(hmQhistDaoImpl.getMaxVersion() == null){
	         Version = 1;
	      }else{
	      Version = Integer.parseInt(hmQhistDaoImpl.getMaxVersion());
	      Version++;
	      }
	        HmQuestionHistory hmqhist = new HmQuestionHistory();
	        NhQuestionHistory nhqhist = new NhQuestionHistory();
	        RecQuestionHistory recqhist = new RecQuestionHistory();

	          hmqhist.setModDate(mTime);
	          hmqhist.setVersion(String.valueOf(Version));
	          if(request.getParameter("hmqKr1") != null){
	           hmqhist.setKR_Q_1(request.getParameter("hmqKr1"));
	            hmqhist.setEN_Q_1(request.getParameter("hmqEn1"));
	          }
	          if(request.getParameter("hmqKr2") != null){
	            hmqhist.setKR_Q_2(request.getParameter("hmqKr2"));
	             hmqhist.setEN_Q_2(request.getParameter("hmqEn2"));
	          }
	          if(request.getParameter("hmqKr3") != null){
	            hmqhist.setKR_Q_3(request.getParameter("hmqKr3"));
	             hmqhist.setEN_Q_3(request.getParameter("hmqEn3"));
	          }
	          if(request.getParameter("hmqKr4") != null){
	            hmqhist.setKR_Q_4(request.getParameter("hmqKr4"));
	             hmqhist.setEN_Q_4(request.getParameter("hmqEn4"));
	          }
	          if(request.getParameter("hmqKr5") != null){
	            hmqhist.setKR_Q_5(request.getParameter("hmqKr5"));
	             hmqhist.setEN_Q_5(request.getParameter("hmqEn5"));
	          }
	          if(request.getParameter("hmqKr6") != null){
	            hmqhist.setKR_Q_6(request.getParameter("hmqKr6"));
	             hmqhist.setEN_Q_6(request.getParameter("hmqEn6"));
	          }
	          if(request.getParameter("hmqKr7") != null){
	            hmqhist.setKR_Q_7(request.getParameter("hmqKr7"));
	             hmqhist.setEN_Q_7(request.getParameter("hmqEn7"));
	          }
	          if(request.getParameter("hmqKr8") != null){
	            hmqhist.setKR_Q_8(request.getParameter("hmqKr8"));
	             hmqhist.setEN_Q_8(request.getParameter("hmqEn8"));
	          }
	          if(request.getParameter("hmqKr9") != null){
	            hmqhist.setKR_Q_9(request.getParameter("hmqKr9"));
	             hmqhist.setEN_Q_9(request.getParameter("hmqEn9"));
	          }
	          if(request.getParameter("hmqKr10") != null){
	            hmqhist.setKR_Q_10(request.getParameter("hmqKr10"));
	             hmqhist.setEN_Q_10(request.getParameter("hmqEn10"));
	          }
	          if(request.getParameter("hmqKr11") != null){
	            hmqhist.setKR_Q_11(request.getParameter("hmqKr11"));
	             hmqhist.setEN_Q_11(request.getParameter("hmqEn11"));
	          }
	          if(request.getParameter("hmqKr12") != null){
	            hmqhist.setKR_Q_12(request.getParameter("hmqKr12"));
	             hmqhist.setEN_Q_12(request.getParameter("hmqEn12"));
	          }
	          if(request.getParameter("hmqKr13") != null){
	            hmqhist.setKR_Q_13(request.getParameter("hmqKr13"));
	             hmqhist.setEN_Q_13(request.getParameter("hmqEn13"));
	          }
	          if(request.getParameter("hmqKr14") != null){
	            hmqhist.setKR_Q_14(request.getParameter("hmqKr14"));
	             hmqhist.setEN_Q_14(request.getParameter("hmqEn14"));
	          }
	          if(request.getParameter("hmqKr15") != null){
	            hmqhist.setKR_Q_15(request.getParameter("hmqKr15"));
	             hmqhist.setEN_Q_15(request.getParameter("hmqEn15"));
	          }
	          
	         nhqhist.setModDate(mTime);
	         nhqhist.setVersion(String.valueOf(Version));
	         if(request.getParameter("nhqKr1") != null){
	          nhqhist.setKR_Q_1(request.getParameter("nhqKr1"));
	           nhqhist.setEN_Q_1(request.getParameter("nhqEn1"));
	         }
	         if(request.getParameter("nhqKr2") != null){
	           nhqhist.setKR_Q_2(request.getParameter("nhqKr2"));
	            nhqhist.setEN_Q_2(request.getParameter("nhqEn2"));
	         }
	         if(request.getParameter("nhqKr3") != null){
	           nhqhist.setKR_Q_3(request.getParameter("nhqKr3"));
	            nhqhist.setEN_Q_3(request.getParameter("nhqEn3"));
	         }
	         if(request.getParameter("nhqKr4") != null){
	           nhqhist.setKR_Q_4(request.getParameter("nhqKr4"));
	            nhqhist.setEN_Q_4(request.getParameter("nhqEn4"));
	         }
	         if(request.getParameter("nhqKr5") != null){
	           nhqhist.setKR_Q_5(request.getParameter("nhqKr5"));
	            nhqhist.setEN_Q_5(request.getParameter("nhqEn5"));
	         }
	         if(request.getParameter("nhqKr6") != null){
	           nhqhist.setKR_Q_6(request.getParameter("nhqKr6"));
	            nhqhist.setEN_Q_6(request.getParameter("nhqEn6"));
	         }
	         if(request.getParameter("nhqKr7") != null){
	           nhqhist.setKR_Q_7(request.getParameter("nhqKr7"));
	            nhqhist.setEN_Q_7(request.getParameter("nhqEn7"));
	         }
	         if(request.getParameter("nhqKr8") != null){
	           nhqhist.setKR_Q_8(request.getParameter("nhqKr8"));
	            nhqhist.setEN_Q_8(request.getParameter("nhqEn8"));
	         }
	         if(request.getParameter("nhqKr9") != null){
	           nhqhist.setKR_Q_9(request.getParameter("nhqKr9"));
	            nhqhist.setEN_Q_9(request.getParameter("nhqEn9"));
	         }
	         if(request.getParameter("nhqKr10") != null){
	           nhqhist.setKR_Q_10(request.getParameter("nhqKr10"));
	            nhqhist.setEN_Q_10(request.getParameter("nhqEn10"));
	         }
	         if(request.getParameter("nhqKr11") != null){
	           nhqhist.setKR_Q_11(request.getParameter("nhqKr11"));
	            nhqhist.setEN_Q_11(request.getParameter("nhqEn11"));
	         }
	         if(request.getParameter("nhqKr12") != null){
	           nhqhist.setKR_Q_12(request.getParameter("nhqKr12"));
	            nhqhist.setEN_Q_12(request.getParameter("nhqEn12"));
	         }
	         if(request.getParameter("nhqKr13") != null){
	           nhqhist.setKR_Q_13(request.getParameter("nhqKr13"));
	            nhqhist.setEN_Q_13(request.getParameter("nhqEn13"));
	         }
	         if(request.getParameter("nhqKr14") != null){
	           nhqhist.setKR_Q_14(request.getParameter("nhqKr14"));
	            nhqhist.setEN_Q_14(request.getParameter("nhqEn14"));
	         }
	         if(request.getParameter("nhqKr15") != null){
	           nhqhist.setKR_Q_15(request.getParameter("nhqKr15"));
	            nhqhist.setEN_Q_15(request.getParameter("nhqEn15"));
	         }
	         
	         recqhist.setModDate(mTime);
	          recqhist.setVersion(String.valueOf(Version));
	          if(request.getParameter("recqKr1") != null){
	           recqhist.setKR_Q_1(request.getParameter("recqKr1"));
	            recqhist.setEN_Q_1(request.getParameter("recqEn1"));
	          }
	          if(request.getParameter("recqKr2") != null){
	            recqhist.setKR_Q_2(request.getParameter("recqKr2"));
	             recqhist.setEN_Q_2(request.getParameter("recqEn2"));
	          }
	          if(request.getParameter("recqKr3") != null){
	            recqhist.setKR_Q_3(request.getParameter("recqKr3"));
	             recqhist.setEN_Q_3(request.getParameter("recqEn3"));
	          }
	          if(request.getParameter("recqKr4") != null){
	            recqhist.setKR_Q_4(request.getParameter("recqKr4"));
	             recqhist.setEN_Q_4(request.getParameter("recqEn4"));
	          }
	          if(request.getParameter("recqKr5") != null){
	            recqhist.setKR_Q_5(request.getParameter("recqKr5"));
	             recqhist.setEN_Q_5(request.getParameter("recqEn5"));
	          }
	          if(request.getParameter("recqKr6") != null){
	            recqhist.setKR_Q_6(request.getParameter("recqKr6"));
	             recqhist.setEN_Q_6(request.getParameter("recqEn6"));
	          }
	          if(request.getParameter("recqKr7") != null){
	            recqhist.setKR_Q_7(request.getParameter("recqKr7"));
	             recqhist.setEN_Q_7(request.getParameter("recqEn7"));
	          }
	          if(request.getParameter("recqKr8") != null){
	            recqhist.setKR_Q_8(request.getParameter("recqKr8"));
	             recqhist.setEN_Q_8(request.getParameter("recqEn8"));
	          }
	          if(request.getParameter("recqKr9") != null){
	            recqhist.setKR_Q_9(request.getParameter("recqKr9"));
	             recqhist.setEN_Q_9(request.getParameter("recqEn9"));
	          }
	          if(request.getParameter("recqKr10") != null){
	            recqhist.setKR_Q_10(request.getParameter("recqKr10"));
	             recqhist.setEN_Q_10(request.getParameter("recqEn10"));
	          }
	          if(request.getParameter("recqKr11") != null){
	            recqhist.setKR_Q_11(request.getParameter("recqKr11"));
	             recqhist.setEN_Q_11(request.getParameter("recqEn11"));
	          }
	          if(request.getParameter("recqKr12") != null){
	            recqhist.setKR_Q_12(request.getParameter("recqKr12"));
	             recqhist.setEN_Q_12(request.getParameter("recqEn12"));
	          }
	          if(request.getParameter("recqKr13") != null){
	            recqhist.setKR_Q_13(request.getParameter("recqKr13"));
	             recqhist.setEN_Q_13(request.getParameter("recqEn13"));
	          }
	          if(request.getParameter("recqKr14") != null){
	            recqhist.setKR_Q_14(request.getParameter("recqKr14"));
	             recqhist.setEN_Q_14(request.getParameter("recqEn14"));
	          }
	          if(request.getParameter("recqKr15") != null){
	            recqhist.setKR_Q_15(request.getParameter("recqKr15"));
	             recqhist.setEN_Q_15(request.getParameter("recqEn15"));
	          }
	         
	        hmQhistDaoImpl.insertHmQHist(hmqhist);
	        nhQhistDaoImpl.insertNhQHist(nhqhist);
	        recQhistDaoImpl.insertRecQHist(recqhist);
	            return "adminhome";
	        }
	/*영문 -> 한글 or 한글 -> 영문을 위함*/
	   @RequestMapping(value="/HmQEN", method=RequestMethod.POST)
	   @ResponseBody
	   public Map<String, Object> HMQEM()
	   {   
	      List<String> lista = new ArrayList<String>();
	   
	      hmendtos = hmQDaoImpl.showHmQEn();
	      System.out.println("---------------------------size  ; "+hmendtos.size());
	      for(int i=0; i<hmendtos.size(); i++)
	         lista.add(hmendtos.get(i).getHmQEn());
	       Map<String, Object> retVal = new HashMap<String, Object>();
	       
	       retVal.put("list", lista);
	       
	       return retVal;
	   }
	   @RequestMapping(value="/HmQKR", method=RequestMethod.POST)
	   @ResponseBody
	   public Map<String, Object> HMQKR()
	   {   
	      List<String> lista = new ArrayList<String>();
	   
	      hmkrdtos = hmQDaoImpl.showHmQKr();
	      
	      for(int i=0; i<hmkrdtos.size(); i++)
	         lista.add(hmkrdtos.get(i).getHmQKr());
	       Map<String, Object> retVal = new HashMap<String, Object>();
	       
	       retVal.put("list", lista);
	       
	       return retVal;
	   }
	   @RequestMapping(value="/NhQEN", method=RequestMethod.POST)
	   @ResponseBody
	   public Map<String, Object> NHQEN()
	   {   
	      List<String> lista = new ArrayList<String>();
	   
	      nhendtos = nhQDaoImpl.showNhQEn();
	      
	      for(int i=0; i<nhendtos.size(); i++)
	         lista.add(nhendtos.get(i).getNhQEn());
	       Map<String, Object> retVal = new HashMap<String, Object>();
	       
	       retVal.put("list", lista);
	       
	       return retVal;
	   }
	   @RequestMapping(value="/NhQKR", method=RequestMethod.POST)
	   @ResponseBody
	   public Map<String, Object> NHQKR()
	   {   
	      List<String> lista = new ArrayList<String>();
	   
	      nhkrdtos = nhQDaoImpl.showNhQKr();
	      
	      for(int i=0; i<nhkrdtos.size(); i++)
	         lista.add(nhkrdtos.get(i).getNhQKr());
	       Map<String, Object> retVal = new HashMap<String, Object>();
	       
	       retVal.put("list", lista);
	       
	       return retVal;
	   }
	   
	   
	   @RequestMapping(value="/RecQEN", method=RequestMethod.POST)
	   @ResponseBody
	   public Map<String, Object> RECQEN()
	   {   
	      List<String> lista = new ArrayList<String>();
	   
	      recendtos = recQDaoImpl.showRecQEn();
	      
	      for(int i=0; i<recendtos.size(); i++)
	         lista.add(recendtos.get(i).getRecQEn());
	       Map<String, Object> retVal = new HashMap<String, Object>();
	       
	       retVal.put("list", lista);
	       
	       return retVal;
	   }
	   @RequestMapping(value="/RecQKR", method=RequestMethod.POST)
	   @ResponseBody
	   public Map<String, Object> RECQKR()
	   {   
	      List<String> lista = new ArrayList<String>();
	   
	      reckrdtos = recQDaoImpl.showRecQKr();
	      
	      for(int i=0; i<reckrdtos.size(); i++)
	         lista.add(reckrdtos.get(i).getRecQKr());
	       Map<String, Object> retVal = new HashMap<String, Object>();
	       
	       retVal.put("list", lista);
	       
	       return retVal;
	   }
	   
}
