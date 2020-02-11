package com.web.dao;

import java.util.List;


import com.web.domain.Field;

public interface FieldDao {
	
	/**
	 * 查询所有翻译领域的系数
	 * @return 返回所有翻译领域系数的集合
	 */
	public List<Field> queryByAll();
	
	/**
	 * 根据条件id查询field信息
	 */
	public Field queryById(int id);
	
	/**
	 * 根据领域名称查询领域id
	 */
	public int getDomainId(String domain);
}
