package com.sanhak.hrsurvey.dao;

import java.util.List;
import com.sanhak.hrsurvey.domain.RecQuestionHistory;

public interface RecQuestionHistoryDao {
   public void insertRecQHist(RecQuestionHistory recqHist);
   public List<RecQuestionHistory> showRecQhistory();
   public String getMaxVersion();
   public RecQuestionHistory searchHistoryByVersion(String idx);
}