<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name=" Keywords" content="......">      <!--content中，网页关键字-->
    <meta name=" description" content="......">   <!--content中，网页描述文字-->
    <meta name="author" content="......">        <!--标注作者-->
    <title><spring:message  code='规则中心'/></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
 <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	
	//发布需求按钮
	$("#publishNeedClick").click(function (){
		if("${clientid}"==null || "clientid"==''){
			//layer.msg('<spring:message code="您不是客户，不能进行发布项目操作"/>',{icon:1});
			alert('<spring:message code="您不是客户，不能进行发布项目操作"/>');
		}else{
			$("#publishNeedClick").prop("href","/cilentCustomer/publishNeed.do")
		}
	})
	
	if("${transid}"!=null && "transid"!=''){
		if("${transid.nickname}"!=null && "${transid.nickname}"!=''){
        	  $("#nickname").text("${transid.nickname}"+"<spring:message  code='，欢迎您！'/>");
          }else if("${transid.tel}"!=null && "${transid.tel}"!=''){
        	  $("#nickname").text("${transid.tel}"+"<spring:message  code='，欢迎您！'/>");
          }else if("${transid.email}"!=null && "${transid.email}"!=''){
        	  $("#nickname").text("${transid.email}"+"<spring:message  code='，欢迎您！'/>");
          }
	}else if("${clientid}"!=null && "clientid"!=''){
		 if("${clientid.userName}"!='' && "${clientid.userName}"!=null){
	   		 $("#nickname").text('${clientid.userName}'+"<spring:message code=',欢迎您!'/>");
	   	 }else if('${clientid.tel}'!=null && '${clientid.tel}'!=null){
	   		 $("#nickname").text('${clientid.tel}'+"<spring:message code=',欢迎您!'/>");
	   	 }else if('${clientid.emaile}'!=null && '${clientid.emaile}'!=null){
	   		 $("#nickname").text('${clientid.emaile}'+"<spring:message code=',欢迎您!'/>");
	   	 }
	}
	/* var tnickname = "${transid.nickname}";
	var unickname = "${clientid.userName}"
	if(tnickname!=""){
		$("#nickname").text(tnickname+"<spring:message  code='，欢迎您！'/>");
		
	}else if (unickname!="") {
		$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>");
		} */
	});
//头标签效果显示  开始
$(document).ready(function(){
    $(".navbg").capacityFixed();
    $("#navul > li").not(".navhome").hover(function(){
      $(this).addClass("navmoon");
    },function(){
      $(this).removeClass("navmoon");
    });
  })

  $.fn.capacityFixed = function(options) {
        var opts = $.extend({},$.fn.capacityFixed.deflunt,options);
        var FixedFun = function(element) {
            var top = opts.top;
            element.css({
                "top":top
            });
            element.find(".close-ico").click(function(event){
                element.remove();
                event.preventDefault();
            })
        };
        return $(this).each(function() {
            FixedFun($(this));
        });
    };
    $.fn.capacityFixed.deflunt={
		right : 0,//相对于页面宽度的右边定位
        top:95
	};
  //头标签效果显示 结束
      function queryByInterpreter() {
   	 
   	 var nickName=$("#nickName").val();
   	 if(nickName!="" && nickName!="null" && nickName!=undefined){
   		 url="/translator/translatorAction_getTotalCount.do?msg="+nickName;
			window.open(url);
   	 }else{
   		 layer.msg('<spring:message  code="译员名不能为空！"/>', {icon: 2});
   	 }
		
	}
	</script>
    <style type="text/css">
    .quality_control{margin-top: 40px;}
    .quality_control_list li{ text-indent: 2em;padding-bottom: 7px;}
    .content_public div img{width:1000px;height:260px;margin:0 auto;margin-top: 30px;border-radius: 7px;}
    </style>
  </head>
  <body style="background:#f5f5f5;">
     <!--      头标签开始      -->
  	<c:if test="${clientid.id!=null || transid.id!=null }">
  	<div class="publickNav">
  		<div class="public_nav"> 
           <nav class="container" style="padding:0 20px;"> 
           <div class="navbar-left"><a href="?lang=zh_CN" class="navbar-link" onclick="in18(this)">中文</a> | <a href="?lang=en_US" class="navbar-link" onclick="in18(this)">English</a></div><a style="padding-left:50px;" href="/forwardAction/forward_toIndex.do"><spring:message  code='首页'/></a>
           <a style="padding-left:50px;"><spring:message  code='帮助热线：'/>010-82895385</a><a style="padding-left:50px;" target="_blank" href="http://www.aitrans.org:8081/"><spring:message  code='爱译社'/></a>
           <div class="navbar-right"> 
           <ul class="list-inline nav_lists">
           <%-- <li class="nav_lists_li"><a href="/ClientUser/clientUserAction_exit.do" class="navbar-link"><spring:message  code='退出登录'/></a></li>
           <li class="nav_lists_li"><a href="/cilentCustomer/findUI.do" target="_blank" class="navbar-link" style="position:relative;" ><spring:message  code='用户中心'/></a>
           <li class="nav_li_li"><a href="javascript:void(0);" class="navbar-link" ><font  id = "nickname"></font></a></li> --%>
           </ul>
           </div>
           </nav>
           </div>
           <div style="height:35px;"></div>
           </div>
     </c:if>   

     <c:if test="${clientid.id==null && transid.id==null }">
     <div class="publickNavs">
   		<div class="public_nav">
                    <nav class="container" style="padding:0 20px;">
                     <div class="navbar-left">
                     	<a href="?lang=zh_CN" class="navbar-link" onclick="in18(this);">中文</a> | <a href="?lang=en_US" class="navbar-link" onclick="in18(this);" >English</a>
                     </div>
                     <a style="padding-left:50px;" href="/forwardAction/forward_toIndex.do"><spring:message  code='首页'/></a>
                     <a style="padding-left:50px;"><spring:message  code='帮助热线：'/>010-82895385</a><a style="padding-left:50px;" target="_blank" href="http://www.aitrans.org:8081/"><spring:message  code='爱译社'/></a>
                     <div class="navbar-right">
                     <ul class="list-inline nav_lists">
                      <%-- <li class="nav_lists_li"><a href="/forwardAction/forward_toLogin.do" class="navbar-link"><spring:message  code='登录'/></a></li>
                      <li class="nav_lists_li"><a href="/forwardAction/forward_toRegister.do" class="navbar-link"><spring:message  code='注册'/></a></li> --%>
                      <li class="nav_lists_li"><a href="/forwardAction/forward_toHelp.do" class="navbar-link"><spring:message  code='帮助中心'/></a></li>
                      </ul>
                      </div>
                      </nav>
                      </div>
                      <div style="height:35px;"></div>
                      </div>
	</c:if>
	<div class="container">
<nav class="publickSearch">
<nav class="search_nav">
              <div class="navbar-left">
              <span class="search_logo"></span>
              </div>
              <form class="navbar-form index_form_search navbar-left" role="search">
              <%-- <div class="input-group">
              <div class="input-group-btn">
              <button type="button" id="dLabel" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span><spring:message  code='找译员'/> </span><i class="fa fa-caret-down fa-2x" aria-hidden="true"></i></button>
              <ul class="dropdown-menu" aria-labelledby="dLabel">
              <li><a href="/cilentCustomer/findNeedListUI.do"><spring:message  code='找项目'/></a></li>
              <li><a href="/translator/translatorAction_getProfessorCount.do?level=5"><spring:message  code='找专家'/></a></li>
              <li role="separator" class="divider"></li>
              </ul>
              </div>
              <input type="text" id="nickName" class="form-control" aria-label="...">
              <div class="input-group-btn">
              <button type="button" class="btn btn-info" onclick="queryByInterpreter();"  style="width:115px;font-size: 17px;"><spring:message  code='搜索'/></button>
              </div>
              </div>
              <a href="javaScript:void(0);" class="btn btn-info requirements" id="publishNeedClick" ><spring:message  code='发布项目'/></a>
              <ul class="list-inline search_more">
              <li><spring:message  code='热门搜索：'/></li>
             <li><a href="/translator/translatorAction_getTransCount.do?language=EN"><spring:message  code='英语精英'/></a></li>
              <li><a href="/translator/translatorAction_getTransCount.do?language=JP"><spring:message  code='日语精英'/></a></li>
              <li><a href="/translator/translatorAction_getTransCount.do?language=GER"><spring:message  code='德语精英'/></a></li>
               <li><a href="/translator/translatorAction_getTransCount.do?language=FR"><spring:message  code='法语精英'/></a></li>
                <li><a href="/translator/translatorAction_getTransCount.do?language=KOR"><spring:message  code='韩语精英'/></a></li>
              </ul> --%>
              </form>
              </nav>
</nav>
      <!--  内容头部导航  -->
      <%-- <div class="contentNav">
 		<div class="navbg">
                      <ul id="navul">
                        <li class="navhome"><a href="/forwardAction/forward_toIndex.do"><spring:message  code='首页'/></a></li>
                        <li><a href="#"><spring:message  code='平台介绍'/></a>
                          <ul>
                          	<li><a href="/forwardAction/forward_toTeam.do"><spring:message  code='关于我们'/></a>
                            <li><a href="/forwardAction/forward_toOA.do"><spring:message  code='服务介绍'/></a></li>
                            <li><a href="/forwardAction/forward_toQuality.do"><spring:message  code='质量控制'/></a></li>
                            <li><a href="/forwardAction/forward_toRuleDescription.do"><spring:message  code='规则中心'/></a></li>
                            <li><a href="/forwardAction/forward_toSecurityCenter.do"><spring:message  code='安全中心'/></a></li>
                            <li><a href="/forwardAction/forward_toCustomerInstructions.do"><spring:message  code='客户须知'/></a></li>
                            <li><a href="/forwardAction/forward_toInterpreterTips.do"><spring:message  code='译员须知'/></a></li>
                            <li><a href="/forwardAction/forward_toTranslationProcess.do"><spring:message  code='翻译流程'/></a></li>
                          </ul>
                        </li>
                        <li><a href="/forwardAction/forward_toOffer.do"><spring:message  code='在线询价'/></a>
                        </li>
                        <li><a href="#"><spring:message  code='项目'/></a>
                    	<ul>
                    		<li><a href="/cilentCustomer/publishNeed.do"><spring:message  code='发布项目'/></a></li>
                    		<li><a href="/cilentCustomer/findNeedListUI.do"><spring:message  code='项目展示'/></a></li>
                    	</ul>
                    	</li>
                        <li><a href="#"><spring:message  code='专业译员'/></a>
                        <ul>
                        <li><a href="/translator/translatorAction_getProfessorCount.do?level=5"><spring:message  code='专家介绍'/></a></li>
                        <li><a href="/translator/translatorAction_getTransCount.do?language=EN"><spring:message  code='英语精英'/></a></li>
                        <li><a href="/translator/translatorAction_getTransCount.do?language=JP"><spring:message  code='日语精英'/></a></li>
                        <li><a href="/translator/translatorAction_getTransCount.do?language=KOR"><spring:message  code='韩语精英'/></a></li>
                        <li><a href="/translator/translatorAction_getTransCount.do?language=GER"><spring:message  code='德语精英'/></a></li>
                        <li><a href="/translator/translatorAction_getTransCount.do?language=FR"><spring:message  code='法语精英'/></a></li>
                        <li><a href="/translator/translatorAction_getTotalCount.do"><spring:message  code='译员查找'/></a></li>
                      </ul>
                        </li>
                        <li><a href="#"><spring:message  code='专利翻译软件'/></a>
                          <ul>
                          <li><a href="/forwardAction/forward_toSoftwareTranslation.do"><spring:message  code='软件下载'/></a></li>
                          <li><a href="/forwardAction/forward_toInstructions.do"><spring:message  code='软件界面说明'/></a></li>
                          <li><a href="/forwardAction/forward_toUse.do"><spring:message  code='软件翻译演示'/></a></li>
                          <li><a href="/forwardAction/forward_toFunction.do"><spring:message  code='软件功能介绍'/></a></li>
                          <li><a href="/forwardAction/forward_toMenu.do"><spring:message  code='功能表'/></a></li>
                          </ul>
                        </li>
                        <li><a href="#"><spring:message  code='专利知识库'/></a>
                          <ul>
                            <li><a href="/term/termAction_getTotalCount.do"><spring:message  code='术语库'/></a></li>
                            <li><a href="/corpus/corpusAction_getTotalCount.do"><spring:message  code='语料库'/></a></li>
                          </ul>
                        </li>
                        <li><a href="#"><spring:message  code='操作指南'/></a>
                        <ul>
                        <li><a href="/forwardAction/forward_toIdentification.do"><spring:message  code='用户认证流程'/></a></li>
                        <li><a href="/forwardAction/forward_toRegisterProcess.do"><spring:message  code='注册登陆流程'/></a></li>
                        <li><a href="/forwardAction/forward_toInterpreterOrders.do"><spring:message  code='译员接单流程'/></a></li>
                        <li><a href="/forwardAction/forward_toPublishProcess.do"><spring:message  code='项目发布流程'/></a></li>
                        <li><a href="/forwardAction/forward_toHelp.do"><spring:message  code='帮助中心'/></a></li>
                        <li><a href="/forwardAction/forward_toRemuneration.do"><spring:message  code='稿酬明细'/></a></li>
                        </ul>
                      </li>
                        <li><a href="#"><spring:message  code='资讯信息'/></a>
                        <ul>
                        <li><a href="/article/articleAction_getNoticeTotalCount.do"><spring:message  code='公告资讯'/></a></li>
                        <li><a href="/article/articleAction_getPlatformTotalCount.do"><spring:message  code='活动资讯'/></a></li>
                        <li><a href="/article/articleAction_getActivityTotalCount.do"><spring:message  code='平台资讯'/></a></li>
                        </ul>
                        </li>
                      </ul>
                    </div>
                   </div> --%> 
                   
        <div class="index_linguister_header" style="height:40px;margin-bottom: 0px;">
        	<ul id="navul" style="float:left;margin-left:20px;">
        		<c:if test="${clientid.id==null && transid.id==null }">
        			<li style="color:#FFF"><a href="/forwardAction/forward_toLogin.do"><spring:message  code='客户中心'/></a></li>
        			<li style="color:#FFF"><a href="javascript:;" id="publishNeedClick"><spring:message  code='发布项目'/></a></li>
        		</c:if>
        		<c:if test="${clientid.id!=null && clientid.id!='' }">
        			<li style="color:#FFF"><a href="/cilentCustomer/findUI.do"><spring:message  code='客户中心'/></a></li>
        			<li style="color:#FFF"><a href="javascript:;" id="publishNeedClick"><spring:message  code='发布项目'/></a></li>
        		</c:if>
        		<c:if test="${clientid.id==null && transid.id==null }">
        			<li style="color:#FFF"><a href="/forwardAction/forward_toLogin.do"><spring:message  code='译员中心'/></a></li>
        		</c:if>
        		<c:if test="${transid.id!=null && transid.id!='' }">
        			<li style="color:#FFF"><a href="/cilentCustomer/findUI.do"><spring:message  code='译员中心'/></a></li>
        		</c:if>
        		<li style="color:#FFF"><a href="/translator/interShowUI.do"><spring:message  code='查看译员'/></a></li>
        		<li style="color:#FFF"><a href="/cilentCustomer/findNeedListUI.do"><spring:message  code='查看项目'/></a></li>
        		<li style="color:#FFF"><a href="javascript:;"><spring:message  code='专利翻译软件'/></a>
        			<ul>
                    	<li><a href="/forwardAction/forward_toSoftwareTranslation.do"><spring:message  code='软件下载'/></a></li>
                        <li><a href="/forwardAction/forward_toInstructions.do"><spring:message  code='软件界面说明'/></a></li>
                        <li><a href="/forwardAction/forward_toUse.do"><spring:message  code='软件翻译演示'/></a></li>
                        <li><a href="/forwardAction/forward_toFunction.do"><spring:message  code='软件功能介绍'/></a></li>
                        <li><a href="/forwardAction/forward_toMenu.do"><spring:message  code='功能表'/></a></li>
                   	</ul>
        		</li>
        		<li style="color:#FFF"><a href="/forwardAction/forward_toTeam.do"><spring:message  code='关于我们'/></a>
        			<ul>
                       <li><a href="/forwardAction/forward_toOA.do"><spring:message  code='服务介绍'/></a></li>
                       <li><a href="/forwardAction/forward_toQuality.do"><spring:message  code='质量控制'/></a></li>
                       <li><a href="/forwardAction/forward_toRuleDescription.do"><spring:message  code='规则中心'/></a></li>
                       <li><a href="/forwardAction/forward_toSecurityCenter.do"><spring:message  code='安全中心'/></a></li>
                       <li><a href="/forwardAction/forward_toCustomerInstructions.do"><spring:message  code='客户须知'/></a></li>
                       <li><a href="/forwardAction/forward_toInterpreterTips.do"><spring:message  code='译员须知'/></a></li>
                       <li><a href="/forwardAction/forward_toTranslationProcess.do"><spring:message  code='翻译流程'/></a></li>
                   </ul>
        		</li>
        	</ul>
       	<c:if test="${clientid.id==null && transid.id==null }">
        	<div class="navbar-right" style="margin-right: 20px;line-height: 40px;">
               	<ul class="list-inline nav_lists">
                      <li class="nav_lists_li"><a href="/forwardAction/forward_toLogin.do" class="navbar-link"><spring:message  code='登录'/></a></li>
                      <li class="nav_lists_li"><a href="/forwardAction/forward_toRegister.do" class="navbar-link"><spring:message  code='注册'/></a></li>
                </ul>
           </div>
        </c:if>
       <c:if test="${clientid.id!=null || transid.id!=null }">
           <div class="navbar-right" style="margin-right: 20px;line-height: 40px;"> 
           		<ul class="list-inline nav_lists">
           			<li class="nav_lists_li" style="width: auto;"><a href="/ClientUser/clientUserAction_exit.do" class="navbar-link"><spring:message  code='退出登录'/></a></li>
           			<%-- <li class="nav_lists_li" style="width: auto;"><a href="/cilentCustomer/findUI.do" target="_blank" class="navbar-link" style="position:relative;" ><spring:message  code='用户中心'/></a></li> --%>
          			<li class="nav_li_li" style="color:#FFF"><font id = "nickname" style="color:#77FF00"></font></li>
           		</ul>
           </div>
       </c:if>
        </div> 
                   
      <!--  头标签结束 -->
      <!--  质量控制 内容开始  -->
      <div class="quality_control">
        <div class="content_public">
                        <div >
               <br>
			<table  style="text-align: center;">
              <tr class="" >
                <td width="125px"><a class="btn btn-primary"  style="font-size: 16px;" href="/forwardAction/forward_toTeam.do"><spring:message  code='关于我们'/></a></td>
                <td width="125px" ><a class="btn btn-primary" style="font-size: 16px" href="/forwardAction/forward_toOA.do"><spring:message  code='服务介绍'/></a></td>
                <td width="125px"><a class="btn btn-primary" style="font-size: 16px" href="/forwardAction/forward_toQuality.do"><spring:message  code='质量控制'/></a></td>
                <td width="125px"><a class="btn btn-primary" style="font-size: 16px" href="/forwardAction/forward_toRuleDescription.do"><spring:message  code='规则中心'/></a></td>
                <td width="125px"><a class="btn btn-primary" style="font-size: 16px" href="/forwardAction/forward_toSecurityCenter.do"><spring:message  code='安全中心'/></a></td>
                <td width="125px"><a class="btn btn-primary" style="font-size: 16px" href="/forwardAction/forward_toCustomerInstructions.do"><spring:message  code='客户须知'/></a></td>
                <td width="125px"><a class="btn btn-primary" style="font-size: 16px" href="/forwardAction/forward_toInterpreterTips.do"><spring:message  code='译员须知'/></a></td>
                <td width="125px"><a class="btn btn-primary" style="font-size: 16px" href="/forwardAction/forward_toTranslationProcess.do"><spring:message  code='翻译流程'/></a></td>
              </tr >
      	</table>
      	<br>
      	</div>
      	<hr>
          <div class="title_public">
          <h2><spring:message  code='规则中心'/></h2>
          </div><br><br>
            <h4><spring:message  code='等级说明'/></h4><br>
     
          
          <ul class="quality_control_list" style="font-size:15px;">
            <li><b>1、<spring:message  code='译员等级。'/></b></li><br>
			<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='在译员注册后平台会对工作经验，与所能翻译及校对或审核的能力进行一个初步评估，给予一个等级。'/></li><br>
			<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='译员在平台进行一定的翻译任务后，或者对于平台给予等级不合理时，可以对等级提出升级。（交由平台进行审核判定）'/></li><br>
			<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='高等级可以获得更高的稿费标准更高。（后续会推出具体等级价格稿费标准表，提供参考，尚未推出以前以平台推荐价格为主）'/></li><br>
			<li><b>2、<spring:message  code='客户等级。'/></b></li><br>
<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='发布需求打一定折扣；在完成订单后积分将加倍计算；'/></li><br>
<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VIP<spring:message  code='客户签订了大客户协议后，将享受优惠将参照协议内容。'/></li><br>
<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='客户连续几个月案件量大于100就将客户直接提升至大客户等级，当连续几个月案件量低于70时就降级未为普通客户。'/></li><br>

            <h4><spring:message  code='信誉说明'/></h4><br>

<li><b>1、<spring:message  code='译员信誉。'/></b></li><br>
<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='信誉会依据译员评价总分数、译员积分、与平台合作时间来进行一份计算。'/></li><br>
<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='信誉初始值为500（较好，良好，一般，优），每完成一次订单将都可以增加部分信誉值。'/></li><br>
<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='信誉会影响系统自动任务的自动任务分配，译员展示的排名推送等功能。'/></li><br>
<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='延后交稿，将扣除部分信誉度。'/></li><br>
<li><b>2、<spring:message  code='客户信誉。'/></b></li><br>
<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='客户初始信誉为500，钱包内留有1000以上的备用金，信誉值会上升部分信誉。'/></li><br>
<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='客户将于每次订单成交完成评价也会增加一定的信誉度。'/></li><br>
<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='客户取消订单将会扣去信誉值，请谨慎选择。'/></li><br>
<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='信誉度会影响到客户下单后的推送，客户的信誉度会被显示。'/></li><br>
<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='当客户评价被译员申诉成功后，客户将扣除部分信誉。'/></li><br>

            <h4><spring:message  code='积分说明'/></h4><br>

<li><b>1、<spring:message  code='译员积分。'/></b></li><br>
<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='译员在翻译任务完成后会通过翻译字数的计算与完成质量而增加一定的积分。'/></li><br>
<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='使用软件可以调高部分积分的加成。'/></li><br>
<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='凡兑换商品务必谨慎，商品每月只允许兑换一次，且兑换后积分将清零。'/></li><br>
<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='兑换积分时平台会以快递形式发送至个人信息中填写的地址务必核对修改。'/></li><br>
<li><b>2、<spring:message  code='客户积分。'/></b></li><br>
            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='客户确认订单后平台会自动增加相应的积分值。'/></li><br>
            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='凡兑换商品务必谨慎，商品每月只允许兑换一次，且兑换过后积分将减少兑换商品相应的积分。'/></li><br>
            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='兑换积分时平台会以快递形式发送至个人信息中填写的地址务必核对修改。'/></li><br>

            <h4><spring:message  code='评价系统'/></h4>    <br>  
    
 <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='在客户确认订单后15天内，如若客户对此订单的翻译内容不满意，以及有任何不满可进行评价，平台会依据评价分数进行译员部分酬劳的扣取，并返还至客户账户中。若客户不对此订单中的译员进行评价，即系统将自动进行评价默认5星好评。'/></li><br>      
     
 
			</ul>
        </div>
      </div>
      <!--  质量控制 内容结束 -->
</div>
 <!-- 尾标签开始 -->
<div id="gradient" class="footer_content">
      <!-- 用户指南  -->
      <div class="messages container">
     	 	<div class="message_more">
      			<div class="row"></div>
      			</div>
      				
      					<ul class="col-sm-2 message_more_li"><li><h2><spring:message  code='新手指南'/></h2></li><li><a href="/forwardAction/forward_toRegisterProcess.do"><spring:message  code='注册流程'/></a></li><li><a href="/forwardAction/forward_toRuleDescription.do"><spring:message  code='规则中心'/></a></li><li><a href="/forwardAction/forward_toIdentification.do"><spring:message  code='用户认证'/></a></li></ul>
      					<ul class="col-sm-2 col-sm-offset-1 message_more_li"><li><h2><spring:message  code='我是客户'/></h2></li><li><a href="/forwardAction/forward_toCustomerInstructions.do"><spring:message  code='客户须知'/></a></li><li><a href="/forwardAction/forward_toPublishProcess.do"><spring:message  code='项目发布'/></a></li><li><a href="/forwardAction/forward_toQuality.do"><spring:message  code='质量控制'/></a></li></ul>
      					<ul class="col-sm-2 col-sm-offset-1 message_more_li"><li><h2><spring:message  code='我是译员'/></h2></li><li><a href="/forwardAction/forward_toInterpreterTips.do"><spring:message  code='译员须知'/></a></li><li><a href="/forwardAction/forward_toTranslationProcess.do"><spring:message  code='任务接受'/></a></li><li><a href="/forwardAction/forward_toRemuneration.do"><spring:message  code='稿酬明细'/></a></li></ul>
      				<ul class="col-sm-2 col-sm-offset-1 message_more_li"><li><h2><spring:message  code='爱译智能'/>-PAT</h2></li><li><a href="/forwardAction/forward_toFunction.do"><spring:message  code='软件功能介绍'/></a></li><li><a href="/forwardAction/forward_toSoftwareTranslation.do"><spring:message  code='在线视频教学'/></a></li><li><a href="/forwardAction/forward_toSoftwareTranslation.do"><spring:message  code='直接下载'/></a></li></ul>
      			
      </div>

      <!--------  login footer  -------->
      <footer class="container register_footer cl">
      		<ul class="list-inline">
      			<li>
      			<a href="/forwardAction/forward_toTeam.do"><spring:message  code='关于我们'/></a>
      			</li> | <li><a href="/forwardAction/forward_toTeam.do"><spring:message  code='联系方式'/></a>
      			</li> | <li><a href="http://www.aitrans.net"><spring:message  code='爱译智能'/>-CAT</a></li> | 
      			<li><a href="javascript:;"><spring:message  code='支付方式'/></a></li> | 
      			<li><a href="http://www.aitrans.org"><spring:message  code='友情链接'/></a></li> | 
      			<li><a href="/forwardAction/forward_toSecurityCenter.do"><spring:message  code='安全中心'/></a></li>
      			</ul>
      			<p class="footer_adress">Copyright 2005-2017 123.com版权所有 渝ICP备1234567-4号 渝B2-12134567 渝公安网备 1234567890号 互联网违法和不良信息举报电话：1234567 邮箱：123456.com</p>
      </footer>


    </div>
  <!-- 尾标签结束 -->

  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
