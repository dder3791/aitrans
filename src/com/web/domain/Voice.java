package com.web.domain;

public class Voice {
   
	private int id;
	private String name;
	private String tel;
	private String email;
	private String voiceTitle;
	private String voiceContent;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	 
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getVoiceTitle() {
		return voiceTitle;
	}
	public void setVoiceTitle(String voiceTitle) {
		this.voiceTitle = voiceTitle;
	}
	public String getVoiceContent() {
		return voiceContent;
	}
	public void setVoiceContent(String voiceContent) {
		this.voiceContent = voiceContent;
	}
	@Override
	public String toString() {
		return "Voice [id=" + id + ", name=" + name + ", tel=" + tel
				+ ", email=" + email + ", voiceTitle=" + voiceTitle
				+ ", voiceContent=" + voiceContent + "]";
	}
	 
	
}
