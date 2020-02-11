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
    <title><spring:message  code='软件功能介绍'/></title>
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
            <h2 align="center"><spring:message  code='功能模块介绍'/></h2>
          </div>
          <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='爱译智能'/>PAT 3.5<spring:message  code='包括：智能化知识库、交互翻译'/>（IT）<spring:message  code='模块、翻译记忆'/>（TM+­）<spring:message  code='模块、翻译存储'/>（TM++）<spring:message  code='模块、在线翻译模块、汉英翻译智能输入提示模块、服务器和云翻译等功能模块。'/></p>
        	
          <br><p><b>[<spring:message  code='智能知识库模块'/>]</b></p><br>
          <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='智能知识库相当于翻译工作者的第二个大脑。'/></p>
          <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='智能知识库模块具有选用、新建、更新、扩充知识库等功能。'/></p>
          <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='词库方面，采用科学合理的词库设计。可区分大小写、专业术语、名词单复数、动词时态和形态等。例如：'/>cat^猫，CAT^<spring:message  code='计算机辅助翻译。'/></p>
          <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='导入标准词条：对于翻译公司、企业和有经验的翻译者，在平时的工作中都积累了大量的与其专业有关的词汇。这些资源比系统提供的词库可能更准确、更有针对性。可以采用导入标准词条的方法将其导入到所选用的专业翻译知识库中。'/></p>
          <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='导入用户词库：例如，将'/>A<spring:message  code='机器中的用户词库的'/>.usr<spring:message  code='文件拷贝至'/>B<spring:message  code='机器，采用导入用户词库功能，就可轻松实现用户间的翻译知识共享。'/></p>
          <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='导入句库：例句可作为提高翻译效率的重要手段之一。如果用户有以前翻译的语料（双语句对），点击知识库->导入句库->导入标准句库，就可充分利用以前积累的翻译知识，保证相同的句子不再需要翻译第二遍了。如果导入的是模式化句对（由'/>TM++<spring:message  code='模块产生），则可保证相近的句子也不需要翻译第二遍了。'/></p>
          <br><p><b> [<spring:message  code='交互翻译'/>（IT）<spring:message  code='模块'/>]</b></p> 
          <br><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='交互翻译'/>（IT）<spring:message  code='模块，调用智能化知识库，将要翻译的句子的单词或词组自动进行拆分和标示，并显示其释义，把高频释义放在首位。由于每个词对应多个释义，译者可通过鼠标选择最适合的释义。利用该模块，用户可在“指点”间完成对句子的理解和翻译。在整个翻译过程中省去了查词典、键盘输入等工作，从而最大限度地减少机械的、重复的工作，让翻译者的主要精力集中到创造性思考上，思考如何翻译好句子，并对翻译结果进行精雕细琢。因此，不仅提高了翻译速度，而且还可提高翻译质量。'/></p>
          <p><img  src="/img/function1.png"  style="height:400px;width: 650px;" ></p><br>
          <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='交互翻译'/>（IT）<spring:message  code='”键释义将在插入译文区当前光标处。'/></p>
          <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='通过交互翻译'/>（IT）<spring:message  code='模块，还可对词库进行快速编辑、更新。在选择释义时，通过双击即可将该释义送入译文区同时还可将其置首。点击修改词条按钮即可打开修改词条对话框，实时增加或修改释义（和/或联想词）。右击新词组的第一个单词再右击最后一个单词，即可快速完成组词。'/></p>
          <br><p><b> [<spring:message  code='翻译记忆'/>（TM+）<spring:message  code='模块'/>]</b></p> <br>
          <p>TM+ <spring:message  code='是利用智能知识库模拟人脑翻译思维的人工智能翻译技术（智能知识库可以自己用'/>TM++<spring:message  code='模块积累，也可以与他人分享）。'/></p>
          <p>TM+ <spring:message  code='模块具有智能翻译处理功能：'/></p>
          <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1）TM+ <spring:message  code='模块可在最短时间内查找智能化知识库，对要翻译的句子进行快速分析对比，保证相同的句子永远不需要翻译第二遍；'/></p>
          <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2）<spring:message  code='利用智能知识库中的句式或句型，'/>TM+ <spring:message  code='功能模块可对要翻译的句子进行模糊匹配、推理和推测等，并给出完整准确的译文，从而保证类似句子也不需要翻译第二遍。'/></p>
          <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3）<spring:message  code='差别部分不仅能自动替换，而且还用相应颜色显示译文的变化，智能效果一目了然。'/></p>
          <br><p><b>[<spring:message  code='超级智能翻译'/>（TM++）<spring:message  code='模块'/>]</b></p><br>
          <p>TM++<spring:message  code='是一种模拟人脑学习记忆和翻译思维的超级人工智能翻译技术。'/></p>
          <p>TM++<spring:message  code='模块在'/>TM+ <spring:message  code='模块基础上增加了智能化自学习功能：'/></p>
          <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1．<spring:message  code='翻译自学习功能：在您进行人机交互翻译过程，'/>TM++<spring:message  code='模块将自动地学习所翻译的句式或句型，并可将它保存到智能知识库中。因此，您的翻译水平越高，该软件（智能知识库）的翻译水平就越高。'/></p><br>
          <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2．<spring:message  code='智能化翻译编辑处理功能：按照您平时的翻译编辑习惯，即可进行智能化格式编辑处理。当然，您对'/>TM++<spring:message  code='技术了解越多，对'/>TM++<spring:message  code='模块功能掌握越多，则您的教学水平就越高。'/></p>
          <br><p><b>[<spring:message  code='在线翻译模块'/>]</b></p><br>
          <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='在翻译过程中，如需要在线查词或在线翻译的帮助，点击“爱译助手'/>（F11）<spring:message  code='”按钮，即可弹出“爱译助手”程序对话框，该程序方便译员快速查词、翻译句子，无需在多个在线翻译网站来回切换，只需点击对话框左侧列表中的在线翻译网站的名称，在线翻译功能具体操作如下：'/></p>
         <p><img alt="" src="/img/function2.png"  style="height:50px;width: 700px; " ></p><br>
         <p>1)<spring:message  code='点击在爱译助手按钮'/><img alt="" src="/img/bn7.png"  style="height:20px;width: 20px; " ><spring:message  code='出现如下对话框：'/></p>
           <p><img alt="" src="/img/function3.png"  style="height:500px;width: 800px;" ></p><br>
           <p>2）<spring:message  code='在此对话框中即可在线查词也可在线翻译句子。在左侧“翻译文本”框中输入需查询的单词或句子，该词或句子将自动发送到用户所选的在线翻译网站并获得来自在线翻译网站的反馈翻译结果，用户可选择左侧翻译框下方的任意在线翻译网站，对话框右侧将显示包含翻译结果的页面。'/></p>
          <p>A. <spring:message  code='在线查词'/></p>
           <p>  <spring:message  code='如果“翻译文本”框中是一个单词或词组，则右侧显示包含该单词或词组的页面，如下图所示。'/></p>
            <p><img src="/img/function4.png" style="height:500px;width: 800px;"></p><br>
            <p>B. <spring:message  code='在线翻译'/></p>
            <p><spring:message  code='如果“翻译文本”框中是一个句子，则右侧显示包含该句子翻译结果的页面，如下图所示。'/></p>
             <p><img src="/img/function5.png" style="height:500px;width: 800px;"></p><br>
            <p> C. <spring:message  code='自动在线翻译'/></p>
              <p><spring:message  code='当程序自动选中并翻译一个句子时，比如'/>“The dream of translators.”<spring:message  code='如想获取在线翻译网站的自动翻译服务，只需点击工具栏中的“在线翻译”按钮，就可打开在线翻译模块（爱译助手）并将上述句子发送至在线翻译模块，在线翻译模块自动将接收到的上述句子发送到在线翻译网站并获得该在线翻译网站提供的自动翻译结果，如下图所示。'/></p>
            <p><img src="/img/function6.png"  style="height:500px;width: 800px;"></p><br>
            <p><spring:message  code='自动在线翻译'/><spring:message  code='当主程序翻译下一句时比如'/>“You are a translator.”<spring:message  code='该句子自动送到在线翻译模块，并显示在在线翻译对话框左上角的“翻译文本”框中，点击翻译按钮即可获得在线翻译网站提供的自动翻译结果。当需要利用其它在线翻译网站进行在线翻译时，只需点击左侧列表中的其它在线翻译网站的名称，该在线翻译模块自动将“翻译文本”框中的内容发送到所点击（选中）的在线翻译网站并获得来自该在线翻译网站的翻译结果。'/></p><br>
            <p><spring:message  code='在下次在线翻译时，选中的在线翻译网站为默认的在线翻译网站。'/></p>
           <p><b>[<spring:message  code='汉英翻译智能输入提示模块'/>]</b></p><br>
             <p><spring:message  code='汉译英时，如在译文区手动输入单词，则自动弹出输入提示框，以便于用户快速输入。'/></p>
               <p>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1）<spring:message  code='智能输入提示框中的内容为交互区所有中文的释义中所有以输入的字母开头的单词；'/></p>
                   <p><img src="/img/function8.png" style="height: 160px;width: 700px;"></p><br>
                   <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2）<spring:message  code='在译文区增加字母时，系统自动筛选智能输入提示框的内容；'/></p>
                     <p><img src="/img/function9.png"></p><br>
                     <p>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3）<spring:message  code='在译文区删除字母时，系统自动恢复原先智能输入提示框内容；'/></p>
                        <p><img src="/img/function10.png"   ></p>
                        <br><p><b> [<spring:message  code='服务器翻译模块'/>]</b></p><br> 
                        <p><spring:message  code='当用户通过局域网或互联网与其它翻译者共享服务器上的智能知识库时，通过服务器翻译选项菜单可进行相应的设置，如下：'/></p>
                        <p><img src="/img/function7.png"   style="height: 400px;width: 300px;"></p>
                       <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1）	<spring:message  code='显示服务器翻译结果对话框（点击框中的翻译内容可将其送入译文区，点击'/>[X]<spring:message  code='或按'/>Esc<spring:message  code='键可关闭该弹出框'/>）。</p>
                         <p>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2）<spring:message  code='译文区无翻译结果时采用服务器翻译结果（交互区优先采用服务器下传的术语），可优先选用爱译或谷歌。'/></p>
                         <p>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3）<spring:message  code='当交互区中不优先显示服务器下传术语时，在对话框中显示服务器下传术语。'/></p>
                         <br><p><b>  [<spring:message  code='云翻译模块'/>]</b></p><br> 
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='爱译智能'/>PAT 3.5 <spring:message  code='还整合了当今各种最先进的云翻译功能，不仅为译者提供各种短语和术语的参考译法，而且越来越多的句子可以直接采用。'/></p> 
        <br><p><b>  [QC<spring:message  code='质量检查按钮'/>]</b></p><br> 
           <p><img src="/img/function11.png"   style="height: 50px;width: 200px;"></p><br>          
          <p><spring:message  code='按下'/>QC<spring:message  code='按钮，在翻译完一句话，确认翻译后软件将进行质量检查，按照设置中QC选项中选中的项目进行。如图,QC提示窗弹出，提示检查出问题，具体的位置和问题在右侧模块框中显示。'/></p><br>
          <p><img src="/img/function12.png"   style="height:450px;width: 1000px;"></p>  
        </div>
        </div>
       
      </div>
      <!--  团队介绍  内容结束  -->
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
