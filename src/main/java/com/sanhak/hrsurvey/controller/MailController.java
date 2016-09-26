package com.sanhak.hrsurvey.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sanhak.hrsurvey.daoImpl.SendMailDaoImpl;
import com.sanhak.hrsurvey.daoImpl.SurveyReminderDaoImpl;
import com.sanhak.hrsurvey.domain.SurveyReminderDto;

@Controller
public class MailController {

	@Autowired
	SurveyReminderDaoImpl surveyReminderDaoImpl;
	@Autowired
	SendMailDaoImpl sendMailDaoImpl;
   // mailForm
   @RequestMapping(value = "/mailForm")
   public String mailForm() {
      return "/mailForm";
   }
   @RequestMapping(value = "/AddTextMail")
   public String addTextMail() {
      return "/AddTextMail";
   }
   // mailSending 
   /*@RequestMapping(value = "/mailSending")
   public String mailSending(HttpServletRequest request) {

      Properties properties = new Properties();
      properties.put("mail.transport.protocol", "smtp");
      properties.put("mail.smtp.host", "smtp.sendgrid.net");
      properties.put("mail.smtp.port", 587);
      properties.put("mail.smtp.auth", "true");

      EAuthenticator auth = new EAuthenticator();
      Session mailSession = Session.getDefaultInstance(properties, auth);

      String setfrom = "jiaekim@kr.ibm.com";
      String tomail = request.getParameter("tomail"); 
      String title = request.getParameter("title");
      String content = request.getParameter("content");

      try {

         MimeMessage message = new MimeMessage(mailSession);

         message.setFrom(setfrom); 
         message.addRecipient(RecipientType.TO, new InternetAddress(tomail));
         message.setSubject(title,"UTF-8"); 
         message.setText(content,"UTF-8");
         
         Transport transport = mailSession.getTransport();
         transport.connect();
         transport.sendMessage(message, message.getAllRecipients());
         transport.close();

      } catch (Exception e) {
         System.out.println(e);
      }
      return "/mailForm";
   }*/
   @RequestMapping(value = "/mailSending", method=RequestMethod.POST)
   public String mailSending(String serialNo, String type, String content) {
      SurveyReminderDto surveyReminderDto = new SurveyReminderDto();
      surveyReminderDto.setSerialNo(serialNo);
      SurveyReminderDto list = null;
      System.out.println(serialNo);
      System.out.println(type);
      System.out.println(content);
      if(content == null)
         content = "";

      if(type.equals("NH"))
      {
         list = surveyReminderDaoImpl.getInfo_NH(serialNo);
         sendMailDaoImpl.sendMail_NH(list, content);
      }
      else if(type.equals("HM"))
      {
         list = surveyReminderDaoImpl.getInfo_HM(serialNo);
         sendMailDaoImpl.sendMail_HM(list, content);
      }
      else if(type.equals("REC"))
      {
         surveyReminderDaoImpl.getInfo_REC(serialNo);
         sendMailDaoImpl.sendMail_REC(list, content);
      }
      else
         return "ViewErrorPage";
      
     /* for(SurveyReminderDto inVo : sdIdVoList){
         try{
            sendMailService.sendMail(inVo.getSdId());
         }catch(Exception e){
            
            System.out.println(arg0);(e.getMessage());
         }
      }*/
      return "SurveyReminder";

   }
}