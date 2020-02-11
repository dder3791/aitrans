<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name=" Keywords" content="......">      <!--content中，网页关键字-->
    <meta name=" description" content="......">   <!--content中，网页描述文字-->
    <meta name="author" content="......">        <!--标注作者-->
    <title><spring:message  code='软件下载'/></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/softwear.translation.css"/>
 <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
   
      	<script type="text/javascript">
$(function(){
	
	//发布需求按钮
	$("#publishNeedClick").click(function (){
		var unickname = "${clientid.userName}"
		if(null==unickname || ""==unickname){
			layer.msg('hello');
			//layer.msg('<spring:message code="兑换成功，稍后会由工作人员给您发货！"/>',{icon:1});
			//alert("您不是客户，不能进行发布项目操作！")
		}else{
			$("#publishNeedClick").prop("href","/cilentCustomer/publishNeed.do")
		}
	})
	
	var tnickname = "${transid.nickname}";
	/* var tnickname = "${transid.nickname}";
	var unickname = "${clientid.userName}"
	if(tnickname!=""){
		$("#nickname").text(tnickname+"<spring:message  code='，欢迎您！'/>");
		
	}else if (unickname!="") {
		$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>");
		} */
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
});
	/* $.ajax({
		type : "POST",
		url : "/download/downloadAction_software.do",
		cache : false,
		dataType : "json",
		success : function(data) {
			software = data.software;
			updatePack = data.updatePack;
			$("#name").append(software.name);
			$("#size").append(software.size);
			$("#updateTime").append(software.updateTime);
			$("#url").prop("href",software.url);
			$("#uname").append(updatePack.name);
			$("#usize").append(updatePack.size);
			$("#uupdateTime").append(updatePack.updateTime);
			$("#ucontent").append(updatePack.content);
			$("#usoftware").append(updatePack.softwareRevision);
			$("#uurl").prop("href",updatePack.url);
			
		}
		});
	}); */
	
      function queryByInterpreter() {
   	 
   	 var nickName=$("#nickName").val();
   	 if(nickName!="" && nickName!="null" && nickName!=undefined){
   		 url="/translator/translatorAction_getTotalCount.do?msg="+nickName;
			window.open(url);
   	 }else{
   		 layer.msg('<spring:message  code="译员名不能为空！"/>', {icon: 2});
   	 }
		
	}
	
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
	</script>
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

      <!--  软件下载  -->
      <div class="wraper">
        <div class="row">
     
  
              <div class="clear"></div>
          <div class="wraper_left col-sm-9">
            <h3><spring:message  code='爱译智能'/><spring:message  code='（英汉/汉英）'/>—PAT<spring:message  code='软件下载'/></h3><br><br>
            <div class="msg-l">
              <ul class="msg-list">
              	<li id="name" ><span class="sub"><spring:message  code='软件版本：'/> </span>Aitrans-PAT 5.0<%--  <spring:message  code='安装盘'/> --%></li>
                <li id="size"><span class="sub"><spring:message  code='软件大小：'/> </span>107M</li>
                <li><span class="sub"><spring:message  code='软件厂商：'/> </span>
                  <a href="/team.presentation.jsp" rel="nofollow"  target="_blank" ><spring:message  code='环宇爱译'/> </a>
                </li>
                <li><span class="sub"><spring:message  code='软件语言：'/> </span><spring:message  code='简体中文'/> </li>
                <li><span class="sub"><spring:message  code='软件授权：'/> </span><spring:message  code='免费'/></li>
                <li><span class="sub"><spring:message  code='软件评级：'/> </span><i class="stars"><span style="width:80%"></span></i></li>
                <li><span class="sub"><spring:message  code='应用平台：'/> </span>WinAll</li>
                <li id="updateTime"><span class="sub"><spring:message  code='更新时间：'/> </span>2017-09-13</li>
              </ul>
              <div class="form-group lab_check">
               <!--  <label class="checkbox-inline">
                  <input type="checkbox" id="inlineCheckbox1" value="option1"> 电脑端版本下载
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="inlineCheckbox2" value="option2"> 更新包下载
                </label> -->
              </div>
              <div class="dl-area">
               <!--  <a href="/download-PAT 3.5 安装盘.rar" class="btn btn-info">PAT软件 高速下载</a> -->
                <a href="/download/Aitrans-PAT 5.0 安装盘.rar" class="btn btn-info" id="url"><spring:message  code='本地下载'/></a>
                <a href="/software/reChargeUI.do" class="btn btn-info" style="margin-left:190px"><spring:message  code='线上购买'/></a>
              </div>
            </div>
            <div class="clear"></div>
           <%--  <br>
            <%-- <h3><spring:message  code='爱译智能'/><spring:message  code='（日汉/汉日）'/>—PAT<spring:message  code='软件下载'/></h3>
            <br><br>
			 <div class="msg-l">
              <ul class="msg-list">
              	<li id="name" ><span class="sub"><spring:message  code='软件版本：'/> </span>Aitrans-PAT 5.0 <spring:message  code='安装盘'/></li>
                <li id="size"><span class="sub"><spring:message  code='软件大小：'/> </span>68.9M</li>
                <li><span class="sub"><spring:message  code='软件厂商：'/> </span>
                  <a href="/team.presentation.jsp" rel="nofollow"  target="_blank" ><spring:message  code='环宇爱译'/> </a>
                </li>
                <li><span class="sub"><spring:message  code='软件语言：'/> </span><spring:message  code='简体中文'/> </li>
                <li><span class="sub"><spring:message  code='软件授权：'/> </span><spring:message  code='免费'/></li>
                <li><span class="sub"><spring:message  code='软件评级：'/> </span><i class="stars"><span style="width:80%"></span></i></li>
                <li><span class="sub"><spring:message  code='应用平台：'/> </span>WinAll</li>
                <li id="updateTime"><span class="sub"><spring:message  code='更新时间：'/> </span>2017-09-13</li>
              </ul>
              <div class="form-group lab_check">
               <!--  <label class="checkbox-inline">
                  <input type="checkbox" id="inlineCheckbox1" value="option1"> 电脑端版本下载
                </label>
                <label class="checkbox-inline">
                  <input type="checkbox" id="inlineCheckbox2" value="option2"> 更新包下载
                </label> -->
              </div>
              <div class="dl-area">
               <!--  <a href="/download-PAT 3.5 安装盘.rar" class="btn btn-info">PAT软件 高速下载</a> -->
                <a href="/download-PAT 3.5 安装盘.rar" class="btn btn-info" id="url"><spring:message  code='本地下载'/></a>
              </div>
            </div> --%>
              <div class="clear"></div>
            <br>
  <!--           <h3>演示视频下载</h3>
			<div class="msg-l">
			
            <br>
              <ul class="msg-list">
              	<li><span class="sub">要求软件版本： </span>Aitrasn-CAT 3.5</li>
                <li><span class="sub">文件大小： </span>51.3MB</li>
                <li><span class="sub">上传时间： </span>2017-09-15</li>
                <li style="width: 100%;height: 40px" ><span class="sub" >包含内容： </span>交互翻译演示视频、界面介绍演示视频、智能翻译演示视频、智能知识库介绍视频、简介及智能翻译的演示视频、爱译在线演示视频。</li>
              </ul>
              <div class="dl-area">
                <a href="/download/演示视频.rar" class="btn btn-info" >本地下载</a>
              </div>
            </div> -->
           <div class="msg-l">
            		           <div class="videos sofr_tab">
            		             <div class="videomore">
                  <h3><spring:message  code='快速入门视频'/></h3>
                  <div class="video_border" >
                  	<video controls="controls"  height="180px" width="300px">
   						<source style="line-height:400px;text-align:center;" src="/mp4/爱译教学视频-Leo（flash）.mp4"  type="video/mp4"/>
   						</video>
                  </div>
                </div>
                <div class="videomore">
                  <h3>TM++<spring:message  code='原理与演示'/></h3>
                  <div class="video_border">
                  <video controls="controls"  height="180px" width="300px">
   						<source style="line-height:400px;text-align:center;" src="/mp4/TM++原理与演示--教学视频_转.mp4"  type="video/mp4"/>
   						</video>
                  </div>
                </div>
              
                <div class="videomore">
                  <h3><spring:message  code='智能翻译知识库教学视频'/></h3>
                  <div class="video_border">
                    <video controls="controls"  height="180px" width="300px">
   						<source style="line-height:400px;text-align:center;" src="/mp4/智能翻译知识库--教学视频_转.mp4"  type="video/mp4"/>
   						</video>
                  </div>
                </div>
                <div class="videomore">
                  <h3><spring:message  code='智能知识库'/></h3>
                  <div class="video_border">
                    <video controls="controls"  height="180px" width="300px">
   						<source style="line-height:400px;text-align:center;" src="/mp4/辅助翻译功能---教学视频_转.mp4"  type="video/mp4"/>
   						</video>
                  </div>
                </div>
              </div>
            </div>
            <!-- 软件介绍tab栏 -->
            <div class="sofr_tab">
              <ul id="myTab" class="nav nav-tabs">
              	<li class="active"><a href="#soft01" data-toggle="tab"><spring:message  code='软件介绍'/></a></li>
             <!--    <li><a href="#soft02" data-toggle="tab">软件使用介绍</a></li>
              	<li><a href="#soft03" data-toggle="tab">软件评论</a></li> -->
              </ul>
              <div id="myTabContent" class="tab-content">
              	<div class="tab-pane fade in active" id="soft01">
                 <h4 align="center"><spring:message  code='爱译智能'/>PAT 5.0</h4><br>
                 	<p><spring:message  code='本软件的'/>IT<spring:message  code='（交互翻译）模块提供快速鼠标指点输入、快捷键选词输入以及快速组词等功能。'/>TM+/TM++<spring:message  code='模块自动提取智能知识库中的匹配句对/句型，利用它们进行智能匹配翻译，使得相同的句子永远不需翻译第二遍，相近的句子也不再需要翻译第二遍，并且差别之处用相应颜色对照，极大减轻翻译者的脑力劳动。'/></p><br>
					<p><spring:message  code='针对计算机翻译技术现状和技术瓶颈，计算机智能翻译技术专家张龙哺先生提出采用混合翻译策略的计算机翻译技术和计算机智能翻译发展方向。以他为带头人的一批国内外机器智能翻译方面的专家和学者组成的团队，成功研发出一套智能化知识库理论体系和计算机智能翻译技术'/>（TM++）<spring:message  code='，以及最优化的多方式翻译策略。真正做到了让电脑模拟人脑的翻译思维，并且在翻译的同时自动智能化地学习和存储人的高智力翻译成果。而且系统还学习和记忆了相关的句式/句型，因此，翻译质量可以迅速提高。'/> </p><br>
      				<p> <spring:message  code='经过国家信息中心软件评测中心的评测和专家鉴定，认为爱译科技开发的'/>AITrans<spring:message  code='智能翻译系统是“我国具有自主知识产权的国际首创的人工智能翻译产品、在计算机翻译同类产品和系统中处于国际领先地位。具有广阔的市场前景”。'/> </p> <br>
		

               
              <!--     <div class="soft_pic">
                    <img src="http://via.placeholder.com/135x120" alt="">
                    <img src="http://via.placeholder.com/135x120" alt="">
                    <img src="http://via.placeholder.com/135x120" alt="">
                  </div> -->
                </div>
                <div class="tab-pane fade in" id="soft02">
                  <div class="row">
                    222
                  </div>
                </div>
                <div class="tab-pane fade in" id="soft03">
                  <div class="row">
                    333
                  </div>
                </div>
              </div>
            </div>
          </div>

       <div class="wraper_right col-sm-3">
          			
          		
          			
          			<div style="background: #f2f2f2;padding:20px;margin-bottom: 20px;margin-top: 40px;margin-left:6px;box-shadow: 2px 2px 8px #ccc;width: 90%;">
          			<br>
          			<h4 style="text-align: center;"><b><spring:message  code='提示'/></b></h4>
          			
          			<br>
          			<p style="font-size: 16px;margin-left: 5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='帮助中心可以找到有关软件的各种问题以及信息，可对于软件的实际操作，以及遇到的问题进行解决。'/></p><br>
          			<p style="font-size: 16px;margin-left: 5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='如果帮助中心依然解决不了您的问题，您可以及时与客服沟通来让技术人员尽快帮您解决使用中遇到的问题。'/></p><br>
          			<p style="font-size: 16px;margin-left: 5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='平台会陆续推出其它各种语言的翻译软件，平台用户可以在资讯信息中第一时间查询到推出进度，敬请期待！'/></p>
            		<br>
            		</div>
             <!--   <h5>热点需求</h5>
            <div class="wraper_need">
              <div class="hot_need">
                <img src="http://via.placeholder.com/230x120" alt="">
                <p class="explian">翻译/英语翻译/医学翻译/机械翻译/化妆品翻译/说明书翻译</p>
                <p class="explian">
                  <span>价格 <span>120.00</span></span>
                  <a href="javascript:;">查看需求</a>
                </p>
              </div>
              <div class="hot_need">
                <img src="http://via.placeholder.com/230x120" alt="">
                <p class="explian">翻译/英语翻译/医学翻译/机械翻译/化妆品翻译/说明书翻译</p>
                <p class="explian">
                  <span>价格 <span>120.00</span></span>
                  <a href="javascript:;">查看需求</a>
                </p>
              </div>
            </div> -->


          </div>
        </div>
      </div>


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
