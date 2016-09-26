package com.sanhak.hrsurvey.dao;

import java.util.List;

import com.sanhak.hrsurvey.domain.NhResultDateDto;
import com.sanhak.hrsurvey.domain.NhResultDto;

public interface NhResultDao {
	public List<NhResultDto> showNhResult();
	public List<NhResultDto> showNhDateResult(NhResultDateDto dto);
}
