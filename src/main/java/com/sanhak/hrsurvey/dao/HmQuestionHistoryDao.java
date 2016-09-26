package com.sanhak.hrsurvey.dao;

import java.util.List;
import com.sanhak.hrsurvey.domain.HmQuestionHistory;

public interface HmQuestionHistoryDao {
   public void insertHmQHist(HmQuestionHistory hmqHist);
   public List<HmQuestionHistory> showHmQhistory();
   public String getMaxVersion();
   public HmQuestionHistory searchHistoryByVersion(String idx);
}