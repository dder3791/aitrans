package com.web.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.TransVerifyDao;
import com.web.domain.TransVerify;
import com.web.service.TransVerifyService;

@Service("transVerifyService")
@Transactional
public class TransVerifyServiceImpl implements TransVerifyService{

	 @Resource
	 private TransVerifyDao transVerifyDao;

	@Override
	public void saveTransVerify(TransVerify transVerify) {
		transVerifyDao.saveTransVerify(transVerify);
		
	}
}
