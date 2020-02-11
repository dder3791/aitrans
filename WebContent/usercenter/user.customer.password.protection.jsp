<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title><spring:message code='用户中心-我是客户-密码保护'/></title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.center.css"/>
    <link href="${pageContext.request.contextPath}/css/page.css" type="text/css" rel="stylesheet"/>


    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/public.nav.footer.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.center.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.customer.myneeds.js"></script> --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
	<script type="text/javascript">
		function check() {
			
			var answer= $("#answer").val();
			var securityQuestion=$("#securityQuestion").val();
			if(securityQuestion==""){
				layer.msg("<spring:message code='尚未选择密保问题！'/>", {icon: 2});
				return false;
			}else{
			if(!(answer.length>0 && answer.length<=20)){
				$(".prompt").text("<spring:message code='密保问题答案长度必须为1-20个字符'/>");
				return false;
			}else{
				$(".form-horizontal").submit();
			} 
			}
		}
		
	</script>
	
	<script type="text/javascript">
	  $(function(){
		  $(".cus_iter_navlists:nth-child(7)").addClass('useractive');
		  
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
	   			$("#nickname").text(tnickname+"<spring:message  code='，欢迎您！'/>");
	   			
	   		}else if (unickname!="") {
	   			$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>!");
	   			} */
	  })
	</script>
    <style type="text/css">
      .prompt{
        display: inline-block;
        height:34px;
        line-height: 34px;
        color:red;
      }
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
			   <li class="cus_iter_navlists"> <a href="/cilentCustomer/findUI.do"> <spring:message code='个人信息'/> </a> </li>  
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
              	<li class="active"><a href="javascript:;" data-toggle="tab"><spring:message code='密码保护'/></a></li>
              </ul>

              <div  class="myTabContent" class="tab-content" style="padding-top:100px;padding-bottom:200px;">
                <form class="form-horizontal" action="${pageContext.request.contextPath}/cilentCustomer/setSecurityQuestion.do">
                <c:if test="${clientid.securityQuestion==null }">
                  <div class="form-group" style="margin-bottom:30px;">
                    <label for="question01" class="col-sm-3 control-label"><spring:message code='密保问题：'/></label>
                    <div class="col-sm-5">
                      <!-- <input type="email" class="form-control" id="question01" placeholder="请输入密码保护问题"> -->
                      <select id="securityQuestion" name = "securityQuestion" class="form-control" style="color: gray;">
                      	<option value="">-- <spring:message code='请选择密保问题'/> --</option>
                      	<option value="你的出生地是哪里？"><spring:message code='你的出生地是哪里？'/></option>
                      	<option value="你最好的朋友名字？"><spring:message code='你最好的朋友名字？'/></option>
                      	<option value="你父亲的生日？"><spring:message code='你父亲的生日？'/></option>
                      	<option value="你母亲的生日？"><spring:message code='你母亲的生日？'/></option>
                      	<option value="你的出生日期？"><spring:message code='你的出生日期？'/></option>
                      	<option value="你印象最深的老师的名字？"><spring:message code='你印象最深的老师的名字？'/></option>
                      </select>
                    </div>
                    <span class="prompt1" style="color: gray;"><spring:message code='（密保设置不能修改请谨慎填写）'/></span>
                  </div>
                  <div class="form-group" style="margin-bottom:30px;">
                    <label for="question02" class="col-sm-3 control-label"><spring:message code='问题答案：'/></label>
                    <div class="col-sm-5">
                      <input type="text" class="form-control" id="answer" name="answer" placeholder="<spring:message code='请输入密码保护问题答案'/>">
                    </div>
                   <span class="prompt"></span>
                  </div>
                  <div class="form-group" style="margin-top:50px;">
                    <div class="row">
                      <div class="col-sm-offset-4 col-sm-10">
                        <button type="submit" class="btn btn-info" style="padding-left:35px;padding-right:35px;" onclick="return check()"><spring:message code='保存提交'/></button>
                      </div>
                    </div>
                  </div>
                  </c:if>
                 <c:if test="${clientid.securityQuestion!=null }"><br><br><br><label for="question02" class="col-sm-offset-4 col-sm-10"><h3><font color="#B0C4DE">（<spring:message code='密码保护问题已设置'/>）</font></h3></label></c:if>
                </form>
              </div>





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

  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
