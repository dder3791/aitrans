package com.web.dao;

import java.util.List;



import com.web.domain.EvaluateClient;
import com.web.util.Page;

public interface EvaluateDao {

	/**
	 * 添加订单评价
	 */
	public void addEvaluate(EvaluateClient evaluateClient);
	/**
	 * 查询评价总数
	 * @param id 
	 * @return
	 */
	public long queryEvaluateCount(int id);
	/**
	 * 根据条件进行查询
	 * 
	 */
	public List<EvaluateClient> queryByAllEvaluate(Page page);
	
	
	/**
	 * 根据id查询评价信息
	 */
	public EvaluateClient queryByEvaluateId(int id);
	
	/**
	 * 根据订单id查询评价信息
	 * @param id
	 * @return
	 */
	public EvaluateClient queryByEvaluteOrder(int id);
	
	
	public void updateEvaluateState(EvaluateClient evaluateClient);
	
	
	public List<EvaluateClient> queryTransEvaluates(int id);
	
	/**
	 * 根据订单id查询评价idW
	 * @param id
	 * @return
	 */
	public int queryById(int id);
}
