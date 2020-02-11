package com.web.domain;

public class Customer {
	private int id;//公司编号
	private String nameZH;//公司中文名
	private String address;//公司地址
	private String cel;//公司座机
	private String email;//公司email
	private String description;//公司描述
	private int type;//公司规模
	private int isForeign;//是否国外
	private String head;//公司负责人
	private int onlineState;//是否在线
	private String nameEN;//公司英文名字
	private String shortName;//公司名称缩写
	private String tel;//公司移动电话
	private String fax;//公司传真
	private String quotedPrice;//公司报价
	private String historicalQuotedPrice;//公司历史报价
	private String addDate;//公司注册时间
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNameZH() {
		return nameZH;
	}
	public void setNameZH(String nameZH) {
		this.nameZH = nameZH;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCel() {
		return cel;
	}
	public void setCel(String cel) {
		this.cel = cel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getIsForeign() {
		return isForeign;
	}
	public void setIsForeign(int isForeign) {
		this.isForeign = isForeign;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	public int getOnlineState() {
		return onlineState;
	}
	public void setOnlineState(int onlineState) {
		this.onlineState = onlineState;
	}
	public String getNameEN() {
		return nameEN;
	}
	public void setNameEN(String nameEN) {
		this.nameEN = nameEN;
	}
	public String getShortName() {
		return shortName;
	}
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getQuotedPrice() {
		return quotedPrice;
	}
	public void setQuotedPrice(String quotedPrice) {
		this.quotedPrice = quotedPrice;
	}
	public String getHistoricalQuotedPrice() {
		return historicalQuotedPrice;
	}
	public void setHistoricalQuotedPrice(String historicalQuotedPrice) {
		this.historicalQuotedPrice = historicalQuotedPrice;
	}
	public String getAddDate() {
		return addDate;
	}
	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}
	public Customer(int id, String nameZH, String address, String cel,
			String email, String description, int type, int isForeign,
			String head, int onlineState, String nameEN, String shortName,
			String tel, String fax, String quotedPrice,
			String historicalQuotedPrice, String addDate) {
		super();
		this.id = id;
		this.nameZH = nameZH;
		this.address = address;
		this.cel = cel;
		this.email = email;
		this.description = description;
		this.type = type;
		this.isForeign = isForeign;
		this.head = head;
		this.onlineState = onlineState;
		this.nameEN = nameEN;
		this.shortName = shortName;
		this.tel = tel;
		this.fax = fax;
		this.quotedPrice = quotedPrice;
		this.historicalQuotedPrice = historicalQuotedPrice;
		this.addDate = addDate;
	}
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Customer [id=" + id + ", nameZH=" + nameZH + ", address="
				+ address + ", cel=" + cel + ", email=" + email
				+ ", description=" + description + ", type=" + type
				+ ", isForeign=" + isForeign + ", head=" + head
				+ ", onlineState=" + onlineState + ", nameEN=" + nameEN
				+ ", shortName=" + shortName + ", tel=" + tel + ", fax=" + fax
				+ ", quotedPrice=" + quotedPrice + ", historicalQuotedPrice="
				+ historicalQuotedPrice + ", addDate=" + addDate + "]";
	}
	
	
	
}
