<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
<script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/updateLevel.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
<style type="text/css">
#but button {
	margin-bottom: 5px;
	margin-right: 5px;
}
.col-sm-3 {
	width: 18%;
	float: left;
}

.col-sm-9 {
	width: 82%;
	float: left;
}

label[class^="btn btn-default"] {
	margin-top: -4px;
}
</style>
</head>
<script type="text/javascript">
function closeWin() {
	$("#form").submit();
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
}  
</script>
<body>
	<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
	<form id="form" name="form" class="form-horizontal" method="post"
	action="${pageContext.request.contextPath}/index/indexAction_addVoice.do">
	<section class="panel panel-default">
		<div class="panel-body">
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label"><spring:message  code="姓名"/></label>
				<div class="col-sm-9">
					<input type="text" class="form-control"
						placeholder="<spring:message  code="请输入姓名"/>" name="name" id="name">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label"><spring:message  code="固定电话"/></label>
				<div class="col-sm-9">
					<input type="text" class="form-control existing"
						placeholder="<spring:message  code="请输入固定电话"/>" name="tel" id="tel">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label"><spring:message  code="电子邮件"/></label>
				<div class="col-sm-9">
					<input type="text" class="form-control existing"
						placeholder="<spring:message  code="请输入电子邮件"/>" name="email" id="email">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label"><spring:message  code="留言主题"/></label>
				<div class="col-sm-9">
					<input type="text" class="form-control existing"
						placeholder="<spring:message  code="请输入留言主题"/>" name="voiceTitle" id="voiceTitle">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label"><spring:message  code="留言内容"/></label>
				<div class="col-sm-9">
					<input type="text" class="form-control"
						placeholder="<spring:message  code="请输入留言内容"/>" name="voiceContent" id="voiceContent">
				</div>
			</div>
		</div>
		<footer class="panel-footer text-right bg-light lter">
		<button id="button" type="submit" class="btn btn-success btn-s-xs" onclick="closeWin()"><spring:message  code="提交"/></button>
		</footer> 
	</section>
</form> 
<div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>