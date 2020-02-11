package com.web.service.impl;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.OrderStateDao;
import com.web.domain.OrderState;
import com.web.service.OrderStateService;
import java.util.List;
@Service("orderStateService")
@Transactional
public class OrderStateServiceImpl implements OrderStateService{
	
	@Resource
	private OrderStateDao orderStateDao;

	@Override
	public OrderState findOrderId(OrderState orderState) {
		return orderStateDao.findOrderId(orderState);
	}

	@Override
	public List<OrderState> queryByOrderState() {
		List<OrderState> orderStateList=orderStateDao.queryByOrderState();
		return orderStateList;
	}
	
}
