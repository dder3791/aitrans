package com.web.dao;

import java.util.List;

import com.web.domain.OrderState;

public interface OrderStateDao {
      
	
	public OrderState findOrderId(OrderState orderState);
	
	public List<OrderState> queryByOrderState();
}
