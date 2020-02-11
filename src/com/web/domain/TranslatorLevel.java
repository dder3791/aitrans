package com.web.domain;

//译员等级系数表
public class TranslatorLevel {
	
	private int id ;//译员等级id
	private String level;//译员等级
	private double factor;//译员等级系数
	public TranslatorLevel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TranslatorLevel(String level, double factor) {
		super();
		this.level = level;
		this.factor = factor;
	}
	public TranslatorLevel(int id, String level, double factor) {
		super();
		this.id = id;
		this.level = level;
		this.factor = factor;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public double getFactor() {
		return factor;
	}
	public void setFactor(double factor) {
		this.factor = factor;
	}
	@Override
	public String toString() {
		return "TranslatorLevel [id=" + id + ", level=" + level + ", factor="
				+ factor + "]";
	}
	
	

}
