package com.sanhak.hrsurvey.dao;

import com.sanhak.hrsurvey.domain.SurveyReminderDto;

public interface SendMailDao {
   public void sendMail_NH(SurveyReminderDto list, String addText);
   public void sendMail_HM(SurveyReminderDto list, String addText);
   public void sendMail_REC(SurveyReminderDto list, String addText);
}