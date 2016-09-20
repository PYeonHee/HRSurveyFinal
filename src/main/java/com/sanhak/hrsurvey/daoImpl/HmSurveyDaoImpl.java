package com.sanhak.hrsurvey.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sanhak.hrsurvey.dao.HmSurveyDao;
import com.sanhak.hrsurvey.domain.HmResultDto;


@Repository("HmSurveyDao")
public class HmSurveyDaoImpl implements HmSurveyDao {
   HmSurveyDao dao;
   
   @Autowired
   private SqlSession sqlSession;

   public void setSqlSession(SqlSession sqlSession){
       this.sqlSession = sqlSession;
   }
   @Override
   public void hmSrvyInsert(HmResultDto dto) {
	
      dao = sqlSession.getMapper(HmSurveyDao.class);
      dao.hmSrvyInsert(dto);
   }
}