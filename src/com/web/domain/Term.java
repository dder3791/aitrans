package com.web.domain;


//术语表
public class Term {
	
	private int id ;//术语主键
	private String termOrigin;//术语原文
	private String termTarget;//术语译文
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTermOrigin() {
		return termOrigin;
	}
	public void setTermOrigin(String termOrigin) {
		this.termOrigin = termOrigin;
	}
	public String getTermTarget() {
		return termTarget;
	}
	public void setTermTarget(String termTarget) {

		this.termTarget = termTarget;
	}
	public Term(int id, String termOrigin, String termTarget) {
		super();
		this.id = id;
		this.termOrigin = termOrigin;
		this.termTarget = termTarget;
	}
	public Term(String termOrigin, String termTarget) {
		super();
		this.termOrigin = termOrigin;
		this.termTarget = termTarget;
	}
	public Term() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Term [id=" + id + ", termOrigin=" + termOrigin
				+ ", termTarget=" + termTarget + "]";
	}

	
}
