package com.web.domain;

public class OrderState {

	private int id; //状态Id
	private String orderState;//状态名称
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	public OrderState(int id, String orderState) {
		super();
		this.id = id;
		this.orderState = orderState;
	}
	public OrderState() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "OrderState [id=" + id + ", orderState=" + orderState + "]";
	}
	public OrderState(int id) {
		super();
		this.id = id;
	}
	public OrderState(String orderState) {
		super();
		this.orderState = orderState;
	}
	
	
	
}
