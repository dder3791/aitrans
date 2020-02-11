<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name=" Keywords" content="......">      <!--content中，网页关键字-->
<meta name=" description" content="......">   <!--content中，网页描述文字-->
<meta name="author" content="......">        <!--标注作者-->
<title><spring:message code='项目详情'/></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/demand.details.css"/>

<script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/public.nav.footer.js"></script> --%>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/all.needs.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
 <script type="text/javascript">
  	$(function(){
  		
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
			$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>!");
			} */
  		
		//发布需求按钮
    	$("#publishNeedClick").click(function (){
    		if("${clientid}"==null || "clientid"==''){
    			layer.msg('hello');
    			//layer.msg('<spring:message code="兑换成功，稍后会由工作人员给您发货！"/>',{icon:1});
    			//alert("您不是客户，不能进行发布项目操作！")
    		}else{
    			$("#publishNeedClick").prop("href","/cilentCustomer/publishNeed.do")
    		}
    	})
		
  	 $("#tender").click(function(){
  		 
  		 //首先判断译员是否实名，实名信息从session中读取
  		 if("${transid}"!=null && "${transid}"!=""){
  			 if("${transid.certificationStatus}"==3 || "${transid.certificationStatus}"=='3' || "${transid.certificationStatus}"=='0' || "${transid.certificationStatus}"==0){
  				 //实名不通过或还没实名操作，跳转实名路劲
  				layer.alert('<spring:message  code="前往实名认证"/>', {
	  					icon: 1,
	  					title: "<spring:message  code='提示'/>",
	  					end: function () {
	  						window.open("/translator/newIdentity.do",'top');
	  						//window.location.href="/translator/newIdentity.do";
							}
	  					});
  				 
  			 }else if("${transid.isVerifty}"==3 || "${transid.isVerifty}"=='3' || "${transid.isVerifty}"=='0' || "${transid.isVerifty}"==0 || "${transid.isProofread}"==3 || "${transid.isProofread}"=='3' || "${transid.isProofread}"=='0' || "${transid.isProofread}"==0 || "${transid.isAudit}"==3 || "${transid.isAudit}"=='3' ||  "${transid.isAudit}"=='0' ||  "${transid.isAudit}"==0){
  				//资格认证失败，或没有认证资格操作
  				layer.alert('<spring:message  code="前往资格认证"/>', {
	  					icon: 1,
	  					title: "<spring:message  code='提示'/>",
	  					end: function () {
	  						window.open("/translator/newLanguage.do",'top');
	  						//window.location.href="/translator/newLanguage.do"
							}
	  					});
  			 }else{
  			    //实名认证并翻译，校对，审核有一项已认证资格
  				var field=$("#field").val();
  				var languagePair=$("#languagePair").val();
  				var transLevel=$("#transLevel").val();
  				/* var transLevels=transLevel.substring(0,1); */
  				var needid=$("#needid").val();
  				var procedureTypeId=$("#procedureTypeId").val();
  				$.post("/translator/translatorAction_queryBytransNeed.do?domain="+field+"&languagePair="+languagePair+"&transLevel="+transLevel+"&procedureTypeId="+procedureTypeId,function(data){
  					    if(data.result =="success"){
  					    	 layer.open({
  			      				  title: '<spring:message  code="提示"/>',
  			      				  content: '<spring:message  code="恭喜您，符合招标条件！！！"/>',
  					    	 });
  					    	 $.post("/translator/translatorAction_acceptTask.do?needid="+needid,function(data){
  					    		  if(data.result=="success"){
  					    			  layer.alert('<spring:message  code="您已接受任务"/>', {
  					  					icon: 1,
  					  					title: "<spring:message  code='提示'/>",
  					  					end: function () {
  					  						window.location.href="/cilentCustomer/findNeedListUI.do"
  											}
  					  					});
  					    		  }
  					    	  },"json");
  					    	 $("#tender").attr({ disabled: "disabled" });
  					    }else{
  					    	layer.alert('<spring:message  code="已认证翻译资格与此项目条件不符合，前往添加资格认证"/>', {
  			  					icon: 1,
  			  					title: "<spring:message  code='提示'/>",
  			  					end: function () {
  			  						window.open("/translator/newLanguage.do",'top');
  			  						//window.location.href="/translator/newLanguage.do"
  									}
  			  					});
  					    }
  				},"json");
  			 }
  		 }
		
	}); 
  		
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
</head>
<body style="background:#f5f5f5;">
  <!--      顶部导航      -->
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

    <!-- 需求的详情 -->
    <div class="demand_details_content">
      <div class="row">
        <!-- 需求的详情  left  开始 -->
        <div class="demand_details_left col-sm-9">
          <div class="demand_kind demand_name" style="margin-left:80px">
            <%-- <h4 style="display:inline-block;padding-right:20px;"><spring:message code='项目名称'/></h4> --%>
             <div class="row" style="margin-top:30px;">
             <input type="hidden" value="${clientCustomerNeed.id}" id="needid">
             <input type="hidden" value="${clientCustomerNeed.procedureTypeId}" name="procedureTypeId" id="procedureTypeId">
             <label  class="col-xs-2 rowlabel" style="margin-right:-50px"><spring:message code='项目名称：'/></label>
	         	<div class="col-xs-3" style="width:68.4%">
		           <input type="text" class="form-control" value="${clientCustomerNeed.title }" readonly="readonly">
        	 	</div>
        	 </div>
        	 <div class="row" style="margin-top:30px;">
        	 <label  class="col-xs-2 rowlabel" style="margin-right:-50px"><spring:message code='发布模式：'/></label>
	        	<div class="col-xs-3">
	        		<c:if test="${ clientCustomerNeed.publishModel=='主动投标模式'}">
	            		<input type="text" style="width:100%" class="form-control" value="<spring:message code='招标模式'/>" readonly="readonly">
	            	</c:if>
		            <c:if test="${clientCustomerNeed.publishModel!='主动投标模式'}">
		             	<input type="text" style="width:100%" class="form-control" value="<spring:message code='${clientCustomerNeed.publishModel}'/>" readonly="readonly">
		            </c:if>
	      		</div> 
	      		<label  class="col-xs-1 rowlabel" style="text-align: left;"></label>
		        <label  class="col-xs-2 rowlabel" style="margin-right:-50px"><spring:message code='项目领域：'/></label>
	         	<div class="col-xs-3">
	          		<input type="text" style="width:100%" id="field" class="form-control" value="<spring:message code='${field }'/>" readonly="readonly">
	        	</div>
	        	<label  class="col-xs-1 rowlabel" style="text-align: left;"></label>
        	</div>
        	 <div class="row" style="margin-top:30px;">
        	 <label  class="col-xs-2 rowlabel" style="margin-right:-50px"><spring:message code='项目语言：'/></label>
	        	<div class="col-xs-3">
	         		<input type="text" style="width:100%" class="form-control" id="languagePair" value="<spring:message code='${clientCustomerNeed.languagePair }'/>" readonly="readonly">
	      		</div>
	      		<label  class="col-xs-1 rowlabel" style="text-align: left;"></label>
		         	<label  class="col-xs-2 rowlabel" style="margin-right:-50px"><spring:message code='译员级别：'/></label>
	         	<div class="col-xs-3">
	          		<input type="text" style="width:100%" class="form-control" id="transLevel"   value="${clientCustomerNeed.transLevel }" readonly="readonly">
	        	</div>
	        	<label  class="col-xs-1 rowlabel" style="text-align: left;"></label>
	        	
        	</div>
        	 <div class="row" style="margin-top:30px;">
        	    <label  class="col-xs-2 rowlabel" style="margin-right:-50px"><spring:message code='流程类型：'/></label>
	        	<div class="col-xs-3">
	        	    <c:if test="${clientCustomerNeed.procedureTypeId eq '1'}">
	         		<input type="text" style="width:100%" class="form-control" value="<spring:message code='只翻译'/>" readonly="readonly">
	      		   </c:if>
	        	    <c:if test="${clientCustomerNeed.procedureTypeId eq '2'}">
	         		<input type="text" style="width:100%" class="form-control" value="<spring:message code='翻译和校对'/>" readonly="readonly">
	      		   </c:if>
	        	    <c:if test="${clientCustomerNeed.procedureTypeId eq '3'}">
	         		<input type="text" style="width:100%" class="form-control" value="<spring:message code='翻译校对和审核'/>" readonly="readonly">
	      		   </c:if>
	      		</div>
	      		<label  class="col-xs-1 rowlabel" style="text-align: left;"></label>
		        <label  class="col-xs-2 rowlabel" style="margin-right:-50px"><spring:message code='字数：'/></label>
	         	<div class="col-xs-3">
	          		<input type="text" style="width:100%" class="form-control" value="${clientCustomerNeed.length }<spring:message code='字'/>" readonly="readonly">
	        	</div>
	        	<label  class="col-xs-1 rowlabel" style="text-align: left;"></label>
	
        	</div>
        	 <div class="row" style="margin-top:30px;">
        	   <%--  <label  class="col-xs-2 rowlabel" style="margin-right:-50px"><spring:message code='总价:'/></label>
	        	<div class="col-xs-3">
	         		<font color="red"><input type="text" style="width:100%" name="totalMoney" class="form-control" value="￥${clientCustomerNeed.totalMoney }" readonly="readonly"></font>
	      		</div>
	      		<label  class="col-xs-1 rowlabel" style="text-align: left;"></label> --%>
		        <label  class="col-xs-2 rowlabel" style="margin-right:-50px"><spring:message code='状态：'/></label>
	         	<div class="col-xs-3">
	          		<input type="text" style="width:100%" class="form-control" name="cycle" id="cycle" value="<spring:message code='${clientCustomerNeed.cycle }'/>" readonly="readonly">
	        	</div>
	        	<label  class="col-xs-1 rowlabel" style="text-align: left;"></label>
	        	<label  class="col-xs-2 rowlabel" style="margin-right:-50px"><spring:message code='项目类型：'/></label>
	         	<div class="col-xs-3">
	          		<input type="hidden" value="${clientCustomerNeed.clientProjectTypeId }" name="ProjectTypeId">
	        		<c:if test="${clientCustomerNeed.clientProjectTypeId==1}">
	        			<input type="text" style="width:100%" class="form-control" value="<spring:message code='OA翻译' />" readonly="readonly">
	        		</c:if>
					<c:if test="${clientCustomerNeed.clientProjectTypeId==2}">
						<input type="text" style="width:100%" class="form-control" value="<spring:message code='部分全文翻译' />" readonly="readonly">
					</c:if>
					<c:if test="${clientCustomerNeed.clientProjectTypeId==3}">
						<input type="text" style="width:100%" class="form-control" value="<spring:message code='摘要翻译' />" readonly="readonly">
					</c:if>
					<c:if test="${clientCustomerNeed.clientProjectTypeId==4}">
						<input type="text" style="width:100%" class="form-control" value="<spring:message code='其他' />" readonly="readonly">
					</c:if>
					<c:if test="${clientCustomerNeed.clientProjectTypeId==5}">
						<input type="text" style="width:100%" class="form-control" value="<spring:message code='全文翻译' />" readonly="readonly">
					</c:if>
	        	</div>
        	</div>
        	<div class="row" style="margin-top:30px;">
        	<!-- <label  class="col-xs-1 rowlabel" style="text-align: left;"></label> -->
		      <label  class="col-xs-2 rowlabel" style="margin-right:-50px"><spring:message code='备注：'/></label>
	          <div style="width:65%;margin-left:90px;border: 1px;border-style: solid;">
			      <p>
		            &nbsp;&nbsp;<spring:message code='项目描述：'/>
		          </p>
		          <p class="text-indent">
		              ${clientCustomerNeed.description }
		          </p><br>
		          <p>&nbsp;&nbsp;<spring:message code='完成时间：'/><span>${clientCustomerNeed.publishTime }--${clientCustomerNeed.completeTime } 23:59:59<%-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code='共'/><c:if test="${time<0 }">0</c:if><c:if test="${time>0 }">${time }</c:if><spring:message code='天'/> --%></span></p>
	          	  <%-- <p>&nbsp;&nbsp;<spring:message code='有效时间：'/><span style="margin-right:30px;">——${clientCustomerNeed.EXPIRYDATE}</span></p> --%>
	          	  <p>&nbsp;&nbsp;<spring:message code='客户预算：'/><span>￥${clientCustomerNeed.totalMoney }</span></p>
	          </div>
        	</div>
     </div>
            <%-- <span style="font-size:16px;">${clientCustomerNeed.title }</span>
            <input type="hidden" value="${clientCustomerNeed.id}" id="needid">
            <div class="budget">
              <p><strong><spring:message code='流水号：'/></strong><span>${clientCustomerNeed.id }</span></p><br>
              <p><spring:message code='项目状态：'/><span style="margin-right:50px;color: black;"><spring:message code='${clientCustomerNeed.acceptState}'/></span><spring:message code='发布模式：'/>
               <span>
              	<c:if test="${ clientCustomerNeed.publishModel=='选定译员模式'}">
             		<spring:message code='招标模式'/>
             	</c:if>
	            <c:if test="${clientCustomerNeed.publishModel!='选定译员模式'}">
	             	<spring:message code='${clientCustomerNeed.publishModel}'/>
	            </c:if>
               </span>
              
              </p>
              <p>
              </p>
              
            </div>
            <input type="hidden" value="${clientCustomerNeed.procedureTypeId}" name="procedureTypeId" id="procedureTypeId">
            <ul class="list-inline">
              <li><spring:message code='项目领域：'/><span id="field"><spring:message code='${field }'/></span></li>
              <li><spring:message code='翻译语言：'/><span id="languagePair"><spring:message code='${clientCustomerNeed.languagePair }'/></span></li>
              <li><spring:message code='译员级别：'/><span id="transLevel">${clientCustomerNeed.transLevel }<spring:message code='级'/></span></li>
              <li id="procedureTypeId"><spring:message code='流程类别：'/>
              		<c:if test="${clientCustomerNeed.procedureTypeId eq '1'}"><span><spring:message code='仅翻译'/></span></c:if>
              		<c:if test="${clientCustomerNeed.procedureTypeId eq '2'}"><span><spring:message code='翻译校对'/></span></c:if>
              		<c:if test="${clientCustomerNeed.procedureTypeId eq '3'}"><span><spring:message code='翻译校对审核'/></span></c:if>        
              </li>
              <li><spring:message code='完成时间：'/><span>${clientCustomerNeed.publishTime }--${clientCustomerNeed.completeTime }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code='共'/><c:if test="${time<0 }">0</c:if><c:if test="${time>0 }">${time }</c:if><spring:message code='天'/></span></li>
              <li>手机号：<span>${clientCustomerNeed.tel }</span></li>
              <li>QQ号：<span>${clientCustomerNeed.qq }</span></li>
            </ul> --%>
          </div>
         <%--  <div class="demand_kind demand_details">
          <h4><spring:message code='项目详情'/></h4>
          <div class="demand_describe">
          <p>
            <spring:message code='项目描述：'/>
          </p>
          <p class="text-indent">
              ${clientCustomerNeed.description }
          </p>
            </div>
            <p style="padding-top:10px;"><spring:message code='有效时间：'/><span style="margin-right:30px;">${clientCustomerNeed.publishTime }——${clientCustomerNeed.EXPIRYDATE}</span> <spring:message code='预算：'/><span>￥${clientCustomerNeed.totalMoney }</span></p>
            
          </div> --%>
         <%--  <div class="" align="center">
              <a href="${pageContext.request.contextPath}/cilentCustomer/findNeedListUI.do" class="btn btn-info tender_btn">返回我的需求</a>
            </div> --%>
         <!--  <div class="demand_kind tendered">
            <h4>已投标</h4>
            <div class="tendered_div">
              <ul class="list-inline tendered_ul">
                <li class="tendered_li">
                  <img src="http://via.placeholder.com/160x140" alt="">
                  <strong>sdfdv</strong>
                  <p>2017-02-03</p>
                </li>
              </ul>
              <p><span class="text-primary click_demand">展开更多投标 》</span></p>
            </div>

          </div> -->
        <!-- </div> -->
        <!-- 需求的详情  left  结束 -->
        <div class="demand_details_right col-sm-3">
          <div class="demand_employer" style="width: 247.5px;height: 150px;">
            <img src="/${clientUser.headPortrait }" style="width: 100px;height: 130px;" alt="">
            <div class="demand_employer_details pull-right">
              <p>${clientUser.realName }</p>
              <p><spring:message code='所在地：'/><span>${clientUser.address }</span></p>
              <p><spring:message code='信用等级：'/>
	              <span>
	              <c:if test="${clientUser.userType==0 || clientUser.userType=='0' } ">
	               <spring:message code='普通用户'/>
	              </c:if>
	              <c:if test="${clientUser.userType==1 || clientUser.userType=='1' } ">
	               <spring:message code='vip用户'/>
	              </c:if>
	              </span>
	           </p>
              <!-- <a href="javascript:;" class="btn btn-info" style="color:#fff;">联系雇主</a> -->
            </div>
          </div>
          <!-- <ul class="list-inline demand_browse">
            <li>
              <strong>浏览数量</strong>
              <strong>197</strong>
            </li>
            <li>
              <strong>投标数量</strong>
              <strong>14</strong>
            </li>
          </ul> -->
          <div style="hight:5px"></div> 
          <div class="demand_btns">
            <div class="row">
            <c:if test="${transid!=null }">
          <c:if test="${clientCustomerNeed.publishModel eq '主动投标模式'}">
             <c:if test="${clientCustomerNeed.acceptState eq '发布中'}">
              <button class="btn btn-info col-sm-12" style="color:#fff;"  id="tender" ><spring:message code='我要投标'/></button>
              </c:if>
            </c:if>
            </c:if>
            </div>
            <%-- <div class="row">
              <!-- <a href="javascript:;" class="btn btn-default col-sm-5">反馈举报</a> -->
            <c:if test="${clientid!=null }">
              <a href="/cilentCustomer/publishNeed.do?language=${clientCustomerNeed.languagePair }&domain=${field }&level=${clientCustomerNeed.transLevel }&procedure=${clientCustomerNeed.procedureTypeId}" class="form-control btn-info" style="text-align: center;"><spring:message code='发布类似项目'/></a>
           	</c:if>
            </div> --%>
          </div>
        </div>
      </div>
    </div>
</div>
<!-- 用户指南  -->
<div id="gradient" class="footer_content">
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
		<li><a href="/forwardAction/forward_toTeam.do"><spring:message  code='关于我们'/></a>|</li>  
		<li><a href="/forwardAction/forward_toTeam.do"><spring:message  code='联系方式'/></a>| </li> 
		<li><a href="http://www.aitrans.net"><spring:message  code='爱译智能'/>-CAT</a>|</li>  
		<li><a href="javascript:;"><spring:message  code='支付方式'/></a>|</li>  
		<li><a href="http://www.aitrans.org"><spring:message  code='友情链接'/></a>| </li> 
		<li><a href="/forwardAction/forward_toSecurityCenter.do"><spring:message  code='安全中心'/></a></li>
 	</ul>
    <p class="footer_adress">Copyright 2005-2017 123.com版权所有 渝ICP备1234567-4号 渝B2-12134567 渝公安网备 1234567890号 互联网违法和不良信息举报电话：1234567 邮箱：123456.com</p>
  </footer>
</div>
  <script type="text/javascript">
    var tenderedLi = $(".tendered_ul").html()
    for(var i=0;i<7;i++){
      $(".tendered_ul").append(tenderedLi);
    }

    $(".click_demand").click(function(){
      if($(".tendered_ul").hasClass("height_demand")){
        $(".tendered_ul").removeClass("height_demand");
        $(this).text("<spring:message code='展开更多投标'/> 》");
      }else{
        $(".tendered_ul").addClass("height_demand");
        $(this).text("<spring:message code='收起'/>");
      }
    });

  </script>
  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
