package com.sanhak.hrsurvey.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sanhak.hrsurvey.dao.RecQuestionDao;
import com.sanhak.hrsurvey.domain.RecQEn;
import com.sanhak.hrsurvey.domain.RecQKr;
@Repository("RecQuestionDao")
public class RecQuestionDaoImpl implements RecQuestionDao {

	 @Autowired
	 RecQuestionDao recQDao;
   @Autowired
    private SqlSession sqlSession;
 
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }

   @Override
   public List<RecQKr> showRecQKr() {
      // TODO Auto-generated method stub
      recQDao = sqlSession.getMapper(RecQuestionDao.class);
      return recQDao.showRecQKr();
   }

   @Override
   public List<RecQEn> showRecQEn() {
      // TODO Auto-generated method stub
      recQDao = sqlSession.getMapper(RecQuestionDao.class);
      return recQDao.showRecQEn();
   }

}