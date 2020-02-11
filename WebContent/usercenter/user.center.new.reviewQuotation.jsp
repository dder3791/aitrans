<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>      
<!DOCTYPE html>
<html>        
  <head>
  <%
		String path = request.getContextPath();//
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
		
		//basePath=http://localhost:8080/Aitrans
		%>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name=" Keywords" content="......">      <!--content中，网页关键字-->
    <meta name=" description" content="......">   <!--content中，网页描述文字-->
    <meta name="author" content="......">        <!--标注作者-->
    <title><spring:message  code='译员中心-我是译员信息编辑'/></title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.center.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/simple.switch.three.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
     <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/simple.switch.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-form.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
	<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
   <script type="text/javascript">
   $(function(){
	   /* var domainss=$("#domainss").val();
	   var checkdomains=domainss.split(",");
		 var checkdomain = document.getElementsByName("domain"); 
		 for(var j=0;j<checkdomains.length;j++){
			 for(var i=0;i<checkdomain.length;i++){
				 if(checkdomain[i].value==checkdomains[j]){
					 checkdomain[i].checked=true;
				 }
			 }
		 } */
   })
	 function checkTranPrice(obj){
		 var checkPirce=obj.value;
		 var domains="";
		 var languageDomain=$("#tranLanguage").val();
		 var box = document.getElementsByName("domain"); 
		 var domains=$("#transDomain").val();
		   /*  var apiContentStr="";  
		    for(var i=0;i<box.length;i++){  
		        if(box[i].checked == true){  
		            apiContentStr += box[i].value+",";  
		        }   
		    }  
		    domains = apiContentStr.substring(0, apiContentStr.length-1);  */ 
		 $.post("/translator/translatorAction_checkTransPrice.do","languageDomain="+ languageDomain+"&domain="+domains+"&tranPrice="+checkPirce , function(data) {
			 if (checkPirce < data.trans) {
					layer.open({
						title : '<spring:message  code="提示"/>',
						content : '<spring:message  code="翻译价格不符合要求，请重新修改"/>',
					});
					$("#checkPrice").attr("disabled", "true");
				} 
			 
		},"json");
		 
	 }
	 function checkProoPrice(obj){
		 var prooPirces=obj.value;
		 var domains="";
		 var languageDomain=$("#tranLanguage").val();
		/*  var box = document.getElementsByName("domain");  */ 
		 var domains=$("#transDomain").val();
		   /*  var apiContentStr="";  
		    for(var i=0;i<box.length;i++){  
		        if(box[i].checked == true){  
		            apiContentStr += box[i].value+",";  
		        }   
		    }  
		    domains = apiContentStr.substring(0, apiContentStr.length-1);  */ 
		 $.post("/translator/translatorAction_checkProoPrice.do","languageDomain="+ languageDomain+"&domain="+domains+"&tranPrice="+prooPirces , function(data) {
			 if (prooPirces < data.proof) {
					layer.open({
						title : '<spring:message  code="提示"/>',
						content : '<spring:message  code="校对价格不符合要求，请重新修改"/>',
					});
					$("#checkPrice").attr("disabled", "true");	
				} 
			 
		},"json");
		 
	 }
	 function checkAuditPrice(obj){
		 var auditPirces=obj.value;
		 var domains="";
		 var languageDomain=$("#tranLanguage").val();
		 var box = document.getElementsByName("domain");  
		 var domains=$("#transDomain").val();
		   /*  var apiContentStr="";  
		    for(var i=0;i<box.length;i++){  
		        if(box[i].checked == true){  
		            apiContentStr += box[i].value+",";  
		        }   
		    }  
		    domains = apiContentStr.substring(0, apiContentStr.length-1); */  
		 $.post("/translator/translatorAction_checkAuditPrice.do","languageDomain="+ languageDomain+"&domain="+domains+"&tranPrice="+auditPirces , function(data) {
			 if (auditPirces < data.veri) {
					layer.open({
						title : '<spring:message  code="提示"/>',
						content : '<spring:message  code="审核价格不符合要求，请重新修改"/>',
					});
					$("#checkPrice").attr("disabled", "true");
				} 
			 
		},"json");
	 }
	 function check() {
		    var  tranPrices=$("#tranPrice").val();
		    var  majorTotalss=$("#majorTotal").val();
		    var dayTranss=$("#dayTrans").val();
		    var  prooPrice=$("#prooPrice").val();
		    var prooTotal=$("#prooTotal").val();
		    var dayProo=$("#dayProo").val();
		    var auditPrice=$("#auditPrice").val();
		    var auditTotal=$("#auditTotal").val();
		    var dayAudit=$("#dayAudit").val();
		    var myreg=/^\+?[1-9][0-9]*$/;
		    var myregmoney=/(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/;
			if(!(myregmoney.test(tranPrices))){ 
				layer.msg("<spring:message code='翻译价格格式错误'/>", {icon: 2});
				return false;
			}else if(!(myreg.test(majorTotalss))){ 
				layer.msg("<spring:message code='翻译字数格式错误'/>", {icon: 2});
				return false;
			}else if(!(myreg.test(dayTranss))){ 
				layer.msg("<spring:message code='日翻译量格式错误'/>", {icon: 2});
				return false;
			}else if(prooPrice != undefined){
				if(!(myregmoney.test(prooPrice))){ 
					layer.msg("<spring:message code='校对价格格式错误'/>", {icon: 2});
					return false;
				}
			}else if(prooTotal != undefined){
				if(!(myreg.test(prooTotal))){ 
					layer.msg("<spring:message code='校对字数格式错误'/>", {icon: 2});
					return false;
				}
			}else if(dayProo != undefined){
				if(!(myreg.test(dayProo))){
					layer.msg("<spring:message code='日校对量格式错误'/>", {icon: 2});
					return false;
				}
			}else if(auditPrice != undefined){
				if(!(myregmoney.test(auditPrice))){
					layer.msg("<spring:message code='审核价格格式错误'/>", {icon: 2});
					return false;
				}
			}else if(auditTotal != undefined){
				if(!(myreg.test(auditTotal))){
					layer.msg("<spring:message code='审核字数格式错误'/>", {icon: 2});
					return false;
				}
			}else if(dayAudit != undefined){
				if(!(myreg.test(dayAudit))){
					layer.msg("<spring:message code='日审核量格式错误'/>", {icon: 2});
					return false;
				}
			}else{
				$("#editForm").submit();
			} 
	}
</script>
<style type="text/css">
	.rowlabel {
		text-align: right;
		padding: 6px;
	}
	.row {
	    margin-top: 20px;
	}
</style>
  </head>
  <body style="background:#f5f5f5;">
  <!--      顶部导航      -->
  	<c:if test="${clientid.id!=null || transid.id!=null }">
  	<div class="publickNav">
  		<div class="public_nav"> 
           <nav class="container" style="padding:0 20px;"> 
           <div class="navbar-left"><a href="${pageContext.request.contextPath}/translator/translatorAction_updateUU.do?lang=zh_CN&id=${translatorsQ.id }" class="navbar-link" onclick="in18(this)">中文</a> | <a href="${pageContext.request.contextPath}/translator/translatorAction_updateUU.do?lang=en_US&id=${translatorsQ.id }" class="navbar-link" onclick="in18(this)">English</a></div><a style="padding-left:50px;" href="/forwardAction/forward_toIndex.do"><spring:message  code='首页'/></a>
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
                 <li class="active"><a href="#personals" data-toggle="tab"><spring:message  code='翻译信息'/></a></li>
                </ul>
              </div>

                <!--  tab面板对应内容   -->
                <div class="myTabContent tab-content" >
                   <!-- 个人资料面板开始 -->     
                   <div class="tab-pane fade in active" id="personals"  style="padding:0px 60px 0px 40px;">
                    <h4><spring:message  code='翻译信息'/></h4>
                      <div class="basic_data">
                        <input type="hidden" id="id" name="id" value="${id}">
                        <input type="hidden" id="tabNo" name="tabNo" value="2">
                		<div class="form-group" style="width:100%">
                        	
                        	<div class="row" style="margin-top:30px;">
               		         	<label  class="col-xs-2 rowlabel"><spring:message code='语言对'/></label>
              		         	<div class="col-xs-3">
              		          		<input type="text" style="width:100%" id="tranLanguage" class="form-control" name="tranLanguage" value="${translatorsQ.languages}" readonly="readonly">
              		        	</div>
              		        	<label  class="col-xs-1 rowlabel" style="text-align: left;"></label>
              		        	<label  class="col-xs-2 rowlabel"><spring:message code='领域'/></label>
              		        	<div class="col-xs-3">
              		         		<input type="text" style="width:100%" id="transDomain" class="form-control" name="transDomain"  value="${translatorsQ.domain}" readonly="readonly">
              		      		</div>
              	        	</div>
                        	<div class="row" style="margin-top:30px;">
               		         	<label  class="col-xs-2 rowlabel"><spring:message code='翻译价格'/></label>
              		         	<div class="col-xs-3">
              		         	 <input readonly="readonly" type="text" style="width:100%" class="form-control" id="tranPrice" name="tranPrice" class="tranPrice" placeholder="<spring:message  code='请输入翻译价格'/>"  value="${translatorsQ.tranPrice}" onblur="checkTranPrice(this)">
              		        	</div>
              		        	<label  class="col-xs-1 rowlabel" style="text-align: left;"><font color="red"><spring:message  code='(元)'/></font></label>
              		        	<label  class="col-xs-2 rowlabel"><spring:message code='所选专业翻译字数'/></label>
              		        	<div class="col-xs-3">
              		        	    <input readonly="readonly" type="text" style="width:100%" class="form-control" id="majorTotal" name="majorTotal" placeholder="<spring:message  code='请输入专业翻译字数'/>" value="${translatorsQ.majorTotal}">
              		      		</div>
              		      		<label  class="col-xs-1 rowlabel" style="text-align: left;"><font color="red"><spring:message  code='(字)'/></font></label>
              	        	</div>
                        	<div class="row" style="margin-top:30px;">
               		         	<label  class="col-xs-2 rowlabel"><spring:message code='日翻译量'/></label>
              		         	<div class="col-xs-3">
              		         	<input readonly="readonly" type="text" style="width:100%" class="form-control" id="dayTrans" name="dayTrans" class="dayTrans" placeholder="<spring:message  code='请输入日翻译量'/>" value="${translatorsQ.dayTrans}">
              		        	</div>
              		        	<label  class="col-xs-1 rowlabel" style="text-align: left;"><font color="red"><spring:message  code='(字)'/></font></label>
              	        	</div>
              	        	<c:if test="${translatorsQ.proolevels>=3 }">
                        	<div class="row" style="margin-top:30px;">
               		         	<label  class="col-xs-2 rowlabel"><spring:message code='校对价格'/></label>
              		         	<div class="col-xs-3">
              		         	<input readonly="readonly" type="text" style="width:100%" class="form-control" id="prooPrice" name="prooPrice" class="prooPrice" placeholder="<spring:message  code='请输入校对价格'/>"  value="${translatorsQ.prooPrice}" onblur="checkProoPrice(this)">
              		        	</div>
              		        	<label  class="col-xs-1 rowlabel" style="text-align: left;"><font color="red"><spring:message  code='(元)'/></font></label>
              		        	<label  class="col-xs-2 rowlabel"><spring:message code='校对总字数'/></label>
              		        	<div class="col-xs-3">
              		        	<input readonly="readonly" type="text"  style="width:100%" class="form-control" id="prooTotal" name="prooTotal" placeholder="<spring:message  code='请输入校对总字数'/>" value="${translatorsQ.prooTotal}">
              		      		</div>
              		      		<label  class="col-xs-1 rowlabel" style="text-align: left;"><font color="red"><spring:message  code='(万字)'/></font></label>
              	        	</div>
                        	<div class="row" style="margin-top:30px;">
               		         	<label  class="col-xs-2 rowlabel"><spring:message code='日校对量'/></label>
              		         	<div class="col-xs-3">
              		         	 <input readonly="readonly" type="text" style="width:100%" class="form-control" id="dayProo" name="dayProo" class="dayProo" placeholder="<spring:message  code='请输入日校对量'/>" value="${translatorsQ.dayProo}">
              		        	</div>
              		        	<label  class="col-xs-1 rowlabel" style="text-align: left;"><font color="red"><spring:message  code='(字)'/></font></label>
              	        	</div>
              	        	</c:if>
              	        	<c:if test="${translatorsQ.auditlevels>=3 }">
              	        	<div class="row" style="margin-top:30px;">
               		         	<label  class="col-xs-2 rowlabel"><spring:message code='审核价格'/></label>
              		         	<div class="col-xs-3">
              		         	 <input readonly="readonly" type="text" style="width:100%" class="form-control" id="auditPrice" name="auditPrice" class="auditPrice" placeholder="<spring:message  code='请输入审核价格'/>"  value="${translatorsQ.auditPrice }" onblur="checkAuditPrice(this)">
              		        	</div>
              		        	<label  class="col-xs-1 rowlabel" style="text-align: left;"><font color="red"><spring:message  code='(元)'/></font></label>
              		        	<label  class="col-xs-2 rowlabel"><spring:message code='审核总字数'/></label>
              		        	<div class="col-xs-3">
              		        	 <input readonly="readonly" type="text" style="width:100%" class="form-control" id="auditTotal" name="auditTotal" placeholder="<spring:message  code='请输入审核总字数'/>" value="${translatorsQ.auditTotal }">
              		      		</div>
              		      		<label  class="col-xs-1 rowlabel" style="text-align: left;"><font color="red"><spring:message  code='(万字)'/></font></label>
              	        	</div>
              	        	<div class="row" style="margin-top:30px;">
               		         	<label  class="col-xs-2 rowlabel"><spring:message code='日审核量'/></label>
              		         	<div class="col-xs-3">
              		         	<input readonly="readonly" type="text" style="width:100%" class="form-control" id="dayAudit" name="dayAudit" class="dayAudit" placeholder="<spring:message  code='请输入日审核量'/>" value="${translatorsQ.dayAudit}">
              		        	</div>
              		        	<label  class="col-xs-1 rowlabel" style="text-align: left;"><font color="red"><spring:message  code='(字)'/></font></label>
              	        	</div>
                            </c:if>
                            <div class="row" style="margin-top:30px;">
               		         	<label  class="col-xs-1 rowlabel"><spring:message code='原文'/></label>
              		         	   <textarea readonly="readonly" class="form-control" id="worksOrigin" cols="10" rows="10" style="width:87%;" name="worksOrigin">${translatorsQ.worksOrigin}</textarea>
              		        	<label  class="col-xs-1 rowlabel" style="text-align: left;"></label>
              	        	</div>
              	        	<div class="row" style="margin-top:30px;">
               		         	<label  class="col-xs-1 rowlabel"><spring:message code='译文'/></label>
              		         	<textarea readonly="readonly" class="form-control" id="worksTarget" cols="10" rows="10"  style="width:87%;" name="worksTarget">${translatorsQ.worksTarget}</textarea>
              		        	<label  class="col-xs-1 rowlabel" style="text-align: left;"></label>
              	        	</div>
              	        	<div align="center">
                          <button class="btn btn-info" name="button" onclick="location='<%=basePath%>/translator/reviewLanguage.do?languages=${translatorsQ.languages}&id=${transid.id}'"><spring:message  code='返回'/></button>
                           </div>
                        </div>
                    </div>
                  </div>
                    <!-- 个人资料面板结束 --> 
                  <!--  银行信息开始 -->
                  
                </div>
                <!--  tab面板切换内容结束！  -->
              </div>

            <!--    用户中心 我是译员 右侧内容 结束   -->


        </div>
        <!--    用户中心 我是译员 结束   -->
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
    	  $(".cus_iter_navlists").eq(0).find("a").addClass("useractive")

        $(".checkbox").simpleSwitch({
         "theme": "FlatCircular"
       });
        
    	  
    	  if("${transid.nickname}"!=null && "${transid.nickname}"!=''){
        	  $("#nickname").text("${transid.nickname}"+"<spring:message  code='，欢迎您！'/>");
          }else if("${transid.tel}"!=null && "${transid.tel}"!=''){
        	  $("#nickname").text("${transid.tel}"+"<spring:message  code='，欢迎您！'/>");
          }else if("${transid.email}"!=null && "${transid.email}"!=''){
        	  $("#nickname").text("${transid.email}"+"<spring:message  code='，欢迎您！'/>");
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
  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
