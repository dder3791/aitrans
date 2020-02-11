package com.web.domain;

import java.util.Date;

public class ClientUserD {
    
	private int id;//前台用户id
	private String userName;//前台用户姓名
	private String password;//前台用户密码
    private String createDate;//前台用户创建时间
	private String IP;//前台用户ip
	private String address;//当前用户主机号
	private String roleName;//角色类型
	private String sex;//性别
	private String birthday;//出生日期
	private String tel;//联系电话
	private String cardId;//身份证号
	private String emaile;//电子邮箱
	private String headPortrait;//头像路径
	private String intro;//描述
	private String realName;
	private String loginStatu;
	private String job;//职位
	private String company;//工作单位
	private String bankAccount;//银行账号
	private double balance;//余额
	private int certificationState;//认证状态
	private int certificationType;//认证类型
	private String serviceLanguage;//服务语言
	private String topCardURL;//证件正面照片
	private String buttomCardURL;//证件反面照片
	private int userType;//用户类型    vip 1 或者普通用户0,内部客户2
	private int integral;//用户积分
	private String openingBank;//开户行
	private int reputation;//信誉值
	private String securityQuestion;
	private String answer;
	private String initialPassword;//原密码
	private String payPassword;//支付密码
	
	
	public String getSecurityQuestion() {
		return securityQuestion;
	}

	public void setSecurityQuestion(String securityQuestion) {
		this.securityQuestion = securityQuestion;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getReputation() {
		return reputation;
	}

	public void setReputation(int reputation) {
		this.reputation = reputation;
	}

	public ClientUserD() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getIP() {
		return IP;
	}

	public void setIP(String iP) {
		IP = iP;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public String getEmaile() {
		return emaile;
	}

	public void setEmaile(String emaile) {
		this.emaile = emaile;
	}

	public String getHeadPortrait() {
		return headPortrait;
	}

	public void setHeadPortrait(String headPortrait) {
		this.headPortrait = headPortrait;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}
     
	public String getLoginStatu() {
		return loginStatu;
	}

	public void setLoginStatu(String loginStatu) {
		this.loginStatu = loginStatu;
	}
	
	

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public int getCertificationState() {
		return certificationState;
	}

	public void setCertificationState(int certificationState) {
		this.certificationState = certificationState;
	}

	public int getCertificationType() {
		return certificationType;
	}

	public void setCertificationType(int certificationType) {
		this.certificationType = certificationType;
	}

	
	
	public String getServiceLanguage() {
		return serviceLanguage;
	}

	public void setServiceLanguage(String serviceLanguage) {
		this.serviceLanguage = serviceLanguage;
	}

	
	
	public String getTopCardURL() {
		return topCardURL;
	}

	public void setTopCardURL(String topCardURL) {
		this.topCardURL = topCardURL;
	}

	public String getButtomCardURL() {
		return buttomCardURL;
	}

	public void setButtomCardURL(String buttomCardURL) {
		this.buttomCardURL = buttomCardURL;
	}

	
	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	
	public int getIntegral() {
		return integral;
	}

	public void setIntegral(int integral) {
		this.integral = integral;
	}

	
	public String getOpeningBank() {
		return openingBank;
	}

	public void setOpeningBank(String openingBank) {
		this.openingBank = openingBank;
	}
    
	public String getInitialPassword() {
		return initialPassword;
	}

	public void setInitialPassword(String initialPassword) {
		this.initialPassword = initialPassword;
	}

	
	public String getPayPassword() {
		return payPassword;
	}

	public void setPayPassword(String payPassword) {
		this.payPassword = payPassword;
	}

	public ClientUserD(int id, String userName, String password) {
		super();
		this.id = id;
		this.userName = userName;
		this.password = password;
	}
	public ClientUserD(String userName, String password) {
		super();
		this.userName = userName;
		this.password = password;
	}
	
}
