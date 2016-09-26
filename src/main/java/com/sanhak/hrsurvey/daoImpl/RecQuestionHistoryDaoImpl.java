package com.sanhak.hrsurvey.daoImpl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sanhak.hrsurvey.dao.RecQuestionHistoryDao;
import com.sanhak.hrsurvey.domain.RecQuestionHistory;

@Repository("RecQuestionHistoryDao")
public class RecQuestionHistoryDaoImpl implements RecQuestionHistoryDao {
   
   @Autowired
   RecQuestionHistoryDao recQhistDao;
   @Autowired
    private SqlSession sqlSession;
 
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
    @Override
    public List<RecQuestionHistory> showRecQhistory() {
       // TODO Auto-generated method stub
       recQhistDao = sqlSession.getMapper(RecQuestionHistoryDao.class);
       return recQhistDao.showRecQhistory();
    }
    
    @Override
    public String getMaxVersion() {
       // TODO Auto-generated method stub
       recQhistDao = sqlSession.getMapper(RecQuestionHistoryDao.class);
       return recQhistDao.getMaxVersion();
    }
   
   @Override
   public void insertRecQHist(RecQuestionHistory recqhist) {
      // TODO Auto-generated method stub
      recQhistDao = sqlSession.getMapper(RecQuestionHistoryDao.class);
      recQhistDao.insertRecQHist(recqhist);
   }
   
   @Override
    public RecQuestionHistory searchHistoryByVersion(String idx) {
       // TODO Auto-generated method stub
       recQhistDao = sqlSession.getMapper(RecQuestionHistoryDao.class);
       return recQhistDao.searchHistoryByVersion(idx);
    }
}