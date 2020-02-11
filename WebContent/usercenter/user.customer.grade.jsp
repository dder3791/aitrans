<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title><spring:message code='用户中心-我是用户-我的等级'/></title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.center.css"/>


    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/public.nav.footer.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.center.js"></script> --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
   <script type="text/javascript">
    $(function(){
    	$(".cus_iter_navlists:nth-child(9)").addClass('useractive');
    	
    	 if("${clientid.userName}"!='' && "${clientid.userName}"!=null){
	   		 $("#nickname").text('${clientid.userName}'+"<spring:message code=',欢迎您!'/>");
	   	 }else if('${clientid.tel}'!=null &&'${clientid.tel}'!=null){
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
    <style>
      .stars{margin-top:9px;}
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
        font-size: 16px;
        padding-bottom:10px;
      }
      .integralName span{
        padding-left:10px;
      }
      .myIntegral{
        width:225px;
        height:225px;
        border-radius: 50%;
        background:#73f1fd;
        margin:100px auto 40px 40px;
        padding-top:28px;
      }
      .myIntegral p{
        color:#bfbebe;
        text-align: center;
        padding-top:20px;
      }
      .integral_rule .integral_rule_ul1{
        width:358px;
        height:380px;
        margin:0 auto;
        margin-top:10px;
        border-radius: 50%;
        border:1.5px solid #ccc;
        padding:10px 10px;
      }
      .integral_rule .integral_rule_ul1 li{
        padding-bottom:7px;
        text-align: left;
        line-height:2;
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
            <div class="my_customer_right col-sm-10">

              <!--  用户中心右侧 tab切换栏   -->
              <div class="">
                <ul id="suerTab" class="nav nav-tabs">
                  <li class="active"><a href="#basicdata" data-toggle="tab"><spring:message code='我的等级'/></a></li>
                </ul>
              </div>

                <!--  tab面板对应内容 我的排名  -->
                <div class="myTabContent tab-content">
                  <div class="tab-pane fade in active" id="basicdata" style="padding:20px 20px 30px 30px;">
                    <div class="row">
                      <div class="col-sm-5" style="padding-top:55px;">
                        <p class="integralName"><spring:message code='客户名称：'/><span>${clientid.userName}</span></p>
                        <p class="integralName"><spring:message code='等级：'/>
                        	<i class="stars" style="margin-left:5px;">
                        		<c:if test="${ clientid.userType==0}"><span style="width:0%"></span></c:if>
                        		<c:if test="${ clientid.userType==1}"><span style="width:48%"></span></c:if>
                        		<c:if test="${clientid.userType==2}"><span style="width:93%"></span></c:if>
                        	</i>
                        </p>
                        <p class="integralName">
                        	<c:if test="${clientid.userType==0}"><spring:message code='普通客户'/></c:if>
                        	<c:if test="${clientid.userType==1}"><spring:message code='vip客户'/></c:if>
                        	<c:if test="${clientid.userType==2}"><spring:message code='内部客户'/></c:if>
                        	<!-- <span>已超过58%的客户</span> -->
                        </p>
                        <c:if test="${clientid.userType<2}">
                           <button class="btn btn-info" style="margin-top:100px;padding:5px 20px;" onclick="placeVIP(${orderListSize})"><spring:message code='申请升级'/></button>
                        </c:if>
                        
                      </div>
                      <div class="col-sm-7">
                        <div>
                          <div class="integral_rule">
                            <ul class="list-group integral_rule_ul1">
                              <li><p class="text-center" style="font-size:16px;"><spring:message code='提升规则'/></p></li>
                              <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1、<spring:message code='客户连续3个月案件量大于100'/><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code='就将客户直接提升至大客户等级，当连续3'/><br>&nbsp;&nbsp;&nbsp;<spring:message code='个月案件量低于70时就降级未为普通客户'/><br>&nbsp;</li>
                              <li>2、<spring:message code='发布需求打一定折扣，在完成订单后积分将加倍计算；'/><br>&nbsp;</li>
                              <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3、<spring:message code='VIP客户签订了大客户协议后，将会享受各种'/><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code='优惠，具体内容请参照协议内容。'/></li>
                              <!-- <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4、客户等级越高，享受平台优惠更多<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;排名靠前的展示。</li> -->
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--  tab面板切换内容结束！  -->
              </div>

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
  	function placeVIP(levelSize){
  		
  		if(levelSize>=100){
  			$.post("/cilentCustomer/upgrade.do","orderSize="+levelSize,function(data){
  	  			if(data.msg=='success'){
  	  			 layer.msg('<spring:message code="恭喜你，升级成功！"/>'); 
  	  			 window.location.href="/usercenter/user.customer.grade.jsp"
  	  			}
  	  		},"json");
  		}else{
  			layer.alert('<spring:message code="最近几个月订单太少了，无法升级！"/>', {
  				icon: 5,
  				title: "<spring:message code='提示'/>"
  				});
  		}
  		
  	}
  </script>
</html>