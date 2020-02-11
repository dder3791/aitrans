<%@ page language="java" buffer="0kb" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
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
    <meta http-equiv="pragma" content="no-cache"> 
	<meta http-equiv="cache-control" content="no-cache"> 
	<meta http-equiv="expires" content="0"> 
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name=" Keywords" content="......">      <!--content中，网页关键字-->
    <meta name=" description" content="......">   <!--content中，网页描述文字-->
    <meta name="author" content="......">        <!--标注作者-->
    <title><spring:message  code='译员中心-我是译员信息内容'/></title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.center.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-select.css">
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/webuploader.css"> --%>
     <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    
    <!-- <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script> -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-form.js"></script>
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/webuploader.min.js"></script> --%>
    <script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
	<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap-select.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/defaults-zh_CN.min.js"></script>
    <script type="text/javascript">
    $(function(){
    	
		
		var domains = "${domains }";
		var arr=domains.split(',');
		$('#domain').selectpicker('val', arr);
    	
    	if('${trans.tranlevels}'==null || '${trans.tranlevels}'==''){
    		$("#transWords").attr("disabled", true);
    		$("#transWords").val("");
    		$("#transWordsDay").attr("disabled", true);
    		$("#transWordsDay").val("");
    		$("#transPrice").attr("disabled", true);
    		$("#transPrice").val("");
    	}
    	if('${trans.proolevels}'==null || '${trans.proolevels}'==''){
    		$("#prooWords").attr("disabled", true);
    		$("#prooWords").val("");
    		$("#prooWordsDay").attr("disabled", true);
    		$("#prooWordsDay").val("");
    		$("#prooPrice").attr("disabled", true);
    		$("#prooPrice").val("");
    	}
    	if('${trans.auditlevels}'==null || '${trans.auditlevels}'==''){
    		$("#auditWords").attr("disabled", true);
    		$("#auditWords").val("");
    		$("#auditWordsDay").attr("disabled", true);
    		$("#auditWordsDay").val("");
    		$("#auditPrice").attr("disabled", true);
    		$("#auditPrice").val("");
    	}
    })
    $.ajaxSetup({ 
    	async : false
    });
    //查看帮助提示
    function overShowTime() {  
        var showDiv = document.getElementById('showDivTime');  
        showDiv.style.left = event.clientX;  
        showDiv.style.top = event.clientY;  
        showDiv.style.display = 'block';  
        showDiv.innerHTML = "<spring:message code='个人资料填写说明'/><br><spring:message code='为了使译员可以更方便的在平台上接受任务'/>，<spring:message code='需要在基本资料中填写详细信息'/>，<spring:message code='并根据自身情况上传翻译资料'/>，<spring:message code='校对资料以及审核资料进行后台人员审核'/>，<spring:message code='译员初步审核通过后就可以填写相关语言对'/>、<spring:message code='翻译价格信息以及原译文信息等必要的报价信息'/>。<spring:message code='如果译员同时兼有校对或审核的能力'/>，<spring:message code='可以上传相应的文件进行后台审核'/>，<spring:message code='审核通过可以对于之前添加的语言信息进行详细增加修改'/>。<spring:message code='(例如：只上传基本个人简历，后台通过评定给予等级，在添加语言只可添加关于翻译的基本相关信息。)'/>";  
    }  
    function outHideTime() {  
        var showDiv = document.getElementById('showDivTime');  
        showDiv.style.display = 'none';  
        showDiv.innerHTML = '';  
    }
    
    function overShowLevel() {  
        var showDiv = document.getElementById('showDivLevel');  
        showDiv.style.left = event.clientX;  
        showDiv.style.top = event.clientY;  
        showDiv.style.display = 'block';  
        showDiv.innerHTML = "<spring:message code='翻译等级说明'/><br>"+
        "<font color='#00FF00'><spring:message code='一级译员：'/>&nbsp;&nbsp;<spring:message code='1年'/></font>&nbsp;&nbsp;<spring:message code='或者'/>&nbsp;&nbsp;&nbsp;&nbsp;<font color='#00FF00'><spring:message code='10万字'/></font>&nbsp;&nbsp;<spring:message code='相关技术领域翻译经验'/><br>"+
        "<font color='#00FF00'><spring:message code='二级译员：'/>&nbsp;&nbsp;<spring:message code='2年'/></font>&nbsp;&nbsp;<spring:message code='或者'/>&nbsp;&nbsp;&nbsp;&nbsp;<font color='#00FF00'><spring:message code='50万字'/></font>&nbsp;&nbsp;<spring:message code='相关技术领域翻译经验'/><br>"+
        "<font color='#00FF00'><spring:message code='三级译员：'/>&nbsp;&nbsp;<spring:message code='3年'/></font>&nbsp;&nbsp;<spring:message code='或者'/>&nbsp;&nbsp;<font color='#00FF00'><spring:message code='100万字'/></font>&nbsp;&nbsp;<spring:message code='相关技术领域翻译经验'/><br>"+
        "<font color='#00FF00'><spring:message code='四级译员：'/>&nbsp;&nbsp;<spring:message code='5年'/></font>&nbsp;&nbsp;<spring:message code='或者'/>&nbsp;&nbsp;<font color='#00FF00'><spring:message code='300万字'/></font>&nbsp;&nbsp;<spring:message code='相关技术领域翻译经验'/><br>"+
        "<font color='#00FF00'><spring:message code='五级译员：'/><spring:message code='10年'/></font>&nbsp;&nbsp;<spring:message code='或者'/>&nbsp;&nbsp;<font color='#00FF00'><spring:message code='800万字'/></font>&nbsp;&nbsp;<spring:message code='相关技术领域翻译经验'/><br>"+
        "ps:<font color='#00FF00'><spring:message code='一级'/></font><spring:message code='与'/><font color='#00FF00'><spring:message code='二级译员'/></font><spring:message code='只在'/><font color='#00FF00'><spring:message code='招标模式'/></font><spring:message code='下可用'/>";  
    }  
    function outHideLevel() {  
        var showDiv = document.getElementById('showDivLevel');  
        showDiv.style.display = 'none';  
        showDiv.innerHTML = '';  
    }
    
    function overShowLevel2() {  
        var showDiv = document.getElementById('showDivLevel2');  
        showDiv.style.left = event.clientX;  
        showDiv.style.top = event.clientY;  
        showDiv.style.display = 'block';  
        showDiv.innerHTML = "<spring:message code='校对等级说明'/><br>"+
        "<font color='#00FF00'><spring:message code='一级校对员：'/>&nbsp;&nbsp;<spring:message code='1年'/></font>&nbsp;&nbsp;<spring:message code='或者'/>&nbsp;&nbsp;&nbsp;&nbsp;<font color='#00FF00'><spring:message code='10万字'/></font>&nbsp;&nbsp;<spring:message code='相关技术领域校对经验'/><br>"+
        "<font color='#00FF00'><spring:message code='二级校对员：'/>&nbsp;&nbsp;<spring:message code='2年'/></font>&nbsp;&nbsp;<spring:message code='或者'/>&nbsp;&nbsp;&nbsp;&nbsp;<font color='#00FF00'><spring:message code='50万字'/></font>&nbsp;&nbsp;<spring:message code='相关技术领域校对经验'/><br>"+
        "<font color='#00FF00'><spring:message code='三级校对员：'/>&nbsp;&nbsp;<spring:message code='3年'/></font>&nbsp;&nbsp;<spring:message code='或者'/>&nbsp;&nbsp;<font color='#00FF00'><spring:message code='100万字'/></font>&nbsp;&nbsp;<spring:message code='相关技术领域校对经验'/><br>"+
        "<font color='#00FF00'><spring:message code='四级校对员：'/>&nbsp;&nbsp;<spring:message code='5年'/></font>&nbsp;&nbsp;<spring:message code='或者'/>&nbsp;&nbsp;<font color='#00FF00'><spring:message code='300万字'/></font>&nbsp;&nbsp;<spring:message code='相关技术领域校对经验'/><br>"+
        "<font color='#00FF00'><spring:message code='五级校对员：'/><spring:message code='10年'/></font>&nbsp;&nbsp;<spring:message code='或者'/>&nbsp;&nbsp;<font color='#00FF00'><spring:message code='800万字'/></font>&nbsp;&nbsp;<spring:message code='相关技术领域校对经验'/><br>"+
        "ps:<font color='#00FF00'><spring:message code='一级'/></font><spring:message code='与'/><font color='#00FF00'><spring:message code='二级校对员'/></font><spring:message code='只在'/><font color='#00FF00'><spring:message code='招标模式'/></font><spring:message code='下可用'/>";  
    }  
    function outHideLevel2() {  
        var showDiv = document.getElementById('showDivLevel2');  
        showDiv.style.display = 'none';  
        showDiv.innerHTML = '';  
    }
    
    function overShowLevel3() {  
        var showDiv = document.getElementById('showDivLevel3');  
        showDiv.style.left = event.clientX;  
        showDiv.style.top = event.clientY;  
        showDiv.style.display = 'block';  
        showDiv.innerHTML = "<spring:message code='审核等级说明'/><br>"+
        "<font color='#00FF00'><spring:message code='一级审核员：'/>&nbsp;&nbsp;<spring:message code='1年'/></font>&nbsp;&nbsp;<spring:message code='或者'/>&nbsp;&nbsp;&nbsp;&nbsp;<font color='#00FF00'><spring:message code='10万字'/></font>&nbsp;&nbsp;<spring:message code='相关技术领域审核经验'/><br>"+
        "<font color='#00FF00'><spring:message code='二级审核员：'/>&nbsp;&nbsp;<spring:message code='2年'/></font>&nbsp;&nbsp;<spring:message code='或者'/>&nbsp;&nbsp;&nbsp;&nbsp;<font color='#00FF00'><spring:message code='50万字'/></font>&nbsp;&nbsp;<spring:message code='相关技术领域审核经验'/><br>"+
        "<font color='#00FF00'><spring:message code='三级审核员：'/>&nbsp;&nbsp;<spring:message code='3年'/></font>&nbsp;&nbsp;<spring:message code='或者'/>&nbsp;&nbsp;<font color='#00FF00'><spring:message code='100万字'/></font>&nbsp;&nbsp;<spring:message code='相关技术领域审核经验'/><br>"+
        "<font color='#00FF00'><spring:message code='四级审核员：'/>&nbsp;&nbsp;<spring:message code='5年'/></font>&nbsp;&nbsp;<spring:message code='或者'/>&nbsp;&nbsp;<font color='#00FF00'><spring:message code='300万字'/></font>&nbsp;&nbsp;<spring:message code='相关技术领域审核经验'/><br>"+
        "<font color='#00FF00'><spring:message code='五级审核员：'/><spring:message code='10年'/></font>&nbsp;&nbsp;<spring:message code='或者'/>&nbsp;&nbsp;<font color='#00FF00'><spring:message code='800万字'/></font>&nbsp;&nbsp;<spring:message code='相关技术领域审核经验'/><br>"+
        "ps:<font color='#00FF00'><spring:message code='一级'/></font><spring:message code='与'/><font color='#00FF00'><spring:message code='二级审核员'/></font><spring:message code='只在'/><font color='#00FF00'><spring:message code='招标模式'/></font><spring:message code='下可用'/>";  
    }  
    function outHideLevel3() {  
        var showDiv = document.getElementById('showDivLevel3');  
        showDiv.style.display = 'none';  
        showDiv.innerHTML = '';  
    }
    
    function selectTransLevel(){
    	if($("#transLevel").val() == null || $("#transLevel").val() == ''){
    		$("#transWords").attr("disabled", true);
    		$("#transWords").val("");
    		$("#transWordsDay").attr("disabled", true);
    		$("#transWordsDay").val("");
    		$("#transPrice").attr("disabled", true);
    		$("#transPrice").val("");
    	}else{
    		$("#transWords").attr("disabled", false);
    		$("#transWordsDay").attr("disabled", false);
    		$("#transPrice").attr("disabled", false);
    	}
    }
    
    function selectProoLevel(){
    	if($("#prooLevel").val() == null || $("#prooLevel").val() == ''){
    		$("#prooWords").attr("disabled", true);
    		$("#prooWords").val("");
    		$("#prooWordsDay").attr("disabled", true);
    		$("#prooWordsDay").val("");
    		$("#prooPrice").attr("disabled", true);
    		$("#prooPrice").val("");
    	}else{
    		$("#prooWords").attr("disabled", false);
    		$("#prooWordsDay").attr("disabled", false);
    		$("#prooPrice").attr("disabled", false);
    	}
    }
    
    function selectAuditLevel(){
    	if($("#auditLevel").val() == null || $("#auditLevel").val() == ''){
    		$("#auditWords").attr("disabled", true);
    		$("#auditWords").val("");
    		$("#auditWordsDay").attr("disabled", true);
    		$("#auditWordsDay").val("");
    		$("#auditPrice").attr("disabled", true);
    		$("#auditPrice").val("");
    	}else{
    		$("#auditWords").attr("disabled", false);
    		$("#auditWordsDay").attr("disabled", false);
    		$("#auditPrice").attr("disabled", false);
    	}
    }
	
    
    /* function checkPhone(){
		var oldtel=$("#oldTel").val();
	 	var tel=$("#tel").val();
	 	var myreg =/^1[34578]\d{9}$/;
	  	if(tel!=null && tel!=''){
	  		if(!myreg.test(tel)){
	  			layer.msg("<spring:message code='手机号格式错误'/>",{icon:2});	
	  			$("#tel").val(oldtel);
	  			return false;
	  		}else if(tel!=oldtel){
	          	$.post("/translator/translatorAction_checkPapers.do","tel="+tel+"&type="+"checkphone",function(data){
	        	  	if(data.result=="success"){
	        		  	var message="<spring:message  code='手机号可以使用！'/>"
	        			layer.msg(message, {icon: 1});
	        		  	return true;
	               }else{
	                 	var message="<spring:message  code='手机号已存在！'/>"
	                  	layer.msg(message, {icon: 5});
	                    $("#tel").val(oldtel);
	                    return false;
	               }
	        	    
	          },"json");
    	  }else{
    		  return true;
    	  }
	  	}else{
	  		layer.msg("<spring:message code='手机号不能为空！'/>",{icon:2});
	  		$("#tel").val(oldtel);
	  		return false;
	  	} 
 	}
    
    function checkMail(){
		var oldMail=$("#oldMail").val();
	 	var mail=$("#mail").val();
	 	var myreg =/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
	  	if(mail!=null && mail!=''){
	  		if(!myreg.test(mail)){
	  			layer.msg("<spring:message code='邮箱格式错误'/>",{icon:2});	
	  			$("#mail").val(oldMail);
	  			return false;
	  		}else if(mail!=oldMail){
	          	$.post("/translator/translatorAction_checkPapers.do","email="+mail+"&type="+"checkemail",function(data){
	        	  	if(data.result=="success"){
	        		  	var message="<spring:message  code='邮箱可以使用！'/>"
	        			layer.msg(message, {icon: 1});
	        		  	return true;
	               }else{
	                 	var message="<spring:message  code='邮箱已存在！'/>"
	                  	layer.msg(message, {icon: 5});
	                    $("#mail").val(oldMail);
	                    return false;
	               }
	        	    
	          },"json");
    	  }else{
    		  return true;
    	  }
	  	}else{
	  		return true;
	  	}
 	}
    
    function checkNickname(){
    	var nickname = $("#incknameInput").val();
    	var oldnickname = $("#oldnickname").val();
    	if(nickname == null || nickname == ''){
    		layer.msg("<spring:message code='请输入昵称！'/>",{icon:2});
    		return false;
    	}else{
    		if(nickname.length > 32 || nickname.length < 2){
    			layer.msg("<spring:message code='请输入长度为2~32位的昵称！'/>",{icon:2});
    			return false;
    		}else if(nickname != oldnickname){
    			$.post("/translator/checkNickname.do","nickname="+nickname,function(data){
    				if(data.result=="success"){
    	        		layer.msg("<spring:message  code='昵称可用！'/>", {icon: 1});
    					return true;
    				}else{
    	                layer.msg("<spring:message  code='昵称已存在！'/>", {icon: 5});
    	                return false;
    				}
    			});
    		}else{
    			return true;
    		}
    	}
    }*/
    
    /* function checkSubmit(){
    	var language = $("#language").val();
    	var domains = $("#domain").val();
    	var transLevel = $("#transLevel").val();
    	var file0 = $("#file0").val();
    	var file1 = $("#file1").val();
    	var file2 = $("#file2").val();
    	var file3 = $("#file3").val();
    	if(language == null || language == ''){
    		layer.msg("<spring:message  code='请选择语言！'/>",{icon:2});
    		return false;
    	}else if(domains == null || domains == ''){
    		layer.msg("<spring:message  code='请至少选择一个领域！'/>",{icon:2});
    		return false;
    	}else if(transLevel == null || transLevel == ''){
    		layer.msg("<spring:message  code='翻译等级不能为空！'/>",{icon:2});
    		return false;
    	}
    	if(file0 != null || file0 != ''){
    		if((file1 == null || file1 == '') && (file2 == null || file2 == '') && (file3 == null || file3 == '')){
        		layer.msg("<spring:message  code='请至少上传一个申请资料'/>",{icon:2});
        		return false;
        	}else{
        		return true;
        	}
    	}else{
    		layer.msg("<spring:message  code='请上传个人简历'/>",{icon:2});
    		return false;
    	}
    } 
    
    function upfile(i){
    	if(i==0){
    		var file0 = $("#file0").val();
    		var start = file0.lastIndexOf('\\');
    		var fileName = file0.slice(start+1,file0.length);
    		$("#PF").html(fileName);
    	}
    	if(i==1){
    		var file1 = $("#file1").val();
    		var start = file1.lastIndexOf('\\');
    		var fileName = file1.slice(start+1,file1.length);
    		$("#FY").html(fileName);
    	}else if(i==2){
    		var file2 = $("#file2").val();
    		var start = file2.lastIndexOf('\\');
    		var fileName = file2.slice(start+1,file2.length);
    		$("#JD").html(fileName);
    	}else{
    		var file3 = $("#file3").val();
    		var start = file3.lastIndexOf('\\');
    		var fileName = file3.slice(start+1,file3.length);
    		$("#SH").html(fileName);
    	}
    }
    
    function selectDoamins(){
    	var id = $("#transID").val();
    	var language = $("#language").val();
    	$.post("/translator/getDomainsByLanguage.do","id="+id+"&language="+language,function(data){
    		var ctrl2=document.getElementById("domain");
    	    for(var i=0;i<ctrl2.options.length;) 
    	    { 
    	        ctrl2.removeChild(ctrl2.options[i]); 
    	    }
    	    for(var i = 0; i < data.length; i++){
    	    	$('#domain').append("<option value='"+data[i]+"'><spring:message  code='"+data[i]+"'/></option>");
    	    }
    	    $('#domain').selectpicker('refresh');  
            $('#domain').selectpicker('render'); 
    	},"json");
    } */
    
    //上传个人头像信息
    function uploadPic(obj){
    		var maxsize =2*1024*1024*1024;//2M
            var size=obj.files[0].size;
    		fileExt=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
    		if(fileExt!='.jpg' && fileExt!=".png" && fileExt !=".gif" && fileExt !=".bmp"){
                 layer.open({
     				  title: '<spring:message  code="提示"/>',
     				  content: '<spring:message code="上传只支持格式为："/>jpg、JPG、gif、GIF、png、PNG、bmp、BMP',
       		 });
    		}else if(size>maxsize){
    			 layer.open({
    				  title: '<spring:message  code="提示"/>',
    				  content: '<spring:message code="图片大小不能大于3M"/>',
      		 });
            }else{
            // 上传设置  
            var options = {  
            		 // 请求方式  
            		type: "post", 
                    // 规定把请求发送到那个URL  
                    url: "/translator/uploadUtils.do",  
                    // 服务器响应的数据类型  
                    dataType: "json",  
                    // 请求成功时执行的回调函数  
                    success: function(data, status, xhr) {
                    	if(status =="success"){
                    		 layer.open({
                  				  title: '<spring:message  code="提示"/>',
                  				  content: '<spring:message  code="修改成功！"/>',
                    		 });
           		 
                    	}else{
                       	 layer.open({
                			   title: '<spring:message  code="提示"/>'
                			    ,content: '<spring:message  code="修改失败！"/>'
                		    }); 
                      }
                        // 图片显示地址  
                        $("#allUrl").attr("src", data.path); 
                        } 
            };  
            $("#uploadform").ajaxSubmit(options);  
             }
    }
</script>
	<style type="text/css">
		.rowlabel-right {
			text-align: right;
			line-height: 35px;
			padding: 1px;
			margin-bottom: 0px;
		}
		.rowlabel-center {
			text-align: center;
			line-height: 35px;
			padding: 1px;
			margin-bottom: 0px;
		}
		.rowlabel-left {
			text-align: left;
			line-height: 35px;
			padding: 1px;
			margin-bottom: 0px;
		}
		.row {
		    width:100%;
		    margin:40px 0 0 0;
		}
		.rowborder{
			border: 1px solid #777;
			border-radius:5px;
		}
		
		.checkbox { position: relative; height: 30px; } 
		.checkbox input[type='checkbox'] { position: absolute; left: 0; top: 0; width: 20px; height: 20px; opacity: 0; }
		.checkbox label { position: absolute; left: 30px; top: 0; height: 20px; line-height: 20px; } 
		.checkbox label:before { content: ''; position: absolute; left: -30px; top: 0; width: 20px; height: 20px; border: 1px solid #ddd; border-radius: 50%; transition: all 0.3s ease; -webkit-transition: all 0.3s ease; -moz-transition: all 0.3s ease; } 
		.checkbox label:after { content: ''; position: absolute; left: -22px; top: 3px; width: 6px; height: 12px; border: 0; border-right: 1px solid #fff; border-bottom: 1px solid #fff; background: #fff; transform: rotate(45deg); -webkit-transform: rotate(45deg); -moz-transform: rotate(45deg); -ms-transform: rotate(45deg); transition: all 0.3s ease; -webkit-transition: all 0.3s ease; -moz-transition: all 0.3s ease; } 
		.checkbox input[type='checkbox']:checked + label:before { background: #4cd764; border-color: #4cd764; } 
		.checkbox input[type='checkbox']:checked + label:after { background: #4cd764; }
	</style>
   </head>
  <body style="background:#f5f5f5;">
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
            <div class="my_interpreter_left col-sm-2" style="margin-left:0">
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
              <div class="" >
                <ul id="suerTab" class="nav nav-tabs">
                  <li class="active"><a href="#basicdata" data-toggle="tab"><spring:message  code='修改翻译资格'></spring:message></a></li>
                </ul>
              </div>
                <!--  tab面板对应内容   -->
                <div class="myTabContent tab-content">
                	<a href="javascript:;" onmouseover="overShowTime()" onmouseout="outHideTime()" style="margin-left: 780px"><font color="red"><b><spring:message  code='查看帮助'/>?</b></font></a>
               		<div id="showDivTime" style="color:#fff;z-index: 999;display:none;position: absolute; background-color:#3a3f51; border: 1px solid #ccc;margin-left:45%;width:45%;text-align: center;border-radius:10px;padding:10px;"></div>
               		
               		
               		<div class="tab-pane fade in active" id="basicdata" style="background-color: #fff;height:800px;;width:100%;margin-top:20px;">
               			<div style="height:100%;width:95%;float:left;">
               				<form action="<%=basePath%>/translator/updateLanguage.do" method="post">
	               				<div class="row" style="margin-top:0">
	               					<label class="rowlabel-left" style="font-size: 17px;color: #0000AA;"><spring:message  code='修改翻译资格'/></label>
	               				</div>
	               				<input type="hidden" name="id" id="transID" value="${id }">
	               				<div class="row">
	               					<label class="col-xs-2 rowlabel-right"><font color="red">*</font><spring:message  code='语言：'/></label>
	               					<div class="col-xs-4">
	               						<input value="${language }" class='form-control' name="language" id="language" readonly="readonly">
	               					</div>
	               					<label class="col-xs-2 rowlabel-right"><font color="red">*</font><spring:message  code='领域：'/></label>
	               					<div class="col-xs-4">
	               						<select class="selectpicker form-control" multiple data-live-search="false" data-actions-box="true" name="domain" id="domain">
							                <option value="日常"><spring:message  code="日常"/></option>
							                <option value="机械"><spring:message  code="机械"/></option>
							                <option value="电子"><spring:message  code="电子"/></option>
							                <option value="电器"><spring:message  code="电器"/></option>
							                <option value="机电"><spring:message  code="机电"/></option>
							                <option value="自动化"><spring:message  code="自动化"/></option>
							                <option value="计算机"><spring:message  code="计算机"/></option>
							                <option value="通讯"><spring:message  code="通讯"/></option>
							                <option value="网络"><spring:message  code="网络"/></option>
							                <option value="物理"><spring:message  code="物理"/></option>
							                <option value="化学"><spring:message  code="化学"/></option>
							                <option value="化工"><spring:message  code="化工"/></option>
							                <option value="医药"><spring:message  code="医药"/></option>
							                <option value="生化"><spring:message  code="生化"/></option>
	               						</select>
	               					</div>
	               					<%-- <label class="col-xs-2 rowlabel-right"><font color="red">*</font><spring:message  code='领域：'/></label>
	               					<div class="col-xs-4">
	               						<input value="${domains }" class="form-control" name="domain" id="domain" readonly="readonly">
	               					</div> --%>
	               				</div>
	               				<div class="row">
	               					<label class="col-xs-2 rowlabel-right"><font color="red">*</font><spring:message  code='翻译等级：'/></label>
	               					<div class="col-xs-2">
	               						<select class="form-control" name="transLevel" id="transLevel" onchange="selectTransLevel()" onmouseover="overShowLevel()" onmouseout="outHideLevel()">
	               							<option value=""><spring:message  code="请选择"/></option>
	               							<option value="1" <c:if test="${trans.tranlevels == 1 }">selected = "selected"</c:if>>1</option>
	               							<option value="2" <c:if test="${trans.tranlevels == 2 }">selected = "selected"</c:if>>2</option>
	               							<option value="3" <c:if test="${trans.tranlevels == 3 }">selected = "selected"</c:if>>3</option>
	               							<option value="4" <c:if test="${trans.tranlevels == 4 }">selected = "selected"</c:if>>4</option>
	               							<option value="5" <c:if test="${trans.tranlevels == 5 }">selected = "selected"</c:if>>5</option>
	               						</select>
	               					</div>
	               					<label class="col-xs-2 rowlabel-right"><spring:message  code='校对等级：'/></label>
	               					<div class="col-xs-2">
	               						<select class="form-control" name="prooLevel" id="prooLevel" onchange="selectProoLevel()" value="${trans.proolevels }" onmouseover="overShowLevel2()" onmouseout="outHideLevel2()">
	               							<option value=""><spring:message  code="请选择"/></option>
	               							<option value="1" <c:if test="${trans.proolevels == 1 }">selected = "selected"</c:if>>1</option>
	               							<option value="2" <c:if test="${trans.proolevels == 2 }">selected = "selected"</c:if>>2</option>
	               							<option value="3" <c:if test="${trans.proolevels == 3 }">selected = "selected"</c:if>>3</option>
	               							<option value="4" <c:if test="${trans.proolevels == 4 }">selected = "selected"</c:if>>4</option>
	               							<option value="5" <c:if test="${trans.proolevels == 5 }">selected = "selected"</c:if>>5</option>
	               						</select>
	               					</div>
	               					<label class="col-xs-2 rowlabel-right"><spring:message  code='审核等级：'/></label>
	               					<div class="col-xs-2">
	               						<select class="form-control" name="auditLevel" id="auditLevel" onchange="selectAuditLevel()" value="${trans.auditlevels }" onmouseover="overShowLevel3()" onmouseout="outHideLevel3()">
	               							<option value=""><spring:message  code="请选择"/></option>
	               							<option value="1" <c:if test="${trans.auditlevels == 1 }">selected = "selected"</c:if>>1</option>
	               							<option value="2" <c:if test="${trans.auditlevels == 2 }">selected = "selected"</c:if>>2</option>
	               							<option value="3" <c:if test="${trans.auditlevels == 3 }">selected = "selected"</c:if>>3</option>
	               							<option value="4" <c:if test="${trans.auditlevels == 4 }">selected = "selected"</c:if>>4</option>
	               							<option value="5" <c:if test="${trans.auditlevels == 5 }">selected = "selected"</c:if>>5</option>
	               						</select>
	               					</div>
	               				</div>
	               				<%-- <div class="row">
	               					<label class="col-xs-3 rowlabel-right"><a href="javascript:;" onmouseover="overShowLevel()" onmouseout="outHideLevel()"><font color="red"><spring:message  code='等级说明'/></font></a></label>
	               				</div> --%>
	               				
	               				<div id="showDivLevel" style="color:white;z-index: 999;display:none;position: absolute;margin-top:10px; background-color: #4169E1; border: 1px solid #4169E1;margin-left:0;width:45%;text-align: center;border-radius:10px;padding:10px;"></div>
	               				<div id="showDivLevel2" style="color:white;z-index: 999;display:none;position: absolute;margin-top:10px; background-color: #4169E1; border: 1px solid #4169E1;margin-left:30%;width:45%;text-align: center;border-radius:10px;padding:10px;"></div>
	               				<div id="showDivLevel3" style="color:white;z-index: 999;display:none;position: absolute;margin-top:10px; background-color: #4169E1; border: 1px solid #4169E1;margin-left:50%;width:45%;text-align: center;border-radius:10px;padding:10px;"></div>
	               				
	               				<div class="row">
	               					<label class="col-xs-2 rowlabel-right"><spring:message  code='翻译总字数：'/></label>
	               					<div class="col-xs-2">
	               						<input class="form-control" type="text" name="transWords" value="${trans.majorTotal }" id="transWords" placeholder="<spring:message  code="万字"/>">
	               					</div>
	               					<label class="col-xs-2 rowlabel-right"><spring:message  code='校对总字数：'/></label>
	               					<div class="col-xs-2">
	               						<input class="form-control" type="text" name="prooWords" value="${trans.prooTotal }" id="prooWords" placeholder="<spring:message  code="万字"/>">
	               					</div>
	               					<label class="col-xs-2 rowlabel-right"><spring:message  code='审核总字数：'/></label>
	               					<div class="col-xs-2">
	               						<input class="form-control" type="text" name="auditWords" value="${trans.auditTotal }" id="auditWords" placeholder="<spring:message  code="万字"/>">
	               					</div>
	               				</div>
	               				
	               				<div class="row">
	               					<label class="col-xs-2 rowlabel-right"><spring:message  code='日翻译字数：'/></label>
	               					<div class="col-xs-2">
	               						<input class="form-control" type="text" name="transWordsDay" value="${trans.dayTrans }" id="transWordsDay" placeholder="<spring:message  code="字"/>">
	               					</div>
	               					<label class="col-xs-2 rowlabel-right"><spring:message  code='日校对字数：'/></label>
	               					<div class="col-xs-2">
	               						<input class="form-control" type="text" name="prooWordsDay" value="${trans.dayProo }" id="prooWordsDay" placeholder="<spring:message  code="字"/>">
	               					</div>
	               					<label class="col-xs-2 rowlabel-right"><spring:message  code='日审核字数：'/></label>
	               					<div class="col-xs-2">
	               						<input class="form-control" type="text" name="auditWordsDay" value="${trans.dayAudit }" id="auditWordsDay" placeholder="<spring:message  code="字"/>">
	               					</div>
	               				</div>
	               				
	               				<div class="row" style="margin-top: 0px;">
	               					<label class="col-xs-2 rowlabel-left" style="color:red;"><spring:message  code='期望酬金:'/></label>
	               				</div>
	               				
	               				<div class="row" style="margin-top: 0px;">
	               					<label class="col-xs-2 rowlabel-right"><spring:message  code='翻译酬金：'/></label>
	               					<div class="col-xs-2">
	               						<input class="form-control" type="text" style="color:red;" value="${trans.wantTranPrice }" name="transPrice" id="transPrice" placeholder="<spring:message  code="元/千字"/>">
	               					</div>
	               					<label class="col-xs-2 rowlabel-right"><spring:message  code='翻译校对酬金：'/></label>
	               					<div class="col-xs-2">
	               						<input class="form-control" type="text" style="color:red;" value="${trans.wantProoPrice }" name="prooPrice" id="prooPrice" placeholder="<spring:message  code="元/千字"/>">
	               					</div>
	               					<label class="col-xs-2 rowlabel-right"><spring:message  code='翻译校对审核酬金：'/></label>
	               					<div class="col-xs-2">
	               						<input class="form-control" type="text" style="color:red;" value="${trans.wantAuditPrice }" name="auditPrice" id="auditPrice" placeholder="<spring:message  code="元/千字"/>">
	               					</div>
	               				</div>
	               				
	               				<div class="row">
	               					<label class="col-xs-2 rowlabel-right"><spring:message  code='原文：'/></label>
	               					<div class="col-xs-10">
	               						<textarea class="form-control" rows="5" name="orignalEssay" id="orignalEssay">${trans.worksOrigin }</textarea>
	               					</div>
	               				</div>
	               				
	               				<div class="row">
	               					<label class="col-xs-2 rowlabel-right"><spring:message  code='译文：'/></label>
	               					<div class="col-xs-10">
	               						<textarea class="form-control" rows="5" name="transEssay" id="transEssay">${trans.worksTarget }</textarea>
	               					</div>
	               				</div>
	               				
	               				<div class="row">
									<div class="col-xs-12" style="text-align: right;">
										<a href="/translator/translatorAction_findTrans.do?page=addQuo">
											<input class="btn btn-info" type="button" value="<spring:message  code='返回'/>">
										</a>
										<input class="btn btn-info" type="submit" style="margin-left: 50px;" value="<spring:message  code='修改'/>">
									</div>
	               				</div>
               				</form>
               			</div>
               			
               			
               			<%-- <div style="height:100%;width:20%;float:left;background-color: #fff;">
               				<div class="row">
               					<div class="file_head" style="margin-top:30px;">
                        			<h4><spring:message  code='用户头像'/></h4>
                        			<c:if test="${translators.userUrl!=null && translators.userUrl!='' }">
                       	 	 			<img style="margin-left:15px;" src="${translators.userUrl}" alt="" width="100" height="100" id="allUrl" alt="">
                       	 			</c:if>
                       	 			<c:if test="${translators.userUrl ==null || translators.userUrl=='' }">
                       	 	 			<img style="margin-left:15px;" src="/img/tuxiang.jpg" alt="" width="100" height="100" >
                       	 			</c:if>
                        			<form id="uploadform"  enctype="multipart/form-data"  method="post" action="/translator/uploadUtils.do" >
                        				<div class="file_span">
                          					<input type="file" id="headFile"  name="file"   onchange="uploadPic(this)">
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
               			</div> --%>
               		</div>
               		
               		
               		
               		
                  <%-- <div class="tab-pane fade in active" id="basicdata" style="padding:50px 60px 80px 40px;">
                    <h4><spring:message  code='基本资料'/></h4>
                      <input type="hidden" value="${translators.id}" name="transId" id="transId">
                    <div class="basic_data">
                      <div class="basic_data_inp">
                        <div class="row">
                          <p class="col-sm-4"><spring:message  code='昵称：'/><span>${translators.nickname }</span></p>
                          <p class="col-sm-4"><spring:message  code='身份证号：'/><span>${translators.nameid }</span></p>
                        </div>
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
                          <p class="col-sm-4"><spring:message  code='是否通过翻译：'/>
                          <input type="hidden" value="${translators.isVerifty }" id="isVeriftys">
                          <span>
                          	<c:if test="${translators.isVerifty==0 }"><spring:message  code='未审核'/></c:if>
                           <c:if test="${translators.isVerifty==1 }"><spring:message  code='正在审核'/></c:if>
                          	<c:if test="${translators.isVerifty==2 }"><spring:message  code='审核通过'/></c:if>
                          	</span>
                          </p>
                        </div>
                      </div>
                      <div class="basic_data_inp">
                       <div class="row">
                      <p class="col-sm-4"><spring:message  code='是否通过校对：'/>
                          <input type="hidden" value="${translators.isProofread }" id="isProofread">
                          <span>
                          	<c:if test="${translators.isProofread==0 }"><spring:message  code='未审核'/></c:if>
                           <c:if test="${translators.isProofread==1 }"><spring:message  code='正在审核'/></c:if>
                          	<c:if test="${translators.isProofread==2 }"><spring:message  code='审核通过'/></c:if>
                          	</span>
                          </p>
                          <p class="col-sm-4"><spring:message  code='是否通过审核：'/>
                          <input type="hidden" value="${translators.isAudit }" id="isAudit">
                          <span>
                          	<c:if test="${translators.isAudit==0 }"><spring:message  code='未审核'/></c:if>
                           <c:if test="${translators.isAudit==1 }"><spring:message  code='正在审核'/></c:if>
                          	<c:if test="${translators.isAudit==2 }"><spring:message  code='审核通过'/></c:if>
                          	</span>
                          </p>
                      </div>
                      </div>
                      <div class="basic_data_inp" style="text-align:center;padding-top:60px;">
                        <a href="" id="interpreter"><button type="button" class="btn btn-info" onclick="interpreter()" name="button"><spring:message  code='修改'/></button></a>
                      </div>
                      <!-- 上传头像 -->
                      <div class="file_head" style="padding-top:30px;">
                        <h4><spring:message  code='用户头像'/></h4>
                        <c:if test="${translators.userUrl!=null && translators.userUrl!='' }">
                       	 	 <img src="${translators.userUrl}" alt="" width="100" height="100" id="allUrl" alt="">
                       	 </c:if>
                       	 <c:if test="${translators.userUrl ==null || translators.userUrl=='' }">
                       	 	 <img src="img/tuxiang.jpg" alt="" width="100" height="100" >
                       	 </c:if>
                        <form id="uploadform"  enctype="multipart/form-data"  method="post" action="/translator/uploadUtils.do" >
                        <div class="file_span">
                          <input type="file" id="headFile"  name="file"   onchange="uploadPic(this)">
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
                  </div> --%>
                </div>
                <!--  tab面板切换内容结束！  -->
              </div>

            <!--    用户中心 我是议员 右侧内容 结束   -->


        </div>
      </div>
      <!--    用户中心 我是议员 结束   -->
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
    	 //限制原译文字符个数
    	  $(".basic_data_inps").each(function(){
    	  var maxwidth=150;
    	  if($(this).text().length>maxwidth){
    	  $(this).text($(this).text().substring(0,maxwidth));
    	  $(this).html($(this).html()+"....");
    	  }
    	  });
    	 
    	  var tnickname = "${transid.nickname}";
			var unickname = "${clientid.userName}"
			if(tnickname!=""){
				$("#nickname").text(tnickname+"<spring:message  code='，欢迎您！'/>");
				
			}else if (unickname!="") {
				$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>");
				}

        $(".checkbox").simpleSwitch({
         "theme": "FlatCircular"
       });
        
      })
       var success="${success}"; 
       if(success.length>0 ){
	   		layer.msg("<spring:message  code='操作成功'/>!", {icon: 1});
	   	}
      
      //上传正面照片进行回显
          function frontUrls(file){
                  var maxsize =3*1024*1024*1024;//3M
                  var prevDiv = document.getElementById('imgPreviews');
                  var size=file.files[0].size;
                  fileExt=file.value.substr(file.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
              	if(file.value==null || file.value==''){
              		layer.open({
         				  title: '<spring:message  code="提示"/>',
         				  content: '<spring:message code="请上传正面有效证件"/>',
           		    });
                 }else if(fileExt!='.jpg' && fileExt!=".png" && fileExt !=".gif" && fileExt !=".bmp"){
                       layer.open({
           				  title: '<spring:message  code="提示"/>',
           				  content: '<spring:message code="上传只支持格式为："/>jpg、JPG、gif、GIF、png、PNG、bmp、BMP',
             		});
              	}else if(size>maxsize){ 
              		layer.open({
         				  title: '<spring:message  code="提示"/>',
         				  content: '<spring:message code="图片大小不能大于3M"/>',
           		    });
                }else if (file.files && file.files[0]) {
             	      var reader = new FileReader();
             	      reader.onload = function(evt) {
             	        prevDiv.innerHTML = '<img src="' + evt.target.result + '" />';
             	      }
             	      reader.readAsDataURL(file.files[0]);
             	} else {
             	      prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
             	}
                return;  
              }  
    //上传背面照片进行回显
   	 function reverseUrls(file){
   		var maxsize =3*1024*1024*1024;//3M
        var prevDiv = document.getElementById('imgPreview');
        var size=file.files[0].size;
        fileExt=file.value.substr(file.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
    	if(file.value==null || file.value==''){
    		layer.open({
				  title: '<spring:message  code="提示"/>',
				  content: '<spring:message code="请上传背面面有效证件"/>',
 		 });
       }else if(fileExt!='.jpg' && fileExt!=".png" && fileExt !=".gif" && fileExt !=".bmp"){
             layer.open({
 				  title: '<spring:message  code="提示"/>',
 				  content: '<spring:message code="上传只支持格式为："/>jpg、JPG、gif、GIF、png、PNG、bmp、BMP',
   		 });
    	}else if(size>maxsize){ 
    		layer.open({
				  title: '<spring:message  code="提示"/>',
				  content: '<spring:message code="图片大小不能大于3M"/>',
 		 });
       }else if (file.files && file.files[0]) {
   	      var reader = new FileReader();
   	      reader.onload = function(evt) {
   	        prevDiv.innerHTML = '<img src="' + evt.target.result + '" />';
   	      }
   	      reader.readAsDataURL(file.files[0]);
   	    } else {
   	      prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
   	    } 
        return; 
   	 }
    //执行个人资料修改
      function interpreter() {
    	  var transId=$("#transId").val();
    	  $("#interpreter").prop("href","/translator/translatorAction_updateUI.do?transId="+transId);
    	  }
    //添加语言
      function addLanguage(){
    	  var transId=$("#transId").val();
    	  $("#addLanguage").prop("href","/translator/translatorAction_updateQuotations.do");
    	  }
    //银行信息修改
     function editBank(){
    	 var transId=$("#transId").val();
    	 $("#editBank").prop("href","/translator/translatorAction_updateUI.do?transId="+transId);
    	 /* $("#editBank").prop("href","/translator/translatorAction_editBank.do?transId="+transId); */
    }
  	 //表单验证
	layui.use(['form', 'layedit', 'laydate'], function(){  
	      var form = layui.form()  
	      ,layer = layui.layer  
	      ,layedit = layui.layedit  
	      ,laydate = layui.laydate;  
	      
	      //自定义验证规则  
	      form.verify({ 
	    	  namesVeri : function(value) {
                  if ((value.length < 2)||(value.length>4)) {
                      return '<spring:message  code="请输入真实姓名"/>';
                  }
              },
              //验证图片格式
			  picture:[/^[a-zA-Z]:(\\.+)(.JPG|.jpg|.GIF|.gif|.BMP|.png|.bmp|.GIF|.gif)$/,'<spring:message  code="图片格式不支持"/>']
	      })
	      //创建一个编辑器  
	      layedit.build('LAY_demo_editor');  

	     form.on('submit(demo1)', function(data){ 	  
	    	  params = data.field;
	    	  submit($,params);
	      }); 
	})
	  var massage="${message}";
	  if(message.trim().length != 0 ){
    		
    		layer.msg(<spring:message code="message"/>, {icon: 5});
    	}
    </script>
  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
