package com.sanhak.hrsurvey.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sanhak.hrsurvey.dao.HmResultDao;
import com.sanhak.hrsurvey.domain.HmResultDateDto;
import com.sanhak.hrsurvey.domain.HmResultDto;

@Repository("HmResultDao")
public class HmResultDaoImpl implements HmResultDao {
	HmResultDao hmResultDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }

	@Override
	public List<HmResultDto> showHmResult() {
		hmResultDao = sqlSession.getMapper(HmResultDao.class);
		return hmResultDao.showHmResult();
	}
	
	@Override
	   public List<HmResultDto> showHmDateResult(HmResultDateDto dto) {
	      // TODO Auto-generated method stub
	      HmResultDao hmResultDao = sqlSession.getMapper(HmResultDao.class);
	      return hmResultDao.showHmDateResult(dto);
	   }

}
