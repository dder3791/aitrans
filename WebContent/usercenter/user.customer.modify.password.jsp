<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name=" Keywords" content="......">
<!--content中，网页关键字-->
<meta name=" description" content="......">
<!--content中，网页描述文字-->
<meta name="author" content="......">
<!--标注作者-->
<title><spring:message code='用户中心-我是客户-修改密码'/></title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/public.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/user.center.css" />
<link href="${pageContext.request.contextPath}/css/page.css"
	type="text/css" rel="stylesheet" />


<script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/js/public.nav.footer.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/user.center.js"></script> --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/page.js"></script>
<script type="text/javascript" 
	src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>

<style type="text/css">
.safety_level {
	height: 34px;
	line-height: 34px;
}

.safety_level span {
	width: 40px;
	height: 20px;
	display: inline-block;
	background: #f1f1f1;
	border-left: 2px solid #ccc;
	vertical-align: middle;
}

.safety_level span:first-child {
	border-left: 0;
	margin-left: 10px;
}
</style>
<script type="text/javascript">
var message = "${message }";

if(message.trim().length != 0 ){
	
	layer.msg(message, {icon: 5});
}
</script>
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
							<li class="active"><a href="javascript:;" data-toggle="tab"><spring:message code='修改密码'/></a></li>
						</ul>

						<div class="myTabContent" class="tab-content"
							style="padding-top: 100px; padding-bottom: 200px;">
							<form class="form-horizontal">
								<div class="form-group" style="margin-bottom: 30px;">
									<label for="password01" class="col-sm-3 control-label"><spring:message code='原始密码：'/></label><span id="oldPwd"></span>
									<div class="col-sm-5">
										<input type="password" class="form-control" id="password01" onkeyup="newPassword()" placeholder="<spring:message code='请输入原始密码'/>" name="password01"> 
										<%-- <input type="hidden" id="oldpassword" value="${clientid.initialPassword }" name="oldpassword"> --%>
									</div>
									<p class="col-sm-offset-3 col-sm-9" style="padding-top: 10px;"><spring:message code='密码由6-16位字符串组成，区分大小写'/></p>
								</div>
								<div class="form-group" style="margin-bottom: 30px;">
									<div class="row">
										<label for="password02" class="col-sm-3 control-label"><spring:message code='新密码：'/></label><span id="newPwd"></span>
										<div class="col-sm-5">
											<input type="password" class="form-control" id="password02"  onblur="newPassword1()" placeholder="<spring:message code='请输入新密码'/>" name="newPassword02">
										</div>
										<div class="col-sm-4 safety_level">
											<spring:message code='安全等级'/> <span id="span1"></span><span id="span2"></span><span id="span3"></span>
										</div>
										<p class="col-sm-offset-3 col-sm-9" style="padding-top: 10px;"><spring:message code='为了提升您的密码安全性，建议使用英文字母加数字或符号的组合密码。'/></p>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<label for="password03" class="col-sm-3 control-label"><spring:message code='确认新密码：'/></label><span id="againpwd"></span>
										<div class="col-sm-5">
											<input type="password" class="form-control" onkeyup="newPassword3()"  onfocus="newPassword1()" id="password03" placeholder="<spring:message code='再输入一次新密码'/>">
										</div>
										<p class="col-sm-offset-3 col-sm-9" style="padding-top: 10px;"></p>
									</div>
								</div>
								<div class="form-group" style="margin-top: 40px;">
									<div class="row">
										<div class="col-sm-offset-3 col-sm-9">
											<button type="button" id="btn_submit" class="btn btn-info" style="padding-left: 35px; padding-right: 35px;" onclick="submitPassword()"><spring:message code='确认修改'/></button>
										</div>
									</div>
								</div>
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

	<script type="text/javascript">
		$(function() {
			$(".cus_iter_navlists:nth-child(8)").addClass('useractive');
			
			//$("#password01")
			
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
		
		 // oninput 和 onpropertychange 两个事件进行实现验证密码等级
    	        $('#password02').bind('input propertychange', function() {
    	            var nodeLength=$(this).val().length;
    	            var pwd=$(this).val();
    	            if( nodeLength==2){
        	        	document.getElementById("span1").style.backgroundColor="crimson";
        	        	document.getElementById("span2").style.backgroundColor="aliceblue";
        	        	document.getElementById("span3").style.backgroundColor="aliceblue";
        	        }else if(nodeLength==4 && /[a-z]/.test(pwd) && /[A-Z]/.test(pwd)){//包含数字
        	        	document.getElementById("span1").style.backgroundColor="crimson";
        	        	document.getElementById("span2").style.backgroundColor="darkorange";
        	            document.getElementById("span3").style.backgroundColor="aliceblue";
        	        }else if(nodeLength>=6 && /\d/.test(pwd) && /\D/.test(pwd)){//包含字母加数字
        	        	document.getElementById("span1").style.backgroundColor="crimson";
        	        	document.getElementById("span2").style.backgroundColor="darkorange";
        	        	document.getElementById("span3").style.backgroundColor="lightgreen";
        	        }else if(nodeLength<2){
        	        	document.getElementById("span1").style.backgroundColor="aliceblue";
        	        	document.getElementById("span2").style.backgroundColor="aliceblue";
        	        	document.getElementById("span3").style.backgroundColor="aliceblue";
        	        };
    	        });
		
		
		
		
		function newPassword1(){
			var oldpassword = "${clientid.initialPassword}";
			var password01 = document.getElementById("password01").value;
			var password02 = document.getElementById("password02").value;
			var password03 = document.getElementById("password03").value;
				if(password02==null || password02==''){
					/* layer.alert('<spring:message code="请输入新密码！"/>', {
						icon: 2,
						title: "<spring:message code='提示'/>",
						}); */
						$('#password02').css({
							border: "1px solid red",
							boxShadow: "0 0 2px red"
						});
						$('#newPwd').html("<font color='red'><b>×<spring:message  code='请输入新密码！'/></b></font>");
						$("#btn_submit").prop("disabled", "true");
				}
				else if(password01==password02){
					/* layer.alert('<spring:message code="新密码不能与原始密码相同！"/>', {
						icon: 2,
						title: "<spring:message code='提示'/>",
						}); */
					$('#password02').css({
						border: "1px solid red",
						boxShadow: "0 0 2px red"
					});
					$('#newPwd').html("<font color='red'><b>×<spring:message  code='新密码不能与原始密码相同！'/></b></font>");
					$("#btn_submit").prop("disabled", "true");
				}else{
					$('#newPwd').html("<font color='#339933'><b>√<spring:message  code='新密码输入成功，请进行下一步操作'/></b></font>");
					 $('#password02').css({
	   					border: "1px solid #ccc",
	   					boxShadow: "none"
	   				});
					 $("#btn_submit").removeAttr("disabled");
				}
		}
			
		
		

		function newPassword(){
			//alert("------------");
			var oldpassword = "${clientid.initialPassword}";
			var password01 = document.getElementById("password01").value;
			var password02 = document.getElementById("password02").value;
			var password03 = document.getElementById("password03").value;
			
			if(password01==null || password01==''){
				$('#password01').css({
					border: "1px solid red",
					boxShadow: "0 0 2px red"
				});
				$('#oldPwd').html("<font color='red'><b>×<spring:message  code='原始密码不能为空'/></b></font>");
				$("#btn_submit").prop("disabled", "true");
			}else if(password01!=oldpassword){
				$('#password01').css({
					border: "1px solid red",
					boxShadow: "0 0 2px red"
				});
				$('#oldPwd').html("<font color='red'><b>×<spring:message  code='原始密码输入错误'/></b></font>");
				$("#btn_submit").prop("disabled", "true");
			}else{
		    	$('#oldPwd').html("<font color='#339933'><b>√<spring:message  code='原密码输入成功，请进行下一步操作'/></b></font>");
				 $('#password01').css({
   					border: "1px solid #ccc",
   					boxShadow: "none"
   				});
				 $("#btn_submit").removeAttr("disabled");
		    }
		}
		
		/* function newPassword2(){  //3jujiao
			 if(password01==password02){
					layer.alert('<spring:message code="新密码不能与原始密码相同！"/>', {
						icon: 2,
						title: "<spring:message code='提示'/>",
						});
				}	
		}
		 */
		function newPassword3(){//3shijiao
			var oldpassword ="${clientid.initialPassword}";
			var password01 = document.getElementById("password01").value;
			var password02 = document.getElementById("password02").value;
			var password03 = document.getElementById("password03").value;
			if(password03==null || password03==''){
				/* layer.alert('<spring:message code="请重复输入新密码！"/>', {
					icon: 2,
					title: "<spring:message code='提示'/>",
					}); */
				$('#password03').css({
					border: "1px solid red",
					boxShadow: "0 0 2px red"
				});
				$('#againpwd').html("<font color='red'><b>×<spring:message  code='新密码不能为空'/></b></font>");
				$("#btn_submit").prop("disabled", "true");
			}else if(password02!=password03){
					/* layer.alert('<spring:message code="新密码两次输入不一致！"/>', {
						icon: 2,
						title: "<spring:message code='提示'/>",
						}); */
				$('#password03').css({
					border: "1px solid red",
					boxShadow: "0 0 2px red"
				});
				$('#againpwd').html("<font color='red'><b>×<spring:message  code='新密码两次输入不一致！'/></b></font>");
				$("#btn_submit").prop("disabled", "true");
			 }else{
				 $('#againpwd').html("<font color='#339933'><b>√<spring:message  code='原密码输入成功，请进行下一步操作'/></b></font>");
				 $('#password03').css({
   					border: "1px solid #ccc",
   					boxShadow: "none"
   				});
				 $("#btn_submit").removeAttr("disabled"); 
			 }
		}
		
		
		function submitPassword(){
			var oldpassword = "${clientid.initialPassword}";
			var password01 = document.getElementById("password01").value;
			var password02 = document.getElementById("password02").value;
			var password03 = document.getElementById("password03").value;

			 if(oldpassword==password01 && password01!=password02 && password03==password02){
				 if(password02.length>=6){
					 $.post("/cilentCustomer/checkPassword.do",
								"&password01=" + password01+ "&password02=" + password02 + "&password03="+ password03,
								function(data) {
									//alert(data.result);
									if(data.result=='修改密码成功！'){
										layer.alert('<spring:message code="密码修改成功！"/>', {
											icon: 1,
											title: "<spring:message code='提示'/>",
											btn: ['确认'],
											shadeClose: false,
											yes: function(){
												window.location.href="/ClientUser/clientUserAction_exit.do?"
											},
										});
									}else{
										layer.alert('<spring:message code="密码修改失败！"/>',{
											icon: 5,
											title: "<spring:message code='提示'/>"
										});
									}
								}, "json"); 
				 }else{
					 layer.alert('<spring:message code="登陆密码不能小于6位！"/>',{
							icon: 5,
							title: "<spring:message code='提示'/>"
						});
				 }
				
			}else{
					layer.alert('<spring:message code="密码设置有误，请重新设置！"/>',{
						icon: 5,
						title: "<spring:message code='提示'/>"
					});
				}
		}
	
	</script>
<div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>