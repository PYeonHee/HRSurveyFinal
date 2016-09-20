package com.sanhak.hrsurvey.dao;

import java.util.List;

import com.sanhak.hrsurvey.domain.RecQEn;
import com.sanhak.hrsurvey.domain.RecQKr;

public interface RecQuestionDao {
   public List<RecQKr> showRecQKr();
   public List<RecQEn> showRecQEn();
}