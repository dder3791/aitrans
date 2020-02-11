package com.web.dao;

import java.util.List;

import com.web.domain.BasicPrice;

public interface BasicPriceDao {
	
	/**
	 * 查询所有翻译语言的基础价格
	 * @return 返回所有翻译语言基础价格的集合
	 */
	public List<BasicPrice> queryByAll();
	
	
	/**
	 * 根据语言类型查询基础价格
	 * @param language
	 * @return
	 */
	public BasicPrice queryByLanguage(String language);
	
	/**
	 * 根据id查询基础价格
	 * @param id
	 * @return 返回实体类
	 */
	public BasicPrice queryById(int id);
	
}
