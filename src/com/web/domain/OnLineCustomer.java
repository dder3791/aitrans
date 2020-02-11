package com.web.domain;

public class OnLineCustomer {

	private int id;
	private String nameZH;//中文名称
	private String nameEN;//英文名称
	private String nameShort;//简称
	private int size;//员工数量
	private String scope;//营业范围
	private String address;//常用地址
	private String Ltd;//官网
	private String cel;//固定电话
	private String tel;//移动电话
	private String intro;//公司简介
	private String registrationURL;//营业执照上传路劲
	private String registrationNumber;//营业执照注册号
	private String contact;//企业联系人
	private int clientUserId;//企业联系人Id
	private String registrationAddress;//营业执照地址
	private String registrationAddressEN;//营业执照英文地址
	private String fax;//公司传真
	private String country;//国家
	private String countryEN;//英文国家
	private String introEN;//中文简介
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
	public String getNameEN() {
		return nameEN;
	}
	public void setNameEN(String nameEN) {
		this.nameEN = nameEN;
	}
	public String getNameShort() {
		return nameShort;
	}
	public void setNameShort(String nameShort) {
		this.nameShort = nameShort;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public String getScope() {
		return scope;
	}
	public void setScope(String scope) {
		this.scope = scope;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLtd() {
		return Ltd;
	}
	public void setLtd(String ltd) {
		Ltd = ltd;
	}
	public String getCel() {
		return cel;
	}
	public void setCel(String cel) {
		this.cel = cel;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getRegistrationURL() {
		return registrationURL;
	}
	public void setRegistrationURL(String registrationURL) {
		this.registrationURL = registrationURL;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public int getClientUserId() {
		return clientUserId;
	}
	public void setClientUserId(int clientUserId) {
		this.clientUserId = clientUserId;
	}
	
	
	public String getRegistrationNumber() {
		return registrationNumber;
	}
	public void setRegistrationNumber(String registrationNumber) {
		this.registrationNumber = registrationNumber;
	}
	
	
	public String getRegistrationAddress() {
		return registrationAddress;
	}
	public void setRegistrationAddress(String registrationAddress) {
		this.registrationAddress = registrationAddress;
	}
	
	
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	
	
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	
	public String getRegistrationAddressEN() {
		return registrationAddressEN;
	}
	public void setRegistrationAddressEN(String registrationAddressEN) {
		this.registrationAddressEN = registrationAddressEN;
	}
	
	
	public String getCountryEN() {
		return countryEN;
	}
	public void setCountryEN(String countryEN) {
		this.countryEN = countryEN;
	}
	
	
	
	public String getIntroEN() {
		return introEN;
	}
	public void setIntroEN(String introEN) {
		this.introEN = introEN;
	}
	
	public OnLineCustomer(int id, String nameZH, String nameEN,
			String nameShort, int size, String scope, String address,
			String ltd, String cel, String tel, String intro,
			String registrationURL, String registrationNumber, String contact,
			int clientUserId, String registrationAddress, String fax,
			String country) {
		super();
		this.id = id;
		this.nameZH = nameZH;
		this.nameEN = nameEN;
		this.nameShort = nameShort;
		this.size = size;
		this.scope = scope;
		this.address = address;
		Ltd = ltd;
		this.cel = cel;
		this.tel = tel;
		this.intro = intro;
		this.registrationURL = registrationURL;
		this.registrationNumber = registrationNumber;
		this.contact = contact;
		this.clientUserId = clientUserId;
		this.registrationAddress = registrationAddress;
		this.fax = fax;
		this.country = country;
	}
	
	
	public OnLineCustomer() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "OnLineCustomer [id=" + id + ", nameZH=" + nameZH + ", nameEN="
				+ nameEN + ", nameShort=" + nameShort + ", size=" + size
				+ ", scope=" + scope + ", address=" + address + ", Ltd=" + Ltd
				+ ", cel=" + cel + ", tel=" + tel + ", intro=" + intro
				+ ", registrationURL=" + registrationURL
				+ ", registrationNumber=" + registrationNumber + ", contact="
				+ contact + ", clientUserId=" + clientUserId
				+ ", registrationAddress=" + registrationAddress + ", fax="
				+ fax + ", country=" + country + "]";
	}
	
	
	
}
