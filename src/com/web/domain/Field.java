package com.web.domain;
//翻译领域系数表
public class Field {
	
	private int id;//翻译领域系数id
	private String field;//翻译领域类型
	private double factor;//翻译领域系数

	public Field(String field, double factor) {
		super();
		this.field = field;
		this.factor = factor;
	}

	public Field(int id, String field, double factor) {
		super();
		this.id = id;
		this.field = field;
		this.factor = factor;
	}

	public Field() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public double getFactor() {
		return factor;
	}

	public void setFactor(double factor) {
		this.factor = factor;
	}

	@Override
	public String toString() {
		return "Field [id=" + id + ", field=" + field + ", factor=" + factor
				+ "]";
	}

}
