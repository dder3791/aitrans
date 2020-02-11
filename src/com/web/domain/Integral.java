package com.web.domain;

public class Integral {
	private int id;//商品id
	private String prize;//商品名称
	private String markMin;//所需积分数
	private String URL;//商品地址
	private int categoryId;//商品类别
	private String remark;//商品描述
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPrize() {
		return prize;
	}
	public void setPrize(String prize) {
		this.prize = prize;
	}
	public String getMarkMin() {
		return markMin;
	}
	public void setMarkMin(String markMin) {
		this.markMin = markMin;
	}
	public String getURL() {
		return URL;
	}
	public void setURL(String uRL) {
		URL = uRL;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integral(int id, String prize, String markMin, String uRL,
			int categoryId, String remark) {
		super();
		this.id = id;
		this.prize = prize;
		this.markMin = markMin;
		URL = uRL;
		this.categoryId = categoryId;
		this.remark = remark;
	}
	public Integral() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Integral [id=" + id + ", prize=" + prize + ", markMin="
				+ markMin + ", URL=" + URL + ", categoryId=" + categoryId
				+ ", remark=" + remark + "]";
	}
	
	
}
