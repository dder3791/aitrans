package com.web.domain;

import java.util.Date;
import java.util.List;

public class Translator {
	private Integer id;
	private String realName;//真实姓名
	private String nickname;//昵称
	private Integer gender;//性别
	private String birthday;//生日
	private String nameid;//身份证号
	private String userUrl;//个人头像
	private String worksTarget;//作品译文
	private String worksOrigin;//作品原文
	private String worksUrl;
	private String workDescribe;//作品描述
	private String job;//职业信息
	private String isObey;//是否服从分配
	private Date registerTime;//注册时间
	private String email;//邮箱
	private String tel;//电话,+座机
	private String address;//住址
	private String ip;//ip
	private Double tranPrice;//翻译价格
	private Double prooPrice;//校对价格
	private Integer dayTrans;//日翻译量
	private Integer transtionId;//译员id
	private Integer transTotal;//翻译总字数
	private Integer prooTotal;//校对总字数
	private Integer isToolUse;//是否使用软件
	private String description;//详细描述
	private Integer onlineState;//在线状态
	private String accountName;//账户名
	private String password;//密码
	private String softType;//软件类型
	private Integer point;//积分
	private String domain;//翻译领域
	private String language;//擅长语言
	private String tranExperience;
	private String prooExperience;
	private Integer cooperativeState;//协同状态
	private Integer level;//等级
	private String major;//专业名称
	private String degree;//最高学历
	private Integer majorId;//专业id
	private String credentialsSalt;//安全认证码
	private String roleName;//角色姓名
	private String state;//当前状态
	private String evaluateid;
	private String accountNumber;//银行账户
	private String openingBank;//开户行
	private Double auditPrice;//审核价格
	private Integer auditTotal;//审核总字数
	private Integer transCount;//翻译总字数
	private Integer prooCount;//校对总字数
	private Integer tranlevels;//翻译等级
	private Integer proolevels;//校对等级
	private Integer auditlevels;//审核等级
	private String languages;//语言
	private Integer qid;
	private String loginStatus;//用户状态码
	private Integer isProofread;//是否校对
	private Integer isAudit;//是否审核
	private Integer isVerifty;//是否通过审核
	private String resumeUrl;//上传简历
	private String msg;//空条件
	private String msg2;//空条件
	private String companyAddress;//公司地址
	private String levels;//报价等级
	private String  proofreadUrl;//校对文件地址
	private String auditUrl;//审核文件地址
	private Integer honor;//荣誉值
	private Double wallet;//余额
	private String problem;//密保问题
	private String answer;//密保回答
	private Integer rank;//排名情况
	private Integer applyState;//等级排名状态
	private List<Quotation> quotations;//每个译员的所有报价
	private List<ClientCustomerNeed> clientCustomerNeeds;
	private Integer dayProo;//日校对量
	private Integer dayAudit;//日审核量
	private Integer majorTotal;//本专业翻译字数
    private String  initialPassword;//原密码
    private String transUrl;
    private Integer majorTotals;
    private Integer prooTotals;
    private Integer applyStateT;
    private Integer applyStateP;
    private Integer applyStateA;
    private String certificationStatus;//实名认证状态  0未认证  1等待审核  2审核通过 3审核不通过
    private Double wantTranPrice;
    private Double wantProoPrice;
    private Double wantAuditPrice;
    private String clientSoftName;
    private String clientSoftCode;
	public Double getWantTranPrice() {
		return wantTranPrice;
	}
	public void setWantTranPrice(Double wantTranPrice) {
		this.wantTranPrice = wantTranPrice;
	}
	public Double getWantProoPrice() {
		return wantProoPrice;
	}
	public void setWantProoPrice(Double wantProoPrice) {
		this.wantProoPrice = wantProoPrice;
	}
	public Double getWantAuditPrice() {
		return wantAuditPrice;
	}
	public void setWantAuditPrice(Double wantAuditPrice) {
		this.wantAuditPrice = wantAuditPrice;
	}
	public String getTransUrl() {
		return transUrl;
	}
	public void setTransUrl(String transUrl) {
		this.transUrl = transUrl;
	}
	public Integer getApplyStateT() {
		return applyStateT;
	}
	public void setApplyStateT(Integer applyStateT) {
		this.applyStateT = applyStateT;
	}
	public Integer getApplyStateP() {
		return applyStateP;
	}
	public void setApplyStateP(Integer applyStateP) {
		this.applyStateP = applyStateP;
	}
	public Integer getApplyStateA() {
		return applyStateA;
	}
	public void setApplyStateA(Integer applyStateA) {
		this.applyStateA = applyStateA;
	}
    
	public Integer getId() {
		return id;
	}
	public List<Quotation> getQuotations() {
		return quotations;
	}
	public void setQuotations(List<Quotation> quotations) {
		this.quotations = quotations;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getNameid() {
		return nameid;
	}
	public void setNameid(String nameid) {
		this.nameid = nameid;
	}
	public String getUserUrl() {
		return userUrl;
	}
	public void setUserUrl(String userUrl) {
		this.userUrl = userUrl;
	}
	public String getWorksTarget() {
		return worksTarget;
	}
	public void setWorksTarget(String worksTarget) {
		this.worksTarget = worksTarget;
	}
	public String getWorksOrigin() {
		return worksOrigin;
	}
	public void setWorksOrigin(String worksOrigin) {
		this.worksOrigin = worksOrigin;
	}
	public String getWorksUrl() {
		return worksUrl;
	}
	public void setWorksUrl(String worksUrl) {
		this.worksUrl = worksUrl;
	}
	public String getWorkDescribe() {
		return workDescribe;
	}
	public void setWorkDescribe(String workDescribe) {
		this.workDescribe = workDescribe;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getIsObey() {
		return isObey;
	}
	public void setIsObey(String isObey) {
		this.isObey = isObey;
	}
	public Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Double getTranPrice() {
		return tranPrice;
	}
	public void setTranPrice(Double tranPrice) {
		this.tranPrice = tranPrice;
	}
	public Double getProoPrice() {
		return prooPrice;
	}
	public void setProoPrice(Double prooPrice) {
		this.prooPrice = prooPrice;
	}
	public Integer getDayTrans() {
		return dayTrans;
	}
	public void setDayTrans(Integer dayTrans) {
		this.dayTrans = dayTrans;
	}
	public Integer getTranstionId() {
		return transtionId;
	}
	public void setTranstionId(Integer transtionId) {
		this.transtionId = transtionId;
	}
	public Integer getTransTotal() {
		return transTotal;
	}
	public void setTransTotal(Integer transTotal) {
		this.transTotal = transTotal;
	}
	public Integer getProoTotal() {
		return prooTotal;
	}
	public void setProoTotal(Integer prooTotal) {
		this.prooTotal = prooTotal;
	}
	public Integer getIsToolUse() {
		return isToolUse;
	}
	public void setIsToolUse(Integer isToolUse) {
		this.isToolUse = isToolUse;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getOnlineState() {
		return onlineState;
	}
	public void setOnlineState(Integer onlineState) {
		this.onlineState = onlineState;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSoftType() {
		return softType;
	}
	public void setSoftType(String softType) {
		this.softType = softType;
	}
	public Integer getPoint() {
		return point;
	}
	public void setPoint(Integer point) {
		this.point = point;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getTranExperience() {
		return tranExperience;
	}
	public void setTranExperience(String tranExperience) {
		this.tranExperience = tranExperience;
	}
	public String getProoExperience() {
		return prooExperience;
	}
	public void setProoExperience(String prooExperience) {
		this.prooExperience = prooExperience;
	}
	public Integer getCooperativeState() {
		return cooperativeState;
	}
	public void setCooperativeState(Integer cooperativeState) {
		this.cooperativeState = cooperativeState;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public Integer getMajorId() {
		return majorId;
	}
	public void setMajorId(Integer majorId) {
		this.majorId = majorId;
	}
	public String getCredentialsSalt() {
		return credentialsSalt;
	}
	public void setCredentialsSalt(String credentialsSalt) {
		this.credentialsSalt = credentialsSalt;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getEvaluateid() {
		return evaluateid;
	}
	public void setEvaluateid(String evaluateid) {
		this.evaluateid = evaluateid;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getOpeningBank() {
		return openingBank;
	}
	public void setOpeningBank(String openingBank) {
		this.openingBank = openingBank;
	}
	public Double getAuditPrice() {
		return auditPrice;
	}
	public void setAuditPrice(Double auditPrice) {
		this.auditPrice = auditPrice;
	}
	public Integer getAuditTotal() {
		return auditTotal;
	}
	public void setAuditTotal(Integer auditTotal) {
		this.auditTotal = auditTotal;
	}
	public Integer getTransCount() {
		return transCount;
	}
	public void setTransCount(Integer transCount) {
		this.transCount = transCount;
	}
	public Integer getProoCount() {
		return prooCount;
	}
	public void setProoCount(Integer prooCount) {
		this.prooCount = prooCount;
	}
	public Integer getTranlevels() {
		return tranlevels;
	}
	public void setTranlevels(Integer tranlevels) {
		this.tranlevels = tranlevels;
	}
	public Integer getProolevels() {
		return proolevels;
	}
	public void setProolevels(Integer proolevels) {
		this.proolevels = proolevels;
	}
	public Integer getAuditlevels() {
		return auditlevels;
	}
	public void setAuditlevels(Integer auditlevels) {
		this.auditlevels = auditlevels;
	}
	public String getLanguages() {
		return languages;
	}
	public void setLanguages(String languages) {
		this.languages = languages;
	}
	public Integer getQid() {
		return qid;
	}
	public void setQid(Integer qid) {
		this.qid = qid;
	}
	public String getLoginStatus() {
		return loginStatus;
	}
	public void setLoginStatus(String loginStatus) {
		this.loginStatus = loginStatus;
	}
	public Integer getIsProofread() {
		return isProofread;
	}
	public void setIsProofread(Integer isProofread) {
		this.isProofread = isProofread;
	}
	public Integer getIsAudit() {
		return isAudit;
	}
	public void setIsAudit(Integer isAudit) {
		this.isAudit = isAudit;
	}
	public Integer getIsVerifty() {
		return isVerifty;
	}
	public void setIsVerifty(Integer isVerifty) {
		this.isVerifty = isVerifty;
	}
	public String getResumeUrl() {
		return resumeUrl;
	}
	public void setResumeUrl(String resumeUrl) {
		this.resumeUrl = resumeUrl;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getCompanyAddress() {
		return companyAddress;
	}
	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}
	public String getLevels() {
		return levels;
	}
	public void setLevels(String levels) {
		this.levels = levels;
	}
	public String getProofreadUrl() {
		return proofreadUrl;
	}
	public void setProofreadUrl(String proofreadUrl) {
		this.proofreadUrl = proofreadUrl;
	}
	public String getAuditUrl() {
		return auditUrl;
	}
	public void setAuditUrl(String auditUrl) {
		this.auditUrl = auditUrl;
	}
	public Integer getHonor() {
		return honor;
	}
	public void setHonor(Integer honor) {
		this.honor = honor;
	}
	 
	public Double getWallet() {
		return wallet;
	}
	public void setWallet(Double wallet) {
		this.wallet = wallet;
	}
	public String getProblem() {
		return problem;
	}
	public void setProblem(String problem) {
		this.problem = problem;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Integer getRank() {
		return rank;
	}
	public void setRank(Integer rank) {
		this.rank = rank;
	}
	public List<ClientCustomerNeed> getClientCustomerNeeds() {
		return clientCustomerNeeds;
	}
	public void setClientCustomerNeeds(List<ClientCustomerNeed> clientCustomerNeeds) {
		this.clientCustomerNeeds = clientCustomerNeeds;
	}
	
	public Integer getApplyState() {
		return applyState;
	}
	public void setApplyState(Integer applyState) {
		this.applyState = applyState;
	}
	
	public Integer getDayProo() {
		return dayProo;
	}
	public void setDayProo(Integer dayProo) {
		this.dayProo = dayProo;
	}
	public Integer getDayAudit() {
		return dayAudit;
	}
	public void setDayAudit(Integer dayAudit) {
		this.dayAudit = dayAudit;
	}
	 
	public Integer getMajorTotal() {
		return majorTotal;
	}
	public void setMajorTotal(Integer majorTotal) {
		this.majorTotal = majorTotal;
	}
	 
	public String getInitialPassword() {
		return initialPassword;
	}
	public void setInitialPassword(String initialPassword) {
		this.initialPassword = initialPassword;
	}
	
	public Integer getMajorTotals() {
		return majorTotals;
	}
	public void setMajorTotals(Integer majorTotals) {
		this.majorTotals = majorTotals;
	}
	public Integer getProoTotals() {
		return prooTotals;
	}
	public void setProoTotals(Integer prooTotals) {
		this.prooTotals = prooTotals;
	}
	
	public String getMsg2() {
		return msg2;
	}
	public void setMsg2(String msg2) {
		this.msg2 = msg2;
	}
	
	public String getCertificationStatus() {
		return certificationStatus;
	}
	public void setCertificationStatus(String certificationStatus) {
		this.certificationStatus = certificationStatus;
	}
	
	public String getClientSoftName() {
		return clientSoftName;
	}
	public void setClientSoftName(String clientSoftName) {
		this.clientSoftName = clientSoftName;
	}
	public String getClientSoftCode() {
		return clientSoftCode;
	}
	public void setClientSoftCode(String clientSoftCode) {
		this.clientSoftCode = clientSoftCode;
	}
	
	@Override
	public String toString() {
		return "Translator [id=" + id + ", realName=" + realName + ", nickname=" + nickname + ", gender=" + gender
				+ ", birthday=" + birthday + ", nameid=" + nameid + ", userUrl=" + userUrl + ", worksTarget="
				+ worksTarget + ", worksOrigin=" + worksOrigin + ", worksUrl=" + worksUrl + ", workDescribe="
				+ workDescribe + ", job=" + job + ", isObey=" + isObey + ", registerTime=" + registerTime + ", email="
				+ email + ", tel=" + tel + ", address=" + address + ", ip=" + ip + ", tranPrice=" + tranPrice
				+ ", prooPrice=" + prooPrice + ", dayTrans=" + dayTrans + ", transtionId=" + transtionId
				+ ", transTotal=" + transTotal + ", prooTotal=" + prooTotal + ", isToolUse=" + isToolUse
				+ ", description=" + description + ", onlineState=" + onlineState + ", accountName=" + accountName
				+ ", password=" + password + ", softType=" + softType + ", point=" + point + ", domain=" + domain
				+ ", language=" + language + ", tranExperience=" + tranExperience + ", prooExperience=" + prooExperience
				+ ", cooperativeState=" + cooperativeState + ", level=" + level + ", major=" + major + ", degree="
				+ degree + ", majorId=" + majorId + ", credentialsSalt=" + credentialsSalt + ", roleName=" + roleName
				+ ", state=" + state + ", evaluateid=" + evaluateid + ", accountNumber=" + accountNumber
				+ ", openingBank=" + openingBank + ", auditPrice=" + auditPrice + ", auditTotal=" + auditTotal
				+ ", transCount=" + transCount + ", prooCount=" + prooCount + ", tranlevels=" + tranlevels
				+ ", proolevels=" + proolevels + ", auditlevels=" + auditlevels + ", languages=" + languages + ", qid="
				+ qid + ", loginStatus=" + loginStatus + ", isProofread=" + isProofread + ", isAudit=" + isAudit
				+ ", isVerifty=" + isVerifty + ", resumeUrl=" + resumeUrl + ", msg=" + msg + ", msg2=" + msg2
				+ ", companyAddress=" + companyAddress + ", levels=" + levels + ", proofreadUrl=" + proofreadUrl
				+ ", auditUrl=" + auditUrl + ", honor=" + honor + ", wallet=" + wallet + ", problem=" + problem
				+ ", answer=" + answer + ", rank=" + rank + ", applyState=" + applyState + ", quotations=" + quotations
				+ ", clientCustomerNeeds=" + clientCustomerNeeds + ", dayProo=" + dayProo + ", dayAudit=" + dayAudit
				+ ", majorTotal=" + majorTotal + ", initialPassword=" + initialPassword + ", transUrl=" + transUrl
				+ ", majorTotals=" + majorTotals + ", prooTotals=" + prooTotals + ", applyStateT=" + applyStateT
				+ ", applyStateP=" + applyStateP + ", applyStateA=" + applyStateA + ", certificationStatus="
				+ certificationStatus + ", wantTranPrice=" + wantTranPrice + ", wantProoPrice=" + wantProoPrice
				+ ", wantAuditPrice=" + wantAuditPrice + ", clientSoftName=" + clientSoftName + ", clientSoftCode="
				+ clientSoftCode + "]";
	}
	public Translator() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
