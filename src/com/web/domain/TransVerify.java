package com.web.domain;

//译员验证表
public class TransVerify {
    
	private int id;//验证id
	private String realName;//真实姓名
	private String IdCard;//身份证
	private String frontUrl;//正面照
	private String reverseUrl;//反面照
	private int translatorId;//译员外键
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getFrontUrl() {
		return frontUrl;
	}
	public void setFrontUrl(String frontUrl) {
		this.frontUrl = frontUrl;
	}
	public String getReverseUrl() {
		return reverseUrl;
	}
	public void setReverseUrl(String reverseUrl) {
		this.reverseUrl = reverseUrl;
	}
	public int getTranslatorId() {
		return translatorId;
	}
	public void setTranslatorId(int translatorId) {
		this.translatorId = translatorId;
	}
	public String getIdCard() {
		return IdCard;
	}
	public void setIdCard(String idCard) {
		IdCard = idCard;
	}
	
	
}
