package com.web.domain;

public class ClientCustomerNeed {

	private int id;//需求id	
	private String languagePair;//语言类型
	private int domainId;//领域类型
	private int procedureTypeId;//流程类型
	private int transLevel;//等级类型
	private String tel;//联系方式
	private String qq;//QQ号码
	private String description;//需求描述
	private int clientUserId;//用户ID
	private double totalMoney;//总金额
	private int length;//总字数
	private String cycle;//是否加急
	private String title;//需求标题
	private String fileURL;//上传文件路径
	private String publishModel;//发布模式
	private String completeTime;//需求结束时间
	private String publishTime;//需求发布时间
	private String acceptState;//需求状态
	private String EXPIRYDATE;//有效期
	private String needReference;//需求号
	private double moneyKilo;//需求单价
	private double transSingle;//针对内部客户--译员收入单价
	private double transTotal;//针对内部客户--译员收入总价
	private int clientProjectTypeId;//项目类型ID
	
	public double getMoneyKilo() {
		return moneyKilo;
	}
	public void setMoneyKilo(double moneyKilo) {
		this.moneyKilo = moneyKilo;
	}
	public String getNeedReference() {
		return needReference;
	}
	public void setNeedReference(String needReference) {
		this.needReference = needReference;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLanguagePair() {
		return languagePair;
	}
	public void setLanguagePair(String languagePair) {
		this.languagePair = languagePair;
	}
	public int getDomainId() {
		return domainId;
	}
	public void setDomainId(int domainId) {
		this.domainId = domainId;
	}
	public int getProcedureTypeId() {
		return procedureTypeId;
	}
	public void setProcedureTypeId(int procedureTypeId) {
		this.procedureTypeId = procedureTypeId;
	}
	public int getTransLevel() {
		return transLevel;
	}
	public void setTransLevel(int transLevel) {
		this.transLevel = transLevel;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getClientUserId() {
		return clientUserId;
	}
	public void setClientUserId(int clientUserId) {
		this.clientUserId = clientUserId;
	}
	public double getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(double totalMoney) {
		this.totalMoney = totalMoney;
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	public String getCycle() {
		return cycle;
	}
	public void setCycle(String cycle) {
		this.cycle = cycle;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getFileURL() {
		return fileURL;
	}
	public void setFileURL(String fileURL) {
		this.fileURL = fileURL;
	}
	public String getPublishModel() {
		return publishModel;
	}
	public void setPublishModel(String publishModel) {
		this.publishModel = publishModel;
	}
	
	public String getCompleteTime() {
		return completeTime;
	}
	public void setCompleteTime(String completeTime) {
		this.completeTime = completeTime;
	}
	
	public String getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(String publishTime) {
		this.publishTime = publishTime;
	}
	
	public String getAcceptState() {
		return acceptState;
	}
	public void setAcceptState(String acceptState) {
		this.acceptState = acceptState;
	}
	
	public String getEXPIRYDATE() {
		return EXPIRYDATE;
	}
	public void setEXPIRYDATE(String eXPIRYDATE) {
		EXPIRYDATE = eXPIRYDATE;
	}
	public ClientCustomerNeed(int id, String languagePair, int domainId,
			int procedureTypeId, int transLevel, String tel, String qq,
			String description, int clientUserId, double totalMoney,
			int length, String cycle, String title,String fileURL,String publishModel,String completeTime) {
		super();
		this.id = id;
		this.languagePair = languagePair;
		this.domainId = domainId;
		this.procedureTypeId = procedureTypeId;
		this.transLevel = transLevel;
		this.tel = tel;
		this.qq = qq;
		this.description = description;
		this.clientUserId = clientUserId;
		this.totalMoney = totalMoney;
		this.length = length;
		this.cycle = cycle;//是否加急
		this.title = title;
		this.fileURL = fileURL;
		this.publishModel = publishModel;
		this.completeTime=completeTime;
	}
	public ClientCustomerNeed() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public ClientCustomerNeed(String languagePair, int domainId,
			int procedureTypeId, int transLevel, String tel, String qq,
			String description, int clientUserId, double totalMoney,
			int length, String cycle, String title,String fileURL,String publishModel,String completeTime) {
		super();
		this.languagePair = languagePair;
		this.domainId = domainId;
		this.procedureTypeId = procedureTypeId;
		this.transLevel = transLevel;
		this.tel = tel;
		this.qq = qq;
		this.description = description;
		this.clientUserId = clientUserId;
		this.totalMoney = totalMoney;
		this.length = length;
		this.cycle = cycle;
		this.title = title;
		this.fileURL = fileURL;
		this.publishModel = publishModel;
		this.completeTime=completeTime;
	}
	
	
	public double getTransSingle() {
		return transSingle;
	}
	public void setTransSingle(double transSingle) {
		this.transSingle = transSingle;
	}
	public double getTransTotal() {
		return transTotal;
	}
	public void setTransTotal(double transTotal) {
		this.transTotal = transTotal;
	}
	
	
	public int getClientProjectTypeId() {
		return clientProjectTypeId;
	}
	public void setClientProjectTypeId(int clientProjectTypeId) {
		this.clientProjectTypeId = clientProjectTypeId;
	}
	@Override
	public String toString() {
		return "ClientCustomerNeed [id=" + id + ", languagePair="
				+ languagePair + ", domainId=" + domainId
				+ ", procedureTypeId=" + procedureTypeId + ", transLevel="
				+ transLevel + ", tel=" + tel + ", qq=" + qq + ", description="
				+ description + ", clientUserId=" + clientUserId
				+ ", totalMoney=" + totalMoney + ", length=" + length
				+ ", cycle=" + cycle + ", title=" + title + "]";
	}
	
	
	
}
