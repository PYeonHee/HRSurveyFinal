package com.sanhak.hrsurvey.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sanhak.hrsurvey.dao.NhQuestionDao;
import com.sanhak.hrsurvey.domain.NhQEn;
import com.sanhak.hrsurvey.domain.NhQKr;

@Repository("NhQuestionDao")
public class NhQuestionDaoImpl implements NhQuestionDao {
   
	@Autowired
   NhQuestionDao nhQDao;
   @Autowired
    private SqlSession sqlSession;
 
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
   @Override
   public List<NhQKr> showNhQKr() {
      // TODO Auto-generated method stub
      nhQDao = sqlSession.getMapper(NhQuestionDao.class);
      return nhQDao.showNhQKr();
   }

   @Override
   public List<NhQEn> showNhQEn() {
      // TODO Auto-generated method stub
      nhQDao = sqlSession.getMapper(NhQuestionDao.class);
      return nhQDao.showNhQEn();
   }

}