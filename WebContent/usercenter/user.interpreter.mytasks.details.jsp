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
    <title><spring:message  code='用户中心-我是译员--我的任务详情'/></title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.center.css"/>


    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.center.js"></script> --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.customer.myneeds.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
	<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
	<style type="text/css">
	.rowlabel {
		text-align: right;
		padding: 6px;
	}
	.row {
	    margin-top: 20px;
	}
</style>
    <!-- <style>
      .myneeds_top{background:#f1f1f1;padding:30px 20px 20px 30px;}
      .list_padding li{padding-right:30px;padding-bottom: 10px;}
    </style> -->
    <script type="text/javascript">
    var lang = "${language}"
    	if(lang==""){
    		lang="zh";
    	}
     $(function(){
    	 $('input[name=totalMoney]').css('color','red');
    	 var cycle=$("#cycle").val();
    		 if(cycle=='一般'){
    			 $('input[name=cycle]').css('color','green');
    		 }else if(cycle=='加急'){
    			 $('input[name=cycle]').css('color','yellow');
    		 }else if(cycle=='特急'){
    			 $('input[name=cycle]').css('color','red');
    		 }
    	 /* var publishModel=$("#publishModels").val();
         if(publishModel=='选定译员模式'){
       	  var totalMoney=$("#totalMoney").text();
       	  var finalMoney=totalMoney-(totalMoney/6);
       	  $("#totalMoney").text(finalMoney);
         } */
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
         
         
     });
     
     //接受任务
      function acceptTasks(){
    	  //首先判断译员是否实名，实名信息从session中读取
   		 if("${transid}"!=null && "${transid}"!=""){
   			 if("${transid.certificationStatus}"==3 || "${transid.certificationStatus}"=='3' || "${transid.certificationStatus}"=='0' || "${transid.certificationStatus}"==0){
   				 //实名不通过或还没实名操作，跳转实名路劲
   				layer.alert('<spring:message  code="前往实名认证"/>', {
 	  					icon: 1,
 	  					title: "<spring:message  code='提示'/>",
 	  					end: function () {
 	  						window.open("/translator/newIdentity.do",'top');
 	  						//window.location.href="/translator/newIdentity.do";
 							}
 	  					});
   				 
   			 }else if("${transid.isVerifty}"==3 || "${transid.isVerifty}"=='3' || "${transid.isVerifty}"=='0' || "${transid.isVerifty}"==0 || "${transid.isProofread}"==3 || "${transid.isProofread}"=='3' || "${transid.isProofread}"=='0' || "${transid.isProofread}"==0 || "${transid.isAudit}"==3 || "${transid.isAudit}"=='3' ||  "${transid.isAudit}"=='0' ||  "${transid.isAudit}"==0){
   				//资格认证失败，或没有认证资格操作
   				layer.alert('<spring:message  code="前往资格认证"/>', {
 	  					icon: 1,
 	  					title: "<spring:message  code='提示'/>",
 	  					end: function () {
 	  						window.open("/translator/newLanguage.do",'top');
 	  						//window.location.href="/translator/newLanguage.do"
 							}
 	  					});
   			 }else{
   			      //实名认证并翻译，校对，审核有一项已认证资格
   				  var needId=$("#needId").val();
	   	    	  $.post("/translator/translatorAction_acceptTask.do","needid="+needId,function(data){
	   	    		  if(data.result=="success"){
	   	    			  layer.alert('<spring:message  code="您已接受任务"/>', {
	   	  					icon: 1,
	   	  					title: "<spring:message  code='提示'/>",
	   	  					end: function () {
	   	  						window.location.href="/translator/translatorAction_getpublishNeedCount.do";
	   							}
	   	  					});
	   	    		  }else if(data.result=="faile"){
	   	    			layer.alert('<spring:message  code="已认证翻译资格与此项目条件不符合，前往添加资格认证"/>', {
			  					icon: 1,
			  					title: "<spring:message  code='提示'/>",
			  					end: function () {
			  						window.open("/translator/newLanguage.do",'top');
			  						//window.location.href="/translator/newLanguage.do"
									}
			  					});
	   	    		  }
	   	    	  },"json");
   			 }
   		 }
      }
      
      //拒绝任务
      function cancelTasks(){
    	  var needId=$("#needId").val();
    	  $.post("/translator/translatorAction_cancelTask.do","needid="+needId,function(data){
    		  if(data.result=="success"){
    			  layer.alert('<spring:message  code="您已取消任务"/>', {
	  					icon: 5,
	  					title: "<spring:message  code='提示'/>",
	  					end: function () {
	  						window.location.href="/translator/translatorAction_getpublishNeedCount.do";
							}
	  					});
    		  }
    	  },"json");
      }
       
     
    </script>
  </head>
  <body style="background: #f5f5f5;">
  <!--      顶部导航      -->
  	<c:if test="${clientid.id!=null || transid.id!=null }">
  	<div class="publickNav">
  		<div class="public_nav"> 
           <nav class="container" style="padding:0 20px;"> 
           <div class="navbar-left"><a href="${pageContext.request.contextPath}/translator/translatorAction_findTransNeedById.do?lang=zh_CN&id=${clientCustomerNeed.id }" class="navbar-link" onclick="in18(this)">中文</a> | <a href="${pageContext.request.contextPath}/translator/translatorAction_findTransNeedById.do?lang=en_US&id=${clientCustomerNeed.id }" class="navbar-link" onclick="in18(this)">English</a></div><a style="padding-left:50px;" href="/forwardAction/forward_toIndex.do"><spring:message  code='首页'/></a>
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
          <h2><spring:message  code='用户中心'/></h2>
        </div>


        <!--    用户中心 我是议员   -->
        <div class="my_customer">
          <div class="row">

            <!--    用户中心 我是议员 左侧导航   -->
            <div class="my_customer_left col-sm-2">
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

            <!--    用户中心 我是议员 我的需求 右侧内容   -->
            <div class="my_customer_right col-sm-10">
              <!--  用户中心右侧 tab切换栏   -->
              <ul id="suerTab" class="nav nav-tabs">
              	<li class="active"><a href="javascript:;" data-toggle="tab"><spring:message  code='我的任务'/></a></li>
              </ul>

              <div  class="myTabContent" class="tab-content">
                <div><h4 style="font-weight:600;padding-bottom:40px;font-size:16px;"><a style="font-size:16px;" href="user.interpreter.mytasks.jsp"><spring:message  code="我的任务"/>-></a> <spring:message  code="任务详情"/></h4></div>
                <div class="myneeds_top">
                <input type="hidden" name="needId" id="needId" value="${clientCustomerNeed.id}">
                <input type="hidden" id="pageNum" value="${pageNum}">
                <div class="form-group" style="width:100%">
                            <div class="row" style="margin-top:30px;">
               		         	<label  class="col-xs-2 rowlabel"><h4><spring:message code='项目标题：'/></h4></label>
              		         	<div class="col-xs-9">
              		          		<input type="text" style="width:100%" class="form-control" value="${clientCustomerNeed.title }" readonly="readonly">
              		        	</div>
              		        	<label  class="col-xs-1 rowlabel" style="text-align: left;"></label>
              		        	
              	        	</div>
              	        	 <div class="row" style="margin-top:30px;">
              	        	 <label  class="col-xs-2 rowlabel"><spring:message code='项目案号：'/></label>
              		        	<div class="col-xs-3">
              		         		<input type="text" style="width:100%" class="form-control" value="${clientCustomerNeed.needReference }" readonly="readonly">
              		      		</div>
              		      		<label  class="col-xs-1 rowlabel" style="text-align: left;"></label>
               		         	<label  class="col-xs-2 rowlabel"><spring:message code='项目领域：'/></label>
              		         	<div class="col-xs-3">
              		          		<input type="text" style="width:100%" class="form-control" value="${domain}" readonly="readonly">
              		        	</div>
              		        	<label  class="col-xs-1 rowlabel" style="text-align: left;"></label>
              	        	</div>
              	        	 <div class="row" style="margin-top:30px;">
              	        	 <label  class="col-xs-2 rowlabel"><spring:message code='项目语言：'/></label>
              		        	<div class="col-xs-3">
              		         		<input type="text" style="width:100%" class="form-control" value="${clientCustomerNeed.languagePair }" readonly="readonly">
              		      		</div>
              		      		<label  class="col-xs-1 rowlabel" style="text-align: left;"></label>
               		         	<label  class="col-xs-2 rowlabel"><spring:message code='译员级别：'/></label>
              		         	<div class="col-xs-3">
              		          		<input type="text" style="width:100%" class="form-control" value="${clientCustomerNeed.transLevel }" readonly="readonly">
              		        	</div>
              		        	<label  class="col-xs-1 rowlabel" style="text-align: left;"></label>
              		        	
              	        	</div>
              	        	 <div class="row" style="margin-top:30px;">
              	        	   <label  class="col-xs-2 rowlabel"><spring:message code='流程类型：'/></label>
              		        	<div class="col-xs-3">
              		        	    <c:if test="${clientCustomerNeed.procedureTypeId eq '1'}">
              		         		<input type="text" style="width:100%" class="form-control" value="只翻译" readonly="readonly">
              		      		   </c:if>
              		        	    <c:if test="${clientCustomerNeed.procedureTypeId eq '2'}">
              		         		<input type="text" style="width:100%" class="form-control" value="翻译和校对" readonly="readonly">
              		      		   </c:if>
              		        	    <c:if test="${clientCustomerNeed.procedureTypeId eq '3'}">
              		         		<input type="text" style="width:100%" class="form-control" value="翻译校对和审核" readonly="readonly">
              		      		   </c:if>
              		      		</div>
              		      		<label  class="col-xs-1 rowlabel" style="text-align: left;"></label>
               		         	<label  class="col-xs-2 rowlabel"><spring:message code='字数'/>：</label>
              		         	<div class="col-xs-3">
              		          		<input type="text" style="width:100%" class="form-control" value="${clientCustomerNeed.length }" readonly="readonly">
              		        	</div>
              		        	<label  class="col-xs-1 rowlabel" style="text-align: left;"></label>
              		
              	        	</div>
              	        	 <div class="row" style="margin-top:30px;">
              	        	      <label  class="col-xs-2 rowlabel"><spring:message code='总价'/>：</label>
              		        	<div class="col-xs-3">
              		         		<font color="red"><input type="text" style="width:100%" name="totalMoney" class="form-control" value="￥${clientCustomerNeed.totalMoney }" readonly="readonly"></font>
              		      		</div>
              		      		<label  class="col-xs-1 rowlabel" style="text-align: left;"></label>
               		         	<label  class="col-xs-2 rowlabel"><spring:message code='状态'/>：</label>
              		         	<div class="col-xs-3">
              		          		<input type="text" style="width:100%" class="form-control" name="cycle" id="cycle" value="${clientCustomerNeed.cycle }" readonly="readonly">
              		        	</div>
              		        	<label  class="col-xs-1 rowlabel" style="text-align: left;"></label>
              	        	</div>
              	        	<div class="row" style="margin-top:30px;">
              	        	      <label  class="col-xs-2 rowlabel"><spring:message code='项目类型'/>：</label>
              		        	<div class="col-xs-3">
              		         		<font color="red"><input type="text" style="width:100%" name="projectTypeId" class="form-control" value="${projectTypeId }" readonly="readonly"></font>
              		      		</div>
              		      		<label  class="col-xs-1 rowlabel" style="text-align: left;"></label>
              	        	</div>
              	        	<div class="row" style="margin-top:30px;">
               		         	<label  class="col-xs-2 rowlabel"><spring:message code='备注'/>：</label>
               		         	<div class="col-xs-9">
               		         		<textarea class="form-control" id="worksOrigin" rows="6" style="width:100%;" name="worksOrigin" disabled="disabled"> ${clientCustomerNeed.description }</textarea>
               		         	</div>
              	        	</div>
                  </div>
                </div>
                <input type="hidden" id="publishModels"  name="publishModels" value="${clientCustomerNeed.publishModel }">
                <div class="myneeds_body">
                  <%-- <h4 style="font-weight:600;padding:30px 0;"><spring:message  code='项目详情'/></h4> --%>
                  <div >
                  </div>
                  <div  align="right" >
                  <p style="padding-top:10px;"><spring:message  code='返稿日期：'/><span style="margin-right:30px;">${clientCustomerNeed.completeTime }</span></p>
                  </div>
                </div>
                <div align="center" id="chooseTask" >
                <c:if test="${clientCustomerNeed.acceptState =='发布中' }">
                <c:if test="${clientCustomerNeed.publishModel != '主动投标模式'}">
                <button type="button" class="btn btn-info"  name="button" onclick="acceptTasks()" id="acceptTask" ><spring:message  code='接受任务'/></button>
                <button type="button" class="btn btn-info"  name="button" onclick="cancelTasks()" id="cancelTasks"><spring:message  code='取消任务'/></button>
                </c:if>
                </c:if>
                <c:if test="${clientCustomerNeed.acceptState == '订单'}">
                <button type="button" class="btn btn-default requirements"  name="button" onclick="cancelTasks()" id="cancelTasks" disabled="disabled"><spring:message  code='已接受任务'/></button>
                </c:if>
                </div>
                <div align="right">
                     <button type="button" class="btn btn-default col-sm-2" name="button" onclick="JavaScript:history.back(-1);"><spring:message  code='返回上一级'/></button> 
                    <%-- <button type="button" class="btn btn-default col-sm-2" name="button" onclick="Homepage()"><spring:message  code='返回上一级'/></button>  --%>
                </div>
              </div>




            </div>
            <!--    用户中心 我是议员 我的需求 右侧内容 结束   -->

          </div>
          <!--    用户中心 我是议员 结束   -->
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
        $(".cus_iter_navlists:nth-child(2)").addClass('useractive');
        
      })
       /*  function Homepage(){
    	  var mm=$("#pageNum").val();
    	  var type="mytask";
    	  window.location.href="/translator/translatorAction_queryByPublishNeed.do?pageNum="+mm+"&type="+type; 
      }   */
     
      
    </script>
  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
