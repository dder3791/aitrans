package com.web.domain;

public class Agreetment {
	
	private int id ;//协议表主键
	private String agreetment ;//协议人的类型
	private String items ;//协议条款
	private String publisher ;//协议发布人
	private String date ;//协议发布日期
	public Agreetment() {
		super();
		// TODO Auto-g     enerated constructor stub
	}
	public Agreetment(String agreetment, String items, String publisher,
			String date) {
		super();
		this.agreetment = agreetment;
		this.items = items;
		this.publisher = publisher;
		this.date = date;
	}
	public Agreetment(int id, String agreetment, String items,
			String publisher, String date) {
		super();
		this.id = id;
		this.agreetment = agreetment;
		this.items = items;
		this.publisher = publisher;
		this.date = date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAgreetment() {
		return agreetment;
	}
	public void setAgreetment(String agreetment) {
		this.agreetment = agreetment;
	}
	public String getItems() {
		return items;
	}
	public void setItems(String items) {
		this.items = items;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
}
