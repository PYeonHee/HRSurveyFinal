package com.sanhak.hrsurvey.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sanhak.hrsurvey.daoImpl.AdminLoginDaoImpl;
import com.sanhak.hrsurvey.domain.AdminLogin;

@Controller
public class AdminLoginController extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(AdminLoginController.class);

	@Autowired
	AdminLoginDaoImpl adlogin;
	AdminLogin member;

	// return to login page
	@RequestMapping("/AdminLogin")
	public String loginForm() 
	{
		logger.info("loginForm()");
		return "AdminLogin";
	}

	// try login
	@RequestMapping("/login.do")
	public String loginProcess(HttpServletResponse response, HttpSession session, String id, String pw) throws IOException {
		logger.info("login()");
	
		member = adlogin.getAdmin();

		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		if ((member.getId().equals(id)) && (member.getPw().equals(pw))) 
		{	//입력한 id, pw가 DB의 id, pw와 같다면 로그인 성공
			session.setAttribute("id", id);
			return "redirect:/adminhome";
		}
		else if(id == null || id == "")
		{//id를 입력하지 않은 경우
			out.println("<script>alert('ID를 입력하세요.'); history.go(-1);</script>");
			out.flush();
			return "AdminLogin";
		}
		else if(pw == null || pw == "")
		{//pw를 입력하지 않은 경우
			out.println("<script>alert('Password를 입력하세요.'); history.go(-1);</script>");
			out.flush();
			return "AdminLogin";
		}
		else if((member.getId().equals(id)) && (!member.getPw().equals(pw))) 
		{//pw가 일치하지 않는 경우
			out.println("<script>alert('Password가 틀립니다.'); history.go(-1);</script>");
			out.flush();
			return "AdminLogin";
		}
		else if((!member.getId().equals(id)) && (member.getPw().equals(pw)))
		{//id가 일치하지 않는 경우 
			out.println("<script>alert('ID가 틀립니다.'); history.go(-1);</script>");
			out.flush();
			return "AdminLogin";
		}
		else
			return "AdminLogin";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) 
	{
		logger.info("logout()");
		session.setAttribute("id", null);
		return "AdminLogin";
	}
}
