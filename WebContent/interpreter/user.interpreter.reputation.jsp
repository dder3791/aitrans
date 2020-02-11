<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
    <title><spring:message  code='用户中心-我是译员-我的信誉'/></title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.center.css"/>

    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.center.js"></script> --%>
    <script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
	<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
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
      .integralName{
        font-size: 18px;
        margin-left:40px;
        margin-top:30px;
      }
      .myIntegral{
        width:225px;
        height:225px;
        border-radius: 50%;
        background:#fdfccf;
        margin:70px auto 40px 40px;
        padding-top:28px;
        box-shadow: 4px 4px 10px #f1f1f1;
      }
      .myIntegral p{
        color:#222;
        text-align: center;
        padding-top:14px;
        font-size: 18px;
      }
      .integral_rule .reputation_ul1{
        width:330px;
        min-height:450px;
        margin:0 auto;
        margin-top:10px;
        border-radius:99%;
        border:2px solid #fbef1f;
        padding:30px 13px; 
      }
      .integral_rule .reputation_ul1 li{
        padding-bottom:10px;
        line-height: 2.5;
      }
    </style>
    <script type="text/javascript">
      $(function(){
    	  $(".cus_iter_navlists a").removeClass("useractive")
          $(".cus_iter_navlists").eq(5).find("a").addClass("useractive")
    	  var tranName="${transid.nickname}";
    	  var transName=$("#transName");
    	  transName.text(tranName);
    	  
    	  if("${transid.nickname}"!=null && "${transid.nickname}"!=''){
        	  $("#nickname").text("${transid.nickname}"+"<spring:message  code='，欢迎您！'/>");
          }else if("${transid.tel}"!=null && "${transid.tel}"!=''){
        	  $("#nickname").text("${transid.tel}"+"<spring:message  code='，欢迎您！'/>");
          }else if("${transid.email}"!=null && "${transid.email}"!=''){
        	  $("#nickname").text("${transid.email}"+"<spring:message  code='，欢迎您！'/>");
          }
    	  /* var tnickname = "${transid.nickname}";
			var unickname = "${clientid.userName}"
			if(tnickname!=""){
				$("#nickname").text(tnickname+"<spring:message  code='，欢迎您！'/>");
				
			}else if (unickname!="") {
				$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>!");
				} */
    	  
    	  
      })
    </script>
  </head>
  <body style="background: #f5f5f5;">
     <!--      顶部导航      -->
  	<c:if test="${clientid.id!=null || transid.id!=null }">
  	<div class="publickNav">
  		<div class="public_nav"> 
           <nav class="container" style="padding:0 20px;"> 
           <div class="navbar-left"><a href="?lang=zh_CN" class="navbar-link" onclick="in18(this)">中文</a> | <a href="?lang=en_US" class="navbar-link" onclick="in18(this)">English</a></div><a style="padding-left:50px;" href="/forwardAction/forward_toIndex.do"><spring:message  code='首页'/></a>
           <a style="padding-left:50px;"><spring:message  code='帮助热线：'/>010-82895385</a><a style="padding-left:50px;" target="_blank" href="http://www.aitrans.org:8081/"><spring:message  code='爱译社'/></a><div class="navbar-right"> 
           <ul class="list-inline nav_lists">
           <li class="nav_lists_li"><a href="/ClientUser/clientUserAction_exit.do" class="navbar-link"><spring:message  code='退出登录'/></a></li>
           <li class="nav_lists_li"><a href="/cilentCustomer/findUI.do" target="_blank" class="navbar-link" style="position:relative;" ><spring:message  code='用户中心'/></a>
           <li class="nav_li_li"><a href="javascript:void(0);" class="navbar-link" ><font  id = "nickname"></font></a></li>
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
                     	<a href="?lang=zh_CN" class="navbar-link" onclick="in18(this);">中文</a> | <a href="?lang=en_US" class="navbar-link" onclick="in18(this);" >English</a></div><a style="padding-left:50px;" href="/forwardAction/forward_toIndex.do"><spring:message  code='首页'/></a>
                     <a style="padding-left:50px;"><spring:message  code='帮助热线：'/>010-82895385</a><a style="padding-left:50px;" target="_blank" href="http://www.aitrans.org:8081/"><spring:message  code='爱译社'/></a><div class="navbar-right">
                     <ul class="list-inline nav_lists">
                      <li class="nav_lists_li"><a href="/forwardAction/forward_toLogin.do" class="navbar-link"><spring:message  code='登录'/></a></li>
                      <li class="nav_lists_li"><a href="/forwardAction/forward_toRegister.do" class="navbar-link"><spring:message  code='注册'/></a></li>
                      <li class="nav_lists_li"><a href="/forwardAction/forward_toHelp.do" class="navbar-link"><spring:message  code='帮助中心'/></a></li>
                      </ul>
                      </div>
                      </nav>
                      </div>
                      <div style="height:35px;"></div>
                      </div>
	</c:if>
  
    <!--      顶部导航      -->
    <!-- <div class="publickNav"></div> -->
    <!--  logo 搜索栏  -->
    <div class="container">
      <nav class="publickSearch"></nav>
    </div>

    <!--  用户中心内容  -->
    <div class="user_center">

      <div class="container">
        <div class="title_public">
          <h2><spring:message  code='译员中心'/></h2>
        </div>

        <!--    用户中心 我是议员   -->
        <div class="my_customer">
          <div class="row">

            <!--    用户中心 我是议员 左侧导航   -->
            <div class="my_customer_left col-sm-2">
              <ul class="my_interpreter_ul">
              <li class="cus_iter_navlists"><a href="/translator/translatorAction_findTrans.do"  id="myinfo"><spring:message  code='个人信息'/></a></li>
	     <li class="cus_iter_navlists"><a href="/translator/translatorAction_getpublishNeedCount.do"><spring:message  code='寻找项目'/></a></li>
	     <li class="cus_iter_navlists"><a href="/translator/translatorAction_exchangegetCount.do"><spring:message  code='积分兑换'/></a></li>
	     <li class="cus_iter_navlists"><a href="/translator/translatorAction_getOrderCount.do"><spring:message  code='我的任务'/></a></li>
	     <li class="cus_iter_navlists"><a href="/translator/translatorAction_queryByRank.do"><spring:message  code='我的排名'/></a></li>
	     <li class="cus_iter_navlists"><a href="/translator/translatorAction_saveTransHonor.do"><spring:message  code='我的信誉'/></a></li>
	     <li class="cus_iter_navlists"><a href="/translator/translatorAction_getEvaluate.do"><spring:message  code='我的评价'/></a></li>
	     <li class="cus_iter_navlists"><a href="/translator/mywallet.do" ><spring:message  code='我的钱包'/></a></li>
	     <li class="cus_iter_navlists"><a href="/forwardAction/forward_toInterpreterPasswordProtection.do"><spring:message  code='密码保护'/></a></li>
	     <li class="cus_iter_navlists"><a href="/translator/translatorAction_getTranlevels.do"><spring:message  code='我的等级'/></a></li>
	     <li class="cus_iter_navlists"><a href="/forwardAction/forward_toInterpreterModifyPassword.do"><spring:message  code='修改密码'/></a></li>
	     <li class="cus_iter_navlists"><a href="/forwardAction/forward_toInterpreterAgreement.do"><spring:message  code='签订协议'/></a></li>     
              
              </ul>
            </div>

            <!--    用户中心 我是议员 我的信誉 右侧内容   -->
            <div class="my_customer_right col-sm-10">
              <!--  用户中心右侧 tab切换栏   -->
              <div class="">
                  <ul id="suerTab" class="nav nav-tabs">
                    <li class="active"><a href="#basicdata" data-toggle="tab"><spring:message  code='我的信誉'/></a></li>
                  </ul>
                </div>
  
                <!--  tab面板对应内容 我的信誉  -->
                <div class="myTabContent tab-content">
                  <div class="tab-pane fade in active" id="basicdata" style="padding:20px 20px 30px 30px;">
                    <div class="row">
                      <div class="col-sm-6">
                        <p class="integralName" style="margin-top:40px;letter-spacing:19px;"><spring:message  code='姓名'/>:<span id="transName"></span></p>
                        <p class="integralName"><spring:message  code='信誉等级：'/><i class="stars" style="margin-left:5px;">
                        <c:if test="${honor<=200 && honor>=0}">
                        <span style="width:20%">
                        </span>
                        </c:if>
                        
                         <c:if test="${honor<=400 && honor>200}">
                        <span style="width:40%">
                        </span>
                        </c:if>
                        
                         <c:if test="${honor<=600 && honor>400}">
                        <span style="width:60%">
                        </span>
                        </c:if>
                        
                        <c:if test="${honor<=800 && honor>600}">
                        <span style="width:90%">
                        </span>
                        </c:if>
                        
                         <c:if test="${honor>800}">
                        <span style="width:100%">
                        </span>
                        </c:if>
                        </i></p>
                        <div class="myIntegral">
                          <p><spring:message  code='信誉度'/></p>
                          <p>${honor}</p>
                          <c:if test="${honor<=200 && honor>=0}">
                          <p><spring:message  code='较差'/></p>
                          </c:if>
                          <c:if test="${honor<=400 && honor>200}">
                          <p><spring:message  code='一般'/></p>
                          </c:if>
                          <c:if test="${honor<=600 && honor>400 }">
                          <p><spring:message  code='良好'/></p>
                          </c:if>
                          <c:if test="${honor<=800 && honor>600 }">
                          <p><spring:message  code='较优'/></p>
                          </c:if>
                          <c:if test="${honor>800 }">
                          <p><spring:message  code='优秀'/></p>
                          </c:if>
                        </div>
                      </div>
                      <div class="col-sm-6">
                        <div>
                          <p class="text-center" style="font-size:18px;"><spring:message  code='信誉计算规则与说明'/></p>
                          <div class="integral_rule">
                          	<div class="inside_integral_rule">
	                            <ul class="list-group reputation_ul1">
	                            	<br>
	                              <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1、<spring:message  code='信誉会依据译员评价分数、'/><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='积分与平台合作时间来进行一份计算。'/><br>
	                              <li>&nbsp;&nbsp;2、<spring:message  code='信誉初始值为500（较好，良好，一般，优），每完成一次订单将都可以增加部分信誉值。'/></li>
	                              <li>3、<spring:message  code='信誉会影响系统自动任务的自动任务分配，译员展示的排名推送等功能。'/><br></li>
	                              <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4、<spring:message  code='如若未能按照需求要求完成'/>
	                                  <spring:message  code='延后交稿，'/><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='将扣除部分的信誉度。'/></li>
	                            </ul>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              <!--  tab面板切换内容结束！  -->

          </div>
          <!--    用户中心 我是议员 结束   -->
        </div>
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


       
  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
