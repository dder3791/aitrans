<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<title><spring:message code='用户中心-我是客户--我的项目详情' /></title>

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
	href="${pageContext.request.contextPath}/css/interpreter.cards.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/interpreter.show.css">



<script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/public.nav.footer.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.center.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.customer.myneeds.js"></script> --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
<style>
.myneeds_top {
	background: #f1f1f1;
	padding: 30px 20px 20px 30px;
}

.list_padding li {
	padding-right: 145px;
	padding-bottom: 10px;
}
/*左右模块父元素定位*/
     /*  .my_customer_right{display: block;position: relative;} */
      /*左边模块加定宽*/
      .myTabContent{width:941.7px;float: left;}
      /*右边新添加模块*/
      .myTabLeft{width: 180px;float: right;position: absolute;top: 20px;right: 0;}
      .navTab{width: 100%;height: 100%;}
      .navTab li{height: 160px;text-align: center;line-height: 160px;}
</style>
<script type="text/javascript">
	$(function() {
		 if("${clientid.userName}"!='' && "${clientid.userName}"!=null){
	   		 $("#nickname").text('${clientid.userName}'+"<spring:message code=',欢迎您!'/>");
	   	 }else if('${clientid.tel}'!=null && '${clientid.tel}'!=null){
	   		 $("#nickname").text('${clientid.tel}'+"<spring:message code=',欢迎您!'/>");
	   	 }else if('${clientid.emaile}'!=null && '${clientid.emaile}'!=null){
	   		 $("#nickname").text('${clientid.emaile}'+"<spring:message code=',欢迎您!'/>");
	   	 }
		/* var tnickname = "${transid.nickname}";
		var unickname = "${clientid.userName}"
		if (tnickname != "") {
			$("#nickname").text(tnickname + "<spring:message  code='，欢迎您！'/>");

		} else if (unickname != "") {
			$("#nickname").text(unickname + "<spring:message  code='，欢迎您！'/>!");
		} */

	});
</script>
</head>
<body style="background: #f5f5f5;">
	<!--      顶部导航      -->
	<c:if test="${clientid.id!=null || transid.id!=null }">
		<div class="publickNav">
			<div class="public_nav">
				<nav class="container" style="padding: 0 20px;">
					<div class="navbar-left">
			          <a href="/cilentCustomer/lookPublishNeedById.do?id=${clientCustomerNeed.id}&lang=zh_CN" class="navbar-link" onclick="in18(this)">中文</a> | 
			          <a href="/cilentCustomer/lookPublishNeedById.do?id=${clientCustomerNeed.id}&lang=en_US" class="navbar-link" onclick="in18(this)">English</a>
			       </div>
					<a style="padding-left: 50px;" href="/forwardAction/forward_toIndex.do"><spring:message code='首页' /></a>
					<div class="navbar-right">
						<ul class="list-inline nav_lists">
							<li class="nav_lists_li">
								<a href="/ClientUser/clientUserAction_exit.do" class="navbar-link"><spring:message code='退出登录' /></a>
							</li>
							<li class="nav_lists_li">
								<a href="/cilentCustomer/findUI.do" target="_blank" class="navbar-link" style="position: relative;"><spring:message code='用户中心' /></a>
							</li>
							<li class="nav_li_li">
								<a href="javascript:void(0);" class="navbar-link"><font id="nickname"></font></a>
							</li>
						</ul>
					</div>
				</nav>
			</div>
			<div style="height: 35px;"></div>
		</div>
	</c:if>

	<c:if test="${clientid.id==null && transid.id==null }">
		<div class="publickNavs">
			<div class="public_nav">
				<nav class="container" style="padding: 0 20px;">
					<div class="navbar-left">
			          <a href="/cilentCustomer/lookPublishNeedById.do?id=${clientCustomerNeed.id}&lang=zh_CN" class="navbar-link" onclick="in18(this)">中文</a> | 
			          <a href="/cilentCustomer/lookPublishNeedById.do?id=${clientCustomerNeed.id}&lang=en_US" class="navbar-link" onclick="in18(this)">English</a>
			       </div>
					<a style="padding-left: 50px;" href="/forwardAction/forward_toIndex.do"><spring:message code='首页' /></a>
					<a style="padding-left:50px;"><spring:message  code='帮助热线：'/>010-82895385</a><a style="padding-left:50px;" target="_blank" href="http://www.aitrans.org:8081/"><spring:message  code='爱译社'/></a><div class="navbar-right">
						<ul class="list-inline nav_lists">
							<li class="nav_lists_li"><a href="/login.jsp" class="navbar-link"><spring:message code='登录' /></a></li>
							<li class="nav_lists_li"><a href="/register.jsp" class="navbar-link"><spring:message code='注册' /></a></li>
							<li class="nav_lists_li"><a href="/help.center.jsp" class="navbar-link"><spring:message code='帮助中心' /></a></li>
						</ul>
					</div>
				</nav>
			</div>
			<div style="height: 35px;"></div>
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


			<!--    用户中心 我是议员   -->
			<div class="my_customer">
				<div class="row">

					<!--    用户中心 我是议员 左侧导航   -->
					<div class="my_customer_left col-sm-2">
						<ul class="my_customer_ul">
							<li class="cus_iter_navlists">
								<a href="/cilentCustomer/findUI.do"> <spring:message code='个人信息' /></a>
							</li>
							<li class="cus_iter_navlists">
								<a href="/cilentCustomer/myneedsUI.do"><spring:message code='我的项目' /> </a>
							</li>
							<li class="cus_iter_navlists">
								<a href="/cilentCustomer/mywallet.do"> <spring:message code='我的备用金' /></a>
							</li>
							<li class="cus_iter_navlists">
								<a href="/cilentCustomer/myOrdersUI.do"> <spring:message code='我的订单' /> </a>
							</li>
							<li class="cus_iter_navlists">
								<a href="/cilentCustomer/exchangeUI.do"> <spring:message code='积分兑换' /></a>
							</li>
							<li class="cus_iter_navlists">
								<a href="/forwardAction/forward_toCustomerReputation.do"> <spring:message code='我的信誉' /></a>
							</li>
							<!-- <li class="cus_iter_navlists"> <a href="user.customer.ranking.html"> 我的排名 </a> </li>  */
		    /*  <li class="cus_iter_navlists"> <a href="user.customer.myeValuate.html"> 我的评价 </a> </li>  */
		     /*  <li class="cus_iter_navlists"> <a href="javascript:;"> 我的账本 </a> </li> -->
							<li class="cus_iter_navlists">
								<a href="/forwardAction/forward_toCustomerPasswordProtection.do"> <spring:message code='密码保护' /></a>
							</li>
							<li class="cus_iter_navlists">
								<a href="/cilentCustomer/findUI.do?type=password"> <spring:message code='修改密码' /></a>
							</li>
							<li class="cus_iter_navlists">
								<a href="/cilentCustomer/gradeUI.do"> <spring:message code='我的等级' /></a>
							</li>
							<li class="cus_iter_navlists">
								<a href="/forwardAction/forward_toCustomerAgreement.do"> <spring:message code='签订协议' /></a>
							</li>
						</ul>
					</div>

					<!--    用户中心 我是议员 我的需求 右侧内容   -->
					<div class="my_customer_right col-sm-10">
						<!--  用户中心右侧 tab切换栏   -->
						<ul id="suerTab" class="nav nav-tabs">
							<li class="active"><a href="javascript:;" data-toggle="tab"><spring:message code='我的项目' /></a></li>
						</ul>

						<div class="myTabContent" class="tab-content">
							<div class="row">
								<c:if test="${clientCustomerNeed.publishModel!='选定译员模式' }">
								 <div class="demand_left col-sm-9" style="margin-left: 119px">
								</c:if>
								<c:if test="${clientCustomerNeed.publishModel=='选定译员模式' }">
									<div class="demand_left col-sm-9">
								</c:if>
									<!-- 中间快开始 -->
									<div>
										<h4 style="font-weight: 600; padding-bottom: 40px; font-size: 28px;">
											<a style="font-size: 28px;"><spring:message code='我的项目' />-></a> <spring:message code='项目详情' />
										</h4>
									</div>

									<div class="demand_kind demand_name">
										<h4 style="display: inline-block; padding-right: 20px;"> <spring:message code='项目名称：' /> </h4>
										<span style="font-size: 20px;color: blue">${clientCustomerNeed.title }</span>
										<input type="hidden" value="${clientCustomerNeed.id}" id="needid">
										<div class="budget"><br/>
											<div style="width: 50%;float: left;">
												<spring:message code='项目案号：' />
												<span style="color: blue;">${clientCustomerNeed.needReference }</span>
											</div>
											<div style="float: left;">
												<spring:message code='项目状态：' />
												<span style="color: blue;margin-right: 145px"><spring:message code='${clientCustomerNeed.acceptState}' /></span>
											</div>
											<div style="width: 100%;height: 40px;"></div>
											<div style="width: 50%;float: left;">
												<spring:message code='发布模式：' />
												<span style="color: blue">
													<c:if test="${ clientCustomerNeed.publishModel=='主动投标模式'}">
														<spring:message code='招标模式' />
													</c:if> 
													<c:if test="${clientCustomerNeed.publishModel!='主动投标模式'}">
														<spring:message code='${clientCustomerNeed.publishModel}' />
													</c:if>
												</span>
											</div>
											<div style="float: left;">
												<spring:message code='项目类型：' />
												<span style="color: blue;margin-right: 145px">
												<c:if test="${clientCustomerNeed.clientProjectTypeId}==1"><spring:message code='OA翻译' /></c:if>
												<c:if test="${clientCustomerNeed.clientProjectTypeId}==2"><spring:message code='部分全文翻译' /></c:if>
												<c:if test="${clientCustomerNeed.clientProjectTypeId}==3"><spring:message code='摘要翻译' /></c:if>
												<c:if test="${clientCustomerNeed.clientProjectTypeId}==4"><spring:message code='其他' /></c:if>
												<c:if test="${clientCustomerNeed.clientProjectTypeId}==5"><spring:message code='全文翻译' /></c:if>
												</span>
											</div>
											<div style="width: 100%;height: 40px;"></div>
										</div>
										<input type="hidden" value="${clientCustomerNeed.procedureTypeId}" name="procedureTypeId" id="procedureTypeId">
									</div>



									<div class="myneeds_top">
										<ul class="list-inline list_padding">
											<li><spring:message code='项目领域：' /><span id="field"><spring:message code='${field }' /></span></li>
											<li><spring:message code='翻译语言：' /><span id="languagePair"><spring:message code='${clientCustomerNeed.languagePair }' /></span></li></br>
											<li><spring:message code='译员级别：' /><span id="transLevel">${clientCustomerNeed.transLevel }<spring:message code='级' /></span></li>
											<li id="procedureTypeId"><spring:message code='流程类别：' />
												<c:if test="${clientCustomerNeed.procedureTypeId eq '1'}">
													<span><spring:message code='仅翻译' /></span>
												</c:if> 
												<c:if test="${clientCustomerNeed.procedureTypeId eq '2'}">
													<span><spring:message code='翻译校对' /></span>
												</c:if> 
												<c:if test="${clientCustomerNeed.procedureTypeId eq '3'}">
													<span><spring:message code='翻译校对审核' /></span>
												</c:if>
											</li><br/>
											<li><spring:message code='交稿日期：' />
												<span>
													${clientCustomerNeed.completeTime } 23:59:59（<spring:message code="共"/>
													<c:if test="${time<0 }">0</c:if>
													<c:if test="${time>=0 }">${time }</c:if>
													<spring:message code='天' />
													）
												</span>
											</li>
											<%--  <li>手机号：<span>${clientCustomerNeed.tel }</span></li>
		              <li>QQ号：<span>${clientCustomerNeed.qq }</span></li> --%>
										</ul>
									</div>
									<input type="hidden" id="publishModels" name="publishModels" value="${clientCustomerNeed.publishModel }">
									<div class="myneeds_body">
											<div>
												<strong><spring:message code='备注' /></strong>
											</div>
										
											<div style="border: 1px solid #ccc; padding: 30px 20px; position: relative;">
												<p>
													<spring:message code='项目描述：' />
												</p>
												<p class="text-indent">${clientCustomerNeed.description }</p>
											</div>
										<div style="padding-top: 15px;">
											<p>
												<spring:message code='发布时间：' />
												<span style="padding-right: 30px;">${clientCustomerNeed.publishTime }</span>
												<c:if test="${clientid.userType==2 }">
													<spring:message code='客户支付预算：' />
													<span style="color:red">￥${clientCustomerNeed.totalMoney }</span>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<spring:message code='译员收入预算：' />
													<span style="color:red">￥${clientCustomerNeed.transTotal }</span>
												</c:if>
												<c:if test="${clientid.userType!=2 }">
													<spring:message code='预算：' />
													<span style="color:red">￥${clientCustomerNeed.totalMoney }</span>
												</c:if>
												
											</p>
										</div>
										<p style="padding-top: 10px;">
											<spring:message code='有效时间：' />
											<span style="margin-right: 30px;">${clientCustomerNeed.publishTime }—${clientCustomerNeed.completeTime} 23:59:59</span>
											
										</p>
										<div>
											<strong><spring:message code='相关文件' /></strong>
										</div>
									
										<div style="border: 1px solid #ccc; padding: 30px 20px; position: relative;">
											<c:forEach items="${needUserNames }" var="needUserNames">
												<form action="/clientCustomer/downloadTransFile.do" method="post">
													<span style="margin-right: 30px">${needUserNames.key }</span>
													<input type="hidden" name="url" id="url" value="${needUserNames.value }"> 
													<a href="javascript:void();" style="color: red" onclick="down(this)"><spring:message code="下载" /></a>
												</form>
											</c:forEach>
										</div>
									</div>
									
								</div>
								<!-- 中间块结束 -->

								<div class="demand_right col-sm-3">
									<!-- 右边块开始 -->
									<!-- 展示译员 -->
									<c:if test="${clientCustomerNeed.publishModel=='选定译员模式' }">
										<div class="myTabLeft">
											<div id="transDiv">
											<h6 class="control-label" style="display: inline-block">
												<strong><spring:message code='您选择的译员有：' /></strong>
											</h6>
											</div>
						                <ul class="navTab">
						                 <c:forEach items="${transList }" var="trans">
						                  <li class="cards_one" style="width:110px;height: 120px;"><!-- <div class="append_card"> -->
													<p style="margin-left: 15px">
														<span class='card_name' id='nickname'>${trans.nickname }</span>
													</p>
													<p style="margin-left: 15px">
														<spring:message code='等级：' />
														<span id='level'>${clientCustomerNeed.transLevel }<spring:message code='级' /></span>
													</p>
													<p style="margin-left: 15px">
														<spring:message code='语种：' />
														<span id='languages'> <spring:message code='${clientCustomerNeed.languagePair }' /></span>
													</p>
													<div class='append_card_btn' style="margin-top: -60px">
														<a href='/translator/translatorAction_findTransById.do?transId=${trans.id }' class='append_card_btn' id='lookTrans' target="_blank">
															<spring:message code='详情' />
														</a>
													</div>
											<!-- </div> -->
										  </li>
										 </c:forEach>
						                  <!-- <li>two</li>
						                  <li>three</li>
						                  <li>four</li>
						                  <li>five</li> -->
						                </ul>
						              </div>
									</c:if>
									<!-- 展示译员结束 -->
								</div>
								<!-- 右边块结束 -->



							</div>

							<!-- <div align="center" id="chooseTask" > -->

							<!-- </div> -->
							<!-- <div align="right">
                 <button type="button" class="btn btn-default col-sm-2" name="button" onclick="JavaScript:history.back(-1);">返回上一级</button>
                </div> -->
						</div>
					</div>
					<!--    用户中心 我是议员 我的需求 右侧内容 结束   -->

				</div>
				<!--    用户中心 我是议员 结束   -->
			</div>
		</div>
	</div>
	<div id="gradient" class="footer_content">
		<!-- 用户指南  -->
		<div class="messages container">
			<div class="message_more">
				<div class="row"></div>
			</div>

			<ul class="col-sm-2 message_more_li">
				<li><h2>
						<spring:message code='新手指南' />
					</h2></li>
				<li><a
					href="/forwardAction/forward_toRegisterProcess.do"><spring:message
							code='注册流程' /></a></li>
				<li><a
					href="/forwardAction/forward_toRuleDescription.do"><spring:message
							code='规则中心' /></a></li>
				<li><a
					href="/forwardAction/forward_toIdentification.do"><spring:message
							code='用户认证' /></a></li>
			</ul>
			<ul class="col-sm-2 col-sm-offset-1 message_more_li">
				<li><h2>
						<spring:message code='我是客户' />
					</h2></li>
				<li><a
					href="/forwardAction/forward_toCustomerInstructions.do"><spring:message
							code='客户须知' /></a></li>
				<li><a
					href="/forwardAction/forward_toPublishProcess.do"><spring:message
							code='项目发布' /></a></li>
				<li><a href="/forwardAction/forward_toQuality.do"><spring:message
							code='质量控制' /></a></li>
			</ul>
			<ul class="col-sm-2 col-sm-offset-1 message_more_li">
				<li><h2>
						<spring:message code='我是译员' />
					</h2></li>
				<li><a
					href="/forwardAction/forward_toInterpreterTips.do"><spring:message
							code='译员须知' /></a></li>
				<li><a
					href="/forwardAction/forward_toTranslationProcess.do"><spring:message
							code='任务接受' /></a></li>
				<li><a href="/forwardAction/forward_toRemuneration.do"><spring:message
							code='稿酬明细' /></a></li>
			</ul>
			<ul class="col-sm-2 col-sm-offset-1 message_more_li">
				<li><h2>
						<spring:message code='爱译智能' />
						-PAT
					</h2></li>
				<li><a href="/forwardAction/forward_toFunction.do"><spring:message
							code='软件功能介绍' /></a></li>
				<li><a
					href="/forwardAction/forward_toSoftwareTranslation.do"><spring:message
							code='在线视频教学' /></a></li>
				<li><a
					href="/forwardAction/forward_toSoftwareTranslation.do"><spring:message
							code='直接下载' /></a></li>
			</ul>

		</div>

		<!--------  login footer  -------->
		<footer class="container register_footer cl">
			<ul class="list-inline">
				<li><a href="/forwardAction/forward_toTeam.do"><spring:message
							code='关于我们' /></a></li> |
				<li><a href="/forwardAction/forward_toTeam.do"><spring:message
							code='联系方式' /></a></li> |
				<li><a href="http://www.aitrans.net"><spring:message
							code='爱译智能' />-CAT</a></li> |
				<li><a href="javascript:;"><spring:message code='支付方式' /></a></li> |
				<li><a href="http://www.aitrans.org"><spring:message
							code='友情链接' /></a></li> |
				<li><a
					href="/forwardAction/forward_toSecurityCenter.do"><spring:message
							code='安全中心' /></a></li>
			</ul>
			<p class="footer_adress">Copyright 2005-2017 123.com版权所有
				渝ICP备1234567-4号 渝B2-12134567 渝公安网备 1234567890号
				互联网违法和不良信息举报电话：1234567 邮箱：123456.com</p>
		</footer>

	</div>

	<script type="text/javascript">
      $(function(){
        $(".cus_iter_navlists:nth-child(2)").addClass('useractive');
        
      })
      
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
