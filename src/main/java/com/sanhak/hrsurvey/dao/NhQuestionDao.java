package com.sanhak.hrsurvey.dao;

import java.util.List;

import com.sanhak.hrsurvey.domain.NhQEn;
import com.sanhak.hrsurvey.domain.NhQKr;

public interface NhQuestionDao {
	public List<NhQKr> showNhQKr();

	public List<NhQEn> showNhQEn();

	public int cntNhQKr();

	public int cntNhQEn();

	public void delNhQKr();

	public void delNhQEn();

	public void insertNhQKr(List<NhQKr> nhq);

	public void insertNhQEn(List<NhQEn> nhq);

}