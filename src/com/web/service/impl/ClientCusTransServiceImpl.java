package com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.ClientCustomerTransDao;import com.web.domain.ClientCustomerNeed;
import com.web.domain.ClientCustomerNeedTrans;
import com.web.service.ClientCustomerTransService;

@Service("clientCustomerTransService")
@Transactional
public class ClientCusTransServiceImpl implements ClientCustomerTransService{

	
	@Resource
	private ClientCustomerTransDao clientCustomerTransDao;
	
	/**
	 * 添加译员客户需求中间表
	 */
	@Override
	public void addtransCustomer(ClientCustomerNeedTrans clientCustomerNeedTrans) {
		clientCustomerTransDao.addtransCustomer(clientCustomerNeedTrans);
	}

	@Override
	public long getTransNeedCount(int id) {
		return clientCustomerTransDao.getTransNeedCount(id);
	}

	@Override
	public void deleteTransNeed(ClientCustomerNeedTrans clientCustomerNeedTrans) {
		clientCustomerTransDao.deleteTransNeed(clientCustomerNeedTrans);
	}

	@Override
	public List<ClientCustomerNeedTrans> queryByMyTasks(int transId) {
		return clientCustomerTransDao.queryByMyTasks(transId);
	}
	@Override
	public List<ClientCustomerNeedTrans> queryByNeedId(int id) {
		return clientCustomerTransDao.queryByNeedId(id);
	}

	@Override
	public List<ClientCustomerNeedTrans> queryById(ClientCustomerNeedTrans clientCustomerNeedTrans) {
		return clientCustomerTransDao.queryById(clientCustomerNeedTrans);
	}

	@Override
	public void delete(ClientCustomerNeedTrans clientCustomerNeedTrans) {
		clientCustomerTransDao.delete(clientCustomerNeedTrans);		
	}

	@Override
	public void deleteByNeedId(int needId) {
		clientCustomerTransDao.deleteByNeedId(needId);		
	}

	@Override
	public void addtransCustomerBat(String allTrans) {
		// TODO Auto-generated method stub
		clientCustomerTransDao.addtransCustomerBat(allTrans);
	}

}
