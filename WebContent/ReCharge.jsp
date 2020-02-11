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
		<title><spring:message code='备用金充值'/></title>
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
		#txt{
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

            <!--    用户中心 我是客户 右侧内容   -->
          <ul id="suerTab" class="nav nav-tabs">
           	<li class="active"><a href="javascript:;" data-toggle="tab"><spring:message code='我要充值'/></a></li>
          </ul>
            <!--充值列表-->
        <form id="payForm" action="" method="post">
		<div class="person_wallet_recharge">
		 <div style="margin-top:30px">
			<ul class="ul" id="ulul" style="margin-left:280px">
                <li>
                    <div class="liDIV" value="500" id="money1"  onclick="pay(this)"><span>￥500</span></div>
                    <div class="sel" style=""></div>
                </li>
                <li>
                    <div class="liDIV" value="800" id="money2" onclick="pay(this)"><span>￥800</span></div>
                    <div class="sel" style=""></div>
                </li>
                <li>
                    <div class="liDIV" value="1200" id="money3" onclick="pay(this)"><span>￥1200</span></div>
                    <div class="sel" style=""></div>
                </li>
                <li>
                    <div class="liDIV" value="2000" id="money4" onclick="pay(this)"><span>￥2000</span></div>
                    <div class="sel" style=""></div>
                </li>
                <li>
                    <div class="liDIV" value="3000" id="money5" onclick="pay(this)"><span>￥3000</span></div>
                    <div class="sel" style=""></div>
                </li>
                <li>
                    <div class="liDIV" value="5000" id="money6" onclick="pay(this)"><span>￥5000</span></div>
                    <div class="sel" style=""></div>
                </li>
                <li>
                    <div class="liDIV" value="10000" id="money7" onclick="pay(this)"><span>￥10000</span></div>
                    <div class="sel" style=""></div>
                </li>
                <li>
                    <div class="liDIV" value="20000" id="money8" onclick="pay(this)"><span>￥20000</span></div>
                    <div class="sel" style=""></div>
                </li>
                <li>
					<div class="liDIV" value="50000" id="money9" onclick="pay(this)"><span>￥50000</span></div>
                </li>
                <li>
                	<input id="otherCharge" type="text" placeholder="<spring:message  code='其他金额'/>" onfocus="getMoney(this)" onblur="isNum(this)" onkeyup="getMoney(this)" value="${needMoney }">
                </li>
                
            </ul>
           <!--  <div style="clear: both;" ></div> --><br><br><br><br><br><br>
           <div style="margin-left:300px;"><span style="font-size:18px;">￥&nbsp;</span><input readonly="readonly" id="txt" type="text" placeholder="<spring:message  code='需支付金额'/>" id="txt" value="${needMoney }"/></div>
           </div>
           <div class="addvideo" style="width: 70%;background: #FFFFFF;margin-left:280px;margin-top: 40px;height:2rem;">
           		<div style="height:0.5rem;width:100%">
           			<span class="col-xs-12" style="color:#19b5ff;font-size: 0.5rem;"><spring:message code='请点击图片选择付款方式'/></span>
           		</div>
            	<%-- <div style="width:50%;background: #fff;height: 1.7rem;line-height: 1.1rem;font-size: 0.5rem; color: #333; text-align: center;float:left;">
            		<a id="id01" onclick="weixin(this.id)" style="width: 90%; border: 1px solid red; display: block; margin: 0 auto; border-radius: 0.5rem;"><spring:message code='微信支付'/></a>
				</div>
            	<div style="width:50%;background: #fff;height: 1.7rem;line-height: 1.1rem;font-size: 0.5rem; color: #333; text-align: center;float:left;">
            		<a id="id02" onclick="Alipay(this.id)" style="width: 90%; border: 1px solid red; display: block; margin: 0 auto; border-radius: 0.5rem;"><spring:message code='支付宝支付'/></a>
            	</div> --%>
            	<div style="width:50%;background: #fff;height: 1.7rem;line-height: 1.1rem;font-size: 0.5rem; color: #333; text-align: center;float:left;">
            		<label style="width:50px;padding: 35px 10px 30px 10px"><img id="id01" style="height:25px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png"></label>
            		<a href="javascript:;" onclick="weixin(this.id)"><img style="width:160px;height:90px;" src="${pageContext.request.contextPath}/img/wechatpay.jpg"></a>
            	</div>
            	<div style="width:50%;background: #fff;height: 1.7rem;line-height: 1.1rem;font-size: 0.5rem; color: #333; text-align: center;float:left;">
            		<label style="width:50px;padding: 35px 10px 30px 10px"><img id="id02" style="height:25px;width:25px;display: none" src="${pageContext.request.contextPath}/img/canUse2.png"></label>
            		<a href="javascript:;" onclick="Alipay(this.id)"><img style="width:160px;height:90px;" src="${pageContext.request.contextPath}/img/alipay.jpg"></a>
            	</div>
           </div>
            <div class="botton" style="width: 70%;margin-left:280px;margin-top: 50px;"><span><spring:message code='我要充值'/></span></div>
            <div class="agreement" style="width: 70%;margin-left:280px"><p><spring:message code='点击我要充值，即您已经表示同意'/><a><spring:message code='《充值协议》'/></a></p></div>
        </div> 
        <input type="hidden" id="payType" name="payType"/>
        <input type="hidden" id="total" name="total" value="${needMoney }"/>
    	<input type="hidden" id="userId" name="userId" value="${userId }"> 
     </form>

            <!--    用户中心 我是客户 右侧内容 结束   -->


        </div>
      </div>
      <!--    用户中心 我是客户 结束   -->
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
		//aa=parseFloat(aa);
		//alert(aa)
		if(payurl==null || payurl=="" || payurl=='undefined' || payurl==undefined){
			layer.alert("<spring:message code='请选择支付方式！'/>");
		}else if(aa<=0 || aa=='0' || aa==null ||aa=="" || aa=="NAN" || aa=="NaN" || aa=='undefined' || aa==undefined){
			layer.alert("<spring:message code='请输入充值金额！'/>");
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
	
	
	function pay(obj){			
	   var test=obj.id;
	   var u = document.getElementById(test).getAttribute('value');
	   number=u; 
	   $("#txt").val(number);
	   $("#otherCharge").val("");
	}
 	
 	
 	function weixin(x){
		 $("#payType").val("weixin");
		/*  $("#payForm").action="../payReturn/topayUrl.do"; */
		 
		$('form').attr('action','/payReturn/topayUrl.do'); 
		$('#id01').css('display','block');
		$('#id02').css('display','none');
	 }
 	
 	
 	function Alipay(x){
		 $("#payType").val("alibaba");
		 
		 /* $("#payForm").action="/payReturn/toGetcodeUrl.do"; */
		 $('form').attr('action','/payReturn/topayUrl.do'); 
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
 	
 	function getMoney(obj){
 		 number='';
 		$("#txt").val(obj.value)
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
