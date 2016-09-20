package com.sanhak.hrsurvey.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sanhak.hrsurvey.dao.RecResultDao;
import com.sanhak.hrsurvey.domain.RecResultDto;

@Repository("RecResultDao")
public class RecResultDaoImpl implements RecResultDao {
	RecResultDao recResultDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }

	@Override
	public List<RecResultDto> showRecResult() {
		recResultDao = sqlSession.getMapper(RecResultDao.class);
		return recResultDao.showRecResult();
	}

}
