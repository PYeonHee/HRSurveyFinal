package com.sanhak.hrsurvey.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.sanhak.hrsurvey.dao.UploadDao;
import com.sanhak.hrsurvey.domain.Excel;
import com.sanhak.hrsurvey.domain.SurveyReminderDto;

@Repository
@Service
public class UploadDaoImpl implements UploadDao {

	private String NAMESPACE = "com.sanhak.hrsurvey.domain.Excel.";

	@Autowired
	   private SqlSession sqlSession;

	   public void setSqlSession(SqlSession sqlSession){
	       this.sqlSession = sqlSession;
	   }
	@Override
	public void addExcel(List<Excel> list) {
		sqlSession.insert(NAMESPACE + "addExcel", list);
	}
	@Override
	public void addReminder(List<SurveyReminderDto> list) {
		// TODO Auto-generated method stub
		sqlSession.insert(NAMESPACE + "addReminder", list);
	}
}
