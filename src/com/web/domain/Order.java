package com.web.domain;

//译员订单信息表
public class Order {
    
	private int id;//订单id
	private String orderNumber;//订单编号
	private String orderReference;//订单案号
	private String generatedTime;//订单生成时间
	private double payNumber;//支付金额
	private String transTime;//翻译时间
	private String prooTime;//校对时间
	private String expertTime;//专家审核时间
	private String examinationTime;//返稿时间
	private String signTime;//客户签收时间
	private String customerEvaluate;//客户评价时间
	private String completeTime;//完成时间
	private int payState;//支付状态
	private String orderTitle;//订单标题
	private int taskStateId;//任务状态
	private String fileUrl;//文件地址
	private int clientUserId;//客户外键
	private int clientCustomerNeedId;//需求外键
	private int translatorid;//译员外键
	private int evaluateId;//评价
	private String transUrl;//翻译文件地址
	private String prooUrl;//校对文件地址
	private String auditUrl;//审核文件地址
	private String rejection;//拒绝理由
	private String rejected;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
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
	public double getPayNumber() {
		return payNumber;
	}
	public void setPayNumber(double payNumber) {
		this.payNumber = payNumber;
	}
	public String getTransTime() {
		return transTime;
	}
	public void setTransTime(String transTime) {
		this.transTime = transTime;
	}
	public String getProoTime() {
		return prooTime;
	}
	public void setProoTime(String prooTime) {
		this.prooTime = prooTime;
	}
	public String getExpertTime() {
		return expertTime;
	}
	public void setExpertTime(String expertTime) {
		this.expertTime = expertTime;
	}
	public String getExaminationTime() {
		return examinationTime;
	}
	public void setExaminationTime(String examinationTime) {
		this.examinationTime = examinationTime;
	}
	public String getSignTime() {
		return signTime;
	}
	public void setSignTime(String signTime) {
		this.signTime = signTime;
	}
	public String getCustomerEvaluate() {
		return customerEvaluate;
	}
	public void setCustomerEvaluate(String customerEvaluate) {
		this.customerEvaluate = customerEvaluate;
	}
	public String getCompleteTime() {
		return completeTime;
	}
	public void setCompleteTime(String completeTime) {
		this.completeTime = completeTime;
	}
	public int getPayState() {
		return payState;
	}
	public void setPayState(int payState) {
		this.payState = payState;
	}
	
	public int getTaskStateId() {
		return taskStateId;
	}
	public void setTaskStateId(int taskStateId) {
		this.taskStateId = taskStateId;
	}
	public String getFileUrl() {
		return fileUrl;
	}
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	public int getClientUserId() {
		return clientUserId;
	}
	public void setClientUserId(int clientUserId) {
		this.clientUserId = clientUserId;
	}
	public int getClientCustomerNeedId() {
		return clientCustomerNeedId;
	}
	public void setClientCustomerNeedId(int clientCustomerNeedId) {
		this.clientCustomerNeedId = clientCustomerNeedId;
	}
	public int getTranslatorid() {
		return translatorid;
	}
	public void setTranslatorid(int translatorid) {
		this.translatorid = translatorid;
	}
	public int getEvaluateId() {
		return evaluateId;
	}
	public void setEvaluateId(int evaluateId) {
		this.evaluateId = evaluateId;
	}
	public String getOrderTitle() {
		return orderTitle;
	}
	public void setOrderTitle(String orderTitle) {
		this.orderTitle = orderTitle;
	}
	public Order(int id, String orderNumber, String orderReference,
			String generatedTime, double payNumber, String transTime,
			String prooTime, String expertTime, String examinationTime,
			String signTime, String customerEvaluate, String completeTime,
			int payState, String orderTitle, int taskStateId, String fileUrl,
			int clientUserId, int clientCustomerNeedId, int translatorid,
			int evaluateId) {
		super();
		this.id = id;
		this.orderNumber = orderNumber;
		this.orderReference = orderReference;
		this.generatedTime = generatedTime;
		this.payNumber = payNumber;
		this.transTime = transTime;
		this.prooTime = prooTime;
		this.expertTime = expertTime;
		this.examinationTime = examinationTime;
		this.signTime = signTime;
		this.customerEvaluate = customerEvaluate;
		this.completeTime = completeTime;
		this.payState = payState;
		this.orderTitle = orderTitle;
		this.taskStateId = taskStateId;
		this.fileUrl = fileUrl;
		this.clientUserId = clientUserId;
		this.clientCustomerNeedId = clientCustomerNeedId;
		this.translatorid = translatorid;
		this.evaluateId = evaluateId;
	}
	public Order() {
		super();
	}
	public Order(int id) {
		super();
		this.id = id;
	}
	
	public String getTransUrl() {
		return transUrl;
	}
	public void setTransUrl(String transUrl) {
		this.transUrl = transUrl;
	}
	public String getProoUrl() {
		return prooUrl;
	}
	public void setProoUrl(String prooUrl) {
		this.prooUrl = prooUrl;
	}
	public String getAuditUrl() {
		return auditUrl;
	}
	public void setAuditUrl(String auditUrl) {
		this.auditUrl = auditUrl;
	}
	
	
	public String getRejected() {
		return rejected;
	}
	public void setRejected(String rejected) {
		this.rejected = rejected;
	}
	
	public String getRejection() {
		return rejection;
	}
	public void setRejection(String rejection) {
		this.rejection = rejection;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", orderNumber=" + orderNumber
				+ ", orderReference=" + orderReference + ", generatedTime="
				+ generatedTime + ", payNumber=" + payNumber + ", transTime="
				+ transTime + ", prooTime=" + prooTime + ", expertTime="
				+ expertTime + ", examinationTime=" + examinationTime
				+ ", signTime=" + signTime + ", customerEvaluate="
				+ customerEvaluate + ", completeTime=" + completeTime
				+ ", payState=" + payState + ", orderTitle=" + orderTitle
				+ ", taskStateId=" + taskStateId + ", fileUrl=" + fileUrl
				+ ", clientUserId=" + clientUserId + ", clientCustomerNeedId="
				+ clientCustomerNeedId + ", translatorid=" + translatorid
				+ ", evaluateId=" + evaluateId + "]";
	}
	 
	
	
	 
	 
	
	
}