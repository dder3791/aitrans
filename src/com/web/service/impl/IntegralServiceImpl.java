package com.web.service.impl;



import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.IntegralDao;
import com.web.domain.Integral;
import com.web.service.IntegralService;
import com.web.util.Page;

@Service("integralService")
@Transactional
public class IntegralServiceImpl implements IntegralService{
	
	@Resource
	private IntegralDao integralDao;

	@Override
	public List<Integral> findAllByPage(Page page) {
		return integralDao.findAllByPage(page);
	}

	@Override
	public long countAll(Page page) {
		return integralDao.countAll(page);
	}

	@Override
	public List<Integral> queryByAll() {
		return integralDao.queryByAll();
	}

	@Override
	public int queryByCount() {
		return integralDao.queryByCount();
	}

	@Override
	public List<Integral> queryByAllIntegral(Page page) {
		return integralDao.queryByAllIntegral(page);
	}



}
