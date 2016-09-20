package com.sanhak.hrsurvey.daoImpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sanhak.hrsurvey.dao.NhSurveyDao;
import com.sanhak.hrsurvey.domain.NhResultDto;


@Repository("NhSurveyDao")
public class NhSurveyDaoImpl implements NhSurveyDao {
   NhSurveyDao dao;
   
   @Autowired
   private SqlSession sqlSession;

   public void setSqlSession(SqlSession sqlSession){
       this.sqlSession = sqlSession;
   }
   @Override
   public void nhSrvyInsert(NhResultDto dto) {
      // TODO Auto-generated method stub
      dao = sqlSession.getMapper(NhSurveyDao.class);
      dao.nhSrvyInsert(dto);
   }
}