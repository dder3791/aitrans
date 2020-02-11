package com.web.util;

public class Page {
	
private long totalCount = 0;//总记录数
private int pageSize = 0;//当前页面显示多少条记录数
private int totalPage = 0;//总页数
private int pageNum = 0 ; //查询当前页数
private int startIndex = 0;//当前页面起始下标
private int start=0;//分页开始值
private int end =0;//分页结束
private String msg;
private String msgType;//查询类型
private String namemsg;//查询条件
private String secondmsg;//二次查询条件
private String thirdmsg;//三次查询条件
private String phonemsg; 
private int dateType;//排序类型
private int msgId;

public int getMsgId() {
	return msgId;
}
public void setMsgId(int msgId) {
	this.msgId = msgId;
}
public int getPageSize() {
	return pageSize;
}
public void setPageSize(int pageSize) {
	this.pageSize = pageSize;
}
public String getMsg() {
	return msg;
}
public void setMsg(String msg) {
	this.msg = msg;
}
public int getDateType() {
	return dateType;
}
public String getNamemsg() {
	return namemsg;
}
public void setNamemsg(String namemsg) {
	this.namemsg = namemsg;
}
public String getPhonemsg() {
	return phonemsg;
}
public void setPhonemsg(String phonemsg) {
	this.phonemsg = phonemsg;
}
public void setDateType(int dateType) {
	this.dateType = dateType;
}
public String getMsgType() {
	return msgType;
}
public void setMsgType(String msgType) {
	this.msgType = msgType;
}

public Page() {
	
}
public Page(long totalCount, String  pageNum,int pageSize) {
	//计算总页数
	this.totalCount=totalCount;
 
 
	this.pageSize = pageSize;
 
	if(totalCount%pageSize==0){
		this.totalPage = (int) (totalCount/this.pageSize);
		
	}else{
		this.totalPage = (int) (totalCount/this.pageSize + 1) ;
	}
	
	//计算当前页查询的起始下标，limit的第一个参数
	if(pageNum==null || "null".equals(pageNum) || "".equals(pageNum)){
		this.pageNum=1;
		this.startIndex =0;
	}else{
		int pNum=Integer.parseInt(pageNum);
		if(pNum<=totalPage){
		this.pageNum =pNum;
		this.startIndex = (this.pageNum -1)* this.pageSize;
		}else{
			this.pageNum =totalPage;
			this.startIndex = (this.pageNum -1)* this.pageSize;
		}
	}
	//计算分页开始值
	if(totalPage<5){
		this.start=1;
		this.end=totalPage;
	}else{
		if(this.pageNum-2>0){
			this.start=this.pageNum-2;
			if(this.pageNum+2<totalPage){
				this.end=this.pageNum+2;
			}else{
				this.start=totalPage-4;
				this.end=totalPage;
			}
		}else{
			this.start=1;
			this.end=5;
		}
	}
	//计算分页结束值
	}
public int getStart() {
	return start;
}
public void setStart(int start) {
	this.start = start;
}
public int getEnd() {
	return end;
}
public void setEnd(int end) {
	this.end = end;
}
public long getTotalCount() {
	return totalCount;
}
public void setTotalCount(long totalCount) {
	this.totalCount = totalCount;
}
public int getTotalPage() {
	return totalPage;
}
public void setTotalPage(int totalPage) {
	this.totalPage = totalPage;
}
public int getPageNum() {
	return pageNum;
}
public void setPageNum(int pageNum) {
	this.pageNum = pageNum;
}
public int getStartIndex() {
	return startIndex;
}
public void setStartIndex(int startIndex) {
	this.startIndex = startIndex;
}
public String getSecondmsg() {
	return secondmsg;
}
public void setSecondmsg(String secondmsg) {
	this.secondmsg = secondmsg;
}
public String getThirdmsg() {
	return thirdmsg;
}
public void setThirdmsg(String thirdmsg) {
	this.thirdmsg = thirdmsg;
}

} 
