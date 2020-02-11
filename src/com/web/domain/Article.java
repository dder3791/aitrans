package com.web.domain;

public class Article {
	
	private int id ;//资讯信息id
	private int hot ;//资讯信息热度
	private int elite ;//资讯信息精品度
	private String title ;//资讯信息标题
	private String issueDate ;//资讯信息发布日期
	private String context ;//资讯信息内容
	private String auther ;//资讯信息作者
	private String type ; //资讯类型
	private String url ;
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Article() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Article [id=" + id + ", hot=" + hot + ", elite=" + elite
				+ ", title=" + title + ", issueDate=" + issueDate
				+ ", context=" + context + ", auther=" + auther + ", type="
				+ type + "]";
	}
	public Article(int hot, int elite, String title, String issueDate,
			String context, String auther,String type,String url) {
		super();
		this.hot = hot;
		this.elite = elite;
		this.title = title;
		this.issueDate = issueDate;
		this.context = context;
		this.auther = auther;
		this.type = type;
		this.url = url;
	}
	public Article(int id, int hot, int elite, String title, String issueDate,
			String context, String auther,String type,String url) {
		super();
		this.id = id;
		this.hot = hot;
		this.elite = elite;
		this.title = title;
		this.issueDate = issueDate;
		this.context = context;
		this.auther = auther;
		this.type = type;
		this.url  =  url;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getHot() {
		return hot;
	}
	public void setHot(int hot) {
		this.hot = hot;
	}
	public int getElite() {
		return elite;
	}
	public void setElite(int elite) {
		this.elite = elite;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIssueDate() {
		return issueDate;
	}
	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getAuther() {
		return auther;
	}
	public void setAuther(String auther) {
		this.auther = auther;
	}
	
	

}
