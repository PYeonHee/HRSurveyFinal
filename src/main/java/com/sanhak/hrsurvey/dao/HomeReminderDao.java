package com.sanhak.hrsurvey.dao;

import java.util.List;

import com.sanhak.hrsurvey.domain.HomeReminderDto;

public interface HomeReminderDao {
   public List<HomeReminderDto> showHomeList();
}