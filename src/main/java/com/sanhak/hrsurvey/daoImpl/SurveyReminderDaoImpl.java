package com.sanhak.hrsurvey.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sanhak.hrsurvey.dao.SurveyReminderDao;
import com.sanhak.hrsurvey.domain.SurveyReminderDto;


@Repository("SurveyReminderDao")
public class SurveyReminderDaoImpl implements SurveyReminderDao{
	
	SurveyReminderDao surveyReminderDao;
	@Autowired
	   private SqlSession sqlSession;

	   public void setSqlSession(SqlSession sqlSession){
	       this.sqlSession = sqlSession;
	   }
	   
	@Override
	public List<SurveyReminderDto> showList() {
		surveyReminderDao = sqlSession.getMapper(SurveyReminderDao.class);
		return surveyReminderDao.showList();
	}

	@Override
	public SurveyReminderDto getInfo_NH(String serialNo) {
		
		surveyReminderDao = sqlSession.getMapper(SurveyReminderDao.class);			
		return surveyReminderDao.getInfo_NH(serialNo);
	}

	@Override
	public SurveyReminderDto getInfo_HM(String serialNo) {
		
		surveyReminderDao = sqlSession.getMapper(SurveyReminderDao.class);		
		return surveyReminderDao.getInfo_HM(serialNo);	
	}

	@Override
	public SurveyReminderDto getInfo_REC(String serialNo) {
	
		surveyReminderDao = sqlSession.getMapper(SurveyReminderDao.class);		
		return surveyReminderDao.getInfo_REC(serialNo);
	}

	@Override
	public List<SurveyReminderDto> listForMail() {
		// TODO Auto-generated method stub
		surveyReminderDao = sqlSession.getMapper(SurveyReminderDao.class);	
		return surveyReminderDao.listForMail();
	}

	@Override
	public void insertMailHM(String serialNo) {
		// TODO Auto-generated method stub
		sqlSession.insert("com.sanhak.hrsurvey.dao.SurveyReminderDao.insertMailHM", serialNo);
	}

	@Override
	public void insertMailNH(String serialNo) {
		// TODO Auto-generated method stub
		sqlSession.insert("com.sanhak.hrsurvey.dao.SurveyReminderDao.insertMailNH", serialNo);
	}

	@Override
	public void insertMailREC(String serialNo) {
		// TODO Auto-generated method stub
		sqlSession.insert("com.sanhak.hrsurvey.dao.SurveyReminderDao.insertMailREC", serialNo);
	}

	@Override
	public void resultCheckHM(String serialNo) {
		// TODO Auto-generated method stub
		sqlSession.insert("com.sanhak.hrsurvey.dao.SurveyReminderDao.resultCheckHM", serialNo);
	}

	@Override
	public void resultCheckNH(String serialNo) {
		// TODO Auto-generated method stub
		sqlSession.insert("com.sanhak.hrsurvey.dao.SurveyReminderDao.resultCheckNH", serialNo);
	}

	@Override
	public void resultCheckREC(String serialNo) {
		// TODO Auto-generated method stub
		sqlSession.insert("com.sanhak.hrsurvey.dao.SurveyReminderDao.resultCheckREC", serialNo);
	}
}
