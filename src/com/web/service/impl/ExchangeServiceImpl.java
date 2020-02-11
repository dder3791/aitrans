package com.web.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.ClientUserDao;
import com.web.dao.ExchangeDao;
import com.web.domain.Exchange;
import com.web.service.ExchangeService;

@Service("exchangeService")
@Transactional
public class ExchangeServiceImpl implements ExchangeService {

	@Resource
	private ExchangeDao exchangeDao;
	
	@Override
	public void saveExchange(Exchange exchange) {
		exchangeDao.saveExchange(exchange);
	}

}
