package com.web.domain;

//翻译语言类型基础价格表
public class BasicPrice {
	
	private int id ;//翻译语言类型id
	private String type;//翻译语言类型
	private double basicPrice;//翻译语言基础价格
	public BasicPrice(String type, double basicPrice) {
		super();
		this.type = type;
		this.basicPrice = basicPrice;
	}
	public BasicPrice(int id, String type, double basicPrice) {
		super();
		this.id = id;
		this.type = type;
		this.basicPrice = basicPrice;
	}
	public BasicPrice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public double getBasicPrice() {
		return basicPrice;
	}
	public void setBasicPrice(double basicPrice) {
		this.basicPrice = basicPrice;
	}
	@Override
	public String toString() {
		return "BasicPrice [id=" + id + ", type=" + type + ", basicPrice="
				+ basicPrice + "]";
	}
	
	

}
