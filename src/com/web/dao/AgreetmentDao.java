package com.web.dao;

import java.util.List;

import com.web.domain.Agreetment;

public interface AgreetmentDao {
	
	
	/**
	 * 根据协议人类型查询对应的协议内容
	 * @return
	 */
	public List<Agreetment> queryByAll(String agreetment);
}
