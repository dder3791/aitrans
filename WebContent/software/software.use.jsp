<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name=" Keywords" content="......">
<!--content中，网页关键字-->
<meta name=" description" content="......">
<!--content中，网页描述文字-->
<meta name="author" content="......">
<!--标注作者-->
<title><spring:message  code='软件翻译演示'/></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/public.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/nav.css" />
 <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
<script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<style type="text/css">
.team_presentation_adress .adress_right {
	background: #fff;
	border-radius: 5px;
	height: 220px;
}

.team_presentation_adress {
	padding-top: 45px .col-sm-6 adress_right;
}

img {
	width: 520px;
	height: 220px;
	margin: 0 auto;
	margin-top: 30px;
	border-radius: 5px;
}
</style>
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
<body style="background: #f5f5f5;">
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
			<div class="team_presentation_content content_public"
				style="margin-top: 40px;">
				<div class="title_public">
					<h2 align="center"><spring:message  code='翻译演示'/></h2>
				</div>
				<p>
					<b><spring:message  code='便捷高效翻译：'/></b>
				</p>
				<br>
				<p><spring:message  code='本软件的'/>IT<spring:message  code='（交互翻译）模块提供快速鼠标指点输入、快捷键选词输入以及快速组词等功能。'/>TM+/TM++<spring:message  code='模块自动提取智能知识库中的匹配句对/句型，利用它们进行智能匹配翻译，使得相同的句子永远不需翻译第二遍，相近的句子也不再需要翻译第二遍，并且差别之处用相应颜色对照，极大减轻翻译者的脑力劳动。'/></p>
				<br>
				<p>
					<b>1、<spring:message  code='打开文件。'/></b>
				</p>
				<br>
				<p><spring:message  code='按下列方式之一打开文件/粘贴所需翻译内容：'/></p>
				<br>
				<p>a 、<spring:message  code='点击“文件”主菜单，选择“打开”子菜单打开所需翻译的文章（文件格式为'/>TXT、RTF<spring:message  code='和'/>DOC）；</p>
				<br>
				<p>b 、<spring:message  code='直接点击工具栏打开按'/><img alt="" src="/img/bn4.jpg" style="width: 20px; height:20px"> <spring:message  code='打开需翻译的文章（文件格式为'/>TXT、RTF<spring:message  code='和'/>DOC）；</p>
				<br>
				<p>c 、<spring:message  code='直接复制/贴粘所需翻译内容至文章区。'/></p>
				<br>
				<p><spring:message  code='打开翻译文章界面如下：'/></p>
				<br>
				<p>
					<img src="/img/use1.png"
						style="width: 800px; height: 500px">
				</p>
				<br>
				<p>
					<b>2、<spring:message  code='选择句子。'/></b>
				</p>
				<br>
				<p><spring:message  code='按下列方式之一选择所需翻译句子：'/></p>
				<br>
				<p>a 、<spring:message  code='自动选择所需翻译句子：将光标放至所需翻译句子句首，点击“翻译”按钮'/><img alt="" src="/img/bn1.png" style="width: 20px; height:20px"> <spring:message  code='可自动选择所需翻译的句子；'/></p>
				<br>
				<p>b 、<spring:message  code='手动选择所需翻译句子：用鼠标选择所需翻译句子内容。'/></p>
				<br>
				<p><spring:message  code='双语单栏界面如下：'/></p>
				<br>
				<p>
					<img src="/img/use2.png"
						style="width: 800px; height: 500px">
				</p>
				<br>
				<p>
					<spring:message  code='双语表格界面：'/>
				</p>
				<br>
				<p>
					<img src="/img/use3.png"
						style="width: 800px; height: 500px">
				</p>
				<br> <br>
				<p>
				<spring:message  code='在双语表格界面下选择翻译句子，只需点击所翻译句子译文行即可，翻译句子整句自动在交互区中显示，也可将交互区关闭。'/>
				</p>
				<br>
				<p>
				<spring:message  code='交互区关闭界面如下：'/>
					
				</p>
				<br>
				<p>
					<img src="/img/use4.png"
						style="width: 800px; height: 500px">
				</p>
				<br>
				<p>
					<spring:message  code='交互区关闭后可直接在原文右侧行中输入译文，界面如下：'/>
				</p>
				<br>
				<p>
					<img src="/img/use5.png"
						style="width: 800px; height: 500px">
				</p>
				<br> <br>
				<p>
					<b>3、<spring:message  code='交互翻译'/> </b>
				</p>
				<br>
				<p><spring:message  code='本软件的'/>IT<spring:message  code='（交互翻译）模块提供快速鼠标指点输入、快捷键选词输入以及快速组词等功能。翻译时，除了在译文区直接输入外，还可用鼠标在交互区指点释义进行快速输入，以及用快捷键方式输入译文。'/>
				</p>
				<br>
				<p><spring:message  code='交互区以积木方式摆放了当前翻译句子的单词/词组、默认释义、快捷键字母等，直接点击默认释义（第一释义）即可将其输入到译文区。交互区的大小随翻译内容的多少而变动，无翻译内容时，交互区是关闭的。'/>
				</p>
				<br>
				<p><spring:message  code='当鼠标指到某个单词区域时，还会出现一个释义下拉对话框，以显示此单词的更多释义和联想词，用户可根据需要来选择最适合的释义，用鼠标点击所需释义即可将其直接输入到译文区中。（通过释义下拉对话框还可对该单词进行修改、添加释义等操作。）'/>
				</p>
				<br>
				<p><spring:message  code='快捷键选词输入：在按下'/>Alt<spring:message  code='键的同时，选择交互区中各单词区域前显示的字母键即可选中交互区中相应的单词或词组（也可在按下'/>Alt<spring:message  code='键的同时，用左右方向键来移动并选中所想单词或词组），并弹出释义下拉对话框，按空格（'/>space<spring:message  code='）键或回车（'/>Enter<spring:message  code='）键即可将默认释义（第一释义）输入到译文区，按各释义左边的数字键即可将相应的释义输入到译文区（也可用上下方向键来选择弹出释义下拉对话框中所需释义）。具体情况可参见下一节“快捷键输入方式”。'/></p>
				<br>
				<p><b>4、<spring:message  code='确认/并翻译下一句'/></b></p>
				<br>
				<p><spring:message  code='翻译完当前句后点击“确认”按钮'/><img alt="" src="/img/bn2.png" style="width: 20px; height:20px"> 
					<spring:message  code='，以确认本句的翻译；则在文章区中以双语对照格式显示原文与译文。如果点击“确认并翻译下一句”按钮'/><img alt="" src="/img/bn3.png" style="width: 20px; height:20px"> 
					<spring:message  code='，以确认本句的翻译并翻译下一句，则在文章区中以双语对照格式显示原文与译文，并且系统自动提取并翻译下一句。，如下图所示：'/></p>
				<br>
				<p><spring:message  code='双语单栏翻译界面：'/></p>
				<br>
				<p>
					<img src="/img/use6.png"
						style="width: 800px; height: 500px">
				</p>
				<br>
				<p><spring:message  code='双语表格翻译界面：'/></p>
				<br>
				<p>
					<img src="/img/use7.png"
						style="width: 800px; height: 500px">
				</p>
				<br>
				<p><spring:message  code='如不需翻译此句可直接点击“翻译下一句”按钮，以进入下一句的翻译，所翻句子内容将在交互区中显示。'/></p>
				<br>
				<p><b>5、<spring:message  code='查看译文'/></b></p>
				<br>
				<p><spring:message  code='在翻译完一部分或整篇文章后，'/></p>
				<br>
				<p><spring:message  code='在翻译完一部分或整篇文章后，'/></p>
				<br>
				<p><spring:message  code='如需回到双语对照翻译状态，可点击菜单栏“项目—显示双语”，文章区将显示双语，并可继续翻译。'/></p>
				<br>
				<p><spring:message  code='在双语对照翻译状态，如需查看原文，可点击菜单栏“项目—显示原文”，文章区将只显示原文。'/></p>
				<br>
				<p>
					<b>6、<spring:message  code='导出译文'/> </b>
				</p>
				<br>
				<p><spring:message  code='翻译完成后，如需导出译文，可选择“文件”菜单中的“导出译文”，或直接点击“导出译文”按钮'/><img alt="" src="/img/bn5.png" style="width: 20px; height:20px"> 
					<spring:message  code='，可将译文另存为'/>TXT/RTF/DOC<spring:message  code='文档格式，同时在文章区显示译文结果。'/></p>
				<br>



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
