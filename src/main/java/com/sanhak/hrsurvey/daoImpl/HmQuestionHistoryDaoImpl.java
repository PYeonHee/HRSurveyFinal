package com.sanhak.hrsurvey.daoImpl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sanhak.hrsurvey.dao.HmQuestionDao;
import com.sanhak.hrsurvey.dao.HmQuestionHistoryDao;
import com.sanhak.hrsurvey.domain.HmQEn;
import com.sanhak.hrsurvey.domain.HmQKr;
import com.sanhak.hrsurvey.domain.HmQuestionHistory;

@Repository("HmQuestionHistoryDao")
public class HmQuestionHistoryDaoImpl implements HmQuestionHistoryDao {
   
   @Autowired
   HmQuestionHistoryDao hmQhistDao;
   @Autowired
    private SqlSession sqlSession;
 
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
    @Override
    public List<HmQuestionHistory> showHmQhistory() {
       // TODO Auto-generated method stub
       hmQhistDao = sqlSession.getMapper(HmQuestionHistoryDao.class);
       return hmQhistDao.showHmQhistory();
    }
    
    @Override
    public String getMaxVersion() {
       // TODO Auto-generated method stub
       hmQhistDao = sqlSession.getMapper(HmQuestionHistoryDao.class);
       return hmQhistDao.getMaxVersion();
    }
   
   @Override
   public void insertHmQHist(HmQuestionHistory hmqhist) {
      // TODO Auto-generated method stub
      hmQhistDao = sqlSession.getMapper(HmQuestionHistoryDao.class);
      hmQhistDao.insertHmQHist(hmqhist);
   }
   
   @Override
    public HmQuestionHistory searchHistoryByVersion(String idx) {
       // TODO Auto-generated method stub
       hmQhistDao = sqlSession.getMapper(HmQuestionHistoryDao.class);
       return hmQhistDao.searchHistoryByVersion(idx);
    }
}