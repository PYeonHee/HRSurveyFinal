package com.sanhak.hrsurvey.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sanhak.hrsurvey.dao.UploadResDao;
import com.sanhak.hrsurvey.domain.UploadResDto;

@Repository("UploadResDao")
public class UploadResDaoImpl implements UploadResDao{
   UploadResDao uploadResDao;
   @Autowired
   private SqlSession sqlSession;
    
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
   
   @Override
   public List<UploadResDto> showUploadRes()
   {
      uploadResDao = sqlSession.getMapper(UploadResDao.class);
      return uploadResDao.showUploadRes();
   }
}