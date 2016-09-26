package com.sanhak.hrsurvey.dao;

import java.util.List;

import com.sanhak.hrsurvey.domain.HmResultDateDto;
import com.sanhak.hrsurvey.domain.HmResultDto;

public interface HmResultDao {
	public List<HmResultDto> showHmResult();
	public List<HmResultDto> showHmDateResult(HmResultDateDto dto);
}
