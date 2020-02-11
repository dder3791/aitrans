package com.web.dao;

import java.util.List;

import com.web.domain.Integral;
import com.web.util.Page;



public interface IntegralDao {
	
	/**
	 * 分页展示兑换商品
	 * @param page
	 * @return
	 */
	public List<Integral> findAllByPage(Page page);
	/**
	 * 查询符合条件的兑换商品总记录数
	 * @return
	 */
	public long countAll(Page page);
	
	 public List<Integral> queryByAll();
	 
	 public int queryByCount();
	 
	 public List<Integral> queryByAllIntegral(Page page);
}
