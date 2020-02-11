package com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.BasicPriceDao;
import com.web.domain.BasicPrice;
import com.web.service.BasicPriceService;

@Service("basicPriceService")
@Transactional
public class BasicPriceServiceImpl implements BasicPriceService {
	@Resource
	private BasicPriceDao basicPriceDao;

	@Override
	public List<BasicPrice> queryByAll() {
		List<BasicPrice> basicPrices = basicPriceDao.queryByAll();
		return basicPrices;
	}

	@Override
	public BasicPrice queryByLanguage(String language) {
		BasicPrice basicPrice = basicPriceDao.queryByLanguage(language);
		return basicPrice;
	}

	@Override
	public BasicPrice queryById(int id) {
		BasicPrice basicPrice = basicPriceDao.queryById(id);
		return basicPrice;
	}

}
