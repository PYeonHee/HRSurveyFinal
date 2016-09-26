package com.sanhak.hrsurvey.daoImpl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sanhak.hrsurvey.dao.NhQuestionHistoryDao;
import com.sanhak.hrsurvey.domain.NhQuestionHistory;


@Repository("NhQuestionHistoryDao")
public class NhQuestionHistoryDaoImpl implements NhQuestionHistoryDao {
   
   @Autowired
   NhQuestionHistoryDao nhQhistDao;
   @Autowired
    private SqlSession sqlSession;
 
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
    @Override
    public List<NhQuestionHistory> showNhQhistory() {
       // TODO Auto-generated method stub
       nhQhistDao = sqlSession.getMapper(NhQuestionHistoryDao.class);
       return nhQhistDao.showNhQhistory();
    }
    
    @Override
    public String getMaxVersion() {
       // TODO Auto-generated method stub
       nhQhistDao = sqlSession.getMapper(NhQuestionHistoryDao.class);
       return nhQhistDao.getMaxVersion();
    }
   
   @Override
   public void insertNhQHist(NhQuestionHistory nhqhist) {
      // TODO Auto-generated method stub
      nhQhistDao = sqlSession.getMapper(NhQuestionHistoryDao.class);
      nhQhistDao.insertNhQHist(nhqhist);
   }
   
   @Override
    public NhQuestionHistory searchHistoryByVersion(String idx) {
       // TODO Auto-generated method stub
       nhQhistDao = sqlSession.getMapper(NhQuestionHistoryDao.class);
       return nhQhistDao.searchHistoryByVersion(idx);
    }
}