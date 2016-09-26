package com.sanhak.hrsurvey.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sanhak.hrsurvey.dao.NhResultDao;
import com.sanhak.hrsurvey.domain.NhResultDateDto;
import com.sanhak.hrsurvey.domain.NhResultDto;

@Repository("NhResultDao")
public class NhResultDaoImpl implements NhResultDao {
	NhResultDao nhResultDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }

	@Override
	public List<NhResultDto> showNhResult() {
		nhResultDao = sqlSession.getMapper(NhResultDao.class);
		return nhResultDao.showNhResult();
	}
	
	@Override
	   public List<NhResultDto> showNhDateResult(NhResultDateDto dto) {
	      // TODO Auto-generated method stub
	      NhResultDao nhResultDao = sqlSession.getMapper(NhResultDao.class);
	      return nhResultDao.showNhDateResult(dto);
	   }

}
