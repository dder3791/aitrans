package com.web.domain;

public class AppealClient {
    
	private int id;
	private int translatorId;//译员外键
	private int orderId;//订单外键
	private String cause;//申诉原因
	private String appealDate;//申诉时间
	private int appealstate;//申诉状态
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTranslatorId() {
		return translatorId;
	}
	public void setTranslatorId(int translatorId) {
		this.translatorId = translatorId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getCause() {
		return cause;
	}
	public void setCause(String cause) {
		this.cause = cause;
	}
	public String getAppealDate() {
		return appealDate;
	}
	public void setAppealDate(String appealDate) {
		this.appealDate = appealDate;
	}
	public int getAppealstate() {
		return appealstate;
	}
	public void setAppealstate(int appealstate) {
		this.appealstate = appealstate;
	}
	 
	
	
}
