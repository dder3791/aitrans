package com.web.dao;

import java.util.List;

import com.web.domain.ProcedureType;

public interface ProcedureTypeDao {
	
	
	/**
	 * 查询所有流程类型
	 * @return
	 */
	public List<ProcedureType> queryByAll();
	
	/**
	 * 根据流程名查询流程Id
	 * @param procedure
	 * @return
	 */
	public int getProcedureId(String procedure);
}
