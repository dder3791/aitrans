<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code='用户中心-我是客户-我的评价详情编辑'/></title>

    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.center.css"/>
	<link rel="stylesheet" href="/css/star-rating.css" media="all" type="text/css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/themes/krajee-fa/theme.css" media="all" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themes/krajee-svg/theme.css" media="all" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themes/krajee-uni/theme.css" media="all" type="text/css"/>
    
   
    <script src="/js/star-rating.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/css/themes/krajee-fa/theme.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/css/themes/krajee-svg/theme.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/css/themes/krajee-uni/theme.js" type="text/javascript"></script>
    <script src="/js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/public.nav.footer.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.center.js"></script> --%>
   <%-- <script  type="text/javascript" src="${pageContext.request.contextPath}/js/starScore.js"></script> --%>
     <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.customer.myneeds.js"></script> --%>
    <script type="text/javascript">
     $(function(){
    	 
    	 if("${clientid.userName}"!='' && "${clientid.userName}"!=null){
	   		 $("#nickname").text('${clientid.userName}'+"<spring:message code=',欢迎您!'/>");
	   	 }else if('${clientid.tel}'!=null && '${clientid.tel}'!=null){
	   		 $("#nickname").text('${clientid.tel}'+"<spring:message code=',欢迎您!'/>");
	   	 }else if('${clientid.emaile}'!=null && '${clientid.emaile}'!=null){
	   		 $("#nickname").text('${clientid.emaile}'+"<spring:message code=',欢迎您!'/>");
	   	 }
    	 
    	 /* var tnickname = "${transid.nickname}";
    		var unickname = "${clientid.userName}"
    		if(tnickname!=""){
    			$("#nickname").text(tnickname+"<spring:message code=',欢迎您!'/>");
    			
    		}else if (unickname!="") {
    			$("#nickname").text(unickname+"<spring:message code=',欢迎您!'/>");
    			}  */
     })
    
    </script>
    <style>
      .stars{margin-top:11px;}
      .stars,.stars span{
     	background:url(http://www1.pconline.com.cn/2015/dl/common/images/bg.png) no-repeat -96px -16px;
        line-height:0; 
        overflow:hidden;
        display:inline-block;
        vertical-align: top;
      }
      .stars{ width:79px;height:13px;}
      .stars span{height:13px;background-position:-96px -30px;}
      .border_botline{border-bottom:1px solid #ccc;}
      .list_padding li{padding-right:30px;padding-bottom: 10px;}
   /*    body,li,p,ul { 
		    margin: 0;
		    padding: 0;
		    font: 12px/1 Tahoma, Helvetica, Arial, "\5b8b\4f53", sans-serif;
		}
		ul, li, ol { list-style: none; }

		/* 重置文本格式元素 */
		a { 
			text-decoration: none; 
			cursor: pointer; 
			color:#333333; 
			font-size:14px;
		}
		a:hover { 
			text-decoration: none; 
		}
		.clearfix::after{ 
			display:block; 
			content:''; 
			height:0; 
			overflow:hidden; 
			clear:both;
		} 

		/*星星样式*/
		.content{ 
			width:600px; 
			margin:0 auto; 
			padding-top:20px;
		}
		.title{ 
			font-size:14px; 
			background:#dfdfdf; 
			padding:10px; 
			margin-bottom:10px;
		}
		.block{ 
			width:90%; 
			margin:-33px 0 20px 0; 
			padding-top:10px; 
			padding-left:140px; 
			line-height:21px;
		}
		.block .star_score{ 
			float:left;
		}
		.star_list{
			height:21px;
			margin:50px; 
			line-height:21px;
		}
		.block p,.block .attitude{ 
			padding-left:20px; 
			line-height:21px; 
			display:inline-block;
		}
		.block p span{ 
			color:#C00; 
			font-size:16px; 
			font-family:Georgia, "Times New Roman", Times, serif;
		}

		.star_score { 
			background:url(/images/stark2.png); 
			width:160px; 
			height:21px;  
			position:relative; 
		}

		.star_score a{ 
			height:21px; 
			display:block; 
			text-indent:-999em; 
			position:absolute;
			left:0;
		}

		.star_score a:hover{ 
			background:url(/images/stars2.png);
			left:0;
		}

		.star_score a.clibg{ 
			background:url(/images/stars2.png);
			left:0;
		}

		#starttwo .star_score { 
			background:url(/images/starky.png);
		}

		#starttwo .star_score a:hover{ 
			background:url(/images/starsy.png);
			left:0;
		}

		#starttwo .star_score a.clibg{ 
			background:url(/images/starsy.png);
			left:0;
		}

		/*星星样式*/

		.show_number{ 
			padding-left:50px; 
			padding-top:20px;
		}

		.show_number li{ 
			width:240px; 
			border:1px solid #ccc; 
			padding:10px; 
			margin-right:5px; 
			margin-bottom:20px;
		}

		.atar_Show{
			background:url(images/stark2.png); 
			width:160px; height:21px;  
			position:relative; 
			float:left; 
		}

		.atar_Show p{ 
			background:url(images/stars2.png);
			left:0; 
			height:21px; 
			width:134px;
		}

		.show_number li span{ 
			display:inline-block; 
			line-height:21px;
		}
 */
    </style>
  </head>
  <body style="background: #f5f5f5;">
   <!--      顶部导航      -->
  <c:if test="${clientid.id!=null || transid.id!=null }">
	<div class="publickNav">
		<div class="public_nav">
			<nav class="container" style="padding:0 20px;">
				<div class="navbar-left">
					<a href="?lang=zh_CN" class="navbar-link" onclick="in18(this)">中文</a> | <a href="?lang=en_US" class="navbar-link" onclick="in18(this)">English</a>
				</div>
				<a style="padding-left: 50px;" href="/forwardAction/forward_toIndex.do"><spring:message code='首页' /></a>
				<a style="padding-left:50px;"><spring:message  code='帮助热线：'/>010-82895385</a><a style="padding-left:50px;" target="_blank" href="http://www.aitrans.org:8081/"><spring:message  code='爱译社'/></a><div class="navbar-right">
					<ul class="list-inline nav_lists">
						<li class="nav_lists_li"><a href="/ClientUser/clientUserAction_exit.do" class="navbar-link"><spring:message code='退出登录' /></a></li>
						<li class="nav_lists_li"><a href="/cilentCustomer/findUI.do" target="_blank" class="navbar-link" style="position: relative;"><spring:message code='用户中心' /></a> 
						<li class="nav_li_li"><a href="javascript:void(0);" class="navbar-link"><font id="nickname"></font></a></li>
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
             <a href="?lang=zh_CN" class="navbar-link" onclick="in18(this);">中文</a> | <a href="?lang=en_US" class="navbar-link" onclick="in18(this);">English</a>
			</div>
			<a style="padding-left:50px;" href="/forwardAction/forward_toIndex.do"><spring:message code='首页' /></a>
            <a style="padding-left:50px;"><spring:message  code='帮助热线：'/>010-82895385</a><a style="padding-left:50px;" target="_blank" href="http://www.aitrans.org:8081/"><spring:message  code='爱译社'/></a><div class="navbar-right">
             <ul class="list-inline nav_lists">
              <li class="nav_lists_li"><a href="/login.jsp" class="navbar-link"><spring:message code='登录' /></a></li>
              <li class="nav_lists_li"><a href="/register.jsp" class="navbar-link"><spring:message code='注册' /></a></li>
              <li class="nav_lists_li"><a href="/help.center.jsp" class="navbar-link"><spring:message code='帮助中心' /></a></li>
             </ul>
            </div>
           </nav>
        </div>
        <div style="height:35px;"></div>
    </div>
  </c:if>
<!--  logo 搜索栏  -->
   <div class="container">
     <nav class="publickSearch"></nav>
   </div>

    <!--  用户中心内容  -->
    <div class="user_center">

      <div class="container">
        <div class="title_public">
          <h2><spring:message code='用户中心'/></h2>
        </div>


        <!--    用户中心 我是客户   -->
        <div class="my_customer">
          <div class="row">

            <!--    用户中心 我是客户 左侧导航   -->
            <div class="my_customer_left col-sm-2">
			  <ul class="my_customer_ul">
			   <li class="cus_iter_navlists"> <a href="/forwardAction/forward_toCustomerShow.do"> <spring:message code='个人信息'/> </a> </li>  
		       <li class="cus_iter_navlists"> <a href="/cilentCustomer/myneedsUI.do"><spring:message code='我的项目'/> </a> </li>  
		       <li class="cus_iter_navlists"> <a href="/cilentCustomer/mywallet.do"> <spring:message code='我的备用金'/> </a> </li>  
		       <li class="cus_iter_navlists"> <a href="/cilentCustomer/myOrdersUI.do"> <spring:message code='我的订单'/> </a> </li>  
		       <li class="cus_iter_navlists"> <a href="/cilentCustomer/exchangeUI.do"> <spring:message code='积分兑换'/></a> </li>  
		       <li class="cus_iter_navlists"> <a href="/forwardAction/forward_toCustomerReputation.do"> <spring:message code='我的信誉'/> </a> </li>  
		     <!-- <li class="cus_iter_navlists"> <a href="user.customer.ranking.html"> 我的排名 </a> </li>  */
		    /*  <li class="cus_iter_navlists"> <a href="user.customer.myeValuate.html"> 我的评价 </a> </li>  */
		     /*  <li class="cus_iter_navlists"> <a href="javascript:;"> 我的账本 </a> </li> -->
		       <li class="cus_iter_navlists"> <a href="/forwardAction/forward_toCustomerPasswordProtection.do"> <spring:message code='密码保护'/></a> </li>  
		       <li class="cus_iter_navlists"> <a href="/cilentCustomer/findUI.do?type=password"> <spring:message code='修改密码'/> </a> </li>  
		       <li class="cus_iter_navlists"> <a href="/cilentCustomer/gradeUI.do"> <spring:message code='我的等级'/></a> </li>  
		       <li class="cus_iter_navlists"> <a href="/forwardAction/forward_toCustomerAgreement.do"> <spring:message code='签订协议'/> </a> </li>
		      </ul>
			</div>

            <!--    用户中心 我是客户 我的需求 右侧内容   -->
            <div class="my_customer_right col-sm-10">
              <!--  用户中心右侧 tab切换栏   -->
              <ul id="suerTab" class="nav nav-tabs">
              	<li class="active"><a href="javascript:;" data-toggle="tab"><spring:message code='评价'/></a></li>
              </ul>
              <!-- 评价详情内容编辑 -->
              <form action="">
              <div  class="myTabContent" class="tab-content">                  
                <h3 style="padding-bottom:20px;margin-bottom:30px;border-bottom:2px solid #ddd;font-size:20px;font-weight:700;"><a href="user.customer.order.html"><spring:message code='我的订单'/></a>-><spring:message code='评价'/></h3>
                <div class="border_botline" style="font-size:18px;padding:10px;">
                  <div class="row" style="padding:10px 0;">
                    <div class="col-sm-6"><spring:message code='订单号：'/><spring:message code="${orderImpl.orderReference }"/><span></span></div>
                    <div class="col-sm-6"><spring:message code='项目名称：'/><spring:message code="${orderImpl.orderTitle }"/><span></span></div>
                  </div>
                  <div class="row" style="padding:10px 0;">
                    <div class="col-sm-3"><spring:message code='日期：'/><spring:message code="${orderImpl.examinationTime }"/><span></span></div>
                    <div class="col-sm-3"><spring:message code='语言：'/><spring:message code="${clientCustomerNeedImpl.languagePair }"/><span></span></div>
                    <div class="col-sm-3"><spring:message code='译员：'/><spring:message code="${translatorImpl.nickname }"/><span></span></div>
                    <div class="col-sm-3"><spring:message code='客户：'/><spring:message code="${ sessionScope.clientid.userName }"/><span></span></div>
                    <input type="hidden" id="order" value="${orderImpl.id }">
                  </div>
                </div>
                
              
      
                
                <div style="font-size:18px;padding:10px;width: 100%">
                <spring:message code='技术难度：'/><div class="block clearfix">
        											<input type="radio" name="technicalDifficulties" id='technicalDifficulties' value="简单" checked="checked"><spring:message code="简单"/>
        											<input type="radio" name="technicalDifficulties" id='technicalDifficulties' value="中级"><spring:message code="中级"/>
        											<input type="radio" name="technicalDifficulties" id='technicalDifficulties' value="高难"><spring:message code="高难"/>
   	 											  </div>
   	 											
   	 											
   	 			<spring:message code='语言难度：'/><div  class="block clearfix">
        											<input type="radio" name="languageDifficulties" id='languageDifficulties' value="简单" checked="checked"><spring:message code="简单"/>
        											<input type="radio" name="languageDifficulties" id='languageDifficulties' value="中级"><spring:message code="中级"/>
        											<input type="radio" name="languageDifficulties" id='languageDifficulties' value="高难"><spring:message code="高难"/>
        										  </div>
   	 											
   	 											
   	 			<div style="width: 50%;float: left">							
                <p style="line-height: 60px;padding-left:140px;color:green;"><b><spring:message code='加分项'/></b></p>
                <spring:message code='原文理解程度：'/><div id="start2" class="block clearfix">
        									<div  class="star_score"></div>
        										<p style="float:left;"><%-- <spring:message code='您的评分：'/> --%><span class="fenshu" id="understandLevel" ></span> <spring:message code='分'/></p>							
   	 											</div>
   	 			<spring:message code='译文通顺程度：'/><div id="start3" class="block clearfix">
        									<div  class="star_score"></div>
        										<p style="float:left;"><%-- <spring:message code='您的评分：'/> --%><span class="fenshu" id="degreeOfSmooth" ></span> <spring:message code='分'/></p>							
   	 											</div>
   	 			<spring:message code='译文严谨程度：'/><div id="start4" class="block clearfix">
        									<div  class="star_score"></div>
        										<p style="float:left;"><%-- <spring:message code='您的评分：'/> --%><span class="fenshu" id="rigor" ></span> <spring:message code='分'/></p>							
   	 											</div>
   	 			<spring:message code='技术术语翻译：'/><div id="start5" class="block clearfix">
        									<div  class="star_score"></div>
        										<p style="float:left;"><%-- <spring:message code='您的评分：'/> --%><span class="fenshu" id="technicalCorpus" ></span> <spring:message code='分'/></p>							
   	 											</div>
   	 											
   	 			<spring:message code='专利术语翻译：'/><div id="start13" class="block clearfix">
        									<div  class="star_score"></div>
        										<p style="float:left;"><%-- <spring:message code='您的评分：'/> --%><span class="fenshu" id="patentCorpus" ></span> <spring:message code='分'/></p>							
   	 											</div>
   	 											
   	 																				
   	 			<%--<spring:message code='翻译完整性：'/><div id="start5" class="block clearfix">
        									<div  class="star_score"></div>
        										<p style="float:left;"> <spring:message code='您的评分：'/> <span class="fenshu" id="integrality" ></span> <spring:message code='分'/></p>							
   	 											</div> --%>
   	 			
   	 			 <spring:message code='格式排版：'/><div id="start6" class="block clearfix">
        									<div  class="star_score"></div>
        										<p style="float:left;"><%-- <spring:message code='您的评分：'/> --%><span class="fenshu" id="format" ></span> <spring:message code='分'/></p>							
   	 											</div>	
   	 			<spring:message code='文件齐全：'/><div id="start7" class="block clearfix">
        									<div  class="star_score"></div>
        										<p style="float:left;"><%-- <spring:message code='您的评分：'/> --%><span class="fenshu" id="integrality" ></span> <spring:message code='分'/></p>							
   	 											</div>
   	 			</div>
   	 			<div style="width: 50%;float: left;">
   	 			<p style="line-height: 60px;padding-left:140px;color:blue;"><b><spring:message code='减分项'/></b></p>
   	 			<!-- <hr style="height: 300px;width: 2px;color: blue;background-color: black;color: #ffffffbf;">		 -->						
   	 			<spring:message code='遗漏语段：'/><div id="start8" class="block clearfix">
        									<div  class="star_score"></div>
        										<p style="float:left;"><%-- <spring:message code='您的评分：'/> --%><span class="fenshu" id="missingParagraph"></span> <spring:message code='分'/></p>					
   	 											</div>
   	 											
   	 			<spring:message code='遗漏句子：'/><div id="start9" class="block clearfix">
        									<div  class="star_score"></div>
        										<p style="float:left;"><%-- <spring:message code='您的评分：'/> --%><span class="fenshu" id="missingSentence"></span> <spring:message code='分'/></p>					
   	 											</div>
   	 											
   	 											
   	 			<spring:message code='漏词'/>/<spring:message code="赘译："/><div id="start10" class="block clearfix">
        									<div  class="star_score"></div>
        										<p style="float:left;"><%-- <spring:message code='您的评分：'/> --%><span class="fenshu" id="missingWord"></span> <spring:message code='分'/></p>					
   	 											</div>
   	 			<spring:message code='语法错误：'/><div id="start11" class="block clearfix">
        									<div  class="star_score"></div>
        										<p style="float:left;"><%-- <spring:message code='您的评分：'/> --%><span class="fenshu" id="syntaxError"></span> <spring:message code='分'/></p>					
   	 											</div>
   	 			 <spring:message code='完成速度：'/><div class="block clearfix">
        											<input type="radio" name="completionSpeed" value="超前"><spring:message code="超前"/>&nbsp;&nbsp;&nbsp;&nbsp;
        											<input type="radio" name="completionSpeed" value="居中" checked="checked"><spring:message code="居中"/>&nbsp;&nbsp;&nbsp;&nbsp;
        											<input type="radio" name="completionSpeed" value="延迟"><spring:message code="延迟"/>
   	 											   </div>
   	 			<div style="width: 387.75px;height: 31px"></div>							   
   	 			<spring:message code='评价总分：'/><div id="" class="block clearfix">
        											<input class="form-control" style="width:80px;display:inline-block;" type="text" id="score" value="0"><span ><font color="#A9A9A9" size="3px">&nbsp;&nbsp;<spring:message code='（以100分为满分）'/></font></span>
   	 											</div>
   	 																		
   	 			</div>								
                  <p class="clearfix"><spring:message code='其他错误：'/><input class="form-control" type="text" name='otherError' id="otherError" onclick="scoreF()"></p>
                  <p class="clearfix"><spring:message code='评语：'/><textarea class="form-control" name="evaluateDetails" id="evaluateDetails" cols="30" rows="7" onclick="scoreF()"></textarea></p>
               </div>
                 <div class="col-sm-offset-4 col-sm-3">
                            <button type="button" class="btn btn-info form-control" id='check'><spring:message code='提交评价'/></button>
              	 </div>
              </div>
             
			 </form>
            </div>
            <!--    用户中心 我是客户 我的需求 右侧内容 结束   -->

          </div>
          <!--    用户中心 我是客户 结束   -->
        </div>
      </div>

    </div>
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

    <script type="text/javascript">
    function scoreF(){
    	var orderId = $("#order").val();//订单Id
    	
		var understandLevel= $("#understandLevel").text()//理解程度
		if(understandLevel==null || understandLevel==''){
			understandLevel=0;
		}
    	var degreeOfSmooth = $("#degreeOfSmooth").text();//通顺程度
    	if(degreeOfSmooth==null || degreeOfSmooth==''){
    		degreeOfSmooth=0;
		}
    	var rigor = $("#rigor").text();//严谨程度
    	if(rigor==null || rigor==''){
    		rigor=0;
		}
    	var integrality = $("#integrality").text();//文件齐全
    	if(integrality==null || integrality==''){
    		integrality=0;
		}
    	var format = $("#format").text();//排版格式
    	if(format==null || format==''){
    		format=0;
		}
    	var completionSpeeds=document.getElementsByName("completionSpeed");
    	var completionSpeed ='';//完成速度
    	for(var i=0;i<completionSpeeds.length;i++)
    	  {
    	   if(completionSpeeds[i].checked)
    	   {
    		   completionSpeed=completionSpeeds[i].value; //这里得到单选按钮值
    	    }
    	  }
    	
    	var evaluateDetails =$("#evaluateDetails").val();//评语
    	/* var score=$("#score").val(parseFloat(score1)); */
    	var technicalDifficultiess=document.getElementsByName("technicalDifficulties")//技术难度
    	var technicalDifficulties='';
    	for(var i=0;i<technicalDifficultiess.length;i++)
  	  {
  	   if(technicalDifficultiess[i].checked)
  	   {
  		 technicalDifficulties=technicalDifficultiess[i].value; //这里得到单选按钮值
  	    }
  	  }
    	
    	
    	var languageDifficultiess=document.getElementsByName("languageDifficulties");//语言难度
    	var languageDifficulties='';
    	for(var i=0;i<languageDifficultiess.length;i++)
    	  {
    	   if(languageDifficultiess[i].checked)
    	   {
    		   languageDifficulties=languageDifficultiess[i].value; //这里得到单选按钮值
    	    }
    	  }
    	
    	var technicalCorpus=$("#technicalCorpus").text();//技术术语
    	if(technicalCorpus==null || technicalCorpus==''){
    		technicalCorpus=0;
		}
    	var patentCorpus=$("#patentCorpus").text();//专利术语
    	if(patentCorpus==null || patentCorpus==''){
    		patentCorpus=0;
		}
    	var missingParagraph=$("#missingParagraph").text();//遗漏段落
    	if(missingParagraph==null || missingParagraph==''){
    		missingParagraph=0;
		}
    	var missingSentence=$("#missingSentence").text();
    	if(missingSentence==null || missingSentence==''){
    		missingSentence=0;
		}
    	var missingWord=$("#missingWord").text();//漏词
    	if(missingWord==null || missingWord==''){
    		missingWord=0;
		}
    	var syntaxError=$("#syntaxError").text();//语法错误
    	if(syntaxError==null || syntaxError==''){
    		syntaxError=0;
		}
    	var otherError=$("#otherError").val();//其他错误
    	
    	var score=(parseFloat(understandLevel))+(parseFloat(degreeOfSmooth))+(parseFloat(rigor))+(parseFloat(integrality))+(parseFloat(format))+(parseFloat(technicalCorpus))+(parseFloat(patentCorpus))-(parseFloat(missingParagraph))-(parseFloat(missingSentence))-(parseFloat(missingWord))-(parseFloat(syntaxError));
		//alert("score="+parseFloat(understandLevel)+(parseFloat(degreeOfSmooth))+"score="+score)
    	
		var n=score*10000000000000000;
		var num = new Number(n/10000000000000000).toFixed(2);  //结果：3488.49
		$("#score").val(num);
		
		return "understandLevel="+understandLevel+"&degreeOfSmooth="+degreeOfSmooth+"&rigor="+rigor+"&integrality="+integrality+"&format="+format+"&completionSpeed="+completionSpeed+"&orderId="+orderId+"&score="+score+"&evaluateDetails="+evaluateDetails+"&technicalDifficulties="+technicalDifficulties+"&languageDifficulties="+languageDifficulties+"&technicalCorpus="+technicalCorpus+"&patentCorpus="+patentCorpus+"&missingParagraph="+missingParagraph+"&missingWord="+missingWord+"&missingSentence="+missingSentence+"&syntaxError="+syntaxError+"&otherError="+otherError;
    }

     scoreFun($("#start2"),{
           fen_d:16,//每一个a的宽度
           ScoreGrade:10//a的个数5
         },10);
      scoreFun($("#start3"),{
          fen_d:16,//每一个a的宽度
          ScoreGrade:10//a的个数5
        },3);    
      scoreFun($("#start4"),{
            fen_d:16,//每一个a的宽度
            ScoreGrade:10//a的个数5
          },3);
      scoreFun($("#start5"),{
          fen_d:16,//每一个a的宽度
          ScoreGrade:10//a的个数5
        },2);
      scoreFun($("#start6"),{
          fen_d:16,//每一个a的宽度
          ScoreGrade:10//a的个数5
        },0.6);
      scoreFun($("#start7"),{
          fen_d:16,//每一个a的宽度
          ScoreGrade:10//a的个数5
        },0.4);
      scoreFun($("#start8"),{
          fen_d:16,//每一个a的宽度
          ScoreGrade:10//a的个数5
        },10);
      scoreFun($("#start9"),{
          fen_d:16,//每一个a的宽度
          ScoreGrade:10//a的个数5
        },6);
      scoreFun($("#start10"),{
          fen_d:16,//每一个a的宽度
          ScoreGrade:10//a的个数5
        },2);
      scoreFun($("#start11"),{
          fen_d:16,//每一个a的宽度
          ScoreGrade:10//a的个数5
        },2);
    /*   scoreFun($("#start12"),{
          fen_d:16,//每一个a的宽度
          ScoreGrade:10//a的个数5
        },10); */
     
      scoreFun($("#start13"),{
          fen_d:16,//每一个a的宽度
          ScoreGrade:10//a的个数5
        },1);
     
      function scoreFun(object,opts,numm1){
    	  var numm=numm1;
    	  var object1=object;
    		// 默认属性
    		var defaults={
    			fen_d:16,  // 每个a的宽度
    			ScoreGrade:10,  // a的个数
    			types:["很不满意",
    			       "差得太离谱，原文内容基本不符合，非常不满",
    			       "不满意",
    			       "翻译内容相差较大，不满意",
    			       "一般",
    			       "翻译效果一般",
    			       "翻译没有达到想象中的效果",
    			       "满意",
    			       "质量不错，与原文内容基本一致，还是挺满意的",
    			       "非常满意",
    			       "很差",
    			       "差",
    			       "一般",
    			       "好",
    			       "很好"],
    			       nameScore:"fenshu",
    			       parent:"star_score",
    			       attitude:"attitude"};
    			options=$.extend({},defaults,opts);
    			var countScore=object.find("."+options.nameScore);  // 找到名为“fenshu”的类
    			var startParent=object.find("."+options.parent);    // 找到名为“star_score”的类
    			var atti=object.find("."+options.attitude);    // 找到名为“attitude”的类
    			var now_cli;
    			var fen_cli;
    			var atu;
    			var fen_d=options.fen_d;     // 每个a的宽度
    			var len=options.ScoreGrade;  // 把a的个数赋值给len
    			startParent.width(fen_d*len); //包含a的div盒子的宽度
    			var preA=(5/len);
    			for(var i=0;i<len;i++){
    				var newSpan=$("<a href='javascript:void(0)'></a>");     // 不整体刷新页面的情况下，可以使用void(0)
    				newSpan.css({"left":0,"width":fen_d*(i+1),"z-index":len-i});  // 设置a的宽度、层级
    				newSpan.appendTo(startParent)
    			}                                    //  把a放到类名为“star_score”的div里
    		  startParent.find("a").each(          // each（）方法
    		  	function(index,element){
    			  	$(this).click(function(){        // 点击事件
    			  	now_cli=index;                   // 当前a的索引值
    			  	show(index,$(this),numm)             //  调用show方法
    			  	//alert("index="+index+"-------this="+this+"---------object1"+object1.attr("id"))
    			  	scoreF();
    			  	//计算总分数
    				/*  var scoreTWl=parseFloat($("#score").val());//初始总分数分数TWL
    				 if(object1.attr("id")=='start2' || object1.attr("id")=='start3' || object1.attr("id")=='start4' ||object1.attr("id")=='start5' ||object1.attr("id")=='start6' || object1.attr("id")=='start7' || object1.attr("id")=='start13'){
    					 $("#score").val(scoreTWl+parseFloat(countScore.text()))
    				 }else{
    					 $("#score").val(scoreTWl-parseFloat(countScore.text()))
    				 } */
       			   //总分数计算完毕 
    			  });
    			  $(this).mouseenter(function(){    /* mouseenter事件(与 mouseover 事件不同，只有在鼠标指针穿过被选元素时，
    			  	                                 才会触发 mouseenter 事件。如果鼠标指针穿过任何子元素，同样会触发 mouseover 事件。) */
    			  	  show(index,$(this),numm)
    			  });
    			  $(this).mouseleave(function(){    // mouseleave事件 
    			  	if(now_cli>=0){
    			  		var scor=preA*(parseInt(now_cli)+1);         // 评分
    			  		startParent.find("a").removeClass("clibg");  // 清除a的“clibg”类
    			  		startParent.find("a").eq(now_cli).addClass("clibg"); // eq()选择器，选取索引值为“now_cli”的a，给它加上“clibg”类
    			  		var ww=fen_d*(parseInt(now_cli)+1);                  // 当前a的宽度
    			  		startParent.find("a").eq(now_cli).css({"width":ww,"left":"0"});  // 给索引值为“now_cli”的a加上宽度“ww”和left值
    			  		if(countScore){
    			  			var cc=scor*(parseFloat(numm))*10000000000000000;
    			  			var n=new Number(cc/*10000000000000000).toFixed(2);
    			  			countScore.text(n)
    			  		} 
    			  	}else{
    			  		startParent.find("a").removeClass("clibg");
    			  		if(countScore){
    			  			countScore.text("")
    			  		}
    			  	}
    			  })
    			  
    			});
    	 
	      // show方法
			  function show(num,obj,numm){
			  	var n=parseInt(num)+1;
			  	var lefta=num*fen_d;
			  	var ww=fen_d*n;
			  	var scor=preA*n;                        // 评分
			  	(len>5)?atu=options.types[parseInt(num)]:atu=options.types[parseInt(num)+10];       // 用户态度
			  	object.find("a").removeClass("clibg");  // 清除所有a的“clibg”类
			  	obj.addClass("clibg");                  // 给当前a添加“clibg”类
			  	obj.css({"width":ww,"left":"0"});       // 给当前a添加宽度“ww”和left值
			  	
			  	var cc=scor*(parseFloat(numm))*10000000000000000;
	  			var n=new Number(cc/*10000000000000000).toFixed(2);
	  			countScore.text(n)						// 显示评分
			  	atti.text(atu);                        // 显示用户态度
			  }
	      
			};
 
    </script>
	<script type="text/javascript">
	$(function(){
		$("#check").click(function(){
			var orderId = $("#order").val();//订单Id   	
	    	var score=$("#score").val();//总分
	    	var regex =/^[-+]?([1-9][0-9]{0,8}\.[0-9]{1,2})$/;
	    	if (!regex.test(score)) {
	    		layer.msg("<spring:message code='提示：请输入有效的评分！例如：99，99.2，99.23'/>", {icon: 2});
			}else if(evaluateDetails==""){
				layer.msg("<spring:message code='提示：请填写评价内容！'/>", {icon: 2});
			
			}else{
				$("#check").attr("disabled",true );
				var datas=scoreF();
				$.ajax({
					type:"POST",													
					url:"/cilentCustomer/addEvaluate.do",								
					data:datas,
					dataType:"json",											
					cache:false,													
					success:function(data){		
						layer.alert("<spring:message code='评价成功！'/>", {icon: 1},function(){
							window.location.href="/cilentCustomer/lookOrderById.do?orderId="+orderId; 
							//关闭后的操作
						});
					
					
						}
					}); 
			}
		})
	})
	</script>
  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
