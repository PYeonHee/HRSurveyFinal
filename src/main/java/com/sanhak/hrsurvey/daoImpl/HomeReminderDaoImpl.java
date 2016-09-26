package com.sanhak.hrsurvey.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sanhak.hrsurvey.dao.HomeReminderDao;
import com.sanhak.hrsurvey.domain.HomeReminderDto;

@Repository("HomeReminderDao")
public class HomeReminderDaoImpl implements HomeReminderDao {
   HomeReminderDao homeReminderDao;
   
   @Autowired
      private SqlSession sqlSession;

      public void setSqlSession(SqlSession sqlSession){
          this.sqlSession = sqlSession;
      }
      
      
      @Override
      public List<HomeReminderDto> showHomeList() {
         homeReminderDao = sqlSession.getMapper(HomeReminderDao.class);
         return homeReminderDao.showHomeList();
      }
}