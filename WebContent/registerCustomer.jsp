<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
<!DOCTYPE html>
<html>
  <head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name=" Keywords" content="......"><!--content中，网页关键字-->
    <meta name=" description" content="......"><!--content中，网页描述文字-->
    <meta name="author" content="......"><!--标注作者-->
    <title><spring:message  code='注册'/></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
   
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    <!-- twlBegin -->
    <style type="text/css">
    	.switch_qlogin{
    		background-color: #3a3f51;
    		width: 150%
    	}
    	.form-control{
    		width:100%
    	}
    	.btn-sm{
    		padding:7px 4px;
    		margin-left:-11px
    		
    	}
    	
    	/* #demo_img{  
			width: 30px;  
			height: 23px;  
			
			margin-buttom:35px;
			margin-top:5px  ;
			margin-right:25px 
		}  */
		
		.demo_img{
			height: 27px;
			position: absolute; 
			display: block;
			padding: 6px 12px;
			margin-left: 75%;
			margin-top:1.5%
		}
    	/* #switch{
    		width:50%;
    		background-color: black;
    		
    	} */
    </style>
    
    <script type="text/javascript">
		 // 这里使用最原始的js语法实现，可对应换成jquery语法进行逻辑控制  
		   /*  var demoImg = document.getElementById("demo_img");  
		    var demoInput = document.getElementById("demo_input");  */ 
		    //隐藏text block，显示password block  
		    function hideShowPswTel(){
		        if (isContains(demo_imgTel.src,'eyeNo')) {  
		        	$("#inputPassword1").attr("type","text")
		            demo_imgTel.src = "/img/eyeOFF.png";  
		        }else {  
		        	$("#inputPassword1").attr("type","password");
		        	demo_imgTel.src = "/img/eyeNo.png";  
		        }  
		    }  
		    
		    
		    function hideShowPswEmail(){
		        if (isContains(demo_imgEmail.src,'eyeNo')) {  
		        	$("#inputPassword2").attr("type","text")
		            demo_imgEmail.src = "/img/eyeOFF.png";  
		        }else {  
		        	$("#inputPassword2").attr("type","password");
		        	demo_imgEmail.src = "/img/eyeNo.png";  
		        }  
		    }  
		    
		    
		    function isContains(str, substr) {//str长字符串，substr短字符串
		        return new RegExp(substr).test(str);
		    }
    </script>
    
    <!-- twl End-->
    <script type="text/javascript">

    $(function(){

    	$('#switch_qlogin').click(function(){
    		$('#switch_login').removeClass("switch_btn_focus").addClass('switch_btn');
    		$('#switch_qlogin').removeClass("switch_btn").addClass('switch_btn_focus');
    		$('#switch_bottom').animate({left:'0%',width:'52%'}); 
    		$('#qlogin').css('display','none');
    		$('#web_qr_login').css('display','block');
 
    		
    		});

    	$('#switch_login').click(function(){
    		$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
    		$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
    		$('#switch_bottom').animate({left:'55%',width:'52%'});
    		$('#qlogin').css('display','block');
    		$('#web_qr_login').css('display','none');

    	}); 
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

    var	pwdmin = 6;

    $(document).ready(function() {
//--------------------------------赵磊开始----------------------------------------------------------------------------------------------------------------
    	//twl开始
    	/* $("#tel_submit").click(function(){
    		
    		// 用户名验证
    		if($("#user").val() == ""){
    			$('#user').css({
    				border: "1px solid red",
    				boxShadow: "0 0 2px red"
    			});
    			$('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='用户名不能为空'/></b></font>"); *///twl结束
    			/* var userNameright = document.getElementById('userNameright');  
                userNameright.style.display="none"; 
                var userNameerror = document.getElementById('userNameerror');  
   		        userNameerror.style.display="block"; 
   		        var userNameloading = document.getElementById('userNameloading');  
   		        userNameloading.style.display="none";  */
   		   //twl开始
   		   /*return false;
    		}else{
    			var user=$("#user").val();
    		    if(!(/^(([a-z]+[0-9]+)|([0-9]+[a-z]+))[a-z0-9]*$/i.test(user))){ 
    		     $('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='用户名应为英文字母和数字的混合'/></b></font>");
    		        return false; 
    		    }  *///twl结束
    		    /* var userNameright = document.getElementById('userNameright');  
                userNameright.style.display="none"; 
                var userNameerror = document.getElementById('userNameerror');  
   		        userNameerror.style.display="block"; 
   		        var userNameloading = document.getElementById('userNameloading');  
   		        userNameloading.style.display="none";  */
   		     //twl开始
   		        /*$('#user').css({
    				border: "1px solid #ccc",
    				boxShadow: "none"
    			});
    		}
    		// 手机号验证
    		if($("#tel").val() == ""){
    			$('#tel').css({
    				border: "1px solid red",
    				boxShadow: "0 0 2px red"
    			});
    			$('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='手机号不能为空'/></b></font>"); */ //twl结束
    			 /* var phoneright = document.getElementById('phoneright');  
        	     phoneright.style.display="none"; 
                 var phoneloading = document.getElementById('phoneloading');  
                 phoneloading.style.display="none"; 
     		     var phoneerror = document.getElementById('phoneerror');  
     		     phoneerror.style.display="block";   */
     		    //twl开始
     		   /*return false;
    		}else{
    			var phone=$("#tel").val();
    			    if(!(/^1[34578]\d{9}$/.test(phone))){ 
    			     $('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='手机号格式错误'/></b></font>");
    			        return false; 
    			    } 
    			$('#tel').css({
    				border: "1px solid #ccc",
    				boxShadow: "none"
    			});*/ //twl结束
    			/*  var phoneright = document.getElementById('phoneright');  
        	     phoneright.style.display="none"; 
                 var phoneloading = document.getElementById('phoneloading');  
                 phoneloading.style.display="none"; 
     		     var phoneerror = document.getElementById('phoneerror');  
     		     phoneerror.style.display="block";  */ 
    			//twl开始
      		   /*}
    		 if($("#inputPassword1").val()==""){
    			 $('#inputPassword1').css({
     				border: "1px solid red",
     				boxShadow: "0 0 2px red"
     			});
    			$('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='密码不能为空'/></b></font>");*///twl结束
      		   /*
    			/* var oldpwdsright = document.getElementById('oldpwdsright');  
    			oldpwdsright.style.display="none"; 
                var oldpwdsloading = document.getElementById('oldpwdsloading');  
                oldpwdsloading.style.display="none"; 
    		    var oldpwdserror = document.getElementById('oldpwdserror');  
    		    oldpwdserror.style.display="block"; */ 
    		  //twl开始
      		   /*return false;
    		 }else{
    			 $('#inputPassword1').css({
     				border: "1px solid #ccc",
     				boxShadow: "none"
     			});*///twl结束
    		   /*  var oldpwdsright = document.getElementById('oldpwdsright');  
     			oldpwdsright.style.display="block"; 
                var oldpwdsloading = document.getElementById('oldpwdsloading');  
                oldpwdsloading.style.display="none"; 
     		    var oldpwdserror = document.getElementById('oldpwdserror');  
     		    oldpwdserror.style.display="none";  */
     		 //twl开始
     		    /*  } */	//twl结束
    		/* // 验证码验证
    		if($("#inputPassword11").val() == ""){
    			$('#inputPassword11').focus().css({
    				border: "1px solid red",
    				boxShadow: "0 0 2px red"
    			});
    			$('#userMes').html("<font color='red'><b>×<spring:message  code='验证码不能为空'/></b></font>");
    			return false;
    		}else{
    			$('#inputPassword11').focus().css({
    				border: "1px solid #ccc",
    				boxShadow: "none"
    			});
    		} */
    		// 邮箱验证
    		/* if($("#email").val() == ""){
    			$('#email').css({
    				border: "1px solid red",
    				boxShadow: "0 0 2px red"
    			});
    			$('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='邮箱不能为空'/></b></font>");
    			return false;
    		}else{
    			var email=$("#email").val();
    		    if(!(/^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(email))){ 
    		     $('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='邮箱格式错误'/></b></font>");
    		        return false; 
    		    } 
    		$('#email').css({
    			border: "1px solid #ccc",
    			boxShadow: "none"
    		   });
    	     } */
    	     
    		// 密码验证
    		//twl开始
    		/* if ($('#inputPassword2').val().length < pwdmin) {
    			$('#inputPassword2').css({
    				border: "1px solid red",
    				boxShadow: "0 0 2px red"
    			});
    			$('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='密码不能小于'/>" + pwdmin + "<spring:message  code='位'/></b></font>"); */
            	//twl结束
    			/* var againspwdright = document.getElementById('againspwdright');  
            	againspwdright.style.display="none"; 
                var againspwdloading = document.getElementById('againspwdloading');  
                againspwdloading.style.display="none"; 
    		    var againspwderror = document.getElementById('againspwderror');  
    		    againspwderror.style.display="block";  */
    		  //twl开始
    		    /* return false;
    		}else{
    			var inputPassword2=$('#inputPassword2').val();
    			if(!(/^(\w){6,20}$/.test(inputPassword2))){
    				$('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='密码强度最少6位,只能输入6-20个字母、数字、下划线'/></b></font>");
    		        return false; 
    		    } 
    			$('#inputPassword2').css({
    				border: "1px solid #ccc",
    				boxShadow: "none"
    			}); *///twl结束
    			/* var againspwdright = document.getElementById('againspwdright');  
            	againspwdright.style.display="none"; 
                var againspwdloading = document.getElementById('againspwdloading');  
                againspwdloading.style.display="none"; 
    		    var againspwderror = document.getElementById('againspwderror');  
    		    againspwderror.style.display="block";  */
    		
    		  //twl开始
    		  /*}
    		
    		
    		// 注册倾向
    		if($(".login_radio:checked").length < 1){
    			$('.radio-inline').css({
    				color: "red"
    			});
    			$('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='请选择注册倾向'/></b></font>");
    			return false;
    		}else{
    			$('.radio-inline').css({
    				color: "#222"
    			});
    		}
    		// 环宇爱译协议是否同意
    		if($("#inlineCheckbox:checked").length == 0){
    			$('.checkbox-inline').css({
    				color: "red"
    			});
    			$('#userMes').html("<font color='#FF8800'><b>×是否同意协议</b></font>");
    			return false;
    		}

    		$('#login_form').submit();
    	}) *///twl结束

    	
//--------------------------------赵磊结束----------------------------------------------------------------------------------------------------------------
    	$("#tel_submit").click(function(){
    		if($("#tel").val() == ""){
    			$('#tel').css({
    				border: "1px solid red",
    				boxShadow: "0 0 2px red"
    			});
    			layer.msg("<spring:message code='手机号不能为空'/>",{icon:2});
    			/* $('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='手机号不能为空'/></b></font>"); */
    			return false;
    		}else{
   			    var phone=$("#tel").val();
   			 	if(!(/^1[34578]\d{9}$/.test(phone))){ 
   			 	layer.msg("<spring:message code='手机号格式错误'/>",{icon:2});
   			    /*  $('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='手机号格式错误'/></b></font>"); */
   			        return false; 
   			    }else{
   			    	$.post("/ClientUser/onlyTel.do",{"tel":tel,"type":"client"},function(data){
      			    	 if(data ==0){
      	                    
      	                    }else {
      	                    	layer.msg("<spring:message code='很遗憾!该手机号已被注册'/>",{icon:2});
      	                    	 $("#tel_submit").prop("disabled", "true");
   	   	                    	/* $("#userMes").html("<font color='#FF8800'><b>×<spring:message  code='很遗憾!该手机号已被注册'/></b></font>"); */
   	   	              			return false; 
      	                    }
      	             },"text")
   			    } 
   			 	
     			$('#tel').css({
    				border: "1px solid #ccc",
    				boxShadow: "none"
    			}); 
    		}
    		 if($("#inputPassword1").val()==""){
    			 $('#inputPassword1').css({
     				border: "1px solid red",
     				boxShadow: "0 0 2px red"
     			});
    			 layer.msg("<spring:message code='密码不能为空'/>",{icon:2});
    			/* $('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='密码不能为空'/></b></font>"); */
    			return false;
    		 }else if($("#inputPassword1").val()!="" && $("#inputPassword1").val().length<6){
    			 $('#inputPassword1').css({
      				border: "1px solid red",
      				boxShadow: "0 0 2px red"
      			});
    			 layer.msg("<spring:message code='密码至少6位'/>",{icon:2});
     			/* $('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='密码至少6位'/></b></font>"); */
     			return false;
     			
    		 } else{
    			 $('#inputPassword1').css({
     				border: "1px solid #ccc",
     				boxShadow: "none"
     			});
    		 }
    		$('#login_form').submit();
    	})


    	$(".login_radio").change(function(){
    		if($(".login_radio:checked").length >= 1){
    			$('.checkbox_01').css({
    				color: "#222"
    			});
    			/* $('#userMes').html("<spring:message  code='快速注册请注意格式'/>"); */
    		}
    	})

    	$("#inlineCheckbox1").change(function(){
    		if($("#inlineCheckbox1:checked").length > 0){
    			$('.checkbox-inline').css({
    				color: "#222"
    			});
    			/* $('#userMes').html("<spring:message  code='快速注册请注意格式'/>"); */
    		}
    	})


    	$("#inlineCheckbox2").change(function(){
    		if($("#inlineCheckbox2:checked").length > 0){
    			$('.checkbox_02').css({
    				color: "#222"  
    			});
    			/* $('#userCue').html("<spring:message  code='快速注册请注意格式'/>"); */
    		}
    	})


    });
    

    var InterValObj; //timer变量，控制时间  
    var count = 60; //间隔函数，1秒执行  
    var curCount;//当前剩余秒数 
    function sendMessage(){
    	  var phone=$("#tel").val();
    	$.post("/ClientUser/onlyTel.do",{"tel":phone,"type":"client"},function(data){
       	 if(data ==0){
       		  /*  layer.msg('<spring:message code="恭喜您!该手机号可以注册"/>',{icon:1}); */
               /* $('#userMes').html("<font color='#00FF00'><b>√<spring:message  code='恭喜您!该手机号可以注册'/></b></font>"); */
               $('#tel').css({
   				border: "1px solid #ccc",
   				boxShadow: "none"
   			});
              var phoneright = document.getElementById('phoneright');  
      	      phoneright.style.display="block"; 
              var phoneloading = document.getElementById('phoneloading');  
              phoneloading.style.display="none"; 
   		      var phoneerror = document.getElementById('phoneerror');  
   		      phoneerror.style.display="none";  
               $("#btnSendCode").removeAttr("disabled");
               var phone=$("#tel").val();
            	 var myreg =/^1[34578]\d{9}$/; 
            	   if(phone !=""&& phone!=null ){
            		  if(myreg.test(phone)){
            		 curCount = count;  
                   //设置button效果，开始计时  
             	     $("#btnSendCode").attr("disabled", "true");//设置按钮为禁用状态  
             	     $("#btnSendCode").val("<spring:message  code='请在'/>" + curCount + "<spring:message  code='秒后重试'/>");  
             	     InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次  
             	   $.post("/sendMessage/sendMessageAction_sendPhone.do","phone="+phone,function(data){
             		   if(data!=null && data!=""){
             			  layer.msg("<spring:message code='短信验证码已发到您的手机,请查收'/>",{icon:1});
             			 /* $('#userMes').html("<font color='#00FF00'><b>√<spring:message  code='短信验证码已发到您的手机,请查收'/></b></font>"); */
             			$('#tel').css({
          				border: "1px solid #ccc",
          				boxShadow: "none"
          			});
             	      var phoneright = document.getElementById('phoneright');  
             		  phoneright.style.display="block"; 
                      var phoneloading = document.getElementById('phoneloading');  
                      phoneloading.style.display="none"; 
          		      var phoneerror = document.getElementById('phoneerror');  
          		      phoneerror.style.display="none"; 
             		   }else{
             			layer.msg("<spring:message code='短信验证码发送失败，请重新发送'/>",{icon:2});
             			/* $('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='短信验证码发送失败，请重新发送'/></b></font>");   */
             			$('#tel').css({
          				border: "1px solid red",
          				boxShadow: "0 0 2px red"
          			});
             		  var phoneright = document.getElementById('phoneright');  
          			  phoneright.style.display="none"; 
                      var phoneloading = document.getElementById('phoneloading');  
                      phoneloading.style.display="none"; 
          		      var phoneerror = document.getElementById('phoneerror');  
          		      phoneerror.style.display="block"; 
             		   }
            	     },"text");
            		}else{
            			layer.msg("<spring:message code='手机号格式错误'/>",{icon:2});
            			/* $('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='手机号格式错误'/></b></font>"); */
            			$('#tel').css({
          				border: "1px solid red",
          				boxShadow: "0 0 2px red"
          			});
            		  var phoneright = document.getElementById('phoneright');  
              	      phoneright.style.display="none"; 
                      var phoneloading = document.getElementById('phoneloading');  
                      phoneloading.style.display="none"; 
           		      var phoneerror = document.getElementById('phoneerror');  
           		      phoneerror.style.display="block";  
            		} 
            	   }else{
            		 layer.msg("<spring:message code='手机号不能为空'/>",{icon:2});
            		/*  $('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='手机号不能为空'/></b></font>"); */
            		 $('#tel').css({
          			border: "1px solid red",
          			boxShadow: "0 0 2px red"
          		});
            	   var phoneright = document.getElementById('phoneright');  
          	       phoneright.style.display="none"; 
                   var phoneloading = document.getElementById('phoneloading');  
                   phoneloading.style.display="none"; 
          	       var phoneerror = document.getElementById('phoneerror');  
          	       phoneerror.style.display="block";
            	   $("#btnSendCode").attr("disabled", "true");//设置按钮为禁用状态  
            	   }     
         }else{
        	 layer.msg("<spring:message code='该手机号已被注册！'/>",{icon:2});
        	 $("#tel_submit").prop("disabled", "true");
        	 return false;
        	 /* layer.alert("<spring:message  code='该手机号已被注册!'/>") */
         }
        },"text");
  	  		
    	$("#tel_submit").removeAttr("disabled");//启用按钮  
  	   }
  //timer处理函数  
    function SetRemainTime() {  
                if (curCount == 0) {                  
                    window.clearInterval(InterValObj);//停止计时器  
                    $("#btnSendCode").removeAttr("disabled");//启用按钮  
                    $("#btnSendCode").val("<spring:message  code='重新发送验证码'/>"); 
                    code = "";// 清除验证码。如果不清除，过时间后，输入收到的验证码依然有效 
                }  
                else {  
                    curCount--;  
                    $("#btnSendCode").val("<spring:message  code='请在'/>" + curCount + "<spring:message  code='秒后重试'/>"); 
                }  
            }
  
  
     //核实验证码  
      function checkcode(){
    	  if($("#inputPassword11").val() == ""){
  			$('#inputPassword11').css({
  				border: "1px solid red",
  				boxShadow: "0 0 2px red"
  			});
  			layer.msg("<spring:message code='验证码不能为空'/>",{icon:2});
  			/* $('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='验证码不能为空'/></b></font>"); */
  			 var coderight = document.getElementById('coderight');  
        	 coderight.style.display="none"; 
             var codeloading = document.getElementById('codeloading');  
             codeloading.style.display="none"; 
		     var codeerror = document.getElementById('codeerror');  
		     codeerror.style.display="block"; 
		     $("#tel_submit").prop("disabled", "true");
    	  }else{	
    	 var codes=$("#inputPassword11").val();
    	  $.post("/sendMessage/sendMessageAction_checkCode.do","code="+codes,function(data){
    		  if(data == 1){
    		/* $('#userMes').html("<font color='#00FF00'><b>√<spring:message  code='短信验证码正确，请进行下一步操作'/></b></font>"); */
    		$('#inputPassword11').css({
				border: "1px solid #ccc",
				boxShadow: "none"
			});
    		 var coderight = document.getElementById('coderight');  
        	 coderight.style.display="block"; 
             var codeloading = document.getElementById('codeloading');  
             codeloading.style.display="none"; 
		     var codeerror = document.getElementById('codeerror');  
		     codeerror.style.display="none"; 
    		$("#tel_submit").removeAttr("disabled");//启用按钮  
    		}else if(data == 0 ){
    			layer.msg("<spring:message code='短信验证码不正确请重新输入'/>",{icon:2});
    	   /*  $("#userMes").html("<font color='#FF8800'><b>×<spring:message  code='短信验证码不正确请重新输入'/><b/></font>"); */
	    	    $('#inputPassword11').css({
					border: "1px solid red",
					boxShadow: "0 0 2px red"
				});
	        	 var coderight = document.getElementById('coderight');  
	        	 coderight.style.display="none"; 
	             var codeloading = document.getElementById('codeloading');  
	             codeloading.style.display="none"; 
			     var codeerror = document.getElementById('codeerror');  
			     codeerror.style.display="block"; 
	        	$("#tel_submit").prop("disabled", "true");
    		}else if(data ==2 || curCount==0){
    			layer.msg("<spring:message code='验证码已失效请重新获取验证码'/>",{icon:2});
	    		/* $("#userMes").html("<font color='#FF8800'><b>×<spring:message  code='验证码已失效请重新获取验证码'/></b></font>"); */
	    		$('#inputPassword11').css({
					border: "1px solid red",
					boxShadow: "0 0 2px red"
				});
	    		 var coderight = document.getElementById('coderight');  
	        	 coderight.style.display="none"; 
	             var codeloading = document.getElementById('codeloading');  
	             codeloading.style.display="none"; 
			     var codeerror = document.getElementById('codeerror');  
			     codeerror.style.display="block"; 
	    		$("#tel_submit").prop("disabled", "true");
    		}
    	 },"json"); 
    	}
     }
     //验证手机号码重复
        function checkPhone(){
    	 var tel=$("#tel").val();
    		 var myreg =/^1[34578]\d{9}$/; 
        	 if(myreg.test($("#tel").val())){
        		 var phoneright = document.getElementById('phoneright');  
        	        phoneright.style.display="none"; 
                 var phoneloading = document.getElementById('phoneloading');  
                 phoneloading.style.display="block"; 
     		    var phoneerror = document.getElementById('phoneerror');  
     		    phoneerror.style.display="none";
             $.post("/ClientUser/onlyTel.do",{"tel":tel,"type":"client"},function(data){
            	 if(data ==0){
            		/* layer.msg('<spring:message code="恭喜您!该手机号可以注册"/>',{icon:1}); */
                   /*  $('#userMes').html("<font color='#00FF00'><b>√<spring:message  code='恭喜您!该手机号可以注册'/></b></font>"); */
                    $('#tel').css({
        				border: "1px solid #ccc",
        				boxShadow: "none"
        			});
                    var phoneright = document.getElementById('phoneright');  
           	        phoneright.style.display="block"; 
                    var phoneloading = document.getElementById('phoneloading');  
                    phoneloading.style.display="none"; 
        		    var phoneerror = document.getElementById('phoneerror');  
        		    phoneerror.style.display="none";  
                    }else {
                    layer.msg("<spring:message code='很遗憾!该手机号已被注册'/>",{icon:2});	
                    /* $("#userMes").html("<font color='#FF8800'><b>×<spring:message  code='很遗憾!该手机号已被注册'/></b></font>"); */
                     $("#tel_submit").prop("disabled", "true");
                    
                    $('#tel').css({
        				border: "1px solid red",
        				boxShadow: "0 0 2px red"
        			});
                    var phoneright = document.getElementById('phoneright');  
           	        phoneright.style.display="none"; 
                    var phoneloading = document.getElementById('phoneloading');  
                    phoneloading.style.display="none"; 
        		    var phoneerror = document.getElementById('phoneerror');  
        		    phoneerror.style.display="block";  
        		    return false;
                    }
             },"text"); 
        	}else if(!myreg.test($("#tel").val())){
        		layer.msg("<spring:message code='手机号格式错误'/>",{icon:2});	
        		/* $('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='手机号格式错误'/></b></font>"); */
        		$('#tel').css({
    				border: "1px solid red",
    				boxShadow: "0 0 2px red"
    			});
        		var phoneright = document.getElementById('phoneright');  
       	        phoneright.style.display="none"; 
                var phoneloading = document.getElementById('phoneloading');  
                phoneloading.style.display="none"; 
    		    var phoneerror = document.getElementById('phoneerror');  
    		    phoneerror.style.display="block";  
        		return false;
        	}
        	 $("#tel_submit").removeAttr("disabled");//启用按钮  
     }     
    /*  function checkEmail(){
    	 var email=$("#email").val();
		    if(!(/^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(email))){ 

		     $('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='邮箱格式错误'/></b></font>");
		     $('#email').css({
 				border: "1px solid red",
 				boxShadow: "0 0 2px red"
 			});
		     return false;
		    }else {
    	 $.post("/ClientUser/clientUserAction_checkEmail.do","email="+email,function(data){
    		 if(data ==0){
                 $('#userMes').html("<font color='#00FF00'><b>√<spring:message  code='恭喜您!该邮箱可以使用'/></b></font>");
                 $('#email').css({
         			border: "1px solid #ccc",
         			boxShadow: "none"
         		   });
                 $("#tel_submit").removeAttr("disabled");
                 }else{

                 $("#userMes").html("<font color='#FF8800'><b>×<spring:message  code='很遗憾!该邮箱已被注册'/></b></font>");
                 $('#email').css({
     				border: "1px solid red",
     				boxShadow: "0 0 2px red"
     			});
                 $("#tel_submit").prop("disabled", "true");
                 return false;
                 }
    	 },"json");
	   }
     } */
     
     function checkEmail(){
    	 var email=$("#email").val();
    	 $("#emailright").css("display","none");
         $("#emailloading").css("display","block");
         $("#emailerror").css("display","none");
		    if(!(/^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(email))){ 

		     $('#userMes').html("<font color='#FF8800'><b>×</b></font>");
		     layer.msg("<spring:message  code='邮箱格式错误'/>",{icon:2});
		     $("#emailright").css("display","none");
             $("#emailloading").css("display","none");
             $("#emailerror").css("display","block");
		     $('#email').css({
 				border: "1px solid red",
 				boxShadow: "0 0 2px red"
 			});
		     $("#mail_submit").prop("disabled", "true");
		     return false;
		 }else {
    	 $.post("/ClientUser/onlyEmail.do",{"email":email,"type":"client"},function(data){
    		 if(data ==0){
                 layer.msg("<spring:message  code='恭喜您!该邮箱可以使用'/>",{icon:1});
                 $("#emailright").css("display","block");
                 $("#emailloading").css("display","none");
                 $("#emailerror").css("display","none");
                 $('#email').css({
         			border: "1px solid #ccc",
         			boxShadow: "none"
         		   });
                 $("#mail_submit").removeAttr("disabled");
                 }else{

                 layer.msg("<spring:message  code='很遗憾!该邮箱已被注册'/>",{icon:5});
                 $("#emailright").css("display","none");
                 $("#emailloading").css("display","none");
                 $("#emailerror").css("display","block");
                 $('#email').css({
     				border: "1px solid red",
     				boxShadow: "0 0 2px red"
     			});
                 $("#mail_submit").prop("disabled", "true");
                 return false;
                 }
    	 },"json");
	   }
     }
     
     function checkPasswords(){
    	 if($("#inputPassword1").val()==""){
    		 $('#inputPassword1').css({
  				border: "1px solid red",
  				boxShadow: "0 0 2px red"
  			});
    		
    		layer.msg("<spring:message code='密码不能为空'/>",{icon:2});	
 			/* $('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='密码不能为空'/></b></font>"); */
 			var oldpwdsright = document.getElementById('oldpwdsright');  
 			oldpwdsright.style.display="none"; 
            var oldpwdsloading = document.getElementById('oldpwdsloading');  
            oldpwdsloading.style.display="none"; 
 		    var oldpwdserror = document.getElementById('oldpwdserror');  
 		    oldpwdserror.style.display="block"; 
    	 }else if($("#inputPassword1").val().length < 6){
    		 $('#inputPassword1').css({
   				border: "1px solid red",
   				boxShadow: "0 0 2px red"
   			});
    		 layer.msg("<spring:message code='密码不能少于6位'/>",{icon:2});	
    		 /* $('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='密码不能少于6位'/></b></font>"); */
    		 var oldpwdsright = document.getElementById('oldpwdsright');  
  			oldpwdsright.style.display="none"; 
             var oldpwdsloading = document.getElementById('oldpwdsloading');  
             oldpwdsloading.style.display="none"; 
  		    var oldpwdserror = document.getElementById('oldpwdserror');  
  		    oldpwdserror.style.display="block"; 
    	 }else{
    		/*  $('#userMes').html("<font color='#FFF'><spring:message  code='快速注册请注意格式'/></font>"); */
    		 $('#inputPassword1').css({
  				border: "1px solid #ccc",
  				boxShadow: "none"
  			});
    		var oldpwdsright = document.getElementById('oldpwdsright');  
  			oldpwdsright.style.display="block"; 
            var oldpwdsloading = document.getElementById('oldpwdsloading');  
            oldpwdsloading.style.display="none"; 
  		    var oldpwdserror = document.getElementById('oldpwdserror');  
  		    oldpwdserror.style.display="none"; 
    	 }
     }
     
     function checkPasswords2(){
    	 if($("#inputPassword2").val()==""){
    		 $('#inputPassword2').css({
  				border: "1px solid red",
  				boxShadow: "0 0 2px red"
  			});
    		
    		layer.msg("<spring:message code='密码不能为空'/>",{icon:2});	
 			/* $('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='密码不能为空'/></b></font>"); */
 			var oldpwdsright = document.getElementById('oldpwdsright2');  
 			oldpwdsright.style.display="none"; 
            var oldpwdsloading = document.getElementById('oldpwdsloading2');  
            oldpwdsloading.style.display="none"; 
 		    var oldpwdserror = document.getElementById('oldpwdserror2');  
 		    oldpwdserror.style.display="block"; 
    	 }else if($("#inputPassword2").val().length < 6){
    		 $('#inputPassword2').css({
   				border: "1px solid red",
   				boxShadow: "0 0 2px red"
   			});
    		 layer.msg("<spring:message code='密码不能少于6位'/>",{icon:2});	
    		 /* $('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='密码不能少于6位'/></b></font>"); */
    		 var oldpwdsright = document.getElementById('oldpwdsright2');  
  			oldpwdsright.style.display="none"; 
             var oldpwdsloading = document.getElementById('oldpwdsloading2');  
             oldpwdsloading.style.display="none"; 
  		    var oldpwdserror = document.getElementById('oldpwdserror2');  
  		    oldpwdserror.style.display="block"; 
    	 }else{
    		/*  $('#userMes').html("<font color='#FFF'><spring:message  code='快速注册请注意格式'/></font>"); */
    		 $('#inputPassword2').css({
  				border: "1px solid #ccc",
  				boxShadow: "none"
  			});
    		var oldpwdsright = document.getElementById('oldpwdsright2');  
  			oldpwdsright.style.display="block"; 
            var oldpwdsloading = document.getElementById('oldpwdsloading2');  
            oldpwdsloading.style.display="none"; 
  		    var oldpwdserror = document.getElementById('oldpwdserror2');  
  		    oldpwdserror.style.display="none"; 
    	 }
     }
     
   //twl开始    
/*      function checkPwds(){
    	 if($("#passwd").val()==""||$("#passwd").val()==null ){
    		 $('#userCue').html("<font color='#FF8800'><b>×<spring:message  code='密码不能为空'/></b></font>");
		     $('#passwd').css({
 				border: "1px solid red",
 				boxShadow: "0 0 2px red"
 			});
		     var oldpwdright = document.getElementById('oldpwdright');  
        	 oldpwdright.style.display="none"; 
             var oldpwdloading = document.getElementById('oldpwdloading');  
             oldpwdloading.style.display="none"; 
		     var oldpwderror = document.getElementById('oldpwderror');  
		     oldpwderror.style.display="block"; 
		     return false;
    	 }else if($("#passwd").val().length < 6){
    		 $('#userCue').html("<font color='#FF8800'><b>×<spring:message  code='密码不能少于6位'/></b></font>");
    		 $('#passwd').css({
  				border: "1px solid red",
  				boxShadow: "0 0 2px red"
  			});
 		     var oldpwdright = document.getElementById('oldpwdright');  
         	 oldpwdright.style.display="none"; 
              var oldpwdloading = document.getElementById('oldpwdloading');  
              oldpwdloading.style.display="none"; 
 		     var oldpwderror = document.getElementById('oldpwderror');  
 		     oldpwderror.style.display="block"; 
    	 }else{
    		 $('#userCue').html("<font color='#FFF'><spring:message  code='快速注册请注意格式'/></font>");
    		 $('#passwd').css({
   				border: "1px solid #ccc",
   				boxShadow: "none"
   			}); 
    		 var oldpwdright = document.getElementById('oldpwdright');  
        	 oldpwdright.style.display="block"; 
             var oldpwdloading = document.getElementById('oldpwdloading');  
             oldpwdloading.style.display="none"; 
		     var oldpwderror = document.getElementById('oldpwderror');  
		     oldpwderror.style.display="none"; 
    	 }
    	 
    	 
     } *///twl结束
   //twl开始
    /*  //邮箱注册--邮箱验证
      function checkEmails(){
    	 var email1=$("#email1").val();
		    if(!(/^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(email1))){ 
		     $('#userCue').html("<font color='#FF8800'><b>×<spring:message  code='邮箱格式错误'/></b></font>");
		     $('#email1').css({
 				border: "1px solid red",
 				boxShadow: "0 0 2px red"
 			});
		     var emailright = document.getElementById('emailright');  
		     emailright.style.display="none"; 
             var emailloading = document.getElementById('emailloading');  
             emailloading.style.display="none"; 
		     var emailerror = document.getElementById('emailerror');  
		     emailerror.style.display="block"; 
		     return false;
		    }else {
		     var emailright = document.getElementById('emailright');  
        	 emailright.style.display="none"; 
             var emailloading = document.getElementById('emailloading');  
             emailloading.style.display="block"; 
             var emailerror = document.getElementById('emailerror');  
             emailerror.style.display="none"; 	
		    	
    	 $.post("/ClientUser/clientUserAction_checkEmail.do","email="+email1,function(data){
    		 if(data ==0){
                 $('#userCue').html("<font color='#00FF00'><b>√<spring:message  code='恭喜您!该邮箱可以使用'/></b></font>");
                 $("#use_submit").removeAttr("disabled");
                 $('#email1').css({
         			border: "1px solid #ccc",
         			boxShadow: "none"
         		   });
                 var emailright = document.getElementById('emailright');  
    		     emailright.style.display="block"; 
                 var emailloading = document.getElementById('emailloading');  
                 emailloading.style.display="none"; 
    		     var emailerror = document.getElementById('emailerror');  
    		     emailerror.style.display="none";
                 }else {
                 var emailright = document.getElementById('emailright');  
        		 emailright.style.display="none"; 
                 var emailloading = document.getElementById('emailloading');  
                 emailloading.style.display="block"; 
        		 var emailerror = document.getElementById('emailerror');  
        		 emailerror.style.display="none"; 
                	 
                 $("#userCue").html("<font color='#FF8800'><b>×<spring:message  code='很遗憾!该邮箱已被注册'/></b></font>");
                 $('#email1').css({
     				border: "1px solid red",
     				boxShadow: "0 0 2px red"
     			});
                 var emailright = document.getElementById('emailright');  
    		     emailright.style.display="none"; 
                 var emailloading = document.getElementById('emailloading');  
                 emailloading.style.display="none"; 
    		     var emailerror = document.getElementById('emailerror');  
    		     emailerror.style.display="block";
                 $("#use_submit").prop("disabled", "true");
                 return false;
                 }
    	 },"text");
	   }
     }  *///twl结束
     //手机号注册--验证用户名
     //twl开始
     /*  function checkAccountName(){
    	  $("#tel_submit").prop("disabled", "true");
    	  var user=$("#user").val();
		    if(!(/^(([a-z]+[0-9]+)|([0-9]+[a-z]+))[a-z0-9]*$/i.test(user))){ 
		     $('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='用户名应为英文字母和数字的混合'/></b></font>");
		     $('#user').css({
  				border: "1px solid red",
  				boxShadow: "0 0 2px red"
  			});
		     $("#tel_submit").prop("disabled", "true");
		     var userNameright = document.getElementById('userNameright');  
             userNameright.style.display="none"; 
             var userNameerror = document.getElementById('userNameerror');  
		     userNameerror.style.display="block"; 
		     var userNameloading = document.getElementById('userNameloading');  
		     userNameloading.style.display="none"; 
		        return false; 
		    } else if(user.length < 6){
		    	$('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='用户名不得少于6位'/></b></font>");
			     $('#user').css({
	  				border: "1px solid red",
	  				boxShadow: "0 0 2px red"
	  			});
			     $("#tel_submit").prop("disabled", "true");
			     var userNameright = document.getElementById('userNameright');  
	             userNameright.style.display="none"; 
	             var userNameerror = document.getElementById('userNameerror');  
			     userNameerror.style.display="block"; 
			     var userNameloading = document.getElementById('userNameloading');  
			     userNameloading.style.display="none"; 
		    }else{
		    	var userNameright = document.getElementById('userNameright');  
	             userNameright.style.display="none"; 
	             var userNameerror = document.getElementById('userNameerror');  
			     userNameerror.style.display="none"; 
			     var userNameloading = document.getElementById('userNameloading');  
			     userNameloading.style.display="block"; 
    	 var username=$("#user").val();
    	 $.post("/ClientUser/clientUserAction_checkAccountname.do","accountName="+username,function(data){
    		 if(data ==0){
    			 $("#phoneLoading").css("display","none");
                 $('#userMes').html("<font color='#00FF00'><b>√<spring:message  code='恭喜您!该用户名可以注册'/></b></font>");
                 $('#user').css({
     				border: "1px solid #ccc",
     				boxShadow: "none"
     			}); 
                 var userNameright = document.getElementById('userNameright');  
                 userNameright.style.display="block"; 
                 var userNameerror = document.getElementById('userNameerror');  
    		     userNameerror.style.display="none"; 
    		     var userNameloading = document.getElementById('userNameloading');  
    		     userNameloading.style.display="none"; 
                 $("#tel_submit").removeAttr("disabled");
                 }else {
                	 var userNameright = document.getElementById('userNameright');  
                     userNameright.style.display="none"; 
                     var userNameerror = document.getElementById('userNameerror');  
        		     userNameerror.style.display="none"; 
        		     var userNameloading = document.getElementById('userNameloading');  
        		     userNameloading.style.display="block"; 	 
                 $("#userMes").html("<font color='#FF8800'><b>×<spring:message  code='很遗憾!该用户名已被注册'/></b></font>");
                 $('#user').css({
     				border: "1px solid red",
     				boxShadow: "0 0 2px red"
     			});
                 $("#tel_submit").prop("disabled", "true");
                 return false;
                 }
    		 
    	 },"text");
		}
     }  *///twl结束
     //邮箱注册--验证用户名
     //twl开始
     /*  function checkAccountNames(){
    	  var userr=$("#userr").val();
		    if(!(/^(([a-z]+[0-9]+)|([0-9]+[a-z]+))[a-z0-9]*$/i.test(userr))){ 
		     $('#userCue').html("<font color='#FF8800'><b>×<spring:message  code='用户名应为英文字母和数字的混合'/></b></font>");
		     $('#userr').css({
   				border: "1px solid red",
   				boxShadow: "0 0 2px red"
   			});
		     var userNamesright = document.getElementById('userNamesright');  
		     userNamesright.style.display="none"; 
             var userNameserror = document.getElementById('userNameserror');  
             userNameserror.style.display="block"; 
		     var userNamesloading = document.getElementById('userNamesloading');  
		     userNamesloading.style.display="none"; 
		     $("#use_submit").prop("disabled", "true");
		        return false; 
		    }else if(userr.length < 6){
		    	$('#userCue').html("<font color='#FF8800'><b>×<spring:message  code='用户名不得少于6位'/></b></font>");
			     $('#userr').css({
	   				border: "1px solid red",
	   				boxShadow: "0 0 2px red"
	   			});
			     var userNamesright = document.getElementById('userNamesright');  
			     userNamesright.style.display="none"; 
	             var userNameserror = document.getElementById('userNameserror');  
	             userNameserror.style.display="block"; 
			     var userNamesloading = document.getElementById('userNamesloading');  
			     userNamesloading.style.display="none"; 
			     $("#use_submit").prop("disabled", "true");
		    }else{
		     var userNamesright = document.getElementById('userNamesright');  
		     userNamesright.style.display="none"; 
		     var userNameserror = document.getElementById('userNameserror');  
		     userNameserror.style.display="none"; 
		     var userNamesloading = document.getElementById('userNamesloading');  
			 userNamesloading.style.display="block"; 	
     	 var username=$("#userr").val();
     	 $.post("/ClientUser/clientUserAction_checkAccountname.do","accountName="+username,function(data){
     		 if(data ==0){
     			$("#mailLoading").css("display","none");
                  $('#userCue').html("<font color='#00FF00'><b>√<spring:message  code='恭喜您!该用户名可以注册'/></b></font>");
                   $('#userr').css({
      				border: "1px solid #ccc",
      				boxShadow: "none"
      			  });
                   var userNamesright = document.getElementById('userNamesright');  
      		       userNamesright.style.display="block"; 
                   var userNameserror = document.getElementById('userNameserror');  
                   userNameserror.style.display="none"; 
      		       var userNamesloading = document.getElementById('userNamesloading');  
      		       userNamesloading.style.display="none";  
                  $("#use_submit").removeAttr("disabled");
                  }else {
                   var userNamesright = document.getElementById('userNamesright');  
           		   userNamesright.style.display="none"; 
                   var userNameserror = document.getElementById('userNameserror');  
                   userNameserror.style.display="none"; 
           		   var userNamesloading = document.getElementById('userNamesloading');  
           		   userNamesloading.style.display="block"; 
                  $("#userCue").html("<font color='#FF8800'><b>×<spring:message  code='很遗憾!该用户名已被注册'/></b></font>");
                  $('#userr').css({
      				border: "1px solid red",
      				boxShadow: "0 0 2px red"
      			});
                 var userNamesright = document.getElementById('userNamesright');  
       		     userNamesright.style.display="none"; 
                 var userNameserror = document.getElementById('userNameserror');  
                 userNameserror.style.display="block"; 
       		     var userNamesloading = document.getElementById('userNamesloading');  
       		     userNamesloading.style.display="none";
                  $("#use_submit").prop("disabled", "true");
                  return false;
                  }
     	 },"text");
	    }
      } 
      function checkpwd(){
     	 if ($('#passwd2').val() != $('#passwd').val()) {
  			$('#userCue').html("<font color='#FF8800'><b>×<spring:message  code='两次密码不一致！'/></b></font>");
  			 $('#passwd2').css({
   				border: "1px solid red",
   				boxShadow: "0 0 2px red"
   			});
        	 var againspwdright = document.getElementById('oldpwdright1');  
        	 againspwdright.style.display="none"; 
             var againspwdloading = document.getElementById('oldpwdloading1');  
             againspwdloading.style.display="none"; 
   		     var againspwderror = document.getElementById('oldpwderror1');  
   		     againspwderror.style.display="block";
        	return false;
  			$("#use_submit").prop("disabled", "true");
  		}else{
  			$('#userCue').html("<font color='#00FF00'><b>√<spring:message  code='恭喜您！密码输入正确！'/></b></font>");
  			$('#passwd2').css({
  				border: "1px solid #ccc",
  				boxShadow: "none"
  			});
  			var againspwdright = document.getElementById('oldpwdright1');  
       	    againspwdright.style.display="block"; 
            var againspwdloading = document.getElementById('oldpwdloading1');  
            againspwdloading.style.display="none"; 
  		    var againspwderror = document.getElementById('oldpwderror1');  
  		    againspwderror.style.display="none";
  			$("#tel_submit").removeAttr("disabled");
  		}
      }
      
      function checkpwd1(){
    	  if ($('#inputPassword1').val() != $('#inputPassword2').val()) {
    			$('#userMes').html("<font color='#FF8800'><b>×<spring:message  code='两次密码不一致！'/></b></font>");
    			 $('#inputPassword2').css({
     				border: "1px solid red",
     				boxShadow: "0 0 2px red"
     			});
    			 var oldpwdright = document.getElementById('againspwdright');  
            	 oldpwdright.style.display="none"; 
                 var oldpwdloading = document.getElementById('againspwdloading');  
                 oldpwdloading.style.display="none"; 
    		     var oldpwderror = document.getElementById('againspwderror');  
    		     oldpwderror.style.display="block"; 
    			return false;
    			$("#use_submit").prop("disabled", "true");
    		}else{
    			$('#userMes').html("<font color='#00FF00'><b>√<spring:message  code='恭喜您！密码输入正确！'/></b></font>");
    			$('#inputPassword2').css({
    				border: "1px solid #ccc",
    				boxShadow: "none"
    			});
    			var oldpwdright = document.getElementById('againspwdright');  
           	    oldpwdright.style.display="block"; 
                var oldpwdloading = document.getElementById('againspwdloading');  
                oldpwdloading.style.display="none"; 
   		        var oldpwderror = document.getElementById('againspwderror');  
   		        oldpwderror.style.display="none"; 
    			$("#tel_submit").removeAttr("disabled");
    		} 
      } *///twl结束
      
      
      var fail="${fail}";
      if(fail.trim().length != 0 ){
  		layer.msg("<spring:message  code='注册失败，请重试！'/>", {icon: 2});
  	}
    //头标签效果显示  开始
      $(document).ready(function(){
          $(".navbg").capacityFixed();
          $("#navul > li").not(".navhome").hover(function(){
            $(this).addClass("navmoon");
          },function(){
            $(this).removeClass("navmoon");
          });
          
          
          $("#switch_qlogin").click(function(){
        	  $("#radioValue").val("我是客户");
        	  $('#switch_qlogin').addClass('switch_qlogin');
      		  $('#switch_login').removeClass("switch_qlogin");
        	  
          })
          
          $("#switch_login").click(function(){
        	  $("#radioValue").val("我是客户");
        	  $('#switch_login').addClass('switch_qlogin');
      		  $('#switch_qlogin').removeClass("switch_qlogin");
          })
          
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
      <!--------  login top  -------->
      <div class="register_top container">
        <div class="row">
          <a href="index.jsp" class="register_top_logo col-sm-3"></a>
          <h1 class="login_register col-sm-8"><spring:message  code='客户注册'/></h1>
        </div>
      </div>
      <!--------  login body  -------->
      <div class="" style="background:#8db5e3;background: url('${pageContext.request.contextPath}/img/login273.jpg') center no-repeat;background-size: 100% 100%"> 
        <div class="register_body regContainer">
          <div class="row">
            <div class="register_body_left col-md-7 col-sm-6 col-xs-12">
              <%-- <img class="img-responsive" style="width:680px;height:400px;" src="${pageContext.request.contextPath}/img/1.jpg" alt=""> --%>
            </div>
            <div class="register_body_right col-md-5 col-sm-6 col-xs-12 pull-right" style="margin-top:70px;border-radius:10px;">
              <div class="header" style="border-bottom: none;">
              	<div class="col-xs-6" style="padding:0;">
              		<label id="switch_qlogin" class="switch_btn_focus switch_qlogin"  style="border-top-left-radius:10px;width:100%;height:43px;line-height: 43px;text-align: center;"><a style="display:block;" href="javascript:;"><strong style="font-size: 18px;color:#fff;"><spring:message  code='手机'/></strong></a></label>
              	</div>
              	<div class="col-xs-6" style="padding:0;">
              		<label class="switch_btn" style="border-top-right-radius:10px;width:100%;color:black;height: 100%;line-height: 43px;text-align: center;" id="switch_login"><a style="display:block;" href="javascript:;"><strong style="font-size: 18px;color:#fff;"><spring:message  code='邮箱'/></strong></a></label>
              	</div>
                <%-- <div class="switch" id="switch" style="top: -4px;text-align:center">

                  <a class="switch_btn_focus" style="width:200px;text-align:center;color:white;" id="switch_qlogin" href="javascript:;"><spring:message  code='手机号注册'/></a>
                  <a class="switch_btn"  style="width:200px;text-align:center;color:white;" id="switch_login"  href="javascript:;"><spring:message  code='邮箱注册'/></a>
					<div class="switch_btn_focus" style="width:120px;margin-top: 0px;height:40px;margin-left: auto;margin-right: auto">
						<a class="switch_btn_focus switch_qlogin" style="width:180px;color:#000000;height:43px;line-height: 43px;margin-top:-4px;" id="switch_qlogin" href="javascript:;"><strong><spring:message  code='手机'/></strong></a>
					</div>
				  	<div class="switch_btn" style="margin-left:55px">
				  		<a class="switch_btn" style="width:180px;text-align:center;color:black;height: 43px" id="switch_login"  href="javascript:;"><strong><spring:message  code='邮箱'/></strong></a>
				  	</div>
                  <!-- <div class="switch_bottom" id="switch_bottom"></div> -->
                </div> --%>
              </div>
              <!-------- 手机/邮箱注册面板 -------->
              <div class="web_qr_login" id="web_qr_login">
                <!--登录-->
                <div class="web_login" id="web_login" >
                  <div class="login_form">
                    <%-- <div id="userMes" style="color:white;" class="cue"><spring:message  code='快速注册请注意格式'/></div> --%>
                      <!-- 客户注册表单开始 -->
                      <form name="loginform" id="login_form" class="loginForm form-horizontal" action="${pageContext.request.contextPath}/ClientUser/clientUserAction_saveUser.do"  method="post"><input type="hidden" name="did" value="0"/>
                       <input type="hidden" name='radioValue' id="radioValue" value="我是客户">
                       <div class="form-group row">
                       <%--  <label for="tel" style="color:white;" class="col-xs-2 control-label"><spring:message  code='手机号'/></label> --%>
                        <div class="col-xs-11">
                          <input type="text" class="form-control" id="tel" onblur="checkPhone()" placeholder="<spring:message  code='请输入手机号'/>" name="cellphone"><!-- onblur="checkPhone()" -->
                        </div>
                         <div  class="col-xs-1" style="display: block;padding-left: 0px">
                        	<img class="control-label" id="phoneright" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png" >
                        	<img class="control-label" id="phoneloading" style="height:30px;display: none" src="${pageContext.request.contextPath}/img/loading4.gif"> 
                        	<img class="control-label" id="phoneerror" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/can‘t2.png">
                        </div>
                       </div>
                       <div class="form-group">
                       <%--  <label for="inputPassword1" style="color:white;" class="col-xs-2 control-label"><spring:message  code='验证码'/></label> --%>
                        <div class="col-xs-7 pull-left ">
                          <input type="text" class="form-control" id="inputPassword11" value="" placeholder="<spring:message  code='请输入验证码'/>" onblur="checkcode()">
                        </div>
                        <div class="col-xs-4 pull-left">
                        	<input type="button" onclick="sendMessage()"  id="btnSendCode" value="<spring:message  code='发送验证码'/>" class="btn btn-primary btn-sm"  >
                        </div>
                        <div  class="col-xs-1" style="display: block;padding-left: 0px">
                        	<img class="control-label" id="coderight" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png" >
                        	<img class="control-label" id="codeloading" style="height:30px;display: none" src="${pageContext.request.contextPath}/img/loading4.gif"> 
                        	<img class="control-label" id="codeerror" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/can‘t2.png">
                        </div>
                       </div>
                       <div class="form-group">
                        <%-- <label for="email" style="color:white;" class="col-xs-2 control-label"><spring:message  code='密码'/></label> --%>
                        <div class="col-xs-11">
                          <img id="demo_imgTel" class="demo_img" onclick="hideShowPswTel()" src="/img/eyeNo.png">  
                          <input type="password" class="form-control" id="inputPassword1" value="" placeholder="<spring:message  code='请输入密码'/>" name="oldpassword" onblur="checkPasswords()">
                        </div>
                        <div  class="col-xs-1" style="display: block;padding-left: 0px">
                          <img class="control-label" id="oldpwdsright" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png" >
                          <img class="control-label" id="oldpwdsloading" style="height:30px;display: none" src="${pageContext.request.contextPath}/img/loading4.gif"> 
                          <img class="control-label" id="oldpwdserror" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/can‘t2.png">
                        </div>
                       </div>
                       <%-- <span id="jbPhoneTip"></span><!-- 根据后台返回data值显示不同信息 -->
                       <div class="login_radio" id="serviceRadio">
                        <span class="message" id="" style="color:white;"><spring:message  code='服务语言'/></span>
                        <label class="radio-inline02">
                          <input type="radio" name="serviceLanguage" class="login_radio06" id="inlineRadio4" value="ZH"  checked="checked"><font style="color:white;"><spring:message  code='汉语'/></font>
                        </label>
                        <label class="radio-inline02" style="padding-left:20px;">
                          <input type="radio" name="serviceLanguage" class="login_radio05" id="inlineRadio3" value="EN"><font style="color:white;"><spring:message  code='英文'/></font>
                        </label>
                       </div> --%>
                       <div class="login_submit">
                       <input type="hidden" name="radioValues" value="我是客户"/>
                       	<input type="hidden" name="type" value="phone"/>
                        <input type="submit" value="<spring:message  code='注册并登陆'/>" id="tel_submit" class="btn btn-info btn-block"/>
                       </div>
                       <div class="login_ckeckbox">
                        <label class="checkbox-inline checkbox_01">
                         <input type="checkbox" id="inlineCheckbox" value="option5" checked="checked"><a style="color:white;" href="/forwardAction/forward_toPublicAgreement.do" target="_blank"><spring:message  code='我已阅读并同意环宇爱译协议'/></a>
                        </label>                                   
                       </div>
                     </form>
                    <!-- 客户注册表单结束 -->
                    <%-- <form name="loginform" id="login_form" class="loginForm form-horizontal" action="${pageContext.request.contextPath}/ClientUser/clientUserAction_saveUser.do"  method="post"><input type="hidden" name="did" value="0"/>
                       <div class="form-group">
                        <label for="inputPassword2" style="color:white;" class="col-xs-2 control-label"><spring:message  code='用户名'/></label>
                        <div class="col-xs-8">
                          <input type="text" class="form-control" id="user" placeholder="<spring:message  code='请输入用户名'/>" name="user" onblur="checkAccountName()">
                        </div>
                        <div id="userNameLoading" class="col-xs-1" style="display: block;">
                        	<img class="control-label" id="userNameright" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png" >
                        	<img class="control-label" id="userNameloading" style="height:30px;display: none" src="${pageContext.request.contextPath}/img/loading4.gif"> 
                        	<img class="control-label" id="userNameerror" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/can‘t2.png">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="tel" style="color:white;" class="col-xs-2 control-label"><spring:message  code='手机号'/></label>
                        <div class="col-xs-5 pull-left">
                          <input type="text" class="form-control" id="tel" onblur="checkPhone()" placeholder="<spring:message  code='请输入手机号'/>" name="cellphone"><!-- onblur="checkPhone()" -->
                        </div>
                        <div class="col-xs-3 pull-left">
                        	<input type="button" onclick="sendMessage()"  id="btnSendCode" value="<spring:message  code='发送验证码'/>" class="btn btn-primary btn-sm"  >
                        </div>
                         <div  class="col-xs-1" style="display: block;">
                        	<img class="control-label" id="phoneright" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png" >
                        	<img class="control-label" id="phoneloading" style="height:30px;display: none" src="${pageContext.request.contextPath}/img/loading4.gif"> 
                        	<img class="control-label" id="phoneerror" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/can‘t2.png">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="inputPassword1" style="color:white;" class="col-xs-2 control-label"><spring:message  code='验证码'/></label>
                        <div class="col-xs-8">
                          <input type="text" class="form-control" id="inputPassword11" placeholder="<spring:message  code='请输入验证码'/>" onblur="checkcode()">
                        </div>
                        <div  class="col-xs-1" style="display: block;">
                        	<img class="control-label" id="coderight" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png" >
                        	<img class="control-label" id="codeloading" style="height:30px;display: none" src="${pageContext.request.contextPath}/img/loading4.gif"> 
                        	<img class="control-label" id="codeerror" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/can‘t2.png">
                        </div>
                        
                      </div>
                      <div class="form-group">
                        <label for="email" style="color:white;" class="col-xs-2 control-label"><spring:message  code='邮箱'/></label>
                        <div class="col-xs-8">
                          <input type="email" class="form-control" id="email" placeholder="<spring:message  code='请输入邮箱'/>" name="email"  onblur="checkEmail()">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="email" style="color:white;" class="col-xs-2 control-label"><spring:message  code='密码'/></label>
                        <div class="col-xs-8">
                          <input type="password" class="form-control" id="inputPassword1" placeholder="<spring:message  code='请输入密码'/>" name="oldpassword" onblur="checkPasswords()">
                        </div>
                         <div  class="col-xs-1" style="display: block;">
                        	<img class="control-label" id="oldpwdsright" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png" >
                        	<img class="control-label" id="oldpwdsloading" style="height:30px;display: none" src="${pageContext.request.contextPath}/img/loading4.gif"> 
                        	<img class="control-label" id="oldpwdserror" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/can‘t2.png">
                        </div>
                      </div>
                      <span id="jbPhoneTip"></span><!-- 根据后台返回data值显示不同信息 -->
                      <div class="form-group">
                        <label for="inputPassword2" style="color:white;" class="col-xs-2 control-label"><spring:message  code='确认密码'/></label>
                        <div class="col-xs-8">
                          <input type="password" class="form-control" id="inputPassword2" placeholder="<spring:message  code='请再次输入密码'/>" name="password" onkeyup="checkpwd1()">
                        </div>
                         <div  class="col-xs-1" style="display: block;">
                        	<img class="control-label" id="againspwdright" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png" >
                        	<img class="control-label" id="againspwdloading" style="height:30px;display: none" src="${pageContext.request.contextPath}/img/loading4.gif"> 
                        	<img class="control-label" id="againspwderror" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/can‘t2.png">
                        </div>
                      </div>
                      <div class="login_radio"  id="inlineRadio">
                        <span class="message" style="color:white;"><spring:message  code='注册倾向'/></span>
                        <label class="radio-inline">

                          <input type="radio" class="login_radio" name="radioValue" id="inlineRadio1" onclick="radioss(this)" value="我是客户" ><font style="color:white;"><spring:message  code='我是客户'/></font>

                        </label>
                        <label class="radio-inline">

                          <input type="radio" class="login_radio" name="radioValue" id="inlineRadio2" onclick="radioss(this)" value="我是客户" checked="checked"><font style="color:white;"><spring:message  code='我是客户'/></font>

                        </label>
                      </div>
                      
                      
                       <div class="login_radio" id="serviceRadio">
                        <span class="message" id="" style="color:white;"><spring:message  code='服务语言'/></span>
                        <label class="radio-inline02" style="padding-left:20px;">

                          <input type="radio" name="serviceLanguage" class="login_radio05" id="inlineRadio3" value="EN"  ><font style="color:white;"><spring:message  code='英文'/></font>

                        </label>
                        <label class="radio-inline02">

                          <input type="radio" name="serviceLanguage" class="login_radio06" id="inlineRadio4" value="ZH"  checked="checked"><font style="color:white;"><spring:message  code='汉语'/></font>

                        </label>
                      </div>
                      
                      
                      <div class="login_ckeckbox">
                        <label class="checkbox-inline checkbox_01">

                         <input type="checkbox" id="inlineCheckbox" value="option5"><a style="color:white;" href="/forwardAction/forward_toPublicAgreement.do" target="_blank"><spring:message  code='我已阅读并同意环宇爱译协议'/></a>

                        </label>                                   
                      </div>
                      <div class="login_submit">
                        <input type="submit" value="<spring:message  code='立即注册'/>" id="tel_submit" class="btn btn-info btn-block"/>
                      </div>
                    </form> --%>
                 </div>
               </div>
                <!--登录end-->
              </div>
              <div class="web_qr_login" id="qlogin" style="display: none;">
              		<div class="login_form">
                    <%-- <div id="userMes" style="color:white;" class="cue"><spring:message  code='快速注册请注意格式'/></div> --%>
                      <!-- 客户注册表单开始 -->
                      <form name="loginform" id="login_form" class="loginForm form-horizontal" action="${pageContext.request.contextPath}/ClientUser/clientUserAction_saveUser.do"  method="post"><input type="hidden" name="did" value="0"/>
                       <input type="hidden" name='radioValue' id="radioValue" value="我是客户">
                       <div class="form-group row" style="margin-top:20px;">
                       <%--  <label for="tel" style="color:white;" class="col-xs-2 control-label"><spring:message  code='手机号'/></label> --%>
                        <div class="col-xs-11">
                          <input type="text" class="form-control" id="email" onblur="checkEmail()" placeholder="<spring:message  code='请输入邮箱'/>" name="email"><!-- onblur="checkPhone()" -->
                        </div>
                         <div  class="col-xs-1" style="display: block;padding-left: 0px">
                        	<img class="control-label" id="emailright" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png" >
                        	<img class="control-label" id="emailloading" style="height:30px;display: none" src="${pageContext.request.contextPath}/img/loading4.gif"> 
                        	<img class="control-label" id="emailerror" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/can‘t2.png">
                        </div>
                       </div>
                       <div class="form-group" style="margin-top:40px;">
                        <%-- <label for="email" style="color:white;" class="col-xs-2 control-label"><spring:message  code='密码'/></label> --%>
                        <div class="col-xs-11">
                          <img id="demo_imgEmail" class="demo_img" onclick="hideShowPswEmail()" src="/img/eyeNo.png">  
                          <input type="password" class="form-control" id="inputPassword2" value="" placeholder="<spring:message  code='请输入密码'/>" name="oldpassword" onblur="checkPasswords2()">
                        </div>
                        <div  class="col-xs-1" style="display: block;padding-left: 0px">
                          <img class="control-label" id="oldpwdsright2" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png" >
                          <img class="control-label" id="oldpwdsloading2" style="height:30px;display: none" src="${pageContext.request.contextPath}/img/loading4.gif"> 
                          <img class="control-label" id="oldpwdserror2" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/can‘t2.png">
                        </div>
                       </div>
                       <%-- <span id="jbPhoneTip"></span><!-- 根据后台返回data值显示不同信息 -->
                       <div class="login_radio" id="serviceRadio">
                        <span class="message" id="" style="color:white;"><spring:message  code='服务语言'/></span>
                        <label class="radio-inline02">
                          <input type="radio" name="serviceLanguage" class="login_radio06" id="inlineRadio4" value="ZH"  checked="checked"><font style="color:white;"><spring:message  code='汉语'/></font>
                        </label>
                        <label class="radio-inline02" style="padding-left:20px;">
                          <input type="radio" name="serviceLanguage" class="login_radio05" id="inlineRadio3" value="EN"><font style="color:white;"><spring:message  code='英文'/></font>
                        </label>
                       </div> --%>
                       <div class="login_submit">
                       <input type="hidden" name="radioValues" value="我是客户"/>
                       	<input type="hidden" name="type" value="email"/>
                        <input type="submit" value="<spring:message  code='注册并登陆'/>" id="mail_submit" class="btn btn-info btn-block"/>
                       </div>
                       <div class="login_ckeckbox">
                        <label class="checkbox-inline checkbox_01">
                         <input type="checkbox" id="inlineCheckbox" value="option5" checked="checked"><a style="color:white;" href="/forwardAction/forward_toPublicAgreement.do" target="_blank"><spring:message  code='我已阅读并同意环宇爱译协议'/></a>
                        </label>                                   
                       </div>
                     </form>
                    <!-- 客户注册表单结束 -->
                    <%-- <form name="loginform" id="login_form" class="loginForm form-horizontal" action="${pageContext.request.contextPath}/ClientUser/clientUserAction_saveUser.do"  method="post"><input type="hidden" name="did" value="0"/>
                       <div class="form-group">
                        <label for="inputPassword2" style="color:white;" class="col-xs-2 control-label"><spring:message  code='用户名'/></label>
                        <div class="col-xs-8">
                          <input type="text" class="form-control" id="user" placeholder="<spring:message  code='请输入用户名'/>" name="user" onblur="checkAccountName()">
                        </div>
                        <div id="userNameLoading" class="col-xs-1" style="display: block;">
                        	<img class="control-label" id="userNameright" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png" >
                        	<img class="control-label" id="userNameloading" style="height:30px;display: none" src="${pageContext.request.contextPath}/img/loading4.gif"> 
                        	<img class="control-label" id="userNameerror" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/can‘t2.png">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="tel" style="color:white;" class="col-xs-2 control-label"><spring:message  code='手机号'/></label>
                        <div class="col-xs-5 pull-left">
                          <input type="text" class="form-control" id="tel" onblur="checkPhone()" placeholder="<spring:message  code='请输入手机号'/>" name="cellphone"><!-- onblur="checkPhone()" -->
                        </div>
                        <div class="col-xs-3 pull-left">
                        	<input type="button" onclick="sendMessage()"  id="btnSendCode" value="<spring:message  code='发送验证码'/>" class="btn btn-primary btn-sm"  >
                        </div>
                         <div  class="col-xs-1" style="display: block;">
                        	<img class="control-label" id="phoneright" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png" >
                        	<img class="control-label" id="phoneloading" style="height:30px;display: none" src="${pageContext.request.contextPath}/img/loading4.gif"> 
                        	<img class="control-label" id="phoneerror" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/can‘t2.png">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="inputPassword1" style="color:white;" class="col-xs-2 control-label"><spring:message  code='验证码'/></label>
                        <div class="col-xs-8">
                          <input type="text" class="form-control" id="inputPassword11" placeholder="<spring:message  code='请输入验证码'/>" onblur="checkcode()">
                        </div>
                        <div  class="col-xs-1" style="display: block;">
                        	<img class="control-label" id="coderight" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png" >
                        	<img class="control-label" id="codeloading" style="height:30px;display: none" src="${pageContext.request.contextPath}/img/loading4.gif"> 
                        	<img class="control-label" id="codeerror" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/can‘t2.png">
                        </div>
                        
                      </div>
                      <div class="form-group">
                        <label for="email" style="color:white;" class="col-xs-2 control-label"><spring:message  code='邮箱'/></label>
                        <div class="col-xs-8">
                          <input type="email" class="form-control" id="email" placeholder="<spring:message  code='请输入邮箱'/>" name="email"  onblur="checkEmail()">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="email" style="color:white;" class="col-xs-2 control-label"><spring:message  code='密码'/></label>
                        <div class="col-xs-8">
                          <input type="password" class="form-control" id="inputPassword1" placeholder="<spring:message  code='请输入密码'/>" name="oldpassword" onblur="checkPasswords()">
                        </div>
                         <div  class="col-xs-1" style="display: block;">
                        	<img class="control-label" id="oldpwdsright" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png" >
                        	<img class="control-label" id="oldpwdsloading" style="height:30px;display: none" src="${pageContext.request.contextPath}/img/loading4.gif"> 
                        	<img class="control-label" id="oldpwdserror" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/can‘t2.png">
                        </div>
                      </div>
                      <span id="jbPhoneTip"></span><!-- 根据后台返回data值显示不同信息 -->
                      <div class="form-group">
                        <label for="inputPassword2" style="color:white;" class="col-xs-2 control-label"><spring:message  code='确认密码'/></label>
                        <div class="col-xs-8">
                          <input type="password" class="form-control" id="inputPassword2" placeholder="<spring:message  code='请再次输入密码'/>" name="password" onkeyup="checkpwd1()">
                        </div>
                         <div  class="col-xs-1" style="display: block;">
                        	<img class="control-label" id="againspwdright" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png" >
                        	<img class="control-label" id="againspwdloading" style="height:30px;display: none" src="${pageContext.request.contextPath}/img/loading4.gif"> 
                        	<img class="control-label" id="againspwderror" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/can‘t2.png">
                        </div>
                      </div>
                      <div class="login_radio"  id="inlineRadio">
                        <span class="message" style="color:white;"><spring:message  code='注册倾向'/></span>
                        <label class="radio-inline">

                          <input type="radio" class="login_radio" name="radioValue" id="inlineRadio1" onclick="radioss(this)" value="我是客户" ><font style="color:white;"><spring:message  code='我是客户'/></font>

                        </label>
                        <label class="radio-inline">

                          <input type="radio" class="login_radio" name="radioValue" id="inlineRadio2" onclick="radioss(this)" value="我是客户" checked="checked"><font style="color:white;"><spring:message  code='我是客户'/></font>

                        </label>
                      </div>
                      
                      
                       <div class="login_radio" id="serviceRadio">
                        <span class="message" id="" style="color:white;"><spring:message  code='服务语言'/></span>
                        <label class="radio-inline02" style="padding-left:20px;">

                          <input type="radio" name="serviceLanguage" class="login_radio05" id="inlineRadio3" value="EN"  ><font style="color:white;"><spring:message  code='英文'/></font>

                        </label>
                        <label class="radio-inline02">

                          <input type="radio" name="serviceLanguage" class="login_radio06" id="inlineRadio4" value="ZH"  checked="checked"><font style="color:white;"><spring:message  code='汉语'/></font>

                        </label>
                      </div>
                      
                      
                      <div class="login_ckeckbox">
                        <label class="checkbox-inline checkbox_01">

                         <input type="checkbox" id="inlineCheckbox" value="option5"><a style="color:white;" href="/forwardAction/forward_toPublicAgreement.do" target="_blank"><spring:message  code='我已阅读并同意环宇爱译协议'/></a>

                        </label>                                   
                      </div>
                      <div class="login_submit">
                        <input type="submit" value="<spring:message  code='立即注册'/>" id="tel_submit" class="btn btn-info btn-block"/>
                      </div>
                    </form> --%>
                 </div>
              </div>
              <!--注册-->
              <%-- <div class="qlogin" id="qlogin" style="display: none; " id="fastRegister">
                <div class="web_login">
                  <div id="userCue" style="color:white;" class="cue"><spring:message  code='快速注册请注意格式'/></div>
                    <!-- 译员注册表单开始 -->
                   	<form name="loginform" id="login_form" class="loginForm form-horizontal" action="${pageContext.request.contextPath}/ClientUser/clientUserAction_saveUser.do?radioValue='我是客户'"  method="post"><input type="hidden" name="did" value="0"/>
                       <div class="form-group row">
                        <label for="tel" style="color:white;" class="col-xs-2 control-label"><spring:message  code='手机号'/></label>
                        <div class="col-xs-8">
                          <input type="text" class="form-control" id="tel" onblur="checkPhone()" placeholder="<spring:message  code='请输入手机号'/>" name="cellphone"><!-- onblur="checkPhone()" -->
                        </div>
                         <div  class="col-xs-1" style="display: block;">
                        	<img class="control-label" id="phoneright" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png" >
                        	<img class="control-label" id="phoneloading" style="height:30px;display: none" src="${pageContext.request.contextPath}/img/loading4.gif"> 
                        	<img class="control-label" id="phoneerror" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/can‘t2.png">
                        </div>
                       </div>
                       <div class="form-group">
                        <label for="inputPassword1" style="color:white;" class="col-xs-2 control-label"><spring:message  code='验证码'/></label>
                        <div class="col-xs-5 pull-left">
                          <input type="text" class="form-control" id="inputPassword11" placeholder="<spring:message  code='请输入验证码'/>" onblur="checkcode()">
                        </div>
                        <div class="col-xs-5 pull-left">
                        	<input type="button" onclick="sendMessage()"  id="btnSendCode" value="<spring:message  code='获取验证码'/>" class="btn btn-primary btn-sm"  >
                        </div>
                        <div  class="col-xs-1" style="display: block;">
                        	<img class="control-label" id="coderight" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png" >
                        	<img class="control-label" id="codeloading" style="height:30px;display: none" src="${pageContext.request.contextPath}/img/loading4.gif"> 
                        	<img class="control-label" id="codeerror" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/can‘t2.png">
                        </div>
                       </div>
                       <div class="form-group">
                        <label for="email" style="color:white;" class="col-xs-2 control-label"><spring:message  code='密码'/></label>
                        <div class="col-xs-8">
                          <input type="password" class="form-control" id="inputPassword1" placeholder="<spring:message  code='请输入密码'/>" name="oldpassword" onblur="checkPasswords()">
                        </div>
                        <div  class="col-xs-1" style="display: block;">
                          <img class="control-label" id="oldpwdsright" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png" >
                          <img class="control-label" id="oldpwdsloading" style="height:30px;display: none" src="${pageContext.request.contextPath}/img/loading4.gif"> 
                          <img class="control-label" id="oldpwdserror" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/can‘t2.png">
                        </div>
                       </div>
                       <span id="jbPhoneTip"></span><!-- 根据后台返回data值显示不同信息 -->
                       <div class="login_ckeckbox">
                        <label class="checkbox-inline checkbox_01">
                         <input type="checkbox" id="inlineCheckbox" value="option5" checked="checked"><a style="color:white;" href="/forwardAction/forward_toPublicAgreement.do" target="_blank"><spring:message  code='我已阅读并同意环宇爱译协议'/></a>
                        </label>                                   
                       </div>
                       <div class="login_submit">
                        <input type="submit" value="<spring:message  code='注册并登陆'/>" id="tel_submit" class="btn btn-info btn-block"/>
                       </div>
                     </form> --%>
                    <!-- 译员注册表单结束-->
                    <%-- <form name="form2" class="form-horizontal" id="regUser" accept-charset="utf-8"  action="${pageContext.request.contextPath}/ClientUser/clientUserAction_saveUser.do" method="post">
                      <div class="form-group row">
                        <label for="user" style="color:white;" class="col-xs-2 control-label"><spring:message  code='用户名'/></label>
                        <div class="col-xs-8">
                          <input type="text" class="form-control inputstyle2" id="userr" placeholder="<spring:message  code='请输入用户名'/>" name="user" onblur="checkAccountNames()">
                        </div>
                         <div  class="col-xs-1" style="display: block;">
                        	<img class="control-label" id="userNamesright" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png" >
                        	<img class="control-label" id="userNamesloading" style="height:30px;display: none" src="${pageContext.request.contextPath}/img/loading4.gif"> 
                        	<img class="control-label" id="userNameserror" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/can‘t2.png">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="user" style="color:white;" class="col-xs-2 control-label"><spring:message  code='邮箱'/></label>
                        <div class="col-xs-8">
                          <input type="email" class="form-control inputstyle2" id="email1" placeholder="<spring:message  code='请输入邮箱'/>" name="email" onblur="checkEmails()">
                        </div>
                         <div  class="col-xs-1" style="display: block;">
                        	<img class="control-label" id="emailright" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png" >
                        	<img class="control-label" id="emailloading" style="height:30px;display: none" src="${pageContext.request.contextPath}/img/loading4.gif"> 
                        	<img class="control-label" id="emailerror" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/can‘t2.png">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="passwd" style="color:white;" class="col-xs-2 control-label"><spring:message  code='密码'/></label>
                        <div class="col-xs-8">
                          <input type="password" class="form-control" id="passwd" placeholder="<spring:message  code='请输入密码'/>" onblur="checkPwds()">
                        </div>
                         <div  class="col-xs-1" style="display: block;">
                        	<img class="control-label" id="oldpwdright" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png" >
                        	<img class="control-label" id="oldpwdloading" style="height:30px;display: none" src="${pageContext.request.contextPath}/img/loading4.gif"> 
                        	<img class="control-label" id="oldpwderror" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/can‘t2.png">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="passwd2" style="color:white;" class="col-xs-2 control-label"><spring:message  code='确认密码'/></label>
                        <div class="col-xs-8">
                          <input type="password" class="form-control inputstyle2" id="passwd2" placeholder="<spring:message  code='请再次输入密码'/>" name="password" onkeyup="checkpwd()">
                        </div>
                        <div  class="col-xs-1" style="display: block;">
                        	<img class="control-label" id="oldpwdright1" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png" >
                        	<img class="control-label" id="oldpwdloading1" style="height:30px;display: none" src="${pageContext.request.contextPath}/img/loading4.gif"> 
                        	<img class="control-label" id="oldpwderror1" style="height:30px;width:25px;display: none" src="${pageContext.request.contextPath}/img/can‘t2.png">
                        </div>
                      </div>
                      <div class="login_radio" id="inlineRadio" >
                        <span class="message" style="color:white;" id=""><spring:message  code='注册倾向'/></span>
                        <label class="radio-inline02" style="padding-left:20px;">
                          <input type="radio" name="radioValue" class="login_radio02" id="inlineRadio3" onclick="radiosss(this)" value="我是客户"  ><font style="color:white;"><spring:message  code='我是客户'/></font>
                        </label>
                        <label class="radio-inline02">
                          <input type="radio" name="radioValue" class="login_radio02" id="inlineRadio4" onclick="radiosss(this)"  value="我是客户"  checked="checked"><font style="color:white;"><spring:message  code='我是客户'/></font>
                        </label>
                      </div>
                      <div class="login_radio" id="serviceRadios">
                        <span class="message" style="color:white;" id=""><spring:message  code='服务语言'/></span>
                        <label class="radio-inline02" style="padding-left:20px;">
                          <input type="radio" name="serviceLanguage01" class="login_radio05" id="inlineRadio3" value="EN"  ><font style="color:white;"><spring:message  code='英文'/></font>
                        </label>
                        <label class="radio-inline02">
                          <input type="radio" name="serviceLanguage01" class="login_radio06" id="inlineRadio4" value="ZH"  checked="checked"><font style="color:white;"><spring:message  code='汉语'/></font>
                        </label>
                      </div>
                      <div class="login_ckeckbox">
                        <label class="checkbox-inline checkbox_02">
                         <input type="checkbox" id="inlineCheckbox2" value="option5" ><a style="color:white;" href="/forwardAction/forward_toPublicAgreement.do" target="_blank"><spring:message  code='我已阅读并同意环宇爱译协议'/></a>
                        </label>
                      </div>
                      <div class="login_submit">
                        <input type="submit" value="<spring:message  code='立即注册'/>" id="use_submit" class="btn btn-info btn-block" />
                      </div>
                    </form> --%>
                  <!-- </div>
                </div> -->
                <!--注册end-->
            </div>
          </div>

        </div>
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
  <script type="text/javascript">
  	/* function radioss(obj){  
  		if("我是客户"==obj.value){
  			$("#serviceRadio").show();
  		}else{
  			var serviceLanguage=document.getElementsByName("serviceLanguage");
  			for(var i=0;i<serviceLanguage.length;i++){
  				if(serviceLanguage[i].value=="ZH"){
  					serviceLanguage[i].checked=true;
  				}
  			}
  			$("#serviceRadio").hide();
  			
  		} 
  	} */
  	/* function radiosss(obj){
  		if("我是客户"==obj.value){
  			$("#serviceRadios").show();
  		}else{
  			var serviceLanguage=document.getElementsByName("serviceLanguage01");
  			for(var i=0;i<serviceLanguage.length;i++){
  				if(serviceLanguage[i].value=="ZH"){
  					serviceLanguage[i].checked=true;
  				}
  			}
  			$("#serviceRadios").hide();
  			
  		} 
  	} */
  </script>
</html>
