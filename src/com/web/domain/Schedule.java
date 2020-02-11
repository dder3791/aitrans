package com.web.domain;
//周期系数表
public class Schedule {
	
	private int id ;//周期系数id
	private String schedule;//周期类型
	private double factor;//周期系数
	public Schedule(String schedule, double factor) {
		super();
		this.schedule = schedule;
		this.factor = factor;
	}
	public Schedule() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Schedule(int id, String schedule, double factor) {
		super();
		this.id = id;
		this.schedule = schedule;
		this.factor = factor;
	}
	@Override
	public String toString() {
		return "Schedule [id=" + id + ", schedule=" + schedule + ", factor="
				+ factor + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSchedule() {
		return schedule;
	}
	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}
	public double getFactor() {
		return factor;
	}
	public void setFactor(double factor) {
		this.factor = factor;
	}
	

}
