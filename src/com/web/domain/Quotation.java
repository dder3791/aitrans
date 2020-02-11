package com.web.domain;

import java.util.List;

public class Quotation {
   
	private Integer id;
	private Double tranPrice;//翻译价格
	private Integer dayTrans;//日翻译量
	private Integer dayProo;//日校对量
	private Integer dayAudit;//日审核量
	private Integer majorTotal;//本专业翻译字数
	private Double prooPrice;//校对价格
	private Integer prooTotal;//校对总字数
	private String languages;//所属语言
	private String domain;//所属领域
	private Double auditPrice;//审核价格
	private Integer auditTotal;//审核总字数
	private Integer tranlevels;//翻译等级
	private Integer proolevels;//校对等级
	private Integer auditlevels;//审核等级
	private String worksTarget;//译文
	private String worksOrigin;//原文
	private Integer transtionId;//译员外键id
	private Integer applyStateT;//翻译申请等级状态   1通过  2不通过
	private Integer applyStateP;//校对申请等级状态   1通过  2不通过
	private Integer applyStateA;//审核申请等级             1通过  2不通过
	private String tranReason;//翻译申请升级理由
	private String prooReason;//校对申请升级理由
	private String auditReason;//审核申请升级理由
	private Integer majorTotals;//翻译总经验
	private Integer prooTotals;
	private Double wantTranPrice;
    private Double wantProoPrice;
    private Double wantAuditPrice;
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
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Double getTranPrice() {
		return tranPrice;
	}
	public void setTranPrice(Double tranPrice) {
		this.tranPrice = tranPrice;
	}
	public Integer getDayTrans() {
		return dayTrans;
	}
	public void setDayTrans(Integer dayTrans) {
		this.dayTrans = dayTrans;
	}
 
	 
	public Integer getMajorTotal() {
		return majorTotal;
	}
	public void setMajorTotal(Integer majorTotal) {
		this.majorTotal = majorTotal;
	}
	public Double getProoPrice() {
		return prooPrice;
	}
	public void setProoPrice(Double prooPrice) {
		this.prooPrice = prooPrice;
	}
	 
	public Integer getProoTotal() {
		return prooTotal;
	}
	public void setProoTotal(Integer prooTotal) {
		this.prooTotal = prooTotal;
	}
	public void setAuditTotal(Integer auditTotal) {
		this.auditTotal = auditTotal;
	}
	public String getLanguages() {
		return languages;
	}
	public void setLanguages(String languages) {
		this.languages = languages;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public Double getAuditPrice() {
		return auditPrice;
	}
	public void setAuditPrice(Double auditPrice) {
		this.auditPrice = auditPrice;
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
	public Integer getTranstionId() {
		return transtionId;
	}
	public void setTranstionId(Integer transtionId) {
		this.transtionId = transtionId;
	}
	public Quotation() {
		super();
		// TODO Auto-generated constructor stub
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
	public String getTranReason() {
		return tranReason;
	}
	public void setTranReason(String tranReason) {
		this.tranReason = tranReason;
	}
	public String getProoReason() {
		return prooReason;
	}
	public void setProoReason(String prooReason) {
		this.prooReason = prooReason;
	}
	public String getAuditReason() {
		return auditReason;
	}
	public void setAuditReason(String auditReason) {
		this.auditReason = auditReason;
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
	public Integer getAuditTotal() {
		return auditTotal;
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
	@Override
	public String toString() {
		return "Quotation [id=" + id + ", tranPrice=" + tranPrice
				+ ", dayTrans=" + dayTrans + ", dayProo=" + dayProo
				+ ", dayAudit=" + dayAudit + ", majorTotal=" + majorTotal
				+ ", prooPrice=" + prooPrice + ", prooTotal=" + prooTotal
				+ ", languages=" + languages + ", domain=" + domain
				+ ", auditPrice=" + auditPrice + ", auditTotal=" + auditTotal
				+ ", tranlevels=" + tranlevels + ", proolevels=" + proolevels
				+ ", auditlevels=" + auditlevels + ", worksTarget="
				+ worksTarget + ", worksOrigin=" + worksOrigin
				+ ", transtionId=" + transtionId + ", applyStateT="
				+ applyStateT + ", applyStateP=" + applyStateP
				+ ", applyStateA=" + applyStateA + ", tranReason=" + tranReason
				+ ", prooReason=" + prooReason + ", auditReason=" + auditReason
				+ ", getId()=" + getId() + ", getTranPrice()=" + getTranPrice()
				+ ", getDayTrans()=" + getDayTrans() + ", getMajorTotal()="
				+ getMajorTotal() + ", getProoPrice()=" + getProoPrice()
				+ ", getProoTotal()=" + getProoTotal() + ", getLanguages()="
				+ getLanguages() + ", getDomain()=" + getDomain()
				+ ", getAuditPrice()=" + getAuditPrice() + ", getTranlevels()="
				+ getTranlevels() + ", getProolevels()=" + getProolevels()
				+ ", getAuditlevels()=" + getAuditlevels()
				+ ", getWorksTarget()=" + getWorksTarget()
				+ ", getWorksOrigin()=" + getWorksOrigin()
				+ ", getTranstionId()=" + getTranstionId()
				+ ", getApplyStateT()=" + getApplyStateT()
				+ ", getApplyStateP()=" + getApplyStateP()
				+ ", getApplyStateA()=" + getApplyStateA()
				+ ", getTranReason()=" + getTranReason() + ", getProoReason()="
				+ getProoReason() + ", getAuditReason()=" + getAuditReason()
				+ ", getDayProo()=" + getDayProo() + ", getDayAudit()="
				+ getDayAudit() + ", getAuditTotal()=" + getAuditTotal()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	 
	 
	 
	
	
}
