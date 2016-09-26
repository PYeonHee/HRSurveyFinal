package com.sanhak.hrsurvey.dao;

import java.util.List;

import com.sanhak.hrsurvey.domain.RecResultDateDto;
import com.sanhak.hrsurvey.domain.RecResultDto;

public interface RecResultDao {
	public List<RecResultDto> showRecResult();
	public List<RecResultDto> showRecDateResult(RecResultDateDto dto);
}
