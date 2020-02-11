<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title><spring:message  code='用户中心-我是译员-密码修改'/></title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.center.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/simple.switch.three.css" type="text/css">


    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/md5.js"></script>
   <%--  <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.center.js"></script> --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/simple.switch.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
	<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script type="text/javascript">
    $(function(){
    	var initialPassword = ("${transid.initialPassword}");
    	$("#oldpwd").val(hex_md5(initialPassword));
    });
    
    var	pwdmin = 6;
    function checkPassword(){
    	 if($("#password01").val() == ""){
			$('#password01').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#oldPwd').html("<font color='red'><b>×<spring:message  code='原始密码不能为空'/></b></font>");
			$("#btn_submit").prop("disabled", "true");
    	 }else{ 
    		var password01=hex_md5($("#password01").val());
    		var oldpwd01=$("#oldpwd").val();
				 if(password01 != oldpwd01){
					 $('#oldPwd').html("<font color='red'><b>×<spring:message  code='原密码输入错误'/></b></font>");
					 $('#password01').css({
							border: "1px solid red",
							boxShadow: "0 0 2px red"
						});
					 $("#btn_submit").prop("disabled", "true");
					 return false;
				 }else{
					 $('#oldPwd').html("<font color='#339933'><b>√<spring:message  code='原密码输入成功，请进行下一步操作'/></b></font>");
					 $('#password01').css({
	    					border: "1px solid #ccc",
	    					boxShadow: "none"
	    				});
					 $("#btn_submit").removeAttr("disabled");
				 } 
		 }
    }
    	function checkOldPassword(){
    		if($("#password02").val() == ""){
    			$("#first").show();
				$("#safety_level").hide();
				$("#safety").hide(); 
				$('#first').html("<font color='red'><b>×<spring:message  code='新密码不能为空'/></b></font>");
				$('#password02').css({
					border: "1px solid red",
					boxShadow: "0 0 2px red"
				});
				$("#btn_submit").prop("disabled", "true");
    		}else{ 
    			var password02=$("#password02").val();
    			var oldpwd01=$("#oldpwd").val();
					 if(hex_md5(password02) == oldpwd01){
						 $("#first").show();
						 $("#safety_level").hide();
						 $("#safety").hide(); 
						 $('#first').html("<font color='red'><b>×<spring:message  code='密码与原密码重复'/></b></font>");
						 $('#password02').css({
								border: "1px solid red",
								boxShadow: "0 0 2px red"
							});
						 $("#btn_submit").prop("disabled", "true");
						 return false;
					 }else if(password02.length < 6){
						 $("#first").show();
						 $("#safety_level").hide();
						 $("#safety").hide(); 
						 $('#first').html("<font color='red'><b>×<spring:message  code='密码不得少于6位'/></b></font>");
						 $('#password02').css({
								border: "1px solid red",
								boxShadow: "0 0 2px red"
							});
						 $("#btn_submit").prop("disabled", "true");
						 return false;
					 }else{
						 $("#safety_level").show();
						 $("#safety").show();
						 $('#password02').css({
		    					border: "1px solid #ccc",
		    					boxShadow: "none"
		    				});
						 $('#first').html("<font color='#339933'><b>√<spring:message  code='新密码输入正确，请进行下一步操作！'/></b></font>");
						 $("#btn_submit").removeAttr("disabled");
					 } 
				}
    		   }
    	
    	function checkNewPassword(){
    		var password03 = $("#password03").val();
    		var password02 = $("#password02").val();
    		if(password03 == null || password03 == ""){
    			$("#second").show();
    			$('#second').html("<font color='red'><b>×<spring:message  code='确认密码不能为空'/></b></font>");
    			$('#password03').css({
					border: "1px solid red",
					boxShadow: "0 0 2px red"
				});
    		}else if(password03 == password02){
    			$("#second").show();
    			$('#second').html("<font color='#339933'><b>√<spring:message  code='恭喜，密码验证正确'/></b></font>");
    			$('#password03').css({
					border: "1px solid #ccc",
					boxShadow: "none"
				});
    		}else{
    			$("#second").show();
    			$('#second').html("<font color='red'><b>×<spring:message  code='确认密码与新密码不一致'/></b></font>");
    			$('#password03').css({
					border: "1px solid red",
					boxShadow: "0 0 2px red"
				});
    		}
    	}
    	
    	var message = "${message }";
    	
    	if(message.trim().length != 0 ){
    		
    		layer.msg(message, {icon: 1});
    	}
    	 
    </script>
    <style type="text/css">
      .safety_level{
        height: 34px;
        line-height: 34px;
      }
        .safety_level span{
          width:40px;
          height:20px;
          display: inline-block;
          background:#f1f1f1;
          border-left: 2px solid #ccc;
          vertical-align: middle;
        }
        .safety_level span:first-child{
          border-left: 0;
          margin-left: 10px;
        }
    </style>
  </head>
  <body style="background:#f5f5f5;">
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


        <!--    用户中心 我是译员   -->
        <div class="my_customer">
          <div class="row">


            <!--    用户中心 我是译员 左侧导航   -->
             <div class="my_interpreter_left col-sm-2">
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

            <!--    用户中心 我是译员 右侧内容   -->
            <div class="my_customer_right col-sm-10">

              <!--  用户中心右侧 tab切换栏   -->
              <div class="">
                <ul id="suerTab" class="nav nav-tabs">
                	<li class="active"><a href="javascript:;" data-toggle="tab"><spring:message  code='修改密码'/></a></li>
                </ul>
              </div>

                <!--  tab面板对应内容   -->
                <div class="myTabContent tab-content" style="padding-top:100px;padding-bottom:200px;">
                  <form class="form-horizontal" id="defaultForm" action="${pageContext.request.contextPath}/translator/translatorAction_updatePassword.do"  method="post">
                    <div class="form-group" style="margin-bottom:30px;">
                    	<div class="row">
                      		<label for="password01" class="col-sm-3 control-label"><spring:message  code='原始密码：'/></label><span id="oldPwd"></span>
                      		<div class="col-sm-5">
                        		<input type="password" class="form-control" id="password01" placeholder="<spring:message  code='请输入原始密码'/>" name="password01" onblur="checkPassword()">
                        		<input type="hidden" id="oldpwd" name="oldpwd">
                      		</div>
                      	</div>
                      <p class="col-sm-offset-3 col-sm-9" style="padding-top:10px;"><spring:message  code='密码由6-16位字符串组成，区分大小写'/></p>
                    </div>
                    <div class="form-group" style="margin-bottom:30px;">
                      <div class="row">
                        <label for="password02" class="col-sm-3 control-label"><spring:message  code='新密码：'/></label><span id="newPwd"></span>
                        <div class="col-sm-5">
                          <input type="password" class="form-control" id="password02" placeholder="<spring:message  code='请输入新密码'/>" name="password02" onkeyup="checkOldPassword()" >
                        </div>
                          <span  id="first" hidden="hidden"></span> 
                        <div class="col-sm-4 safety_level" id="safety_level">
                                                 <h7 id="safety"><spring:message code='安全等级'/></h7>
                        <span id="span1" ></span><span id="span2"></span><span id="span3"></span>
                        </div>
                      <p class="col-sm-offset-3 col-sm-9" style="padding-top:10px;"><spring:message  code='为了提升您的密码安全性，建议使用英文字母加数字或符号的组合密码。'/></p> 
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <div class="row">
                        <label for="password03" class="col-sm-3 control-label"><spring:message  code='确认新密码：'/></label><span id="againpwd"></span>
                        <div class="col-sm-5">
                          <input type="password" class="form-control" id="password03" placeholder="<spring:message  code='再输入一次新密码'/>" name="password03" onkeyup="checkNewPassword()">
                        </div>
                        <span  id="second" hidden="hidden"></span>
                        <p class="col-sm-offset-3 col-sm-9" style="padding-top:10px;"></p>
                      </div>
                    </div>
                    <div class="form-group" style="margin-top:40px;">
                      <div class="row">
                        <div class="col-sm-offset-3 col-sm-10">
                          <button type="submit" id="btn_submit" class="btn btn-info" style="padding-left:35px;padding-right:35px;" id="btnsubmit" ><spring:message  code='确认修改'/></button>
                        </div>
                      </div>
                    </div>
                  </form>
                </div>
                <!--  tab面板切换内容结束！  -->
              </div>

            <!--    用户中心 我是客户 右侧内容 结束   -->


        </div>
        <!--    用户中心 我是客户 结束   -->
      </div>
    </div>
    </div>
     <div id="gradient" class="footer_content">
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
       $(function(){ 
    	   $(".cus_iter_navlists a").removeClass("useractive")
           $(".cus_iter_navlists").eq(10).find("a").addClass("useractive")
       	/* var tnickname = "${transid.nickname}";
   		var unickname = "${clientid.userName}"
   		if(tnickname!=""){
   			$("#nickname").text(tnickname+"<spring:message  code='，欢迎您！'/>");
   			
   		}else if (unickname!="") {
   			$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>!");
   			} */
   			
           if("${transid.nickname}"!=null && "${transid.nickname}"!=''){
         	  $("#nickname").text("${transid.nickname}"+"<spring:message  code='，欢迎您！'/>");
           }else if("${transid.tel}"!=null && "${transid.tel}"!=''){
         	  $("#nickname").text("${transid.tel}"+"<spring:message  code='，欢迎您！'/>");
           }else if("${transid.email}"!=null && "${transid.email}"!=''){
         	  $("#nickname").text("${transid.email}"+"<spring:message  code='，欢迎您！'/>");
           }
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
    	   
    	   
    	  
    	   var	pwdmin = 6; 
    	   $('#btn_submit').click(function() {
    			 // 原始密码验证
    			if($("#password01").val() == ""){
    				$('#password01').css({
    					border: "1px solid red",
    					boxShadow: "0 0 2px red"
    				});
    				$('#oldPwd').html("<font color='red'><b>×<spring:message  code='原始密码不能为空'/></b></font>");
    				return false;
    				$("#btn_submit").prop("disabled", "true");
    			}else{
    				$('#password01').css({
    					border: "1px solid #ccc",
    					boxShadow: "none"
    				});
    				$("#btn_submit").removeAttr("disabled");
    			} 
    			// 新密码验证
    			if($("#password02").val() == ""){
    				$('#password02').focus().css({
    					border: "1px solid red",
    					boxShadow: "0 0 2px red"
    				});
    				$('#first').html("<font color='red'><b>×<spring:message  code='新密码不能为空'/></b></font>");
    				$("#btn_submit").prop("disabled", "true");
    				return false;
    			}else{
    				$('#password02').css({
    					border: "1px solid #ccc",
    					boxShadow: "none"
    				});
    				$("#btn_submit").removeAttr("disabled");
    			} 
    			if ($('#password03').val().length < pwdmin) {
    				$('#password03').focus();
    				$('#againpwd').html("<font color='red'><b>×密码不能小于" + pwdmin + "位</b></font>");
    				$("#btn_submit").prop("disabled", "true");
    				return false;
    			}else{
    				var passwd=$('#password03').val();
    				if(!(/^(\w){6,20}$/.test(passwd))){
    					$('#againpwd').html("<font color='red'><b>×<spring:message  code='密码强度最少6位,只能输入6-20个字母、数字、下划线'/></b></font>");
    			        return false; 
    			    } 
    				$('#passwd').css({
    					border: "1px solid #ccc",
    					boxShadow: "none"
    				});
    			}
    			if ($('#password02').val() != $('#password03').val()) {
    				$('#password03').focus();
    				$('#againpwd').html("<font color='red'><b>×<spring:message  code='两次密码不一致！'/></b></font>");
    				$("#btn_submit").prop("disabled", "true");
    				return false;
    			}else{
    				$('#passwd2').css({
    					border: "1px solid #ccc",
    					boxShadow: "none"
    				});
    				$("#btn_submit").removeAttr("disabled");
    			}
    			
    	   
    			$('#defaultForm').submit();
    		}); 
       }); 
        
    </script>
  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
