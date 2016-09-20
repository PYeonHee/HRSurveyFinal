package com.sanhak.hrsurvey.dao;

import java.util.List;

import com.sanhak.hrsurvey.domain.NhQEn;
import com.sanhak.hrsurvey.domain.NhQKr;

public interface NhQuestionDao {
   public List<NhQKr> showNhQKr();
   public List<NhQEn> showNhQEn();
}