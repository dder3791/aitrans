package com.web.domain;

public class ClientCustomerNeedTrans {

	private int clientCustomerNeedId;
	private int translatorId;
	public int getClientCustomerNeedId() {
		return clientCustomerNeedId;
	}
	public void setClientCustomerNeedId(int clientCustomerNeedId) {
		this.clientCustomerNeedId = clientCustomerNeedId;
	}
	public int getTranslatorId() {
		return translatorId;
	}
	public void setTranslatorId(int translatorId) {
		this.translatorId = translatorId;
	}
	public ClientCustomerNeedTrans(int clientCustomerNeedId, int translatorId) {
		//super();
		this.clientCustomerNeedId = clientCustomerNeedId;
		this.translatorId = translatorId;
	}
	public ClientCustomerNeedTrans() {
		//super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ClientCustomerNeed_trans [ClientCustomerNeedId="
				+clientCustomerNeedId + ", translatorId=" + translatorId + "]";
	}
	
	
}
