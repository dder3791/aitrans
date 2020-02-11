<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code='支付 - 环宇爱译翻译平台'/></title>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">	
		<link href="${pageContext.request.contextPath}/css/pay.css" rel="stylesheet">		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/include.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/tqutils.js"></script>
	</head>
	<body>		
		<include src="head.jsp"></include>
		<div class="container" style="margin-top: 10%">
			<div class="ps-header">
			   <c:if test="${type=='weixin' || type eq 'weixin' }">
				<img src="/img/pay_weixin.jpg" width="250px"height="50px" />
			   </c:if>
			   <c:if test="${type=='alibaba' || 'alibaba' eq type }">
				<img src="/img/alipay2.jpg" width="160px"height="50px" />
			   </c:if>
			</div>
			
			<div class="ps-payAlt">
				<div class="ps-payAlt-one"><i></i><spring:message code='交易付款成功'/></div>
				<div class="ps-payAlt-two"><spring:message code='你的货款已经打到卖家'/>
					<c:if test="${type=='weixin' || type eq 'weixin' }">
						<spring:message code='微信'/>
			   		</c:if>
			   		<c:if test="${type=='alibaba' || 'alibaba' eq type }">
						<spring:message code='支付宝'/>
			   		</c:if>
			   		<spring:message code='账户中，请您积极与卖家联系，确保交易顺利完成'/></div>
			</div>
		</div>
			
		<!-- <script type="text/javascript">
			new Include39485748323().replaceIncludeElements();
		
		</script> -->
<div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>