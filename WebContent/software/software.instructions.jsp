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
    <title><spring:message  code='软件界面说明'/></title>
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
//头标签效果显示  开始
$(document).ready(function(){
    $(".navbg").capacityFixed();
    $("#navul > li").not(".navhome").hover(function(){
      $(this).addClass("navmoon");
    },function(){
      $(this).removeClass("navmoon");
    });
    
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
    .team_presentation_adress .adress_right{ background:#fff;border-radius: 5px;height:220px;}
    .team_presentation_adress{padding-top:45px
    .col-sm-6 adress_right;}img{width:520px;height:220px;margin:0 auto;margin-top: 30px;border-radius: 5px;}
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

      <!--  团队介绍 内容开始  -->
      <div class="team_presentation">
        <div class="team_presentation_content content_public" style="margin-top:40px;">
          <div class="title_public">
            <h2 align="center">PAT<spring:message  code='界面说明'/></h2>
          </div>
          <p><spring:message  code='程序启动后，在屏幕上将出现如下图所示界面：'/></p>
        	<p><img  src="/img/jiemian1.png"  style="height:400px;width: 650px;"></p><br>
          <p><spring:message  code='系统界面是翻译人员进行翻译/校对和知识库管理等的工作平台，包括以下部分：'/></p> <br>  
          <p><spring:message  code='菜单栏：用于完成各种操作。'/></p><br>
          <p><spring:message  code='工具栏：提供系统常用操作和翻译操作的快捷按钮，可分为系统常用操作按钮、翻译操作按钮。'/></p><br>
          <p><spring:message  code='状态栏：用于显示提示信息、库名信息以及其它相关信息等。在状态栏中，主要包括：提示区和库名区。'/> </p><br>
          <p><spring:message  code='译文区：用于显示当前句子的翻译结果，在此区域可直接对译文进行插入、删除等编辑工作。'/> </p><br>
          <p><spring:message  code='交互区：用于积木式摆放当前翻译句子的单词/词组、释义、快捷键字母等按钮，供交互组句使用；同时，可用于修改/更新单词/词组、释义等信息。（交互区的大小随翻译内容的多少而变动，无翻译内容时，交互区是关闭的。）'/></p><br>
          <p><spring:message  code='文章区：用于显示要翻译的文章，并以双语逐句对照形式显示原文和译文。'/> </p><br>
          <p><spring:message  code='提示区：当光标移动到某个菜单或按钮上时，提示区中将显示相应功能的说明信息。'/> </p><br>
          <p><spring:message  code='库名区：显示当前所用知识库名称，更换知识库时，知识库名称将相应变化。'/> </p><br>
          <br><p><spring:message  code='实际使用情况下的系统界面如下：'/> </p><br>
          
          <p>1 ）<spring:message  code='双语单栏翻译界面'/> </p><br>
        <p><img alt="" src="/img/jiemian2.png"  style="height:500px;width: 800px;" ></p><br> 
          <p>2 ）<spring:message  code='双语表格翻译界面'/> </p><br>
         <p><img alt="" src="/img/jiemian3.png" style="height:500px;width: 800px;"></p><br> 
         <p>3）<spring:message  code='启用项目术语表与云翻译翻译界面（位置可在视图—垂直栏设置里进行更改）'/></p><br>
       
         <p><img src="/img/jiemian4.png"  style="height:500px;width: 800px;"></p>
        
                     
          
        </div>
        
       
      </div>
      <!--  团队介绍  内容结束  -->

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
