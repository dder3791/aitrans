package com.web.domain;

public class ProcedureType {
	private int id;//翻译流程编号
	private String procedureType;//翻译流程名称
	private String description;//翻译流程描述
	
	
	public ProcedureType() {
		super();
	}
	
	public ProcedureType(int id, String procedureType, String description) {
		super();
		this.id = id;
		this.procedureType = procedureType;
		this.description = description;
	}

	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProcedureType() {
		return procedureType;
	}

	public void setProcedureType(String procedureType) {
		this.procedureType = procedureType;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	
	@Override
	public String toString() {
		return "ProcedureType [id=" + id + ", procedure=" + procedureType
				+ ", description=" + description + "]";
	}
	
	
	
}
