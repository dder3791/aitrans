package com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.TranslatorLevelDao;
import com.web.domain.TranslatorLevel;
import com.web.service.TranslatorLevelService;


@Service("translatorLevelService")
@Transactional
public class TranslatorLevelServiceImpl implements TranslatorLevelService {

		@Resource
		private TranslatorLevelDao translatorLevelDao;
		
	@Override
	public List<TranslatorLevel> queryByAll() {
			List<TranslatorLevel> translatorLevels= translatorLevelDao.queryByAll();
		return  translatorLevels;
	}
	@Override
	public TranslatorLevel queryByLevel(int level) {
		return translatorLevelDao.queryByLevel(level);
	}

}
