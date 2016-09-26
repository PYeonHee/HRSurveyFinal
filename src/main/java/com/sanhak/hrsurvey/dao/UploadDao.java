package com.sanhak.hrsurvey.dao;

import java.util.List;

import com.sanhak.hrsurvey.domain.Excel;
import com.sanhak.hrsurvey.domain.SurveyReminderDto;

public interface UploadDao {
	void addExcel(List<Excel> list);
	void addReminder(List<SurveyReminderDto> list);
}
