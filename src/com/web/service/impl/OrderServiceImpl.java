package com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.OrderDao;
import com.web.domain.Order;
import com.web.service.OrderService;
import com.web.util.Page;

@Service("OrderService")
@Transactional
public class OrderServiceImpl implements OrderService{

	@Resource
	private OrderDao tranOrderDao;

	@Override 
	public void addOrder(Order order) {
		tranOrderDao.addOrder(order);
	}

	@Override
	public List<Order> findCusOrderByCusId(Page page) {
		return tranOrderDao.findCusOrderByCusId(page);
	}

	@Override
	public long countCusOrderByCusId(Page page) {
		return tranOrderDao.countCusOrderByCusId(page);
	}

	@Override
	public List<Order> queryByAllOrder(Page page) {
		return tranOrderDao.queryByAllOrder(page);
	}

	@Override
	public Order queryByOrderId(Order order) {
		return tranOrderDao.queryByOrderId(order);
	}

	@Override
	public long queryCompstate(int id) {
	  return tranOrderDao.queryCompstate(id);
	}
 

	@Override
	public long queryOrderCount(int id) {
		return tranOrderDao.queryOrderCount(id);
	}

	@Override
	public long queryUnfinished(int id) {
		 return tranOrderDao.queryUnfinished(id);
	}

	@Override
	public int updateTaskstateId(Order order) {
		return tranOrderDao.updateTaskstateId(order);
		
	}

	@Override
	public Order findOrderId(int orderId) {
	  return tranOrderDao.findOrderId(orderId);
	}

	@Override
	public Order queryByOrderId(int id) {
		return tranOrderDao.queryByOrderId(id);
	}

	@Override
	public List<Order> findOrder(Order order) {
		return tranOrderDao.findOrder(order);
	}

	@Override
	public void editOrderId(Order order) {
		tranOrderDao.editOrderId(order);
		
	}

	@Override
	public List<Order> queryTransOrder(int id) {
		return tranOrderDao.queryTransOrder(id);
	}

	@Override
	public int queryOrderTrans(int id) {
		return tranOrderDao.queryOrderTrans(id);
	}

	@Override
	public void setEvaluateId(Order order) {

			tranOrderDao.setEvaluateId(order);
			}

	@Override
	public String getSignTime(int orderId) {
		
		return 	tranOrderDao.getSignTime(orderId);
	}

	@Override
	public int getEvalueteId(int id) {
	
		return tranOrderDao.getEvalueteId(id);
	}

	@Override
	public String sumPayNumber(Order order) {
		return tranOrderDao.sumPayNumber(order);
	}

	@Override
	public long getTransOrderCount(Page page) {
		return tranOrderDao.getTransOrderCount(page);
	}

	@Override
	public List<Order> queryByTransOrder(Page page) {
		return tranOrderDao.queryByTransOrder(page);
	}


	 

	 

	 
}
