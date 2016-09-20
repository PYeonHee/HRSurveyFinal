package com.sanhak.hrsurvey.dao;

import java.util.List;

import com.sanhak.hrsurvey.domain.HmQEn;
import com.sanhak.hrsurvey.domain.HmQKr;

public interface HmQuestionDao {
   public List<HmQKr> showHmQKr();
   public List<HmQEn> showHmQEn();
}