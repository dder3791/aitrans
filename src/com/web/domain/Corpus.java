package com.web.domain;

//语料表
public class Corpus {
	private int id;//语料主键
	private String corpusOrigin;//语料原文
	private String corpusTarget;//语料译文

	public Corpus(int id, String corpusOrigin, String corpusTarget) {
		super();
		this.id = id;
		this.corpusOrigin = corpusOrigin;
		this.corpusTarget = corpusTarget;
	}

	public Corpus() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Corpus(String corpusOrigin, String corpusTarget) {
		super();
		this.corpusOrigin = corpusOrigin;
		this.corpusTarget = corpusTarget;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCorpusOrigin() {
		return corpusOrigin;
	}

	public void setCorpusOrigin(String corpusOrigin) {
		this.corpusOrigin = corpusOrigin;
	}

	public String getCorpusTarget() {
		return corpusTarget;
	}

	public void setCorpusTarget(String corpusTarget) {
		this.corpusTarget = corpusTarget;
	}

	@Override
	public String toString() {
		return "Corpus [id=" + id + ", corpusOrigin=" + corpusOrigin
				+ ", corpusTarget=" + corpusTarget + "]";
	}

}
