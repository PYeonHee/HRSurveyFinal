package com.sanhak.hrsurvey.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;	
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sanhak.hrsurvey.daoImpl.AdminLoginDaoImpl;
import com.sanhak.hrsurvey.daoImpl.HomeReminderDaoImpl;
import com.sanhak.hrsurvey.domain.AdminLogin;
import com.sanhak.hrsurvey.domain.HomeReminderDto;

@Controller
public class AdminLoginController extends HandlerInterceptorAdapter{
   private static final Logger logger = LoggerFactory.getLogger(AdminLoginController.class);

   @Autowired
   AdminLoginDaoImpl adlogin;
   AdminLogin member;
   
   @Autowired
   HomeReminderDaoImpl homeReminderDaoImpl;
   List<HomeReminderDto> homeReminderDto;

   // return to login page
   @RequestMapping("/AdminLogin")
   public String loginForm() 
   {
      logger.info("loginForm()");
      return "AdminLogin";
   }

   // try login
   @RequestMapping("/login.do")
   public String loginProcess(HttpServletResponse response, HttpSession session, String id, String pw, Map<String, Object> commandMap) throws IOException {
      logger.info("login()");
   
      member = adlogin.getAdmin();

      PrintWriter out = response.getWriter();
      response.setContentType("text/html; charset=UTF-8");
      if ((member.getId().equals(id)) && (member.getPw().equals(pw))) 
      {   
         session.setAttribute("id", id);
         return "adminhome";
      }
      else if(id == null || id == "")
      {
         out.println("<script>alert('ID를 입력하세요.'); history.go(-1);</script>");
         out.flush();
         return "AdminLogin";
      }
      else if(pw == null || pw == "")
      {
         out.println("<script>alert('Password를 입력하세요.'); history.go(-1);</script>");
         out.flush();
         return "AdminLogin";
      }
      else if((member.getId().equals(id)) && (!member.getPw().equals(pw))) 
      {
         out.println("<script>alert('Password가 일치하지 않습니다.'); history.go(-1);</script>");
         out.flush();
         return "AdminLogin";
      }
      else if((!member.getId().equals(id)) && (member.getPw().equals(pw)))
      {
         out.println("<script>alert('ID가 일치하지 않습니다.'); history.go(-1);</script>");
         out.flush();
         return "AdminLogin";
      }
      else
         return "AdminLogin";
   }
   
   
   @RequestMapping("/Home")
   public String Home(HttpServletResponse response, HttpSession session, String id, String pw, Map<String, Object> commandMap) throws IOException {
   
      member = adlogin.getAdmin();

      PrintWriter out = response.getWriter();
      response.setContentType("text/html; charset=UTF-8");
         session.setAttribute("id", id);
         return "adminhome";
   }
   
   @RequestMapping("/logout.do")
   public String logout(HttpSession session) 
   {
      logger.info("logout()");
      session.setAttribute("id", null);
      return "AdminLogin";
   }
   
   @ModelAttribute("showHomeList")
   public List<HomeReminderDto> HomeRemind()
   {
      homeReminderDto = homeReminderDaoImpl.showHomeList();
      return homeReminderDto;
   }
}