<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code='用户中心-我是客户-我的评价详情编辑'/></title>

    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.center.css"/>
	<link rel="stylesheet" href="/css/star-rating.css" media="all" type="text/css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/themes/krajee-fa/theme.css" media="all" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themes/krajee-svg/theme.css" media="all" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themes/krajee-uni/theme.css" media="all" type="text/css"/>
    
   
    <script src="/js/star-rating.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/css/themes/krajee-fa/theme.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/css/themes/krajee-svg/theme.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/css/themes/krajee-uni/theme.js" type="text/javascript"></script>
    <script src="/js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/public.nav.footer.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.center.js"></script> --%>
   <script  type="text/javascript" src="${pageContext.request.contextPath}/js/starScore.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.customer.myneeds.js"></script> --%>
    <script type="text/javascript">
     $(function(){
    	 if("${transid.nickname}"!=null && "${transid.nickname}"!=''){
       	  $("#nickname").text("${transid.nickname}"+"<spring:message  code='，欢迎您！'/>");
         }else if("${transid.tel}"!=null && "${transid.tel}"!=''){
       	  $("#nickname").text("${transid.tel}"+"<spring:message  code='，欢迎您！'/>");
         }else if("${transid.email}"!=null && "${transid.email}"!=''){
       	  $("#nickname").text("${transid.email}"+"<spring:message  code='，欢迎您！'/>");
         }
    	/*  var tnickname = "${transid.nickname}";
    		var unickname = "${clientid.userName}"
    		if(tnickname!=""){
    			$("#nickname").text(tnickname+"<spring:message code=',欢迎您!'/>");
    			
    		}else if (unickname!="") {
    			$("#nickname").text(unickname+"<spring:message code=',欢迎您!'/>");
    			}  */
     })
    
    </script>
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
      .border_botline{border-bottom:1px solid #ccc;}
      .list_padding li{padding-right:30px;padding-bottom: 10px;}
    </style>
  </head>
  <body style="background: #f5f5f5;">
   <!--      顶部导航      -->
  <c:if test="${clientid.id!=null || transid.id!=null }">
	<div class="publickNav">
		<div class="public_nav">
			<nav class="container" style="padding:0 20px;">
				<div class="navbar-left">
					<a href="${pageContext.request.contextPath}/translator/translatorAction_getEvaluatedetails.do?lang=zh_CN&id=${evaluateClient.id }" class="navbar-link" onclick="in18(this)">中文</a> | <a href="${pageContext.request.contextPath}/translator/translatorAction_getEvaluatedetails.do?lang=en_US&id=${evaluateClient.id }" class="navbar-link" onclick="in18(this)">English</a>
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
          <h2><spring:message code='译员中心'/></h2>
        </div>


        <!--    用户中心 我是客户   -->
        <div class="my_customer">
          <div class="row">

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

            <!--    用户中心 我是客户 我的需求 右侧内容   -->
            <div class="my_customer_right col-sm-10">
              <!--  用户中心右侧 tab切换栏   -->
              <ul id="suerTab" class="nav nav-tabs">
              	<li class="active"><a href="javascript:;" data-toggle="tab"><spring:message code='评价'/></a></li>
              </ul>
              <!-- 评价详情内容编辑 -->
              <form action="">
              <div  class="myTabContent" class="tab-content">                  
                <h3 style="padding-bottom:20px;margin-bottom:30px;border-bottom:2px solid #ddd;font-size:20px;font-weight:700;"><a href="user.customer.order.html"><spring:message code='我的订单'/></a>-><spring:message code='客户评价'/></h3>
                <div class="border_botline" style="font-size:18px;padding:10px;">
                  <div class="row" style="padding:10px 0;">
                    <div class="col-sm-6"><spring:message code='订单号：'/><spring:message code="${orderImpl.orderReference }"/><span></span></div>
                    <div class="col-sm-6"><spring:message code='项目名称：'/><spring:message code="${orderImpl.orderTitle }"/><span></span></div>
                  </div>
                  <div class="row" style="padding:10px 0;">
                    <div class="col-sm-3"><spring:message code='日期：'/><spring:message code="${orderImpl.examinationTime }"/><span></span></div>
                    <div class="col-sm-3"><spring:message code='语言：'/><spring:message code="${clientCustomerNeedImpl.languagePair }"/><span></span></div>
                    <div class="col-sm-3"><spring:message code='译员：'/><spring:message code="${translatorImpl.nickname }"/><span></span></div>
                    <div class="col-sm-3"><spring:message code='客户：'/><spring:message code="${clinetUser.realName}"/><span></span></div>
                    <input type="hidden" id="order" value="${orderImpl.id }">
                    <input type="hidden" id="evaluateId" value="${evaluateClient.id}">
                  </div>
                </div>
                
                <div style="font-size:18px;padding:10px;">
                <spring:message code='技术难度：'/><div class="block clearfix">
        											<input type="radio" name="technicalDifficulties" id='technicalDifficulties' value="${evaluateClient.technicalDifficulties}" checked="checked">${evaluateClient.technicalDifficulties }
   	 											  </div>
   	 											
   	 											
   	 			<spring:message code='语言难度：'/><div  class="block clearfix">
        											<input type="radio" name="languageDifficulties" id='languageDifficulties' value="${evaluateClient.languageDifficulties }" checked="checked">${evaluateClient.languageDifficulties }
        										  </div>
   	 			 <spring:message code='完成速度：'/><div class="block clearfix">
        											<input type="radio" name="completionSpeed" value="${evaluateClient.completionSpeed}" checked="checked">${evaluateClient.completionSpeed}&nbsp;&nbsp;&nbsp;&nbsp;
   	 											   </div>								
   	 			<div style="width: 50%;float: left">							
                <p><spring:message  code='原文理解程度：'/><i class="stars" style="margin-left:5px;">
                  <span style="width:${evaluateClient.understandLevel*2 }%"></span>
                  </i></p>
                   <p><spring:message  code='译文通顺程度：'/><i class="stars" style="margin-left:5px;">
                  <span style="width:${evaluateClient.degreeOfSmooth*6 }%"></span>
                  </i></p>
   	 		     <p><spring:message  code='译文严谨程度：'/><i class="stars" style="margin-left:5px;">
                  <span style="width:${evaluateClient.rigor*6 }%"></span>
                  </i></p>
                  <p><spring:message  code='技术术语翻译：'/><i class="stars" style="margin-left:5px;">
                  <span style="width:${evaluateClient.technicalCorpus*10 }%"></span>
                  </i></p>
   	 			  <p><spring:message  code='专利术语翻译：'/><i class="stars" style="margin-left:5px;">
                  <span style="width:${evaluateClient.patentCorpus*20 }%"></span>
                  </i></p>
   	 			   <p><spring:message  code='格式排版：'/><i class="stars" style="margin-left:5px;">
                  <span style="width:${evaluateClient.format*34 }%"></span>
                  </i></p>								
   	 			   <p><spring:message  code='文件齐全：'/><i class="stars" style="margin-left:5px;">
                  <span style="width:${evaluateClient.integrality*2 }%"></span>
                  </i></p>	
   	 		 
   	 			</div>
   	 			<div style="width: 50%;float: left;">
   	 			<p><spring:message  code='遗漏语段：'/><i class="stars" style="margin-left:5px;">
                  <span style="width:${evaluateClient.missingParagraph*2}%"></span>
                  </i></p>
   	 			<p><spring:message  code='遗漏句子：'/><i class="stars" style="margin-left:5px;">
                  <span style="width:${evaluateClient.missingSentence*3 }%"></span>
                  </i></p> 
   	 			<p><spring:message  code='漏词/赘译：'/><i class="stars" style="margin-left:5px;">
                  <span style="width:${evaluateClient.missingWord*10 }%"></span>
                  </i></p> 								
   	 			<p><spring:message  code='语法错误：'/><i class="stars" style="margin-left:5px;">
                  <span style="width:${evaluateClient.syntaxError*10 }%"></span>
                  </i></p> 	 
   	 			
   	 			<div style="width: 387.75px;height: 31px"></div>							   
   	 			<spring:message code='评价总分：'/><div id="" class="block clearfix">
        											<input class="form-control" style="width:80px;display:inline-block;" type="text" id="score" value="${evaluateClient.score }" readonly="readonly"><span ><font color="#A9A9A9">&nbsp;&nbsp;<spring:message code='(以100分为满分)'/></font></span>
   	 											</div>
   	 																		
   	 			</div>								
                  <p class="clearfix"><spring:message code='其他错误：'/><input class="form-control" type="text" name='otherError' id="otherError" readonly="readonly"   value="${evaluateClient.otherError}"></p>
                  <p class="clearfix"><spring:message code='评语：'/><textarea class="form-control" name="evaluateDetails" id="evaluateDetails" disabled="disabled" cols="30" rows="7" >${evaluateClient.evaluateDetails}</textarea></p>
               </div>
                 <div class="col-sm-offset-4 col-sm-3">
                    <c:if test="${evaluateClient.state ==0 }">
                     <button type="button" class="btn btn-info form-control" onclick="check()"><spring:message  code='申请申诉'/></button>
                    </c:if>
                     <c:if test="${evaluateClient.state >0 }">
                     <button type="button" class="btn btn-disabled" disabled="disabled"><spring:message  code='订单已申诉'/></button>
                    </c:if>
              	 </div>
              </div>
             
			 </form>
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
      $(function(){
    	  $(".cus_iter_navlists a").removeClass("useractive")
          $(".cus_iter_navlists").eq(6).find("a").addClass("useractive")
        var tnickname = "${transid.nickname}";
		var unickname = "${clientid.userName}"
		if(tnickname!=""){
			$("#nickname").text(tnickname+"<spring:message  code='，欢迎您！'/>");
			
		}else if (unickname!="") {
			$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>!");
			}
        
        
        
      });
        function check(){
        	var evaluateId=$("#evaluateId").val();
        	//prompt层
        	  layer.prompt({title: '<spring:message  code="请填写申诉理由"/>', formType: 2}, function(text, index){
        	    layer.close(index);
        	     $.post("/translator/translatorAction_updateEvaluate.do","id="+evaluateId+"&text="+text,function(data){
        		if(data.result="success"){
        			layer.alert('<spring:message  code="提交申诉成功，申诉结果会以短信进行通知"/>', {
      					icon: 6,
      					title: "<spring:message  code='提示'/>",
      					end: function () {
      						window.location.href="/translator/translatorAction_getEvaluatedetails.do?id="+evaluateId;
      						}
      					});
        		}else{
        			layer.alert('<spring:message  code="提交申诉失败，请稍后再试!"/>', {
      					icon: 5,
      					title: "<spring:message  code='提示'/>",
      					end: function () {
      						window.location.href="/translator/translatorAction_getEvaluatedetails.do?id="+evaluateId;
      						}
      					});
        		}
        	},"json");
        	  });
        	
        }
    </script>
     

  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
