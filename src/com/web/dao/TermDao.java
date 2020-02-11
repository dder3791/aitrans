package com.web.dao;

import java.util.List;

import com.web.domain.Term;

import com.web.util.Page;

public interface TermDao {
	
	/**
	 * 查询所有语言类型对应领域的术语
	 * @return
	 */
	public List<Term> getTerms(Page page);
	
	/** 
	 * 依据条件查询总记录数
	 * @param page
	 * @return
	 */
	public long getTotalCount(Page page);
	
	/**
	 * 根据查询模糊字段查术语
	 * @param msg
	 * @return
	 */
	public List<Term> queryByMsg(Page page);

}
