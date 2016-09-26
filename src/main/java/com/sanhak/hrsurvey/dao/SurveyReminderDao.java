package com.sanhak.hrsurvey.dao;

import java.util.List;

import com.sanhak.hrsurvey.domain.SurveyReminderDto;

public interface SurveyReminderDao {
	public List<SurveyReminderDto> showList();
	public SurveyReminderDto getInfo_NH(String serialNo);
	public SurveyReminderDto getInfo_HM(String serialNo);
	public SurveyReminderDto getInfo_REC(String serialNo);
	public List<SurveyReminderDto> listForMail();
	public void insertMailHM(String serialNo);
	public void insertMailNH(String serialNo);
	public void insertMailREC(String serialNo);
	public void resultCheckHM(String serialNo);
	public void resultCheckNH(String serialNo);
	public void resultCheckREC(String serialNo);
}
