<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/new_file.css" />
		<script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layer.css" />
		<title><spring:message code='Aitrans交易网'/></title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.center.css"/>
    <link href="${pageContext.request.contextPath}/css/page.css" type="text/css" rel="stylesheet"/>


    <!-- <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script> -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/public.nav.footer.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.center.js"></script> --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script> --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
	<style type="text/css">
		.person_wallet_recharge .ul li {
		    float: left;
		    width: 15%;
		    height: 0.9rem;
		    text-align: center;
		    border: 1px solid #CCCCCC;
		    border-radius: 0.18rem;
		    line-height: 0.9rem;
		    margin: 0px 1% 0.2rem 2%;
		    box-sizing: border-box;
		    color: #525252;
		    position: relative;
		}
		.person_wallet_recharge .ul li span {
		    font-size: 18px;
		    width:100%;
		    height:100%;
		    text-align: center;
		}
		#otherCharge{
			float: left;
		    width: 100%;
		    height: 100%;
		    text-align: center;
		    border: 0px solid #CCCCCC;
		    border-radius: 0.18rem;
		    line-height: 100%;
		    box-sizing: border-box;
		    color: #525252;
		    position: relative;
		    font-size: 18px;
		}
		.txt{
			border: 0px solid #CCCCCC;
			font-size:24px;
			color:red;
		}
		 h5 {
			font-size: 26px;
		}
	
	</style>

    <style>
      .integralName{
        font-size: 16px;
      }
      .integralName span{
        padding-left:10px;
      }
      .myIntegral{
        width:200px;
        height:150px;
        border-radius: 60%;
        background:#f1f1f1;
        margin:10px 0 0 20px;
      }
      .myIntegral p{
        text-align: center;
        padding-top:25px;
      }
      .integral_rule .integral_rule_ul1{
        width:260px;
        height:350px;
        margin-top:10px;
        border:1.5px solid #ccc;
        padding:30px 20px;
      }
      .integral_rule .integral_rule_ul1 li{
        padding-bottom:5px;
      }
      .integral_rule .integral_rule_ul2{
        width:165px;
        min-height:350px;
        margin-top:10px;
        background:#7fcef5;
        border-radius: 5px;
        border:1.5px solid #ccc;
        padding:20px 8px;
        position: relative;
        left:-45px;
        top:20px;
      }
      .changeclick{
        text-align: right;
        margin-right:50px;
      }
      .changeclick span{
        cursor: pointer;
        border-bottom: 1px solid #222;
      }
      .changemore{
        height:200px;
        overflow: hidden;
      }
      .changemore li{
        margin-right:55px !important;
      }

      /* 积分商城 */
      
      .integralthings li{
        width:115px;
        min-height:170px;
        margin-top:25px;
        text-align: center;
        margin-right:50px;
      }
      .integralthings li img{
        width:95px;
        height:95px;
        margin-bottom:20px;
      }
      .integralthings li p{
        font-size:12px;
      }
      .integralthings li button{
        width:60px;
        height:25px;
        border-radius: 10px;
        line-height:25px;
        padding:0;
        margin-top:8px;
      }
      .integral_rule_ul2 li{
        padding-bottom:8px;
      }
      
    </style>
  </head>
  <body style="background:#f5f5f5;">
	<header>
		<span>
			<spring:message code='智能软件-PAT'/>
		</span>
	</header>
	<div style="height: 70px"></div>
     <div class="my_customer" style="padding: 30px 1px;margin-bottom: 0px">
            <!--充值列表-->
      <form id="payForm" action="/payReturn/topayUrl.do" method="post">
		<div class="person_wallet_recharge" style="text-align: center">
		   <div style="margin-top:60px;width: 70%;margin-left: 15%;padding-bottom: 20px">
          	 <div style="float: left;width: 50%;margin: 0" class="txt">支付金额：<span style="font-size:18px;">￥&nbsp;</span><input type="text" onblur="isNum(this)" placeholder="<spring:message  code='需支付金额'/>" id="txt" value="${patMoney }"/></div>
          	 <div style="width: 50%;margin: 0;float: left" class="txt">联系电话：<input type="text" id="tel" name="tel" placeholder="<spring:message  code='请输入联系电话'/>"/></div>
           </div>
           <div class="addvideo" style="text-align: center;width: 70%;background: #FFFFFF;margin-left:280px;margin-top: 90px;height:3.5rem;">
           		<div style="height:0.65rem;width:100%;margin-left: -460px">
           			<span class="col-xs-12" style="color:#19b5ff;font-size: 0.5rem;"><spring:message code='请点击图片选择付款方式'/></span>
           		</div>
            	<div style="margin-left:-90px;width:50%;background: #fff;height: 1rem;line-height: 1.1rem;font-size: 0.5rem; color: #333; text-align: center;float:left;">
            		<label style="width:50px;padding: 25px 10px 30px 10px"><img id="id01" style="height:25px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png"></label>
            		<a href="javascript:;" onclick="weixin(this.id)"><img style="width:160px;height:90px;" src="${pageContext.request.contextPath}/img/wechatpay.jpg"></a>
            	</div>
            	<div style="width:50%;background: #fff;height: 1rem;line-height: 1.1rem;font-size: 0.5rem; color: #333; text-align: center;float:left;">
            		<label style="width:50px;padding: 25px 10px 30px 10px"><img id="id02" style="height:25px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png"></label>
            		<a href="javascript:;" onclick="Alipay(this.id)"><img style="width:160px;height:90px;" src="${pageContext.request.contextPath}/img/alipay.jpg"></a>
            	</div>
           </div>
           <div class="botton" style="width: 70%;margin-top: 50px;"><span><spring:message code='我要充值'/></span></div>
           <div class="agreement" style="width: 70%;margin-left: 15%"><p><spring:message code='点击我要充值，即您已经表示同意'/><a><spring:message code='《充值协议》'/></a></p></div>
        </div> 
        <input type="hidden" id="payType" name="payType"/>
        <input type="hidden" id="total" name="total"/>
    	<input type="hidden" id="userId" name="userId" value="0"> 
    	<input type="hidden" id="tt" name="tt" value="pat"> 
     </form>
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
  <script type="text/javascript">
 	var number='';
 	var a=5;
 	$(".person_wallet_recharge .ul li").click(function(e){
		$(this).addClass("current").siblings("li").removeClass("current");					
		$(this).children(".sel").show(0).parent().siblings().children(".sel").hide(0);
	});
 	
 	$(".botton").click(function(e){			
		var txt='';
		if($("#txt").val()!=""&& $("#txt").val()!=null){
		   txt=$("#txt").val()					  
		}else{					  
		   txt=number;
		
		}				
		$("#total").val(txt);
		
		var payurl=$("#payForm").attr('action');
		var aa=$("#total").val();
		var tel=$("#tel").val();
		//aa=parseFloat(aa);
		//alert(aa)
		if(payurl==null || payurl=="" || payurl=='undefined' || payurl==undefined){
			layer.alert("<spring:message code='请选择支付方式！'/>");
		}else if(aa<=0 || aa=='0' || aa==null ||aa=="" || aa=="NAN" || aa=="NaN" || aa=='undefined' || aa==undefined){
			layer.alert("<spring:message code='请输入充值金额！'/>");
			return false;
		}else if(tel==null ||tel=="" || tel=="NAN" || tel=="NaN" || tel=='undefined' || tel==undefined){
			layer.alert("<spring:message code='请输入联系电话！'/>");
			return false;
		}else{
			$("#payForm").submit(); 
		}
			
		
		/* if('weixin'==$("#payType").val()){
			$("#payForm").submit();
		}else{
			
			$.post("/payReturn/toGetcodeUrl.do?total="+txt+"&payType="+$("#payType").val()+"&userId="+$("#userId").val());
		} */
		
	})
	
 	function weixin(x){
		 $("#payType").val("weixin");
		/*  $("#payForm").action="../payReturn/topayUrl.do"; */
		 
		$('#id01').css('display','block');
		$('#id02').css('display','none');
	 }
 	
 	
 	function Alipay(x){
		 $("#payType").val("alibaba");
		 
		 /* $("#payForm").action="/payReturn/toGetcodeUrl.do"; */
		 $('#id02').css('display','block');
		 $('#id01').css('display','none');
	 }
 	
 	
 	function isNum1(str)   
	  {   
	      if(/^(0|[1-9][0-9]{0,9})(\.[0-9]{1,2})?$/.test(str))   
	      {   
	          return true;   
	      }   
	      return false;   
	  }

 	function isNum(obj){
 	  if(obj.value!="" && obj.value!=null){
 		 if(isNum1(obj.value)==true){
  			$("#txt").val(obj.value)
  		}else{
  			obj.value="";
  			$("#txt").val("")
  			layer.alert("<spring:message code='请输入正确金额！'/>");	
  		} 
 	  }
 		
 	}
  </script>
</html>
