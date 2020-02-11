<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
		<title><spring:message  code='忘记密码'/></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/forgetPassword.css"/>
	
		<script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
	    <script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
		<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
<script type="text/javascript">
var lang = "${language}"
	if(lang==""){
		lang="zh";
	}

var InterValObj; //timer变量，控制时间  
var count = 60; //间隔函数，1秒执行  
var curCount;//当前剩余秒数 
function change(){
	document.getElementById("imageCode").src="/ClientUser/clientUserAction_getCode.do?"+new Date().getTime();
}
function check(obj){

	 var regex=/^(\w){6,20}$/

	 if(!regex.test(obj.value)){
		 $("#message").show();
	 }
}
function show (obj){
	var temp = document.getElementById("name");
		if(obj.value=="手机号验证"){
			
			$.ajax({
			type:"POST",													
			url:"/ClientUser/clientUserAction_getIphone.do",								
			data:"name="+temp.value,
			dataType:"json",											
			cache:false,													
			success:function(data){	
				var tel = data.tel;
				
		if(tel==null){
			
			layer.msg(data.message, {icon: 5});
			$("#nameid").attr("selected","selected");
			$("#iphone").hide();
				$("#cardId").show();
				$("#securityQuestion").hide();
			
		}else{
			var iphone = tel.substring(0, 3)+"****"+tel.substring(7, 11);
			$("#telInfo").prop("value",iphone);
				tel1 = tel;
				$("#iphone").show();
 				$("#cardId").hide();
 				$("#securityQuestion").hide();
			}	
			}
			});
			
		}else if(obj.value=="身份证号验证"){
			$("#iphone").hide();
			$("#cardId").show();
			$("#securityQuestion").hide();
		}else if(obj.value=="密保问题验证"){
			
			$.ajax({
			type:"POST",													
			url:"/ClientUser/clientUserAction_getSecurityQuestion.do",								
			data:"name="+temp.value,
			dataType:"json",											
			cache:false,													
			success:function(data){	
				var securityQuestion = data.securityQuestion;
				if(securityQuestion==null){
					
					layer.msg(data.message, {icon: 5});
					$("#nameid").attr("selected","selected");
					$("#iphone").hide();
	 				$("#cardId").show();
	 				$("#securityQuestion").hide();
				}else{
					$("#squestion").prop("value",securityQuestion);
					$("#iphone").hide();
	 				$("#cardId").hide();
	 				$("#securityQuestion").show();
					
				}
			}
			});
		}

}

function sendMessage(){
  var phone=$("#telInfo");
  if(phone !=""&& phone!=null ){
	 curCount = count;  
  //设置button效果，开始计时  
     $("#btnSendCode").attr("disabled", "true");//设置按钮为禁用状态  
     $("#btnSendCode").val("<spring:message  code='请在'/>" + curCount + "<spring:message  code='秒内输入验证码'/>");  
     InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次  
   $.post("/sendMessage/sendMessageAction_sendPhone.do?phone="+tel1,function(data){
	   if(data!=null && data!=""){
		 $('#userMes').html("<font color='#339933'><b>√ <spring:message  code='短信验证码已发到您的手机,请查收'/></b></font>");
	   }else{
		 $('#userMes').html("<font color='red'><b>× <spring:message  code='短信验证码发送失败，请重新发送'/></b></font>");  
	   }
    },"text");
  }
  }
//timer处理函数  
function SetRemainTime() {  
        if (curCount == 0) {                  
            window.clearInterval(InterValObj);//停止计时器  
            $("#btnSendCode").removeAttr("disabled");//启用按钮  
            $("#btnSendCode").val("<spring:message  code='重新发送验证码'/>");  
        }  
        else {  
            curCount--;  
            $("#btnSendCode").val("<spring:message  code='请在'/>" + curCount + "<spring:message  code='秒内输入验证码'/>");  
        }  
    }

$(function (){
	var tnickname = "${transid.nickname}";
	var unickname = "${clientid.userName}"
	if(tnickname!=""){
		$("#nickname").text(tnickname+"<spring:message  code='，欢迎您！'/>");
		
	}else if (unickname!="") {
		$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>");
		}

$("#inp01").click(function(){
var temp = document.getElementById("name");
var code = document.getElementById("passWid002");
var code1=code.value;
  //对电子邮件的验证
  var regex=/^[a-zA-Z]\w{3,15}$/;
  var regex1=/^1[35678]\d{9}$/ ;
  var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
if(temp.value === ""){ //输入不能为空
	layer.msg("<spring:message  code='用户名不能为空'/>", {icon: 2});
	change();
}else if(!myreg.test(temp.value) && !regex.test(temp.value) && !regex1.test(temp.value) ){

		layer.msg("<spring:message  code='提示：请输入有效的用户名！'/>", {icon: 2});
		change();

 }else{
$.ajax({
	type:"POST",													
	url:"/ClientUser/clientUserAction_queryByName.do",								
	data:"name="+temp.value+"&code="+code1,
	dataType:"json",											
	cache:false,													
	success:function(data){									
		var msg = data.message;
		if(msg=="success"){
			$(".passWid").hide();
			$("#forS2").css({"background-position":"0 -307px","color":"white"});
			$(".passWid").eq(1).show();
		}else{
			 jQuery.i18n.properties({
					
			        name:'Messages', 
			        path:'/i18n/', 
			        mode:'both',
			   		language:lang,
			        checkAvailableLanguages: true,
			        async: true,
			        callback: function() { 
			layer.msg(jQuery.i18n.prop(msg), {icon: 2});
			change();
			        }
			    });
		}
	
	}	
})

}

}) 

$("#inp02").click(function(){
var temp = document.getElementById("name");
var show = document.getElementById("show");
if(show.value=="身份证号验证"){
var cardId = document.getElementById("card");
var uname = document.getElementById("uname");

  //对电子邮件的验证
  var mycard = /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/;
if(uname.value === ""){ //输入不能为空
	layer.msg("<spring:message  code='姓名不能为空！'/>", {icon: 2});
}else if(!mycard.test(cardId.value)){
	layer.msg("<spring:message  code='身份证号格式有误！'/>", {icon: 2});
 }else{
$.ajax({
	type:"POST",													
	url:"/ClientUser/clientUserAction_queryByCardId.do",								
	data:"name="+temp.value+"&uname="+uname.value+"&cardId="+cardId.value,
	dataType:"json",											
	cache:false,													
	success:function(data){									
		var msg = data.message;
		if(msg=="success"){
			$(".passWid").hide();
			$("#forS3").css({"background-position":"0 -423px","color":"white"})
			$(".passWid").eq(2).show();
		}else{
			 jQuery.i18n.properties({
					
			        name:'Messages', 
			        path:'/i18n/', 
			        mode:'both',
			   		language:lang,
			        checkAvailableLanguages: true,
			        async: true,
			        callback: function() { 
			layer.msg(jQuery.i18n.prop(msg), {icon: 2});
			        }
			    });
		}
	
	}	
})

}
}else if (show.value=="手机号验证") {
	var code = $("#code").val();

	$.ajax({
		type:"POST",													
		url:"/sendMessage/sendMessageAction_checkCode.do",								
		data:"code="+code,
		dataType:"json",											
		cache:false,													
		success:function(data){	
	if(data==1){

		$(".passWid").hide();
		$("#forS3").css({"background-position":"0 -423px","color":"white"})
		$(".passWid").eq(2).show(); 
	}else{
		layer.msg("<spring:message  code='您输入的验证码有误或者已过期！'/>", {icon: 2});
		
	}
		
		
		}
	
});
}else if (show.value=="密保问题验证") {
	var answer = $("#answer").val();
	var securityQuestion = $("#squestion").val();
	if(answer=="" || answer==null){
		layer.msg("<spring:message  code='答案不能为空！'/>", {icon: 2});
	}else {
		$.ajax({
			type:"POST",													
			url:"/ClientUser/clientUserAction_checkAnswer.do",								
			data:"answer="+answer+"&securityQuestion="+securityQuestion+"&name="+temp.value,
			dataType:"json",											
			cache:false,													
			success:function(data){	
				if(data.message=="success"){
							
					$(".passWid").hide();
					$("#forS3").css({"background-position":"0 -423px","color":"white"})
					$(".passWid").eq(2).show(); 
				}else{
					 jQuery.i18n.properties({
							
					        name:'Messages', 
					        path:'/i18n/', 
					        mode:'both',
					   		language:lang,
					        checkAvailableLanguages: true,
					        async: true,
					        callback: function() { 
					$("#append").text(jQuery.i18n.prop(data.message));
					        }
					    });
				}
				
				}
			});
	}
	
	
	
}

})
$("#inp03").click(function(){
var temp = document.getElementById("name");
var newpassword1= $("#password1").val();
var newpassword2= $("#password2").val();
var regex=/^(\w){6,20}$/

if(newpassword1==newpassword2){
	if(!regex.test(newpassword1)){
		layer.msg("<spring:message  code='密码格式有误请核对！'/>", {icon: 2});
		 }else{
	$.ajax({
		type:"POST",													
		url:"/ClientUser/clientUserAction_updatePassword.do",								
		data:"name="+temp.value+"&newpassword="+newpassword1,
		dataType:"json",											
		cache:false,													
		success:function(data){									
			var msg = data.message;
			if(msg=="success"){
				$(".passWid").hide();
				$(".passWid").eq(3).show();
			}else{
				 jQuery.i18n.properties({
						
				        name:'Messages', 
				        path:'/i18n/', 
				        mode:'both',
				   		language:lang,
				        checkAvailableLanguages: true,
				        async: true,
				        callback: function() { 
				layer.msg(jQuery.i18n.prop(msg), {icon: 2});
				        }
				    });
			}
		
		}	
	})
		}
}else{
	layer.msg("<spring:message  code='两次密码输入不符！请核对！'/>", {icon: 2});
}



})
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
	</script>
    
    
	</head>
	<body >
<!--      头标签开始      -->
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
		<!--   正文内容   -->
		<div class="container">
	
		<!--   帮助中心 logo   -->
		<div class="help_center_logo">
			<a href="javascript:;"></a>
		</div>
		<h3 style="margin:20px 0 30px 30px;"><spring:message  code='忘记密码'/></h3>
		<!-- 忘记密码  开始 -->
		<div class="forgetPassword">
			<div class="forgetPasswordDiv">
				<!--找回密码进度条-->
				<div style="text-align:center;">
					<span class="forgetPasswordIcon" id="forS1" style="color: #fff;">1.<spring:message  code='输入账户名'/></span>
						
					<span class="forgetPasswordIcon" id="forS2">2.<spring:message  code='验证身份'/></span>
						
					<span class="forgetPasswordIcon" id="forS3">3.<spring:message  code='重置密码'/></span>
				</div>
				<!--验证信息-->
				<div>
					<!--验证信息第一步-->
					<div class="passWid" style="margin-left:170px;">
						<span><spring:message  code='请填写您需要找回的账号'/></span>
						<input type="text"  id="name"  placeholder="<spring:message  code='请输入您的用户名/手机号/邮箱'/>" />
						<input type="text"  id="passWid002"  placeholder="<spring:message  code='请输入验证码'/>"/>
						 <span id="miasdWd"><img src="/ClientUser/clientUserAction_getCode.do" id="imageCode"/>
						</span>
						<a href="javascript:change();" id="miasdWdas"><spring:message  code='看不清？'/></a>
						<input id="inp01" type="button" id="next01" value="<spring:message  code='下一步'/>" /> 
					</div>
					<!--验证信息第二步-->
					<div class="passWid" style="display: none;margin-left:170px;">
						
						<label for=""><spring:message  code='选择验证方式：'/></label>
						<select  id="show"  onchange="show(this);" >
							<option value="">-- <spring:message  code='请选择验证方式'/> </option>
							<option value="身份证号验证" id='nameid' >-- <spring:message  code='身份证号验证'/> --</option>
							<option value="手机号验证" id='tel' >-- <spring:message  code='手机号验证'/> --</option>
							<option value="密保问题验证" id='question' >-- <spring:message  code='密保问题验证'/> --</option>
						</select><br>
						<div id="cardId" style="display: none;">
						<p><label style="letter-spacing:20px;" for=""><spring:message  code='姓名'/></label>： <input type="text" name="" id="uname" value=""/></p>
						<p><label style="letter-spacing:7px;" for=""><spring:message  code='身份证号：'/></label><input style="width: 300px;" type="text" name="" id="card" value=""/></p>
						</div>
						<div id="securityQuestion" style="display: none;">
						<p><label style="letter-spacing:7px;" for=""><spring:message  code='密保问题：'/></label> <input type="text"  style="text-align: center;" name="" id="squestion" value="" disabled="disabled"/></p>
						<p><label style="letter-spacing:20px;" for=""><spring:message  code='答案'/></label>：&nbsp; <input style="width: 300px;" type="text" name="" id="answer" value=""/><span >&nbsp;&nbsp;&nbsp;&nbsp;<font color="red"><b id = "append"></b></font></span></p>
						</div>
						<div id = "iphone" style="display: none;">
						<p ><label style="letter-spacing:9px;" for=""><spring:message  code='手机号'/></label>：<input style="text-align:center;width: 200px;font-size: 15px;" type="text" name="" id = "telInfo" value="" disabled="disabled"/><span id="userMes" ></span></p>
						 <div class="pull-left">
						<p><label style="letter-spacing:9px;" for=""><spring:message  code='验证码'/></label>：<input style="width: 100px;" type="text" name="" id="code" value=""/></p>
						</div>
						<div >
							<input type="button" onclick="sendMessage()"  style="width: 100px;" id="btnSendCode" value="<spring:message  code='发送验证码'/>" class="btn btn-primary btn-sm"   >
				
						</div>
						
						</div>
						
						<input id="inp02" type="button" id="next02" value="<spring:message  code='下一步'/>"  />
					</div>
					<!--验证信息第三步-->
					<div class="passWid" style="display: none;margin-left:170px;">
						<p  ></p>
						<p><label style="letter-spacing:4px;" for=""><spring:message  code='新密码：'/></label><input type="password" name="" id="password1" onblur="check(this)" value="" placeholder="<spring:message  code='请输入新密码'/>"/><font color="red"id="message" style="display: none;" >&nbsp&nbsp&nbsp*<spring:message  code='只能输入6-20个字母、数字、下划线'/>*</font></p>
						<p><label for=""><spring:message  code='重复密码：'/></label><input style="width: 300px;" type="password" name="" id="password2" onblur="check(this)" value="" placeholder="<spring:message  code='再输入新密码'/>"/></p>
						<input id="inp03" type="button" id="next03" value="<spring:message  code='确定'/>" />
					</div>
					<!-- 修改成功 -->
					<div class="passWid" style="display: none;text-align:center;">
						<div class="passWidD03" ><i></i><span id="threeIcon"><spring:message  code='你的新密码已设置成功！'/></span></div>
						<div><p><spring:message  code='你可以'/><a href="/forwardAction/forward_toLogin.do" id="fourIcon"><spring:message  code='立即登录'/></a><spring:message  code='或者回到'/><a style="color: #428FDD;" href="/forwardAction/forward_toIndex.do"><spring:message  code='首页'/>&gt;&gt;</a></p></div>
					</div>
				</div>
			</div>
		</div>

		<!-- 忘记密码  结束 -->


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
		<script type="text/javascript">
		
		</script>
	<div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
