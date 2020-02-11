<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name=" Keywords" content="......">      <!--content中，网页关键字-->
    <meta name=" description" content="......">   <!--content中，网页描述文字-->
    <meta name="author" content="......">        <!--标注作者-->
<title><spring:message code='用户中心-我是客户-我的订单详情' /></title>

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


<script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
<script type="text/javascript">
    $(function(){
    	
    	 if("${clientid.userName}"!='' && "${clientid.userName}"!=null){
	   		 $("#nickname").text('${clientid.userName}'+"<spring:message code=',欢迎您!'/>");
	   	 }else if('${clientid.tel}'!=null && '${clientid.tel}'!=null){
	   		 $("#nickname").text('${clientid.tel}'+"<spring:message code=',欢迎您!'/>");
	   	 }else if('${clientid.emaile}'!=null && '${clientid.emaile}'!=null){
	   		 $("#nickname").text('${clientid.emaile}'+"<spring:message code=',欢迎您!'/>");
	   	 }
    	/* var tnickname = "${transid.nickname}";
    	var unickname = "${clientid.userName}";
    	if(tnickname!=""){
    		$("#nickname").text(tnickname+"<spring:message  code=',欢迎您!'/>");
    		
    	}else if (unickname!="") {
    		$("#nickname").text(unickname+"<spring:message  code=',欢迎您!'/>");
    		} */
    });
</script>
<style type="text/css">
.myOrders .table {
	margin-top: 20px;
}

.myOrders .table th {
	text-align: center;
	font-weight: 500;
	vertical-align: middle;
}

.myOrders .table td {
	text-align: center;
	line-height: 1.5;
	vertical-align: middle;
	border-left: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
}

.myOrders .table td:first-child {
	border-left: none;
}

.liuchenglis, .buzoulis, .daylis {
	text-align: center;
}

.liuchenglis span {
	display: inline-block;
	width: 81px;
	padding-bottom: 8px;
}

.buzoulis span {
	display: inline-block;
	width: 25px;
	height: 25px;
	border-radius: 50%;
	text-align: center;
	line-height: 25px;
	border: 1px solid #ddd;
}

.daylis span {
	display: inline-block;
	padding-top: 8px;
	font-size: 12px;
	width: 81px;
}

.buzoubg {
	color: #fff;
	background: #0a9f05;
}

.needdetails>div {
	min-height: 420px;
}

.needdetails h4 {
	font-size: 18px;
	font-weight: 700;
	margin: 20px 0;
}

.needdetails .needdoc {
	border: 1px solid #ddd;
	width: 90%;
	padding: 20px;
	min-height: 400px;
}

.needdetails .needdoc p {
	font-size: 12px;
}

.needdetails .needdoc p:nth-child(2), .needdetails .needdoc p:nth-child(3)
	{
	text-indent: 2em;
}

.downloads li {
	width: 130px;
}

.downloads li a {
	display: inline-bloxk;
	height: 60px;
	padding-left: 10px;
	color: #337ab7;
	vertical-align: bottom;
}

.sureOrder {
	padding: 10px 35px;
	position: absolute;
	left: 50px;
	bottom: 0;
}
#caozuo a:hover{
	color:green;
}
</style>
</head>
<body style="background: #f5f5f5;">
	<!--      顶部导航      -->
  <c:if test="${clientid.id!=null || transid.id!=null }">
	<div class="publickNav">
		<div class="public_nav">
			<nav class="container" style="padding:0 20px;">
				<div class="navbar-left">
					<a href="/cilentCustomer/lookOrderById.do?orderId=${orderImpl.id }&lang=zh_CN" class="navbar-link" onclick="in18(this)">中文</a> | <a href="/cilentCustomer/lookOrderById.do?orderId=${orderImpl.id }&lang=en_US" class="navbar-link" onclick="in18(this)">English</a>
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
				<a href="/cilentCustomer/lookOrderById.do?orderId=${orderImpl.id }&lang=zh_CN" class="navbar-link" onclick="in18(this)">中文</a> | <a href="/cilentCustomer/lookOrderById.do?orderId=${orderImpl.id }&lang=en_US" class="navbar-link" onclick="in18(this)">English</a>
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
				<h2>
					<spring:message code='用户中心' />
				</h2>
			</div>

			<!--    用户中心 我是客户   -->
			<div class="my_customer">
				<div class="row">

					<!--    用户中心 我是客户 左侧导航   -->
					<div class="my_customer_left col-sm-2">
					  <ul class="my_customer_ul">
					   <li class="cus_iter_navlists"> <a href="/forwardAction/forward_toCustomerShow.do"> <spring:message code='个人信息'/> </a> </li>  
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

					<!--    用户中心 我是客户 我的订单 右侧内容   -->
					<div class="my_customer_right col-sm-10">
						<div class="myTabContent" class="tab-content"
							style="margin-top: 0;">
							<h3
								style="padding-bottom: 20px; margin-bottom: 30px; border-bottom: 2px solid #ddd; font-size: 20px; font-weight: 700;">
								<spring:message code='我的订单' />-><spring:message code='订单详情'/>
							</h3>
							<div>
								<ul class="buzoukuai">
									<li class="liuchenglis">
										<span><spring:message code="生成订单" /></span>
										<span><spring:message code="翻译" /></span> 
										<c:if test="${clientCustomerNeed.procedureTypeId>1}">
											<span><spring:message code="校对" /></span>
										</c:if> 
										<c:if test="${clientCustomerNeed.procedureTypeId>2}">
											<span><spring:message code="专家审核" /></span>
										</c:if> 
										<span><spring:message code="已返稿" /></span> 
										<span><spring:message code="客户签收" /></span> 
										<span><spring:message code="客户评价" /></span>
										<span><spring:message code="完成" /></span>
									</li>
									<li class="buzoulis"><span
										<c:if test="${orderImpl.generatedTime!=null && orderImpl.generatedTime!=''}">class="buzoubg"</c:if>>1</span>————
										<span
										<c:if test="${orderImpl.transTime!=null && orderImpl.transTime!=''}">class="buzoubg"</c:if>>2</span>————
										<c:if test="${clientCustomerNeed.procedureTypeId==1 }">
											<span
												<c:if test="${orderImpl.examinationTime!=null && orderImpl.examinationTime!=''}">class="buzoubg"</c:if>>3</span>————
                      <span
												<c:if test="${orderImpl.signTime!=null && orderImpl.signTime!=''}">class="buzoubg"</c:if>>4</span>————
                      <span
												<c:if test="${orderImpl.customerEvaluate!=null && orderImpl.customerEvaluate!=''}">class="buzoubg"</c:if>>5</span>————
                      <span
												<c:if test="${orderImpl.completeTime!=null && orderImpl.completeTime!=''}">class="buzoubg"</c:if>>6</span>
										</c:if>
										<c:if test="${clientCustomerNeed.procedureTypeId==2}">
											<span
												<c:if test="${orderImpl.prooTime!=null && orderImpl.prooTime!=''}">class="buzoubg"</c:if>>3</span>————
                      <span
												<c:if test="${orderImpl.examinationTime!=null && orderImpl.examinationTime!=''}">class="buzoubg"</c:if>>4</span>————
                      <span
												<c:if test="${orderImpl.signTime!=null && orderImpl.signTime!=''}">class="buzoubg"</c:if>>5</span>————
                      <span
												<c:if test="${orderImpl.customerEvaluate!=null && orderImpl.customerEvaluate!=''}">class="buzoubg"</c:if>>6</span>————
                      <span
												<c:if test="${orderImpl.completeTime!=null && orderImpl.completeTime!=''}">class="buzoubg"</c:if>>7</span>
										</c:if>
										<c:if test="${clientCustomerNeed.procedureTypeId==3}">
											<span
												<c:if test="${orderImpl.prooTime!=null && orderImpl.prooTime!=''}">class="buzoubg"</c:if>>3</span>————
                      <span
												<c:if test="${orderImpl.expertTime!=null && orderImpl.expertTime!=''}">class="buzoubg"</c:if>>4</span>————
                      <span
												<c:if test="${orderImpl.examinationTime!=null && orderImpl.examinationTime!=''}">class="buzoubg"</c:if>>5</span>————
                      <span
												<c:if test="${orderImpl.signTime!=null && orderImpl.signTime!=''}">class="buzoubg"</c:if>>6</span>————
                      <span
												<c:if test="${orderImpl.customerEvaluate!=null && orderImpl.customerEvaluate!=''}">class="buzoubg"</c:if>>7</span>————
                      <span
												<c:if test="${orderImpl.completeTime!=null && orderImpl.completeTime!=''}">class="buzoubg"</c:if>>8</span>
										</c:if>
									</li>
									<li class="daylis">
										<span>${orderImpl.generatedTime }</span>
										<span>${orderImpl.transTime }</span>
										<c:if
											test="${clientCustomerNeed.procedureTypeId>1 }">
											<span>${orderImpl.prooTime }</span>
										</c:if> 
										<c:if test="${clientCustomerNeed.procedureTypeId>2 }">
											<span>${orderImpl.expertTime }</span>
										</c:if> 
										<span>${orderImpl.examinationTime }</span>
										<span>${orderImpl.signTime }</span>
										<span>${orderImpl.customerEvaluate }</span>
										<span>${orderImpl.completeTime }</span>
									</li>
								</ul>
							</div>
							<div class="myOrders">
								<table class="table myOrdersTable">
									<tr>
										<th><spring:message code="订单案号" /></th>
										<th><spring:message code="订单标题" /></th>
										<th><spring:message code="译员名" /></th>
										<c:if test="${clientid.userType==2 }">
										<th><spring:message code="译员收入" /></th>
										</c:if>
										<th><spring:message code="客户支付" /></th>
										<th><spring:message code="状态" /></th>
										<th><spring:message code="操作" /></th>
									</tr>
									<tr>
										<td>${orderImpl.orderReference }</td>
										<td>${orderImpl.orderTitle }</td>
										<td>${translator.nickname }</td>
										<c:if test="${clientid.userType==2 }">
										<td>￥${clientCustomerNeed.transTotal }</td>
										</c:if>
										<td>￥${orderImpl.payNumber }<br> <span><c:if
													test="${orderImpl.payState==0 }">
													<spring:message code="未支付" />
												</c:if> <c:if test="${orderImpl.payState!=0 }">
													<spring:message code="已支付" />
												</c:if></span></td>
										<td>
											<span><spring:message code="${orderState.orderState }"/></span><br>
											<c:if test="${orderImpl.signTime!=null && orderImpl.signTime!='' }">
												<spring:message code="已签收" />
											</c:if> 
											<c:if test="${orderImpl.signTime==null || orderImpl.signTime=='' }">
												<c:if test="${orderImpl.taskStateId==5 }">
													<spring:message code="待签收" />
													<%-- <a href='javaScript:okStateButton("y")' style="color: BLUE"><spring:message
															code="签收" /></a>/
               	  	    							<a href='javaScript:okStateButton("n")'
														style="color: BLUE"><spring:message code="拒收" /></a> --%>
												</c:if>
											</c:if>
										</td>
										<td id="caozuo">
											<c:if test="${orderImpl.taskStateId!=9 }">
												<c:if
													test="${(orderImpl.evaluateId==null || orderImpl.evaluateId=='' ) && (orderImpl.signTime!=null && orderImpl.signTime!='')}">
													<a style="color:red;" href="/cilentCustomer/valuateUI.do?orderId=${orderImpl.id }"><spring:message code="前往评价" /></a>
												</c:if>
												<c:if
													test="${orderImpl.evaluateId!=null && orderImpl.evaluateId!=''}">
													<%-- <a href="#" target="_blank"><spring:message code="查看评价" /></a> --%>
												</c:if>
											</c:if>
										</td>
								</table>
							</div>
							<div class="row needdetails">
								<div class="col-sm-6">
									<h4>
										<spring:message code="项目详情" />
									</h4>
									<div class="needdoc">
										<p>
											1、
											<spring:message code="项目描述：" />
										</p>
										<p>${clientCustomerNeed.description }</p>
										<p>
											<spring:message code="客户：" />${clientUser.userName }</p>
										<p>
											2、
											<spring:message code="原稿文件：" />
										</p>
										<c:forEach items="${needUserNames }" var="needUserNames">
											<p>
											<form action="/clientCustomer/downloadTransFile.do" method="post">
												<span style="margin-right: 30px">${needUserNames.key }</span>
												<input type="hidden" name="url" id="url"
													value="${needUserNames.value }"> <a href="#"
													style="color: red" onclick="down(this)"><spring:message
														code="下载" /></a>
											</form>
											</p>
										</c:forEach>


										<!-- <p>预算：待商议</p>
                      <p>工期：待定</p> -->
										<!-- <p>注：在猪八戒网线上交易，对双方都有保障的 <a href="">查看全文</a></p>
                      <p>应用平台：<br>Androidbr <br>ios</p> -->
									</div>

									<!--  <h4>原稿文件</h4> -->
									<!-- <div class="needdoc">
                      
                      <p>预算：待商议</p>
                      <p>工期：待定</p>
                      <p>注：在猪八戒网线上交易，对双方都有保障的 <a href="">查看全文</a></p>
                      <p>应用平台：<br>Androidbr <br>ios</p>
                    </div> -->

								</div>
								<div class="col-sm-6" style="position: relative;">
									<h4>
										<spring:message code="项目文件下载：" />
									</h4>
									<ul class="list-inline transdownloads">
										<li>
											<p>
												<span style="color: BLUE"><spring:message
														code="翻译文件：" /></span>
											</p>
										</li>
										<c:forEach items="${fileTransNames }" var="fileTransName">
											<li>
												<p>
												<form action="/clientCustomer/downloadTransFile.do"
													method="post">
													<span style="margin-right: 30px">${fileTransName.key }</span>
													<input type="hidden" name="url" id="url"
														value="${fileTransName.value }"> <a href="#"
														style="color: red" onclick="down(this)"><spring:message
															code="下载" /></a>
												</form>
												</p>
											</li>
										</c:forEach>
									</ul>
									<ul class="list-inline proofdownloads">
										<li><span style="color: BLUE"><spring:message
													code="校对文件：" /></span></li>
										<c:forEach items="${fileProofNames }" var="fileProofName">
											<li>
												<form action="" method="post">
													<span style="margin-right: 30px">${fileProofName.key }</span>
													<input type="hidden" name="url"
														value="${fileProofName.value }"> <a href="#"
														style="color: red" onclick="down(this)"><spring:message
															code="下载" /></a>
												</form>
											</li>
										</c:forEach>
									</ul>
									<ul class="list-inline auditdownloads">
										<li><span style="color: BLUE"><spring:message
													code="审核文件：" /></span></li>
										<c:forEach items="${fileAuditNames }" var="fileAuditName">
											<li>
												<form action="/clientCustomer/downloadTransFile.do"
													method="post">
													<span style="margin-right: 30px">${fileAuditName.key }</span>
													<input type="hidden" name="url"
														value="${fileAuditName.value }"> <a href="#"
														style="color: red" onclick="down(this)"><spring:message
															code="下载" /></a>
												</form>
											</li>
										</c:forEach>
									</ul>
									<div id="rejectionDIV" style="display: none;">
										<h4>
											<spring:message code="" />
										</h4>
										<select name="rejectionSelect" id="rejectionSelect">
											<option value="缺少翻译文件" selected="selected"><spring:message code="缺少翻译文件" /></option>
											<option value="缺少校对文件"><spring:message code='缺少校对文件' /></option>
											<option value="缺少审核文件"><spring:message code='缺少审核文件' /></option>
										</select>
										<h6>
											<spring:message code="您还想说：" />
										</h6>
										<textarea rows="3" cols="30" id="rejection" name="rejection"></textarea>
										<br> <br>
									</div>
									<div>
										<!-- <span id="isNoOrYes" style="display: none"></span> -->
										<c:if test="${orderImpl.taskStateId==5}">
										<div id="okButtonDIV">
											<button class="btn btn-info" onclick="okButton(${orderImpl.id },'y')" id="buttonOK">
												<spring:message code="签收" />
											</button>
	
											<button class="btn btn-info" onclick="okButton(${orderImpl.id },'n')" id="buttonNO" >
												<spring:message code="拒签" />
											</button>
										</div>
										<div id="backButtonDIV" style="display: none;">
											<button class="btn btn-info isOkRejection" onclick="backButton(${orderImpl.id },'n')" id="buttonNO">
											  <spring:message code="确认拒签" />
										    </button>
										   
										    <button class="btn btn-info isOkRejection" onclick="backButton(${orderImpl.id },'y')" id="buttonNO" >
											  <spring:message code="取消" />
										    </button>
									   </div>
									   </c:if>
									   
									</div>

								</div>
							</div>
						</div>
					</div>
					<!--    用户中心 我是客户 我的订单 右侧内容 结束   -->
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
        $(".cus_iter_navlists").eq(3).find("a").addClass("useractive")
      });
      
      
      //操作分类 拒收 或签收
      function okStateButton(obj){
    	 /*  var buttonNO=document.getElementById("buttonNO");
	  	  var buttonOK=document.getElementById("buttonOK"); */
	  	  //alert(obj);
    	  /* if("y" == obj){//签收
    		  $("#buttonOK").attr("disabled",false);
    		  $('#buttonNO').attr("disabled",true); 
    		  $("#rejectionDIV").hide();
    		 //$("#rejectionDIV").val()='';
    		 $("#isNoOrYes").html("签收")
    	  }
    	  
		  if("n" == obj){//拒收
			  $("#buttonOK").attr("disabled",true);
    		  $('#buttonNO').attr("disabled",false); 
    		  $("#rejectionDIV").show();
    		  $("#isNoOrYes").html("拒收")
    	  } */
      }
      
      
      //客户确认签收/拒收
      function okButton(orderId,okState){
    	  
    	  //防止再次提交
    	  $("#buttonOK").attr("disabled",true);
		  $('#buttonNO').attr("disabled",true); 
    	  //订单Id,分辨签收/拒收okState
    	  var msg="";//提示信息
    	  var canshu="orderId="+orderId+"&okState="+okState;//参数
    	  if("y"==okState){
    		  //签收
    		$.post("${pageContext.request.contextPath}/cilentCustomer/getDeleteMoney.do","orderId="+orderId,function(data){
			/* alert(data.getDeleteMoney); */
			var money=data.getDeleteMoney;
			/* alert(money) */
			layer.open({
			  content: "<spring:message code='签收订单将会扣除相应费用"+money+"元'/><br>请输入密码:<input type='password' id='contentId'>"
			  ,btn: ["<spring:message code='确定'/>", "<spring:message code='取消'/>"]
			  ,btn1: function(index, layero){
			    //按钮【按钮一】的回调
			    layer.close(index);
			    	//var payPassword=getPayPassword();//支付密码是否正确
			    	/* layer.prompt({
				    	 formType: 2,
				    	 title:'',
				    	// content:""
			    	},function(content, index, elem){ */
			    		$.ajax({
		    		    	type: "post",
		    		    	url: "${pageContext.request.contextPath}/cilentCustomer/getPayPassword.do",
		    		    	data: {
		    		    	"payPassword":$("#contentId").val()
		    		    	},
		    		    	
		    		    	success : function(data){
		    		    		if("success"==data.result){
		    		    			layer.close(index);
		    		    			$.post("/cilentCustomer/customerSign.do",canshu+"&money="+money,function(data){
		    		    	    		  if(data.result=='success'){
		    		    					layer.alert("<spring:message code='签收成功，请15天内完成评论！'/>", {
		    		    						icon: 1,
		    		    						title: "<spring:message code='提示'/>",
		    		    						success :window.location.href="/cilentCustomer/lookOrderById.do?orderId="+orderId
		    		    							
		    		    						});
		    		    	    		  }else{
		    		    	    			  layer.alert("<spring:message code='签收失败，再试试！'/>", {
		    		    	  					icon: 5,
		    		    	  					title: "<spring:message code='提示'/>",
		    		    	  					success :window.location.href="/cilentCustomer/lookOrderById.do?orderId="+orderId
		    		    							
		    		    	  					});
		    		    	    		  }
		    		    	    	    },"json")
		    			    	}else{
		    			    		layer.msg("<spring:message code='密码错误！'/>");  
		    			    		$("#buttonOK").attr("disabled",false);
		    			   		  	$('#buttonNO').attr("disabled",false); 
		    			    	}
		    			    	
		    		    	 },
		    		    
		    		    }); 
			    	/* }) */
			    	
			  }
			  ,btn2: function(index, layero){
			    //按钮【按钮二】的回调
			    layer.close(index)
			    $('#buttonNO').attr("disabled",false); 
			    $("#buttonOK").attr("disabled",false);
			    
			    //return false 开启该代码可禁止点击该按钮关闭
			  }
			  ,cancel: function(){ 
			    //右上角关闭回调
			    layer.close(index);
			    //return false 开启该代码可禁止点击该按钮关闭
			    
			    $('#buttonNO').attr("disabled",false); 
			    $("#buttonOK").attr("disabled",false);
			  }
			});
		
		  },'json');//post结束
    		  
   	  }
   	  if("n"==okState){
  		  	  $("#rejectionDIV").show();
  		  	  $("#backButtonDIV").show();
  		  	  $("#okButtonDIV").hide();
  			  //msg="<spring:message code='管理员将会尽快为您解决！'/>" ;
  	    	  //canshu+="&rejection="+$("#rejectionSelect").val()+","+$("#rejection").val(); 
   	  }
   }
      
      
      function backButton(orderId,okState){
    	  $(".btn btn-info isOkRejection").attr("disabled",true);
    	  var msg="";//提示信息
    	  var canshu="orderId="+orderId+"&okState="+okState;//参数
    	  	  
    	//拒收
    	  if("n"==okState){
    		  canshu+="&rejection="+$("#rejectionSelect").val()+","+$("#rejection").val(); 
    		  $.post("/cilentCustomer/customerSign.do",canshu,function(data){
        		  if(data.result=='success'){
    				layer.alert("<spring:message code='管理员将会尽快为您解决！'/>", {
    					icon: 1,
    					title: "<spring:message code='提示'/>",
    					success :window.location.href="/cilentCustomer/lookOrderById.do?orderId="+orderId
    						
    					});
        		  }else{
        			  layer.alert("<spring:message code='拒签失败！'/>", {
      					icon: 5,
      					title: "<spring:message code='提示'/>",
      					success :window.location.href="/cilentCustomer/lookOrderById.do?orderId="+orderId
    						
      					});
        		  }
        	    },"json")
    		  
    	  }
    	//返回签收
    	  if("y"==okState){
   		  	  $("#backButtonDIV").hide();
   		  	  $("#okButtonDIV").show();
    		  
    		  $(".btn btn-info isOkRejection").attr("disabled",true);  
    		  $("#buttonOK").attr("disabled",false);
    		  $('#buttonNO').attr("disabled",false); 
    		  $("#rejectionDIV").hide();
    	  }
      }
      
      
      
      
      function down(obj){
    	  var inputElement=getNearEle(obj, 1);
    	  var spanEle=getNearEle(inputElement,1);
    	  var formEle=inputElement.parentNode;
    	//  alert(inputElement+formEle);
    	   var chan=spanEle.innerHTML.replace("\\","/");
    	  formEle.action="/cilentCustomer/downloadTransFile.do?filename="+spanEle.innerHTML;
    	  formEle.submit();
      }
      
      function getNearEle(ele, type) {
    	  type = type == 1 ? "previousSibling" : "nextSibling";
    	  var nearEle = ele[type];
    	  while(nearEle) {
    	    if(nearEle.nodeType === 1) {
    	      return nearEle;
    	    }
    	    nearEle = nearEle[type];
    	    if(!nearEle) {
    	      break;
    	    }
    	  }
    	  return null;
    	}
    </script>
<div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
