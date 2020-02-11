<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/css/rem.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><spring:message  code='环宇爱译全球翻译平台'/></title>
<style type="text/css">
	td{
		width:60%;
		color:#08A5E0;
		font-size:0.4rem;
		text-align:center;
	}
	th{
		width:40%;
		font-size:0.4rem;
		height:1rem;
	}
	.acceptbtn {
      	border-radius: 0.2rem;
	    background-color: white;
	    color: #1b6d85;
	    border: 2px solid #5bc0de; /* #5bc0de */
	}
</style>
<script type="text/javascript">
var needId = '${needid}';
var transId='${transId}';
   function acceptTask(){
	   $("#acceptTask").css("background-color","#1b6d85");
	   $("#acceptTask").css("color","white");
	   
	 //首先判断译员是否实名，实名信息从session中读取
		 if("${transid}"!=null && "${transid}"!=""){
			 if("${transid.certificationStatus}"==3 || "${transid.certificationStatus}"=='3' || "${transid.certificationStatus}"=='0' || "${transid.certificationStatus}"==0){
				 //实名不通过或还没实名操作，跳转实名路劲
				 layer.msg('<spring:message  code="请先进行实名认证"/>', {icon: 1});
				 
			 }else if("${transid.isVerifty}"==3 || "${transid.isVerifty}"=='3' || "${transid.isVerifty}"=='0' || "${transid.isVerifty}"==0 || "${transid.isProofread}"==3 || "${transid.isProofread}"=='3' || "${transid.isProofread}"=='0' || "${transid.isProofread}"==0 || "${transid.isAudit}"==3 || "${transid.isAudit}"=='3' ||  "${transid.isAudit}"=='0' ||  "${transid.isAudit}"==0){
				//资格认证失败，或没有认证资格操作
				 layer.msg('<spring:message  code="请先进行资格认证"/>', {icon: 1});
			 }else{
			    //实名认证并翻译，校对，审核有一项已认证资格
				 $.post("${pageContext.request.contextPath}/index/indexAction_acceptTask.do?needid="+needId+"&transId="+transId,function(data){ 
					   if(data.result="success"){
						   layer.msg('<spring:message  code="接受任务成功"/>', {icon: 1});
						    $("#acceptTask").hide();
						    $("#cancelTask").hide(); 
				          }
					 },"json");
			 }
		 }
   }
   function cancelTask(){
		   $("#cancelTask").css("background-color","#1b6d85");
		   $("#cancelTask").css("color","white");
	   $.post("${pageContext.request.contextPath}/index/indexAction_cancelTask.do?needid="+needId+"&transId="+transId,function(data){
		   if(data.result="success"){
			   layer.msg('<spring:message  code="取消任务成功"/>', {icon: 1});
			    $("#acceptTask").hide();
			   $("#cancelTask").hide(); 
            }
			 },"json");
   }

</script>
<script>!function(e){function t(a){if(i[a])return i[a].exports;var n=i[a]={exports:{},id:a,loaded:!1};return e[a].call(n.exports,n,n.exports,t),n.loaded=!0,n.exports}var i={};return t.m=e,t.c=i,t.p="",t(0)}([function(e,t){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var i=window;t["default"]=i.flex=function(e,t){var a=e||100,n=t||1,r=i.document,o=navigator.userAgent,d=o.match(/Android[\S\s]+AppleWebkit\/(\d{3})/i),l=o.match(/U3\/((\d+|\.){5,})/i),c=l&&parseInt(l[1].split(".").join(""),10)>=80,p=navigator.appVersion.match(/(iphone|ipad|ipod)/gi),s=i.devicePixelRatio||1;p||d&&d[1]>534||c||(s=1);var u=1/s,m=r.querySelector('meta[name="viewport"]');m||(m=r.createElement("meta"),m.setAttribute("name","viewport"),r.head.appendChild(m)),m.setAttribute("content","width=device-width,user-scalable=no,initial-scale="+u+",maximum-scale="+u+",minimum-scale="+u),r.documentElement.style.fontSize=a/2*s*n+"px"},e.exports=t["default"]}]);
    flex(100, 1);</script>
</head>
<body style="width:100%;">
    <img src="${pageContext.request.contextPath}/img/logo.jpg" style="margin-top:0.1rem;width: 4rem;height: 1.6rem">
	<table style="margin-left:5%;width:90%;margin-top:0.1rem;">
		<tr>
			<th style="font-size: 0.5rem" colspan="2">${clientCustomerNeed.title}</th>
		</tr>
		<tr>
			<th>语种</th>
			<td>${clientCustomerNeed.languagePair}</td>
		</tr>
		<tr>
			<th>领域</th>
			<td>${field}</td>
		</tr>
		<tr>
			<th>字数</th>
			<td>${clientCustomerNeed.length }</td>
		</tr>
		<tr>
			<th>项目类型</th>
			<td>${projectTypeId }</td>
		</tr>
		<tr>
			<th>价格</th>
			<td style="color:red">${clientCustomerNeed.totalMoney}元</td>
		</tr>
		<tr>
			<th>发布日期</th>
			<td>${clientCustomerNeed.publishTime}</td>
		</tr>
		<tr>
			<th>返稿日期</th>
			<td>${clientCustomerNeed.completeTime}</td>
		</tr>
		<tr>
			<th>备注</th>
			<td>${clientCustomerNeed.description}</td>
		</tr>
	</table>
	   <c:if test="${clientCustomerNeed.acceptState!='订单'}">
		<button class="acceptbtn" style="width:25%;height:0.5rem;font-size:0.35rem;margin-left: 20%;" onclick="acceptTask()" id="acceptTask">接受</button>
		<button class="acceptbtn" style="width:25%;height:0.5rem;font-size:0.35rem;margin-left: 10%;" onclick="cancelTask()" id="cancelTask">不接受</button>
      </c:if>
<div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>