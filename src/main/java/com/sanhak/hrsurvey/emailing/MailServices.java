package com.sanhak.hrsurvey.emailing;

import java.util.List;
import java.util.Properties;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.sanhak.hrsurvey.config.EAuthenticator;
import com.sanhak.hrsurvey.daoImpl.SurveyReminderDaoImpl;
import com.sanhak.hrsurvey.domain.SurveyReminderDto;

@Component
public class MailServices {

	@Autowired
	SurveyReminderDaoImpl surveyReminderDaoImpl;
	List<SurveyReminderDto> srdtos;

	@Scheduled(cron = "0 40 11 * * *")
	public void MailScheduler() throws MessagingException {
		Properties properties = new Properties();
		properties.put("mail.transport.protocol", "smtp");
		properties.put("mail.smtp.host", "smtp.sendgrid.net");
		properties.put("mail.smtp.port", 587);
		properties.put("mail.smtp.auth", "true");

		EAuthenticator auth = new EAuthenticator();
		Session mailSession = Session.getDefaultInstance(properties, auth);
		Transport transport = mailSession.getTransport();
		transport.connect();
		srdtos = surveyReminderDaoImpl.listForMail();

		int cntId = srdtos.size();

		try {
			for (int i = 0; i < cntId; i++) {
				String setfrom = "jiaekim@kr.ibm.com";
				String titleNH = "[IBM KOREA] 신입사원(" + srdtos.get(i).getNewHireName() + "님에 대한 SURVEY 안내 (For New Hire)";
				String contentNH = "안녕하십니까? 한국IBM 채용팀입니다.<br>" + srdtos.get(i).getNewHireDate() + "에 입사하신 "
						+ srdtos.get(i).getNewHireName() + "님의 채용 진행 관련 만족도를 조사하고자 합니다.<br>"
						+ "본 조사는 New Hire의 입장에서 채용 과정 및 회사 관련 전반적인 만족도를 파악하여, <br>"
						+ "향후 채용 진행시 보다 개선된 채용 과정을 고안하기 위한 목적으로 개발되었습니다.<br>"
						+ "전체 문항은 10개로 구성되어 있으며, 응답시간은 약 3분 이내 소요됩니다.<br>"
						+ "모든 답변은 상기 목적 이외에 활용되지 않으며, 외부로 노출되지 않으므로 솔직한 의견을 부탁드립니다.<br>"
						+ "만족도 조사에 참가해 주셔서 진심으로 감사 드립니다. 문의사항은 담당 리크루터(" + srdtos.get(i).getRecruiterName()
						+ ")에게 주시기 바랍니다.<br>" + "아래 Link를 통해 접속하여 주시기 부탁드립니다.<br>"
						+ "<a href='http://10.2.4.14:9090/HRSurveyFinal/NhQuestion?lang=1&serial="
						+ srdtos.get(i).getSerialNo() + "'><br>설문조사이동</a><br><br><br>" + "Dear New Hire,<br>"
						+ "You who onboarded " + srdtos.get(i).getNewHireDate()
						+ " are invited to take part in the Hiring Satisfaction Survey.<br>"
						+ "This Survey that apprehend the overall hiring satisfaction toward process and new hire on behalf of you is designed<br>"
						+ "to offer the improved hiring experience to you in the future.<br>"
						+ "The questionnaire is composed of 10 questions and it may take about 3 minutes to answer.<br>"
						+ "All answers will asked for honest feedback from you, are not utilized other than the object, and also not exposed to the outside either.<br>"
						+ "If you have questions about this survey, please inform your recruiter("
						+ srdtos.get(i).getRecruiterName() + ").Thank you for your cooperation.<br>"
						+ "Please connect the link below.<br>"
						+ "<a href='http://10.2.4.14:9090/HRSurveyFinal/NhQuestion?lang=2&serial="
						+ srdtos.get(i).getSerialNo() + "'><br>GoSurvey</a>";
				String settoNH = srdtos.get(i).getNewHireID();
				MimeMessage messageNH = new MimeMessage(mailSession);
				messageNH.setFrom(setfrom);
				messageNH.addRecipient(RecipientType.TO, new InternetAddress(settoNH));
				messageNH.setSubject(titleNH,"UTF-8");
				messageNH.setText(contentNH, "UTF-8","html");
				String titleHM = "[IBM KOREA] 신입사원(" + srdtos.get(i).getNewHireName() + "님에 대한 SURVEY 안내 (For Hiring Manager)";
				String contentHM = "안녕하십니까? 한국IBM 채용팀입니다.<br>" + srdtos.get(i).getNewHireDate() + "에 입사하신 "
						+ srdtos.get(i).getNewHireName() + "님의 채용 진행 관련 만족도를 조사하고자 합니다.<br>"
						+ "본 조사는 Hiring Manager의 입장에서 채용 과정 및 신규입사자 입사 이후 전반적인 만족도를 파악하여, <br>"
						+ "향후 개선된 채용 경험을 제공하고자 하는 목적으로 개발되었습니다.<br>"
						+ "전체 문항은 10개로 구성되어 있으며, 응답시간은 약 3분 이내 소요됩니다.<br>"
						+ "모든 답변은 상기 목적 이외에 활용되지 않으며, 외부로 노출되지 않으므로 솔직한 의견을 부탁드립니다.<br>"
						+ "만족도 조사에 참가해 주셔서 진심으로 감사 드립니다. 문의사항은 담당 리크루터(" + srdtos.get(i).getRecruiterName()
						+ ")에게 주시기 바랍니다.<br>" + "아래 Link를 통해 접속하여 주시기 부탁드립니다.<br>"
						+ "<a href='http://10.2.4.14:9090/HRSurveyFinal/HmQuestion?lang=1&serial="
						+ srdtos.get(i).getSerialNo() + "'><br>설문조사이동</a><br><br><br>" + "Dear Hiring Manager,<br>"
						+ "You are invited to take part in the Hiring Satisfaction Survey regarding the new hire (" 
						+ srdtos.get(i).getNewHireName()
						+ ") who onboarded on "
						+ srdtos.get(i).getNewHireDate()
						+ ".<br>This Survey that apprehend the overall hiring satisfaction toward process and new hire on behalf of hiring manager is designed<br>"
						+ "to offer the improved hiring experience to you in the future.<br>"
						+ "The questionnaire is composed of 10 questions and it may take about 3 minutes to answer.<br>"
						+ "All answers will asked for honest feedback from you, are not utilized other than the object, and also not exposed to the outside either.<br>"
						+ "If you have questions about this survey, please inform your recruiter("
						+ srdtos.get(i).getRecruiterName() + ").Thank you for your cooperation.<br>"
						+ "Please connect the link below.<br>"
						+ "<a href='http://10.2.4.14:9090/HRSurveyFinal/HmQuestion?lang=2&serial="
						+ srdtos.get(i).getSerialNo() + "'><br>GoSurvey</a>";
				String settoHM = srdtos.get(i).getHiringManagerID();
				MimeMessage messageHM = new MimeMessage(mailSession);
				messageHM.setFrom(setfrom);
				messageHM.addRecipient(RecipientType.TO, new InternetAddress(settoHM));
				messageHM.setSubject(titleHM,"UTF-8");
				messageHM.setText(contentHM, "UTF-8","html");
				String titleREC = "[IBM KOREA] 신입사원(" + srdtos.get(i).getNewHireName() + "님에 대한 SURVEY 안내 (For Recruiter)";
				String contentREC = srdtos.get(i).getNewHireDate() + "에 입사한 "
						+ srdtos.get(i).getNewHireName() + "님의 채용 진행 관련 만족도를 조사하고자 합니다.<br>"
						+ "본 조사는 Recruiter의 입장에서 채용 과정 진행간 전반적인 만족도를 파악하고 Hiring Manager/신규입사자에 관한 응답을 통해 <br>"
						+ "향후 개선된 채용 경험을 제공하고자 하는 목적으로 개발되었습니다.<br>"
						+ "전체 문항은 10개로 구성되어 있으며, 응답시간은 약 3분 이내 소요됩니다.<br>"
						+ "모든 답변은 상기 목적 이외에 활용되지 않으며, 외부로 노출되지 않으므로 솔직한 의견을 부탁드립니다.<br>"
						+ "만족도 조사에 참가해 주셔서 진심으로 감사 드립니다.<br>" + "아래 Link를 통해 접속하여 주시기 부탁드립니다.<br>"
						+ "<a href='http://10.2.4.14:9090/HRSurveyFinal/RecQuestion?lang=1&serial="
						+ srdtos.get(i).getSerialNo() + "'><br>설문조사이동</a><br><br><br>" + "Dear Recruiter,<br>"
						+ "You are invited to take part in the Hiring Satisfaction Survey. regarding the new hire("
						+ srdtos.get(i).getNewHireName()
						+ ") who onboarded on "
						+ srdtos.get(i).getNewHireDate()
						+ ".<br>"
						+ "This Survey that apprehend the overall hiring satisfaction toward process and new hire on behalf of recruiter is designed<br>"
						+ "to offer the improved hiring experience to hiring managers and new hires in the future.<br>"
						+ "The questionnaire is composed of 10 questions and it may take about 3 minutes to answer.<br>"
						+ "All answers will asked for honest feedback from you, are not utilized other than the object, and also not exposed to the outside either.<br>"
						+ "Thank you for your cooperation.<br>"
						+ "Please connect the link below.<br>"
						+ "<a href='http://10.2.4.14:9090/HRSurveyFinal/RecQuestion?lang=2&serial="
						+ srdtos.get(i).getSerialNo() 
						+ "'><br>GoSurvey</a>";
				String settoREC = srdtos.get(i).getRecruiterID();
				MimeMessage messageREC = new MimeMessage(mailSession);
				messageREC.setFrom(setfrom);
				messageREC.addRecipient(RecipientType.TO, new InternetAddress(settoREC));
				messageREC.setSubject(titleREC,"UTF-8");
				messageREC.setText(contentREC, "UTF-8","html");
				transport.sendMessage(messageNH, messageNH.getAllRecipients());
				transport.sendMessage(messageHM, messageHM.getAllRecipients());
				transport.sendMessage(messageREC, messageREC.getAllRecipients());
				surveyReminderDaoImpl.insertMailHM(srdtos.get(i).getSerialNo());
				surveyReminderDaoImpl.insertMailNH(srdtos.get(i).getSerialNo());
				surveyReminderDaoImpl.insertMailREC(srdtos.get(i).getSerialNo());
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		transport.close();

	}
}
