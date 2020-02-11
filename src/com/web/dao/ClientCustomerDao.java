package com.web.dao;

import java.util.List;
import java.util.Map;

import com.web.domain.ClientCustomerNeed;
import com.web.domain.ClientUserD;
import com.web.domain.Customer;
import com.web.domain.OnLineCustomer;
import com.web.util.Page;

public interface ClientCustomerDao {
	
	/**
	 * 添加公司客户
	 * @param customer
	 */
	public void addCustomer(Customer customer);
	
	
	
	/**
	 * 分页展示企业客户总记录数
	 * @param page
	 * @return
	 */
	public long countCompanyCustomerByPage(Page page); 
	
	
	
	/**
	 * 分页展示企业客户信息
	 * @param page
	 * @return
	 */
	public List<OnLineCustomer> findCompanyCustomerByPage(Page page); 
	
	
	
	
	/**
	 * 首页展示，查询所有企业客户，按发布需求数量，等级排序
	 * @param top
	 * @return
	 */
	public List<ClientUserD> findOnlineUser(OnLineCustomer onlinecustomer);
	
	/**
	 * 根据客户id修改客户信息
	 * @param clientUser
	 */
	public void editCilentCustomerById(ClientUserD clientUser );
	
	
	/**
	 * 判断唯一字段是否重复
	 * @param cardId
	 * @return
	 */
	public List<ClientUserD> findCardId(String cardId);
	
	
	/**
	 * 添加客户需求
	 * @param clientCustomerNeed
	 */
	public void addCustomerNeed(ClientCustomerNeed clientCustomerNeed);
	
	
	public List<ClientCustomerNeed> queryByPublishNeed(Page page);
		
	public long getPublishNeedCount(Page page);
	
	public  ClientCustomerNeed findTransNeedByid(int id);
	
	
	/**
	 * 根据条件查询客户需求
	 * @param clientCustomerNeed
	 * @return
	 */
	public ClientCustomerNeed queryByWhere(ClientCustomerNeed clientCustomerNeed);
	
	/**
	 * 验证需求唯一条件
	 */
	public List<ClientCustomerNeed> queryOnly(String parameter);
	
	/**
	 * 根据条件，分页展示客户需求
	 * @param page
	 * @return
	 */
	public List<ClientCustomerNeed> findCusNeedByPage(Page page); 

	/**
	 * 根据条件，查询符合条件的总记录数
	 * @return
	 */
	public long countCusNeesByPage(Page page);
	
	/**
	 * 根据客户id，分页展示客户需求
	 * @param page
	 * @return
	 */
	public List<ClientCustomerNeed> findCusNeedByCusId(Page page); 

	/**
	 * 根据客户id，查询符合条件的总记录数
	 * @return
	 */
	public long countCusNeesByCusId(Page page);
	
	
	
	/**
	 * 修改需求接受状态Z
	 * 修改需求
	 * @param clientCustomerNeed
	 */
	public void updateNeed(ClientCustomerNeed clientCustomerNeed);
	
	/**
	 * 查询需求信息Z
	 * @param page
	 * @return
	 */
	public List<ClientCustomerNeed> findTransNeed(Page page);	
	
	/**
	 * 添加企业认证信息
	 * @param onLineCustomer
	 */
	public void saveOnliCustomer(OnLineCustomer onLineCustomer);
	
	/**
	 * 修改企业客户信息
	 * @param onLineCustomer
	 */
	public void updateOnlineCustomer(OnLineCustomer onLineCustomer);
	
	/**
	 * 根据客户id（clientUserId）查找企业信息
	 * @param id
	 * @return
	 */
	public OnLineCustomer findUserID(int id);
	
	
	/**
	 * 根据需求Id删除需求信息
	 * @param id
	 */
	public void deleteNeed(int id);
	
	
	public void updateAcceptState(ClientCustomerNeed clientCustomerNeed);
	
	public int queryClientCount(int id);
	
	public int queryAcceptCount(ClientCustomerNeed clientCustomerNeed);
	
	/**
	 * 为首页查询需求信息，并依据信誉及发布日期进行排序展示
	 */
	public List<ClientCustomerNeed> getNeeds(Page page); 
	
	/**
	 * 获取所有的需求的总纪录数
	 */
	public long getTotalCount(Page page);
	
	/**
	 * 查询发布中的相同需求案号
	 * @param clientCustomerNeed
	 * @return
	 */
	public List<ClientCustomerNeed>  queryNeedReference(ClientCustomerNeed clientCustomerNeed);


	/**
	 * 根据条件排序查询几条需求信息
	 * @param clientCustomerNeed
	 * @return
	 */
	public  List<ClientCustomerNeed>  findNeedOrderBY(ClientCustomerNeed clientCustomerNeed);
	
	
	/**
	 * 计算项目案号
	 * @param clientCustomerNeed
	 * @return
	 */
	public String getNeedReference(ClientCustomerNeed clientCustomerNeed);
	
	/**
	 * 计算发布中状态的需求总价
	 * @param clientCustomerNeed
	 * @return
	 */
	public String getPublishPayNum(ClientCustomerNeed clientCustomerNeed);
	
	public int getIdentity();
	
	
	
}
