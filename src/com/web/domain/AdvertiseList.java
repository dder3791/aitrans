package com.web.domain;

public class AdvertiseList {

	private int id;
	private String nameCH;
	private String nameEN;
	private String countryCH;
	private String countryEN;
	private String introCH;
	private String introEN;
	private String province;
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}

	private String isUseFul;
	private String type;
	private int userId;
	private String web;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNameCH() {
		return nameCH;
	}
	public void setNameCH(String nameCH) {
		this.nameCH = nameCH;
	}
	public String getNameEN() {
		return nameEN;
	}
	public void setNameEN(String nameEN) {
		this.nameEN = nameEN;
	}
	public String getCountryCH() {
		return countryCH;
	}
	public void setCountryCH(String countryCH) {
		this.countryCH = countryCH;
	}
	public String getCountryEN() {
		return countryEN;
	}
	public void setCountryEN(String countryEN) {
		this.countryEN = countryEN;
	}
	public String getIntroCH() {
		return introCH;
	}
	public void setIntroCH(String introCH) {
		this.introCH = introCH;
	}
	public String getIntroEN() {
		return introEN;
	}
	public void setIntroEN(String introEN) {
		this.introEN = introEN;
	}
	public String getIsUseFul() {
		return isUseFul;
	}
	public void setIsUseFul(String isUseFul) {
		this.isUseFul = isUseFul;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getWeb() {
		return web;
	}
	public void setWeb(String web) {
		this.web = web;
	}
	public AdvertiseList(int id, String nameCH, String nameEN,
			String countryCH, String countryEN, String introCH, String introEN,
			 String isUseFul, String type, int userId,
			String web) {
		super();
		this.id = id;
		this.nameCH = nameCH;
		this.nameEN = nameEN;
		this.countryCH = countryCH;
		this.countryEN = countryEN;
		this.introCH = introCH;
		this.introEN = introEN;
		this.isUseFul = isUseFul;
		this.type = type;
		this.userId = userId;
		this.web = web;
	}
	public AdvertiseList() {
		super();
	}
	
	@Override
	public String toString() {
		return "AdvertiseList [id=" + id + ", nameCH=" + nameCH + ", nameEN="
				+ nameEN + ", countryCH=" + countryCH + ", countryEN="
				+ countryEN + ", introCH=" + introCH + ", introEN=" + introEN
				+ ", isUseFul=" + isUseFul
				+ ", type=" + type + ", userId=" + userId + ", web=" + web
				+ "]";
	}
	
	
	
}
