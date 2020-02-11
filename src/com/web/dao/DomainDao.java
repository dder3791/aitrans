package com.web.dao;

import java.util.List;

import com.web.domain.Domain;

public interface DomainDao {
	/**
	 * 查询所有的领域信息
	 * @return 返回所有领域信息的集合
	 */
	public List<Domain> queryByAll();
	
	/**
	 * 获取领域Id
	 * @param domain
	 * @return
	 */
	public int  getDomainId(String domain);

}
