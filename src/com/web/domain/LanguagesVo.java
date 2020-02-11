package com.web.domain;

import java.util.List;

public class LanguagesVo {
	
	private String languageName;
	
	private List<Quotation> quoList;

	public String getLanguageName() {
		return languageName;
	}

	public void setLanguageName(String languageName) {
		this.languageName = languageName;
	}

	public List<Quotation> getQuoList() {
		return quoList;
	}

	public void setQuoList(List<Quotation> quoList) {
		this.quoList = quoList;
	}
	
	

}
