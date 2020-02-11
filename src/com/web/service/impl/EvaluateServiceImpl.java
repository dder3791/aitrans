package com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.EvaluateDao;
import com.web.domain.EvaluateClient;
import com.web.service.EvaluateService;
import com.web.util.Page;

@Service("evaluateService")
@Transactional
public class EvaluateServiceImpl implements EvaluateService {
	@Resource
	private EvaluateDao evaluateDao;


	@Override
	public void addEvaluate(EvaluateClient evaluateClient) {
		evaluateDao.addEvaluate(evaluateClient);
		
	}


	@Override
	public long queryEvaluateCount(int id) {
		return evaluateDao.queryEvaluateCount(id);
	}


	@Override
	public List<EvaluateClient> queryByAllEvaluate(Page page) {
		return evaluateDao.queryByAllEvaluate(page);
	}


	@Override
	public EvaluateClient queryByEvaluateId(int id) {
		return evaluateDao.queryByEvaluateId(id);
	}


	@Override
	public EvaluateClient queryByEvaluteOrder(int id) {
		return evaluateDao.queryByEvaluteOrder(id);
	}


	@Override
	public void updateEvaluateState(EvaluateClient evaluateClient) {
		evaluateDao.updateEvaluateState(evaluateClient);
		
	}


	@Override
	public List<EvaluateClient> queryTransEvaluates(int id) {
		return evaluateDao.queryTransEvaluates(id);
	}


	@Override
	public int queryById(int id) {
	
		return evaluateDao.queryById(id);
	}

}
