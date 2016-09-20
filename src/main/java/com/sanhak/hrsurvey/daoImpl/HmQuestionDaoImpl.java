package com.sanhak.hrsurvey.daoImpl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sanhak.hrsurvey.dao.HmQuestionDao;
import com.sanhak.hrsurvey.domain.HmQEn;
import com.sanhak.hrsurvey.domain.HmQKr;

@Repository("HmQuestionDao")
public class HmQuestionDaoImpl implements HmQuestionDao {
   
	@Autowired
   HmQuestionDao hmQDao;
   @Autowired
    private SqlSession sqlSession;
 
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }

   @Override
   public List<HmQKr> showHmQKr() {
      // TODO Auto-generated method stub
      hmQDao = sqlSession.getMapper(HmQuestionDao.class);
      return hmQDao.showHmQKr();
   }

   @Override
   public List<HmQEn> showHmQEn() {
      // TODO Auto-generated method stub
      hmQDao = sqlSession.getMapper(HmQuestionDao.class);
      return hmQDao.showHmQEn();
   }
}