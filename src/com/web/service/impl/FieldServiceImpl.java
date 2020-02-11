package com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.FieldDao;
import com.web.domain.Field;
import com.web.service.FieldService;


@Service("fieldService")
@Transactional
public class FieldServiceImpl implements FieldService {

	@Resource
	private FieldDao fieldDao;
	
	@Override
	public List<Field> queryByAll() {
		List<Field> fields = fieldDao.queryByAll();
		return fields;
	}

	@Override
	public Field queryById(int id) {
		return fieldDao.queryById(id);
	}
	@Override
	public int getDomainId(String domain) {
		return fieldDao.getDomainId(domain);
	}

	
	
}
