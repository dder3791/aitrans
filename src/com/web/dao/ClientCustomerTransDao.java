package com.web.dao;

import java.util.List;

import com.web.domain.ClientCustomerNeedTrans;

public interface ClientCustomerTransDao {

	/**
	 * 根据条件是否为空，添加译员，客户id
	 * @param clientCustomerNeedTrans
	 */
	public void addtransCustomer(ClientCustomerNeedTrans clientCustomerNeedTrans);
	
	
    /**
     * 获取译员对应需求记录数
     * @param id
     * @return
     */
	public long getTransNeedCount(int id);
	/**
	 * 删除译员对应的需求
	 * @param clientCustomerNeedTrans
	 */
	public void deleteTransNeed(ClientCustomerNeedTrans clientCustomerNeedTrans);

	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public List<ClientCustomerNeedTrans> queryByMyTasks(int transId);
	
	
	public List<ClientCustomerNeedTrans> queryByNeedId(int id);
	
	/**
	 * 根据id查找信息
	 * @param clientCustomerNeedTrans
	 * @return
	 */
	public List<ClientCustomerNeedTrans> queryById(ClientCustomerNeedTrans clientCustomerNeedTrans);
	
	/**
	 * 根据条件删除中间表信息
	 * @param clientCustomerNeedTrans
	 */
	public void delete(ClientCustomerNeedTrans clientCustomerNeedTrans);
	
	
	/**
	 * 根据需求id删除中间表信息
	 * @param needId
	 */
	public void deleteByNeedId(int needId);
	
	/**
	 * 批量添加中间表信息
	 * @param allTrans
	 */
	public void addtransCustomerBat(String allTrans);

}
