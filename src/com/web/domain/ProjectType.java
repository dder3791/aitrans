package com.web.domain;

public class ProjectType {

	private int id;
	private String projectType;//项目类型名称
	private String intro;//项目类型描述
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProjectType() {
		return projectType;
	}
	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public ProjectType(int id, String projectType, String intro) {
		super();
		this.id = id;
		this.projectType = projectType;
		this.intro = intro;
	}
	public ProjectType() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ProjectType [id=" + id + ", projectType=" + projectType
				+ ", intro=" + intro + "]";
	}
	
	
}
