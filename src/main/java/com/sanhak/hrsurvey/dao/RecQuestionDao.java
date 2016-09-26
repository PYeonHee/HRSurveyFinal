package com.sanhak.hrsurvey.dao;

import java.util.List;

import com.sanhak.hrsurvey.domain.RecQEn;
import com.sanhak.hrsurvey.domain.RecQKr;

public interface RecQuestionDao {
	public List<RecQKr> showRecQKr();

	public List<RecQEn> showRecQEn();

	public int cntRecQKr();

	public int cntRecQEn();

	public void delRecQKr();

	public void delRecQEn();

	public void insertRecQKr(List<RecQKr> recq);

	public void insertRecQEn(List<RecQEn> recq);

}