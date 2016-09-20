package com.sanhak.hrsurvey.daoImpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sanhak.hrsurvey.dao.AdminLoginDao;
import com.sanhak.hrsurvey.domain.AdminLogin;

@Repository("AdminLoginDao")
public class AdminLoginDaoImpl implements AdminLoginDao {

	AdminLoginDao adLogin;

	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public AdminLogin getAdmin() 
	{
			adLogin = sqlSession.getMapper(AdminLoginDao.class);
			return adLogin.getAdmin();
	}
}
