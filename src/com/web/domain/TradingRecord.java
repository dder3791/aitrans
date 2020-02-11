package com.web.domain;

public class TradingRecord {

	private int id;
	private String type; //类型，充值，提现
	private String intro;//描述
	private String payer;//付款人（译员或用户Id）
	private String accountNumber;//（账单号）
	private String payeeModel;//收款方式
	private String payee;//收款人（译员或用户Id）
	private String payTime;//支付时间
	private String payModel;//支付方式  
	private String payState;//支付状态
	private double payMoney;//支付金额
	private int userType;//客户类型  0非平台用户（没登陆的用户）  1 客户   2译员
	
	
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
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
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getPayer() {
		return payer;
	}
	public void setPayer(String payer) {
		this.payer = payer;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getPayeeModel() {
		return payeeModel;
	}
	public void setPayeeModel(String payeeModel) {
		this.payeeModel = payeeModel;
	}
	public String getPayee() {
		return payee;
	}
	public void setPayee(String payee) {
		this.payee = payee;
	}
	public String getPayTime() {
		return payTime;
	}
	public void setPayTime(String payTime) {
		this.payTime = payTime;
	}
	public String getPayModel() {
		return payModel;
	}
	public void setPayModel(String payModel) {
		this.payModel = payModel;
	}
	public String getPayState() {
		return payState;
	}
	public void setPayState(String payState) {
		this.payState = payState;
	}
	public double getPayMoney() {
		return payMoney;
	}
	public void setPayMoney(double payMoney) {
		this.payMoney = payMoney;
	}
	@Override
	public String toString() {
		return "TradingRecord [id=" + id + ", type=" + type + ", intro="
				+ intro + ", payer=" + payer + ", accountNumber="
				+ accountNumber + ", payeeModel=" + payeeModel + ", payee="
				+ payee + ", payTime=" + payTime + ", payModel=" + payModel
				+ ", payState=" + payState + ", payMoney=" + payMoney + "]";
	}
	public TradingRecord(int id, String type, String intro, String payer,
			String accountNumber, String payeeModel, String payee,
			String payTime, String payModel, String payState, double payMoney) {
		super();
		this.id = id;
		this.type = type;
		this.intro = intro;
		this.payer = payer;
		this.accountNumber = accountNumber;
		this.payeeModel = payeeModel;
		this.payee = payee;
		this.payTime = payTime;
		this.payModel = payModel;
		this.payState = payState;
		this.payMoney = payMoney;
	}
	public TradingRecord() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
