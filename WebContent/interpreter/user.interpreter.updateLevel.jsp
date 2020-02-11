<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
 
 
<script type="text/javascript">
function closeWin() {  
    var formData = new FormData($( "#form" )[0]);  
    $.ajax({  
         url: '${pageContext.request.contextPath}/translator/translatorAction_promoteRank.do' ,  
         type: 'POST',  
         data: formData,  
         async: false,  
         cache: false,  
         contentType: false,  
         processData: false,  
         success: function (returndata) {  
        	 if(returndata=="success"){
                 layer.alert("申请等级提交成功！结果会以短信方式发送到您的手机上！", {
    					icon: 1,
    					title: "<spring:message code='提示'/>",
    					end: function () {
                            var index = parent.layer.getFrameIndex(window.name);
           	                parent.layer.close(index);   
    						}
    					});
            }else{
            	layer.alert("申请等级提交失败！", {
					icon: 1,
					title: "<spring:message code='提示'/>",
					end: function () {
                        var index = parent.layer.getFrameIndex(window.name);
       	                parent.layer.close(index);   
						}
					});
            } 
         },  
    });  
}  
  /*  function closeWin() {
	$("#form").submit();
	 var index = parent.layer.getFrameIndex(window.name);
	  parent.layer.close(index);
	  var message="${message}";
	  alert(message);
  }  */
</script>
</head>
<body>
	<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
	<form id="form" name="form" class="form-horizontal" method="post"
	action="${pageContext.request.contextPath}/translator/translatorAction_promoteRank.do" enctype="multipart/form-data">
	<section class="panel panel-default">
	<div class="line line-dashed line-lg pull-in"></div>
		      <div class="radio" style="margin-left: 20px">
               <label>
              <c:if test="${quotations.tranlevels!=0 }">
              <input type="radio" name="updateLevel" id="transLevel" 
         value="翻译等级" checked> <spring:message  code='翻译等级'/>
             </c:if>
              </label>
               <!-- </div class="radio" style="margin-left: 20px"> -->
                <!-- <div class="radio"> -->
               <label>
               <c:if test="${quotations.proolevels !=0}">
              <input type="radio" name="updateLevel" id="prooLevel" 
         value="校对等级" checked> <spring:message  code='校对等级'/> 
             </c:if>
              </label>
               </div>
                <div class="radio" style="margin-left: 20px">
               <label>
               <c:if test="${quotations.auditlevels !=0}">
              <input type="radio" name="updateLevel" id="auditLevel" 
         value="审核等级" checked><spring:message  code='审核等级'/>
              </c:if>
              </label>
               </div>
			<div class="line line-dashed line-lg pull-in"></div>
			<input type="hidden" name="quotationId" value="${quotations.id}" id="quotationId">
			<div class="form-group">
				<label class="col-sm-3 control-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='申请原因'/></label>
				<div class="col-sm-9">
					<select class="form-control" name="reason" id="reason">
						<option value="翻译经验与等级不符" selected="selected" ><spring:message  code='翻译经验与等级不符'/></option>
						<option value="从事翻译工作时限过长" ><spring:message  code='从事翻译工作时间时限过长'/></option>
						<option value="个人原因"><spring:message  code='个人原因'/></option>
					</select>
				</div>
			</div>
			
			
			<div class="line line-dashed line-lg pull-in"></div>
			
			<div class="form-group" >
				<label class="col-sm-3 control-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='文件上传'/></label>
				<div class="col-sm-9" id="newUpload1" align="left">
					<input type="file" id="file" name="filename"/>
				</div>
				<div  style="margin-right: 130px" align="right">
				</div>
				
			</div>
		<footer class="panel-footer text-right bg-light lter" >
		  
		 <button type="button" class="btn btn-success btn-s-xs" id="sub_submit" onclick="closeWin()" ><spring:message  code='提交'/></button>
		</footer> 
	</section>
	
	 
</form>
<div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>