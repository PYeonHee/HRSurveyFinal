package com.sanhak.hrsurvey.dao;

import java.util.List;
import com.sanhak.hrsurvey.domain.NhQuestionHistory;

public interface NhQuestionHistoryDao {
   public void insertNhQHist(NhQuestionHistory nhqHist);
   public List<NhQuestionHistory> showNhQhistory();
   public String getMaxVersion();
   public NhQuestionHistory searchHistoryByVersion(String idx);
}