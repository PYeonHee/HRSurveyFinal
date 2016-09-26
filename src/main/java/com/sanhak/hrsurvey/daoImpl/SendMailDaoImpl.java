package com.sanhak.hrsurvey.daoImpl;

import java.util.Properties;

import javax.mail.Message.RecipientType;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Repository;

import com.sanhak.hrsurvey.config.EAuthenticator;
import com.sanhak.hrsurvey.dao.SendMailDao;
import com.sanhak.hrsurvey.domain.SurveyReminderDto;

@Repository("SendMailDao")
public class SendMailDaoImpl implements SendMailDao{
   @Autowired
   private SurveyReminderDaoImpl surveyReminderDaoImpl;
   
   private SurveyReminderDto surveyReminderDto;
   
   
   @Override
   public void sendMail_NH(SurveyReminderDto list, String addText) {
      
      Properties properties = new Properties();
       properties.put("mail.transport.protocol", "smtp");
       properties.put("mail.smtp.host", "smtp.sendgrid.net");
       properties.put("mail.smtp.port", 587);
       properties.put("mail.smtp.auth", "true");

       EAuthenticator auth = new EAuthenticator();
       Session mailSession = Session.getDefaultInstance(properties, auth);
       
      String setfrom = "jiaekim@kr.ibm.com";
      String tomail = list.getNewHireID();
      String title =  "[IBM KOREA] 신입사원("+list.getNewHireName() + "님에 대한 SURVEY 안내 (For New Hire)";
      
      
      String text_kr = "\n안녕하십니까? 한국IBM 채용팀입니다.\n\n"
                  + list.getNewHireDate()+"에 입사하신" 
                  +list.getNewHireName() +"님의 채용 진행 관련 만족도를 조사하고자 합니다.\n"
                  + "본 조사는 New Hire의 입장에서 채용 과정 및 회사 관련 전반적인 만족도를 파악하여,\n"
                  + "향후 채용 진행시 보다 개선된 채용 과정을 고안하기 위한 목적으로 개발되었습니다.\n\n"
                  + "전체 문항은 10개로 구성되어 있으며, 응답시간은 약 3분 이내 소요됩니다.\n"
                  + "모든 답변은 상기 목적 이외에 활용되지 않으며, 외부로 노출되지 않으므로 솔직한 의견을 부탁드립니다.\n"
                  + "만족도 조사에 참가해 주셔서 진심으로 감사 드립니다. 문의사항은 담당 리크루터에게 주시기 바랍니다.\n\n"
                  + "아래 Link를 통해 접속하여 주시기 부탁드립니다.\n" + "URL";
      
      String text_en = "Dear New Hire,\n\n"
                  + "You who onboarded " +list.getNewHireDate()
                  + " are invited to take part in the Hiring Satisfaction Survey.\n"
                  + "This Survey that apprehend the overall hiring satisfaction toward process and new hire on behalf of you is designed\n"
                  + "to offer the improved hiring experience to you in the future.\n\n"
                  + "The questionnaire is composed of 10 questions and it may take about 3 minutes to answer.\n"
                  + "All answers will asked for honest feedback from you, are not utilized other than the object, and also not exposed to the outside either.\n"
                  + "If you have questions about this survey, please inform your recruiter(ooo).Thank you for your cooperation.\n\n"
                  + "Please connect the link below.\n"+ "URL";
      String content = "\n\n"+addText + "\n\n\n"+ text_kr + "\n\n\n\n\n"+text_en+"\n\n";
      
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
            surveyReminderDaoImpl.insertMailNH(list.getSerialNo());
            //surveyReminderDto.setMailingDate((new SimpleDateFormat("yyyyMMdd").format(new java.util.Date()).toString()));
         } catch (Exception e) {
            System.out.println(e);
         }
   }
   @Override
   public void sendMail_HM(SurveyReminderDto list, String addText) {
      Properties properties = new Properties();
       properties.put("mail.transport.protocol", "smtp");
       properties.put("mail.smtp.host", "smtp.sendgrid.net");
       properties.put("mail.smtp.port", 587);
       properties.put("mail.smtp.auth", "true");

       EAuthenticator auth = new EAuthenticator();
       Session mailSession = Session.getDefaultInstance(properties, auth);
       
      String setfrom = "jiaekim@kr.ibm.com";
      String tomail = list.getHiringManagerID();
      String title =  "[IBM KOREA] 신입사원("+list.getNewHireName() + "님에 대한 SURVEY 안내 (For Hiring Manager)";
      
      String text_kr = "\n안녕하십니까? 한국IBM 채용팀입니다.\n\n"
                  + list.getNewHireDate()+"에 입사한 "+list.getNewHireName()+ " 님의 채용 진행 관련 만족도를 조사하고자 합니다.\n"
                  + "본 조사는 Hiring Manager의 입장에서 채용 과정 및 신규입사자 입사 이후 전반적인 만족도를 파악하여,\n"
                  + "향후 개선된 채용 경험을 제공하고자 하는 목적으로 개발되었습니다.\n\n"
                  + "전체 문항은 10개로 구성되어 있으며, 응답시간은 약 3분 이내 소요됩니다.\n" 
                  + "모든 답변은 상기 목적 이외에 활용되지 않으며, 외부로 노출되지 않으므로 솔직한 의견을 부탁드립니다.\n"
                  + "만족도 조사에 참가해 주셔서 진심으로 감사 드립니다. 문의사항은 담당 리크루터에게 주시기 바랍니다.\n\n"
                  + "아래 Link를 통해 접속하여 주시기 부탁드립니다. (Link)\n";
      
      String text_en = "Dear New Hire,\n\n"
                  +"Dear Hiring Manager,\n"
                  + "You are invited to take part in the Hiring Satisfaction Survey regarding the new hire "
                  + list.getNewHireName()+" who onboarded on "+list.getNewHireDate()+".\n"
                  + "This Survey that apprehend the overall hiring satisfaction toward process and new hire on behalf of hiring manager is designed\n"
                  + "to offer the improved hiring experience to you in the future.\n\n"
                  + "The questionnaire is composed of 10 questions and it may take about 3 minutes to answer.\n"
                  + "All answers will asked for honest feedback from you, are not utilized other than the object, and also not exposed to the outside either.\n"
                  + "If you have questions about this survey, please inform your recruiter(ooo). Thank you for your cooperation.\n\n"
                  + "Please connect the link below.";
         String content = "\n\n"+addText + "\n\n\n"+ text_kr + "\n\n\n\n\n"+text_en+"\n\n";
      
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
            surveyReminderDaoImpl.insertMailHM(list.getSerialNo());
            //surveyReminderDto.setMailingDate((new SimpleDateFormat("yyyyMMdd").format(new java.util.Date()).toString()));
         } catch (Exception e) {
            System.out.println(e);
         }
      
   }
   @Override
   public void sendMail_REC(SurveyReminderDto list, String addText) {
      Properties properties = new Properties();
       properties.put("mail.transport.protocol", "smtp");
       properties.put("mail.smtp.host", "smtp.sendgrid.net");
       properties.put("mail.smtp.port", 587);
       properties.put("mail.smtp.auth", "true");

       EAuthenticator auth = new EAuthenticator();
       Session mailSession = Session.getDefaultInstance(properties, auth);
       
      String setfrom = "jiaekim@kr.ibm.com";
      String tomail = list.getRecruiterID();
      String title =  "[IBM KOREA] 신입사원("+list.getNewHireName() + ")님에 대한 SURVEY 안내 (For Recruiter)";
      
      String text_kr = list.getNewHireDate() + "에 입사한 "+list.getNewHireName() + "님의 채용 진행 관련 만족도를 조사하고자 합니다.\n"
                  + "본 조사는 Recruiter의 입장에서 채용 과정 진행간 전반적인 만족도를 파악하고 Hiring Manager/신규입사자에 관한 응답을 통해\n"
                  + "향후 개선된 채용 경험을 제공하고자 하는 목적으로 개발되었습니다.\n\n"
                  +"전체 문항은 10개로 구성되어 있으며, 응답시간은 약 3분 이내 소요됩니다.\n"
                  +"모든 답변은 상기 목적 이외에 활용되지 않으며, 외부로 노출되지 않으므로 솔직한 의견을 부탁드립니다.\n"
                  +"만족도 조사에 참가해 주셔서 진심으로 감사 드립니다.\n\n"
                  +"아래 Link를 통해 접속하여 주시기 부탁드립니다.(Link)\n\n";
      
      String text_en = "Dear Recruiter,\n\n"
            +"You are invited to take part in the Hiring Satisfaction Survey regarding the new hire "
            +list.getNewHireName() + " who onboarded on "+list.getNewHireDate()+"\n"
            +"This Survey that apprehend the overall hiring satisfaction toward hiring process on behalf of recruiter is designed\n"
            +"to offer the improved hiring experience to hiring managers and new hires in the future.\n\n"
            +"The questionnaire is composed of 10 questions and it may take about 3 minutes to answer.\n"
            +"All answers will be asked for honest feedback from you, are not utilized other than the object, and also not exposed to the outside either.\n"
            +"Thank you for your cooperation.\n\n"
            +"Please connect the link below. (Link)\n";
      String content = "\n\n"+addText +    "\n\n\n"+ text_kr + "\n\n\n\n\n"+text_en+"\n\n";
      
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
            surveyReminderDaoImpl.insertMailREC(list.getSerialNo());
            //surveyReminderDto.setMailingDate((new SimpleDateFormat("yyyyMMdd").format(new java.util.Date()).toString()));
         } catch (Exception e) {
            System.out.println(e);
         }
      
   }
   

}