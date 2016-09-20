package com.sanhak.hrsurvey.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sanhak.hrsurvey.dao.RecSurveyDao;
import com.sanhak.hrsurvey.domain.RecResultDto;

@Repository("RecSurveyDao")
public class RecSurveyDaoImpl implements RecSurveyDao {
   RecSurveyDao dao;
   
   @Autowired
   private SqlSession sqlSession;

   public void setSqlSession(SqlSession sqlSession){
       this.sqlSession = sqlSession;
   }
   @Override
   public void recSrvyInsert(RecResultDto dto) {
      // TODO Auto-generated method stub
      dao = sqlSession.getMapper(RecSurveyDao.class);
      dao.recSrvyInsert(dto);
   }
}