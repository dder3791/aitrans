package com.web.dao;

import java.util.List;

import com.web.domain.Order;
import com.web.util.Page;

public interface OrderDao {
   
	public void addOrder(Order order);
	
	
	/**
	 * 根据客户id，分页展示客户订单
	 * @param page
	 * @return
	 */
	public List<Order> findCusOrderByCusId(Page page);
	/**
	 * 根据客户id，查询符合条件的订单总记录数
	 * @return
	 */
	public long countCusOrderByCusId(Page page);
	
 
	
	public List<Order> queryByAllOrder(Page page);
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public Order queryByOrderId(int id);
	/**
	 * 查询完成订单
	 * @param id
	 * @return
	 */
	public long queryCompstate(int id);
	/**
	 * 查询订单总数
	 * @param id
	 * @return
	 */
	public long queryOrderCount(int id);
	/**
	 * 查询未完成订单
	 * @param id
	 * @return
	 */
	public long queryUnfinished(int id);
	/**
	 * 修改任务状态及时间
	 * @param order
	 */
	public int updateTaskstateId(Order order);
	
	
	/**
	 * 根据id查看订单内容
	 * @param order
	 * @return
	 */
	public Order queryByOrderId(Order order);
	
	
	/**
	 * 根据订单id查找订单
	 * @param order
	 * @return
	 */
	public Order findOrderId(int orderId);
	
	
	/**
	 * 根据条件查找订单
	 * @param order
	 * @return
	 */
	public List<Order> findOrder(Order order);
	
	
	public void editOrderId(Order order);
	
	
	/**
	 * 查询译员完成订单信息
	 * @param id
	 * @return
	 */
	public List<Order> queryTransOrder(int id);
	
	public int queryOrderTrans(int id);
	
	/**
	 * 添加评价id
	 * @param id
	 */
	public void setEvaluateId(Order order);
	
	/**
	 * 查看订单的确认时间
	 * @param orderId 订购单id
	 */
	public String getSignTime(int orderId);
	
	/**
	 * 获取评价id
	 * 
	 */
	public int getEvalueteId(int id);
	
	
	public String sumPayNumber(Order order);
	
	public long getTransOrderCount(Page page); 
	
	public List<Order> queryByTransOrder(Page page);
}
