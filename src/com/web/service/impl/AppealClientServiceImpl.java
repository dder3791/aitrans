package com.web.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.AppealClientDao;
import com.web.domain.AppealClient;
import com.web.service.AppealClientService;

@Service("appealCilentService")
@Transactional
public class AppealClientServiceImpl implements AppealClientService {

	@Resource
	private AppealClientDao appealClientDao;

	@Override
	public void updateAppeal(AppealClient appealClient) {
		appealClientDao.updateAppeal(appealClient);
	}

	@Override
	public void addTransAppeal(AppealClient appealClient) {
		appealClientDao.addTransAppeal(appealClient);
		
	}

	
	 

}
