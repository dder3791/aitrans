package com.web.domain;
//领域表
public class Domain {
	
	private int id ;//领域Id
	private String name; //领域名称
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public Domain() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Domain [id=" + id + ", name=" + name + "]";
	}
	public Domain(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public Domain(String name) {
		super();
		this.name = name;
	}

	
	

}
