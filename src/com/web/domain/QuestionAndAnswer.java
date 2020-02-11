package com.web.domain;

public class QuestionAndAnswer {
	
	private int id ;//常见问题表主键ID
	private String type ;//常见问题类型
	private String question ;//问题
	private String answer ;//问题回答
	public QuestionAndAnswer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QuestionAndAnswer(String type, String question, String answer) {
		super();
		this.type = type;
		this.question = question;
		this.answer = answer;
	}
	public QuestionAndAnswer(int id, String type, String question,
			String answer) {
		super();
		this.id = id;
		this.type = type;
		this.question = question;
		this.answer = answer;
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
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	

}
