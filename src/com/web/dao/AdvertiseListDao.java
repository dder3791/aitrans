package com.web.dao;

import java.util.List;

import com.web.domain.AdvertiseList;
import com.web.util.Page;

public interface AdvertiseListDao {
	
	
	/**
	 * 分页展示企业列表总记录数
	 * @param page
	 * @return
	 */
	public long countAdvertiseByPage(Page page); 
	
	
	/**
	 * 分页展示企业客户信息
	 * @param page
	 * @return
	 */
	public List<AdvertiseList> findAdvertiseByPage(Page page); 
}
