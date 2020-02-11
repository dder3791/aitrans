package com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.AgreetmentDao;
import com.web.domain.Agreetment;
import com.web.service.AgreetmentService;
@Service("agreetmentService")
@Transactional
public class AgreetmentServiceImpl implements AgreetmentService{
     
	@Resource
	private AgreetmentDao agreetmentDao;
	
	
	@Override
	public List<Agreetment> queryByAll(String agreetment) {
		return agreetmentDao.queryByAll(agreetment);
	}

}
