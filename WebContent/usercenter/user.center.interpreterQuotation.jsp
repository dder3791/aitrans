<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name=" Keywords" content="......">
<!--content中，网页关键字-->
<meta name=" description" content="......">
<!--content中，网页描述文字-->
<meta name="author" content="......">
<!--标注作者-->
<title><spring:message  code='译员中心-我是译员新增翻译信息'/></title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/public.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/user.center.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/simple.switch.three.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/layui/css/layui.css" />
<script type="text/javascript" 
          src="${pageContext.request.contextPath}/js/bootstrap-select.js"></script>	
<script type="text/javascript"
	src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/ajaxfileupload.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/simple.switch.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-form.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
<script type="text/javascript">
      $(function(){
    	  
      })
	  function checkTranPrice(obj){
		 var checkPirce=obj.value;
		 var domains="";
		 var languageDomain=$("#translanguage").val();
		 var domains = $("#transdomain").val();  
		    /* var apiContentStr="";  
		    for(var i=0;i<box.length;i++){  
		        if(box[i].checked == true){  
		            apiContentStr += box[i].value+",";  
		        }   
		    }  
		    domains = apiContentStr.substring(0, apiContentStr.length-1);   */
		 $.post("/translator/translatorAction_checkTransPrice.do","languageDomain="+ languageDomain+"&domain="+domains+"&tranPrice="+checkPirce , function(data) {
			 if (checkPirce < data.trans) {
					layer.open({
						title : '<spring:message  code="提示"/>',
						content : '<spring:message  code="翻译价格不符合要求，请重新修改"/>',
					});
					$("#checkPrice").attr("disabled", "true");
				}else{
					$("#checkPrice").removeAttr("disabled");//启用按钮 
				} 
			 
		},"json");
		 
	 }
	 function checkProoPrice(obj){
		 var prooPirces=obj.value;
		 var domains="";
		 var languageDomain=$("#proolanguage").val();
		/*  var box = document.getElementsByName("");  */
		 var domains = $("#proodomain").val();
		    /* var apiContentStr="";  
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
				}else{
					$("#checkPrice").removeAttr("disabled");//启用按钮 
				} 
			 
		},"json");
		 
	 }
	 function checkAuditPrice(obj){
		 var auditPirces=obj.value;
		 var domains="";
		 var languageDomain=$("#auditLanguage").val();
		 var box = document.getElementsByName("Auditdomain");
		 var domains = $("#Auditdomain").val();
		 /* var apiContentStr="";  
		    for(var i=0;i<box.length;i++){  
		        if(box[i].checked == true){  
		            apiContentStr += box[i].value+",";  
		        }   
		    }   
		    domains = apiContentStr.substring(0, apiContentStr.length-1);  */
		 $.post("/translator/translatorAction_checkAuditPrice.do","languageDomain="+ languageDomain+"&domain="+domains+"&tranPrice="+auditPirces , function(data) {
			 if (auditPirces < data.veri) {
					layer.open({
						title : '<spring:message  code="提示"/>',
						content : '<spring:message  code="审核价格不符合要求，请重新修改"/>'
					});
					$("#checkPrice").attr("disabled", "true");
				}else{
					$("#checkPrice").removeAttr("disabled");//启用按钮 
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
			if($("#tranPrice").val()!=0.0){
				if(!(myregmoney.test(tranPrices))){ 
				 layer.msg("<spring:message code='翻译价格格式错误'/>", {icon: 2});
				 return false;
			 }
			}else if(majorTotalss!=0){	
				if(!(myreg.test(majorTotalss))){ 
					 layer.msg("<spring:message code='翻译字数格式错误'/>", {icon: 2});
					 return false;
			   }	
			}else if(dayTranss!=0){
				if(!(myreg.test(dayTranss))){ 
					 layer.msg("<spring:message code='日翻译量格式错误'/>", {icon: 2});
					 return false;
			   }
			}else if(prooPrice!=0.0){
				if(!(myregmoney.test(prooPrice))){ 
					 layer.msg("<spring:message code='校对价格格式错误'/>", {icon: 2});
					 return false;
			   }	
	        }else if(prooTotal!=0){
	        	if(!(myreg.test(prooTotal))){ 
					 layer.msg("<spring:message code='校对字数格式错误'/>", {icon: 2});
					 return false;
			   }
	        }else if(dayProo!=0){
	        	if(!(myreg.test(dayProo))){ 
					 layer.msg("<spring:message code='日校对量格式错误'/>", {icon: 2});
					 return false;
			   }
	        }else if(auditPrice!=0.0){
	        	if(!(myregmoney.test(auditPrice))){ 
					 layer.msg("<spring:message code='审核价格格式错误'/>", {icon: 2});
					 return false;
			   }
	        }else if(auditTotal!=0){
	        	if(!(myreg.test(auditTotal))){ 
					 layer.msg("<spring:message code='审核字数格式错误'/>", {icon: 2});
					 return false;
			   }
	        }else if(dayAudit!=0){
	        	if(!(myreg.test(dayAudit))){ 
					 layer.msg("<spring:message code='日审核量格式错误'/>", {icon: 2});
					 return false;
			   }
	      }else{
				$("#form").submit();
			} 
		}
</script>

</head>
<body style="background: #f5f5f5;">
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
								<%-- <li class="active"><a href="#personal" data-toggle="tab"><spring:message  code='基本资料'/></a></li>
							   <li><a id="trans" href="#transMessage" data-toggle="tab"><spring:message  code='翻译信息'/></a></li> --%>
								<li class="active"><a id="base" href="#personal" data-toggle="tab"><spring:message  code='基本资料'/></a></li>
							   <li><a id="trans" href="#transMessage" data-toggle="tab"><spring:message  code='翻译信息'/></a></li>
							    <li><a href="#bankInfo" data-toggle="tab" ><spring:message  code='银行信息'/></a></li>
							</ul>
						</div>

				<!--  tab面板对应内容   -->
				<div class="myTabContent tab-content">
                   <!-- 个人资料面板开始 -->    
                   <div class="tab-pane fade in active"  id="personal"  style="padding:50px 60px 80px 40px;" >
                    <h4><spring:message  code='基本资料'/></h4>
                      <input type="hidden" value="${translators.id}" name="transId" id="transId">
                    <div class="basic_data">
                      <div class="basic_data_inp">
                        <div class="row">
                          <p class="col-sm-4"><spring:message  code='真实姓名：'/><span>${translators.nickname }</span></p>
                          <p class="col-sm-4"><spring:message  code='身份证号：'/><span>${translators.nameid }</span></p>
                        </div>	`
                      </div>
                      <div class="basic_data_inp">
                        <div class=row>
                          <p class="col-sm-4"><spring:message  code='性别：'/>
                          <c:if test="${translators.gender ==0 }">
                          <span><spring:message  code='男'/></span>
                          </c:if>
                          <c:if test="${translators.gender ==1 }">
                          <span><spring:message  code='女'/></span>
                          </c:if>
                          </p>
                          <p class="col-sm-4"><spring:message  code='职业：'/><span>${translators.job }</span></p>
                        </div>
                      </div>
                      <div class="basic_data_inp">
                        <div class="row">
                        <p class="col-sm-4" ><spring:message  code='出生年月：'/><span>${translators.birthday } </span></p>
                          <p class="col-sm-4"><spring:message  code='现居地址：'/><span>${translators.address }</span></p>
                        </div>
                      </div>
                      <div class="basic_data_inp">
                        <div class="row">
                          <p class="col-sm-4"><spring:message  code='手机号：'/><span>${translators.tel }</span></p>
                          <p class="col-sm-4"><spring:message  code='电子邮箱：'/><span>${translators.email }</span></p>
                        </div>
                      </div>
                      <div class="basic_data_inp">
                        <div class="row">
                          <p class="col-sm-4"><spring:message  code='工作地址：'/><span>${translators.companyAddress }</span></p>
                          <p class="col-sm-4"><spring:message  code='银行账号：'/><span>${translators.accountNumber }</span></p>
                        </div>
                      </div>
                      <div class="basic_data_inp">
                        <div class="row">
                          <p class="col-sm-4"><spring:message  code='软件使用情况：'/>
                           <c:if test="${translators.isToolUse ==1 }">
                          <span><spring:message  code='使用'/></span>
                            </c:if>
                             <c:if test="${translators.isToolUse ==0 }">
                             <span><spring:message  code='未使用'/></span>
                             </c:if>
                          </p>
                          <p class="col-sm-4"><spring:message  code='是否通过审核：'/>
                          <input type="hidden" value="${translators.isVerifty }" id="isVeriftys">
                          <span>
                          	<c:if test="${translators.isVerifty==0 }"><spring:message  code='未审核'/></c:if>
                           <c:if test="${translators.isVerifty==1 }"><spring:message  code='正在审核'/></c:if>
                          	<c:if test="${translators.isVerifty==2 }"><spring:message  code='审核通过'/></c:if>
                          	</span>
                          </p>
                        </div>
                      </div>
                      <div class="basic_data_inp" style="text-align:center;padding-top:60px;">
                        <a href="" id="interpreter"><button type="button" class="btn btn-info" onclick="interpreter()" name="button"><spring:message  code='修 改'/></button></a>
                      </div>
                      <!-- 上传头像 -->
                      <div class="file_head" style="padding-top:30px;">
                        <h4><spring:message  code='用户头像'/></h4>
                        <c:if test="${translators.userUrl!=null && translators.userUrl!='' }">
                       	 	 <img src="${pageContext.request.contextPath}/${translators.userUrl}" alt="" width="100" height="100" id="allUrl" alt="">
                       	 </c:if>
                       	 <c:if test="${translators.userUrl ==null || translators.userUrl=='' }">
                       	 	 <img src="${pageContext.request.contextPath}/img/tuxiang.jpg" alt="" width="100" height="100" >
                       	 </c:if>
                        <form id="uploadform"  enctype="multipart/form-data"  method="post" action="/translator/uploadUtils.do" >
                        <div class="file_span">
                          <input type="file" id="file"  name="file"   onchange="uploadPic()">
                           <c:if test="${translators.userUrl!=null && translators.userUrl!='' }">
                          	 	 <span class=""><spring:message  code='修改照片'/></span>
                          	 </c:if>
                          	 <c:if test="${translators.userUrl ==null || translators.userUrl=='' }">
                          	 	 <span class=""><spring:message  code='上传照片'/></span>
                          	 </c:if>
                        </div> 
                        </form>
                      </div>
                    </div>
                  </div>
                 <!-- 个人资料面板结束 -->    
                 <!-- 翻译信息开始 -->
                <div class="tab-pane fade" id="transMessage" style="padding:50px 60px 80px 40px;">
					<h4><spring:message  code='翻译信息'/></h4>
					   <div class="basic_data">
						  <form class="form-inline" method="post" id="form" action="${pageContext.request.contextPath}/translator/translatorAction_addTransQuotation.do">
										  <c:if test="${quotationTransList[0].tranPrice == '0.0' }"> 
											 <c:forEach items="${quotationTransList}" var="quotationTransList" begin="0" end="0" >
										<div class="basic_data_inp">
											<label for="languageDomain"><font color="red"><b>*&nbsp;</b></font><spring:message  code='翻译语言'/></label> 
											<%-- <select  id="languageDomain" name="TranslanguageDomain"
												class="form-control">
			                                     <c:if test="${quotationTransList.tranlevels>=3 }">
                        			              <option value="${quotationTransList.languages }">${quotationTransList.languages }</option>
                        		                 </c:if>
											</select> --%> 
											<input type="text" id="translanguage" class="form-control" name="translanguage" readonly="readonly"  value="${quotationTransList.languages }" /> 
										</div>
										<div class="basic_data_inp">
											   <label for="domain"><font color="red"><b>*&nbsp;&nbsp;&nbsp;</b></font><spring:message  code='翻译领域'/></label> 
												<input type="text" class="form-control" readonly="readonly"   name="transdomain" value="${quotationTransList.domain}"  id="transdomain"/>
                                          </div>
                                           
										<div class="basic_data_inp">
											<label for="tranPrice"><spring:message  code='翻译价格'/></label> <input type="text"
												class="form-control" id="tranPrice" name="tranPrice"
												 placeholder="请输入翻译价格" onchange="checkTranPrice(this)" value="0"><font color="red"><spring:message  code='(元)'/></font> 
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<label for="transTotal"><spring:message  code='所选专业翻译字数'/></label>
											<input type="text" class="form-control" id="majorTotal"
												name="majorTotal" placeholder="请输入专业翻译字数" value="0">
												<font color="red"><spring:message  code='(字)'/></font>
										</div>
										</c:forEach>
										<div class="basic_data_inp">
											<label for="dayTrans"><spring:message  code='日翻译量'/></label> <input type="text"
												class="form-control" id="dayTrans" name="dayTrans"
												class="dayTrans" placeholder="请输入日翻译量" value="0">
												<font color="red"><spring:message  code='(字)'/></font>
										</div>
										 </c:if> 
										<c:if test="${translators.isProofread !=0}">
										     <c:if test="${quotationProoList[0].prooPrice == '0.0' }"> 
											 <c:forEach items="${quotationProoList}" var="quotationProoList" begin="0" end="0">
										 <div class="basic_data_inp">
											<label for="languageDomain"><font color="red"><b>*&nbsp;</b></font><spring:message  code='校对语言'/></label> 
											<%-- <select  id="languageDomain" name="ProolanguageDomain"
												class="form-control">
			                                     <c:if test="${quotationProoList.proolevels>=3 }">
                        			              <option value="${quotationProoList.languages }" >${quotationProoList.languages }</option>
                        		                 </c:if>
											</select>  --%>
											 <input type="text" id="proolanguage" class="form-control" name="proolanguage" readonly="readonly"  value="${quotationProoList.languages }" /> 
										</div>
										<div class="basic_data_inp">
											   <label for="domain"><font color="red"><b>*&nbsp;</b></font><spring:message  code='校对领域'/>&nbsp;&nbsp;&nbsp;&nbsp;</label> 
												 <input type="text" class="form-control" name="proodomain" id="proodomain" readonly="readonly"  value="${quotationProoList.domain}" /> 
                                          </div>
											<div class="basic_data_inp">
												<label for="prooPrice"><spring:message  code='校对价格'/></label> <input type="text"
													class="form-control" id="prooPrice" name="prooPrice"
													class="prooPrice" placeholder="请输入校对价格" onchange="checkProoPrice(this)" value="0">
												<font color="red"><spring:message  code='(元)'/></font>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<label for="prooTotal"><spring:message  code='校对总字数'/></label>
												<input type="text" class="form-control" id="prooTotal"
													name="prooTotal" placeholder="请输入校对总字数" value="0">
													<font color="red"><spring:message  code='(万字)'/></font>
											</div>
											<div class="basic_data_inp">
											<label for="dayTrans"><spring:message  code='日校对量'/></label> <input type="text"
												class="form-control" id="dayProo" name="dayProo"
												class="dayProo" placeholder="请输入日校对量" value="0">
												<font color="red"><spring:message  code='(字)'/></font>
										</div>
										    </c:forEach>	
										 </c:if> 
										</c:if>
										<c:if test="${translators.isAudit !=0}">
										 <c:if test="${quotationAuditList[0].auditPrice == '0.0' }"> 
										   <c:forEach items="${quotationAuditList}" var="quotationAuditList" begin="0" end="0"> 
										   <div class="basic_data_inp">
											<label for="languageDomain"><font color="red"><b>*&nbsp;</b></font><spring:message  code='审核语言'/></label> 
											<%-- <select  id="languageDomain" name="AuditlanguageDomain"
												class="form-control">
			                                     <c:if test="${quotationAuditList.auditlevels>=3 }">
                        			              <option value="${quotationAuditList.languages }">${quotationAuditList.languages }</option>
                        		                 </c:if>
											</select>  --%>
											<input type="text" class="form-control" id="auditLanguage" readonly="readonly"   name="auditLanguage" value="${quotationAuditList.languages}" />
										</div>
										 
										<div class="basic_data_inp">
											   <label for="domain"><font color="red"><b>*&nbsp;</b></font><spring:message  code='审核领域'/>&nbsp;&nbsp;&nbsp;&nbsp;</label> 
												<input type="text" class="form-control"  readonly="readonly"  id="Auditdomain" name="Auditdomain" value="${quotationAuditList.domain}" />
                                          </div>
											<div class="basic_data_inp" class="basic_data_audit" >
												<label for="auditPrice"><spring:message  code='审核价格'/></label> <input type="text"
													class="form-control" id="auditPrice" name="auditPrice"
													class="auditPrice" placeholder="请输入审核价格" onchange="checkAuditPrice(this)" value="0">
													<font color="red"><spring:message  code='(元)'/></font> 
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<label
													for="auditTotal"><spring:message  code='审核总字数'/></label> <input type="text"
													class="form-control" id="auditTotal" name="auditTotal"
													placeholder="请输入审核总字数" value="0">
													<font color="red"><spring:message  code='(万字)'/></font>
											</div>
											<div class="basic_data_inp">
											<label for="dayTrans"><spring:message  code='日审核量'/></label> <input type="text"
												class="form-control" id="dayAudit" name="dayAudit"
												class="dayAudit" placeholder="请输入日审核量" value="0">
												<font color="red"><spring:message  code='(字)'/></font>
										</div>
										   </c:forEach>
										</c:if>
                                        </c:if>
										<div class="basic_data_inp">
											<label for="worksOrigin" style="width: 10%;"><spring:message  code='原文'/></label>
											<textarea class="form-control" id="worksOrigin" rows="6"
												style="width: 87%;" name="worksOrigin"></textarea>
										</div>
										<div class="basic_data_inp">
											<label for="worksTarget" style="width: 10%;"><spring:message  code='译文'/></label>
											<textarea class="form-control" id="worksTarget" rows="6"
												style="width: 87%;" name="worksTarget"></textarea>
										</div>
										<div class="basic_data_inp" style="text-align: center;">
											<button type="submit" class="btn btn-info" name="button"
												id="checkPrice"  onclick="return check()"><spring:message  code='保存'/></button>
										</div>
										
									</form>
								</div>
							</div>
                         <!--    翻译信息结束 -->
                          <!--  银行信息开始 -->
                  <div class="tab-pane fade" id="bankInfo">
                         <input type="hidden" value="${translators.id}" name="transId" id="transId">
                        <div class="basic_data_inp">
                        <div class="row">
                          <p class="col-sm-4"><spring:message  code='真实姓名'/>:<span>${translators.realName }</span></p>
                          <p class="col-sm-4"><spring:message  code='身份证号'/>:<span>${translators.nameid }</span></p>
                        </div>
                      </div>
                        <div class="basic_data_inp">
                        <div class="row">
                          <p class="col-sm-4"><spring:message  code='银行账号'/>:<span>${translators.accountNumber }</span></p>
                          <p class="col-sm-4"><spring:message  code='开户行'/>:<span>${translators.openingBank }</span></p>
                        </div>
                      </div>
                     
                      <div class="basic_data_inp" style="text-align:center;padding-top:60px;">
                        <a href="" id="editBank"><button type="button" class="btn btn-info"  onclick="editBank()" name="button"><spring:message  code='修改'/></button></a>
                      </div>
                  
                  </div>
                        
                        
                        
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
		window.onload = function startToInsert(){
			$("#trans").trigger("click");
		}
		$(function() {
			$(".cus_iter_navlists a").removeClass("useractive")
	    	  $(".cus_iter_navlists").eq(0).find("a").addClass("useractive")

			$(".checkbox").simpleSwitch({
				"theme" : "FlatCircular"
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
