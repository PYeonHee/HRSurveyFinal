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

   @Override
	public void delHmQKr() {
		// TODO Auto-generated method stub
		sqlSession.delete("delHmQKr");
	}
   
   @Override
	public void delHmQEn() {
		// TODO Auto-generated method stub
		sqlSession.delete("delHmQEn");
	}

	@Override
	public void insertHmQKr(List<HmQKr> hmq) {
		// TODO Auto-generated method stub
		hmQDao = sqlSession.getMapper(HmQuestionDao.class);
		hmQDao.insertHmQKr(hmq);
	}
	
	@Override
	public void insertHmQEn(List<HmQEn> hmq) {
		// TODO Auto-generated method stub
		hmQDao = sqlSession.getMapper(HmQuestionDao.class);
		hmQDao.insertHmQEn(hmq);
	}

	@Override
	public int cntHmQKr() {
		// TODO Auto-generated method stub
		hmQDao = sqlSession.getMapper(HmQuestionDao.class);
		return hmQDao.cntHmQKr();
	}
	
	@Override
	public int cntHmQEn() {
		// TODO Auto-generated method stub
		hmQDao = sqlSession.getMapper(HmQuestionDao.class);
		return hmQDao.cntHmQEn();
	}

}