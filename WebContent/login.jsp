<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
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
    <title><spring:message  code='登录'/></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/> 
     
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
    <script src="${pageContext.request.contextPath}/js/i18n.js"></script>
     <script type="text/javascript">
		var lang = "${language}"
		if(lang==""){
			lang="zh";
		}
	 var message = "${message }";
		if(message.length != 0 ){
	 jQuery.i18n.properties({
	    	
	   	        name:'Messages', 
	   	        path:'/i18n/', 
	   	        mode:'both',
	   	   		language:lang,
	   	        checkAvailableLanguages: true,
	   	        async: true,
	   	        callback: function() {   
 			layer.msg(jQuery.i18n.prop(message), {icon: 5}); 
     }
	   	   });   
		}
		
	 var updateSucc="${updateSucc}";	
	  if(updateSucc.length>0 ){
	   		layer.msg("<spring:message  code='恭喜您，密码修改成功！'/>", {icon: 1});
	   	}
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

    		  /* 	var tnickname = "${transid.nickname}";  
    	    	var unickname = "${clientid.userName}";   
    	    	if(tnickname!=""){
    	    		$("#nickname").text(tnickname+"<spring:message  code='，欢迎您！'/>");
    	    		
    	    	}else if (unickname!="") {
    	    		$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>");
    	    		} */
    	    	
    	    	  $('#switch_qlogin').click(function(){
    	    			$('#switch_login').removeClass("switch_btn_focus").addClass('switch_btn');
    	    			$('#switch_qlogin').removeClass("switch_btn").addClass('switch_btn_focus');
    	    				$("#radioValue").val("trans");
    	    			});

    	    		$('#switch_login').click(function(){
    	    			$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
    	    			$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
    	    				$("#radioValue").val("client");
    	    			});
    	    		

    	    	  $("#loginIn_submit").click(function(){

    	    	    if($("#loginIn_user").val() == ""){
    	    	    	layer.msg("<spring:message  code='账号不能为空'/>",{
    	    	    		icon:2
    	    	    	});
    	    	      return false;
    	    	    }
    	    	    if($("#loginIn_pass").val() == ""){
    	    	    	layer.msg("<spring:message  code='密码不能为空'/>",{
    	    	    		icon:2
    	    	    	});
    	    	      return false;
    	    	    }
    	    	    $(".form_sub").submit();
    	    	  })
    	    	  
    	    	 /*  $("#loginIn_submitt").click(function(){

    	    	    if($("#loginIn_userr").val() == ""){
    	    	      $(".login_prompt").html("<p><spring:message  code='账号不能为空'/></p>");
    	    	      return false;
    	    	    }
    	    	    if($("#loginIn_passs").val() == ""){
    	    	      $(".login_prompt").html("<p><spring:message  code='密码不能为空'/></p>");
    	    	      return false;
    	    	    }
    	    	    $(".form_subb").submit();
    	    	  }) */
    	    	  if('${fromClient}' == '1'){
      		 		$("#fromClient").trigger("click");
      		 		$("#radioValue").val("client");
      		 	}
       	
    	 });   
    		
      /*  var successs="${success}";
       if(successs.length>0 ){
   		
   		layer.msg("<spring:message  code='恭喜您，注册成功！'/>", {icon: 1});
   	} */
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
    <style type="text/css">
    	.headers {
			height:40px;
			position:relative;
			font-family:"Microsoft Yahei";
			width:100%
		}
		
		#demo_img{  
			width: 30px;  
			height: 23px;  
			position: absolute;    
			right: 0px;   
			/* margin: 15px; */ 
			margin-buttom:35px;
			margin-top:30px  ;
			margin-right:55px 
		} 
		.switch_btn_focus{
    		background-color: #3a3f51;
    		width: 100%
    	}
    </style>
    <script type="text/javascript">
		 // 这里使用最原始的js语法实现，可对应换成jquery语法进行逻辑控制  
		    /* var demoImg = document.getElementById("demo_img");  
		    var demoInput = document.getElementById("demo_input");  */ 
		    //隐藏text block，显示password block  
		    function hideShowPsw(){
		        if (isContains(demo_img.src,'eyeNo')) {  
		        	$("#loginIn_pass").attr("type","text")
		            demo_img.src = "/img/eyeOFF.png";  
		        }else {  
		        	$("#loginIn_pass").attr("type","password");
		            demo_img.src = "/img/eyeNo.png";  
		        }  
		    }  
		    
		    function isContains(str, substr) {//str长字符串，substr短字符串
		        return new RegExp(substr).test(str);
		    }
    </script>
  </head>
  <body>
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
    <div class="container-fluid" style="padding:0;">
      <!--  login top  -->
      <div class="register_top container">
        <div class="row">
          <a href="/forwardAction/forward_toIndex.do" class="register_top_logo col-sm-3"></a>
          <h1 class="login_register col-sm-8"><spring:message  code="欢迎登录"/></h1>
        </div>
      </div>

      <!--  login body  -->
      <div class="" style="background:#8db5e3;background: url('${pageContext.request.contextPath}/img/login012205.jpg') center no-repeat;background-size: 100% 100%">
        <div class="register_body regContainer">
        	<div class="row">
          <div class="register_body_left col-md-7 col-sm-6 col-xs-12">
            <%-- <img class="img-responsive" style="width:680px;height:400px;" src="${pageContext.request.contextPath}/img/1.jpg" alt=""> --%>
          </div>
          <div class="login_body_right col-md-5 col-sm-6 pull-right" style="width:380px;padding:0px;">
            <!--  login body header  -->
          <div class="headers">
              <%-- <div class="switch" id="switch">
                <a class="switch_btn_focus" style="color:white;width:150px;text-align: center;margin-right:0;" id="switch_qlogin" href="javascript:;"><spring:message  code="译员登录"/></a>
                <a class="switch_btn" style="color:white;width:150px;text-align: center;margin-right:0;" id="switch_login" href="javascript:;"><spring:message  code="客户登录"/></a>
                <div class="switch_bottom" id="switch_bottom" style="width:150px;"></div>
              </div> --%>
              <div class="col-xs-6" style="padding:0;">
              		<label id="switch_qlogin" class="switch_btn_focus switch_qlogin"  style="border-top-left-radius:10px;width:100%;height:43px;line-height: 43px;text-align: center;"><a style="display:block;" href="javascript:;"><strong style="font-size: 18px;color:#fff;"><spring:message  code='译员'/></strong></a></label>
              	</div>
              	<div class="col-xs-6" style="padding:0;">
              		<label class="switch_btn" style="border-top-right-radius:10px;width:100%;color:black;height: 100%;line-height: 43px;text-align: center;" id="switch_login"><a id="fromClient" style="display:block;" href="javascript:;"><strong style="font-size: 18px;color:#fff;"><spring:message  code='客户'/></strong></a></label>
              	</div>
            </div> 

            <!--  login body body  -->
            <div class="web_qr_login" id="web_qr_login" style="padding-left:0;">
              <div class="web_login" id="web_login">
                <div class="loginIn_form">
                    <form class="form_sub" id="loginForm" action="${pageContext.request.contextPath}/ClientUser/userLogin.do" method="post">
                      <input type="hidden" name="radioValue" id="radioValue" value="trans">
                      <input type="text" id="loginIn_user" class="form-control" placeholder="<spring:message  code="用户名/手机号/邮箱"/>"  name="cellphone" value="${account }">
                      <img id="demo_img" onclick="hideShowPsw()" src="/img/eyeNo.png">
                      <input type="password" id="loginIn_pass" class="form-control" placeholder="<spring:message  code="请输入密码"/>"  name="password">
                      <div class="loginIn_forpass">
                       <!--  <label class="checkbox-inline">
                          <input type="checkbox" id="loginIn_checkbox" value="1"   name="saveTime">自动登录
                        </label> -->

                        <a class="forget_password" style="color:white;" href="/forwardAction/forward_toForgetPassword.do"><spring:message  code="忘记密码"/></a>
                      </div>
                      <input type="submit" value="<spring:message  code="登录"/>" id="loginIn_submit" class="btn btn-info btn-block"/>
                      <div style="height: 13px"></div>
                      <input type="button" value="<spring:message  code="注册"/>" style="height: 40px" class="btn btn-info btn-block" onclick="window.location='/forwardAction/forward_toRegister.do'"/>
                      <div class="other_uer">
                        <!-- <p>其他账号</p> -->
                        <div class="three_party">
                         <!--  <a class="loginIn_qq" href="#"></a> -->
                         <!--  <a class="login_wx" href="https://open.weixin.qq.com/connect/qrconnect?appid=appid&redirect_uri=url&response_type=code&scope=snsapi_login&state=state#wechat_redirect"></a> --> 
                          
                        </div>
                      </div>
                    </form>
                  </div>
              </div>
            </div>
            
             <!--  login body body  -->
           <%--  <div class="qlogin" id="qlogin" style="display: none;padding-left:0; ">
              <div class="web_login" >
                <div class="loginIn_form">
                    <div class="login_prompt"></div>
                    <form class="form_subb" action="${pageContext.request.contextPath}/ClientUser/clientUserAction_findUserLogin.do?type=client" method="post">
                      <input type="text" id="loginIn_userr" class="form-control" placeholder="<spring:message  code="请输入客户用户名"/>"  name="cellphone">
                      <input type="password" id="loginIn_passs" class="form-control" placeholder="<spring:message  code="请输入客户密码"/>"  name="password">
                      <div class="loginIn_forpass">
                        <label class="checkbox-inline">
                          <!-- <input type="checkbox"  value="1"   name="saveTime">自动登录 -->
                        </label>
                        <a class="forget_password" style="color:white;" href="/usercenter/ForgetPassword.jsp"><spring:message  code="忘记密码"/></a>
                      </div>
                      <input type="button" value="<spring:message  code="登录"/>" id="loginIn_submitt" class="btn btn-info btn-block"/>
                      <input type="button" value="<spring:message  code="免费注册"/>" class="btn btn-info btn-block" onclick="window.location='/forwardAction/forward_toRegister.do'"/>
                      
                    </form>
                  </div>
              </div>
            </div> --%>
           
          

          </div>
        </div>
      </div>
      </div>
      <!--  login footer  -->
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
      			<p class="footer_adress">Copyright 2005-2017 123.com版权所有 渝ICP备1234567-4号 渝B2-12134567 渝公安网备 1234567890号 互联网违法和不良信息举报电话：1234567 邮箱：info@aitrans.cn</p>
      </footer>

    </div>
  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
