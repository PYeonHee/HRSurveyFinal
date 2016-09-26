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

   @Override
	public void delRecQKr() {
		// TODO Auto-generated method stub
		sqlSession.delete("delRecQKr");
	}
   
   @Override
	public void delRecQEn() {
		// TODO Auto-generated method stub
		sqlSession.delete("delRecQEn");
	}

	@Override
	public void insertRecQKr(List<RecQKr> recq) {
		// TODO Auto-generated method stub
		recQDao = sqlSession.getMapper(RecQuestionDao.class);
		recQDao.insertRecQKr(recq);
	}
	
	@Override
	public void insertRecQEn(List<RecQEn> recq) {
		// TODO Auto-generated method stub
		recQDao = sqlSession.getMapper(RecQuestionDao.class);
		recQDao.insertRecQEn(recq);
	}

	@Override
	public int cntRecQKr() {
		// TODO Auto-generated method stub
		recQDao = sqlSession.getMapper(RecQuestionDao.class);
		return recQDao.cntRecQKr();
	}
	
	@Override
	public int cntRecQEn() {
		// TODO Auto-generated method stub
		recQDao = sqlSession.getMapper(RecQuestionDao.class);
		return recQDao.cntRecQEn();
	}

}