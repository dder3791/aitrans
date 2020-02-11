package com.web.domain;

//评价信息
public class EvaluateClient {
	private int id ;
	private String understandLevel;//原文理解程度
	private String degreeOfSmooth;//译文通顺程度
	private String rigor;//译文严谨程度
	private String integrality;//翻译完整性（文件是否齐全twl）
	private String format;//格式排版
	private String completionSpeed;//完成速度
	private String score;//评价总分
	private String evaluateDetails;//评价内容
	private int state;//申诉状态
	private Order order;//订单
	private int orderId;//订单id
	
	//twl补充 时间 2017-12-11
	private String technicalDifficulties;//技术难度
	private String languageDifficulties;//语言难度
	
	private String technicalCorpus;//技术术语
	private String patentCorpus;//专利术语
	
	
	private String missingParagraph;//遗漏语段
	private String missingSentence;//遗漏句
	private String missingWord;//遗漏词
	private String syntaxError;//语法错误
	private String otherError;//其他错误
	//twl补充结束
	
	private String nickname;
	private String orderReference;
	private String generatedTime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUnderstandLevel() {
		return understandLevel;
	}
	public void setUnderstandLevel(String understandLevel) {
		this.understandLevel = understandLevel;
	}
	public String getDegreeOfSmooth() {
		return degreeOfSmooth;
	}
	public void setDegreeOfSmooth(String degreeOfSmooth) {
		this.degreeOfSmooth = degreeOfSmooth;
	}
	public String getRigor() {
		return rigor;
	}
	public void setRigor(String rigor) {
		this.rigor = rigor;
	}
	public String getIntegrality() {
		return integrality;
	}
	public void setIntegrality(String integrality) {
		this.integrality = integrality;
	}
	public String getFormat() {
		return format;
	}
	public void setFormat(String format) {
		this.format = format;
	}
	public String getCompletionSpeed() {
		return completionSpeed;
	}
	public void setCompletionSpeed(String completionSpeed) {
		this.completionSpeed = completionSpeed;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getEvaluateDetails() {
		return evaluateDetails;
	}
	public void setEvaluateDetails(String evaluateDetails) {
		this.evaluateDetails = evaluateDetails;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getOrderReference() {
		return orderReference;
	}
	public void setOrderReference(String orderReference) {
		this.orderReference = orderReference;
	}
	public String getGeneratedTime() {
		return generatedTime;
	}
	public void setGeneratedTime(String generatedTime) {
		this.generatedTime = generatedTime;
	}
	
	
	
	public String getTechnicalDifficulties() {
		return technicalDifficulties;
	}
	public void setTechnicalDifficulties(String technicalDifficulties) {
		this.technicalDifficulties = technicalDifficulties;
	}
	public String getLanguageDifficulties() {
		return languageDifficulties;
	}
	public void setLanguageDifficulties(String languageDifficulties) {
		this.languageDifficulties = languageDifficulties;
	}
	public String getMissingParagraph() {
		return missingParagraph;
	}
	public void setMissingParagraph(String missingParagraph) {
		this.missingParagraph = missingParagraph;
	}
	public String getMissingWord() {
		return missingWord;
	}
	public void setMissingWord(String missingWord) {
		this.missingWord = missingWord;
	}
	public String getSyntaxError() {
		return syntaxError;
	}
	public void setSyntaxError(String syntaxError) {
		this.syntaxError = syntaxError;
	}
	public String getOtherError() {
		return otherError;
	}
	public void setOtherError(String otherError) {
		this.otherError = otherError;
	}
	public EvaluateClient() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public String getTechnicalCorpus() {
		return technicalCorpus;
	}
	public void setTechnicalCorpus(String technicalCorpus) {
		this.technicalCorpus = technicalCorpus;
	}
	public String getPatentCorpus() {
		return patentCorpus;
	}
	public void setPatentCorpus(String patentCorpus) {
		this.patentCorpus = patentCorpus;
	}
	public String getMissingSentence() {
		return missingSentence;
	}
	public void setMissingSentence(String missingSentence) {
		this.missingSentence = missingSentence;
	}
	public EvaluateClient(int id, String understandLevel,
			String degreeOfSmooth, String rigor, String integrality,
			String format, String completionSpeed, String score,
			String evaluateDetails, int state, Order order, int orderId,
			String technicalDifficulties, String languageDifficulties,
			String technicalCorpus, String patentCorpus,
			String missingParagraph, String missingSentence,
			String missingWord, String syntaxError, String otherError,
			String nickname, String orderReference, String generatedTime) {
		super();
		this.id = id;
		this.understandLevel = understandLevel;
		this.degreeOfSmooth = degreeOfSmooth;
		this.rigor = rigor;
		this.integrality = integrality;
		this.format = format;
		this.completionSpeed = completionSpeed;
		this.score = score;
		this.evaluateDetails = evaluateDetails;
		this.state = state;
		this.order = order;
		this.orderId = orderId;
		this.technicalDifficulties = technicalDifficulties;
		this.languageDifficulties = languageDifficulties;
		this.technicalCorpus = technicalCorpus;
		this.patentCorpus = patentCorpus;
		this.missingParagraph = missingParagraph;
		this.missingSentence = missingSentence;
		this.missingWord = missingWord;
		this.syntaxError = syntaxError;
		this.otherError = otherError;
		this.nickname = nickname;
		this.orderReference = orderReference;
		this.generatedTime = generatedTime;
	}
	@Override
	public String toString() {
		return "EvaluateClient [id=" + id + ", understandLevel="
				+ understandLevel + ", degreeOfSmooth=" + degreeOfSmooth
				+ ", rigor=" + rigor + ", integrality=" + integrality
				+ ", format=" + format + ", completionSpeed=" + completionSpeed
				+ ", score=" + score + ", evaluateDetails=" + evaluateDetails
				+ ", state=" + state + ", order=" + order + ", orderId="
				+ orderId + ", technicalDifficulties=" + technicalDifficulties
				+ ", languageDifficulties=" + languageDifficulties
				+ ", technicalCorpus=" + technicalCorpus + ", patentCorpus="
				+ patentCorpus + ", missingParagraph=" + missingParagraph
				+ ", missingSentence=" + missingSentence + ", missingWord="
				+ missingWord + ", syntaxError=" + syntaxError
				+ ", otherError=" + otherError + ", nickname=" + nickname
				+ ", orderReference=" + orderReference + ", generatedTime="
				+ generatedTime + "]";
	}
	
	

	
	
}
