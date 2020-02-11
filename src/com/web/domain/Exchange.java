package com.web.domain;

public class Exchange {

	private int id;//id
	private int usId;//用户Id
	private int integralId;//商品Id
	private String exchangeTime;//对换时间
	private String exchangeState;//兑换状态
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUsId() {
		return usId;
	}
	public void setUsId(int usId) {
		this.usId = usId;
	}
	public int getIntegralId() {
		return integralId;
	}
	public void setIntegralId(int integralId) {
		this.integralId = integralId;
	}
	public String getExchangeTime() {
		return exchangeTime;
	}
	public void setExchangeTime(String exchangeTime) {
		this.exchangeTime = exchangeTime;
	}
	public String getExchangeState() {
		return exchangeState;
	}
	public void setExchangeState(String exchangeState) {
		this.exchangeState = exchangeState;
	}
	public Exchange(int id, int usId, int integralId, String exchangeTime,
			String exchangeState) {
		super();
		this.id = id;
		this.usId = usId;
		this.integralId = integralId;
		this.exchangeTime = exchangeTime;
		this.exchangeState = exchangeState;
	}
	public Exchange() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Exchange [id=" + id + ", usId=" + usId + ", integralId=" + integralId
				+ ", exchangeTime=" + exchangeTime + ", exchangeState="
				+ exchangeState + "]";
	}
	
	
}
