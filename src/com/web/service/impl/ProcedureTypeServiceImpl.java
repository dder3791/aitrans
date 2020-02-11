package com.web.service.impl;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.ProcedureTypeDao;
import com.web.domain.ProcedureType;
import com.web.service.ProcedureService;

@Service("procedureService")
@Transactional
public class ProcedureTypeServiceImpl implements ProcedureService{

	@Resource
	private ProcedureTypeDao procedureTypeDao;
	
	@Override
	public List<ProcedureType> queryByAll() {
		List<ProcedureType> procedure = new ArrayList<ProcedureType>();
		procedure=procedureTypeDao.queryByAll();
		return procedure;
	}

	@Override
	public int getProcedureId(String procedure) {
		return procedureTypeDao.getProcedureId(procedure);
	}
}
