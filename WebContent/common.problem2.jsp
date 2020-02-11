<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <title><spring:message  code='帮助中心'/> <spring:message  code='常见问题'/></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/help.center.css"/>
    <link href="css/page.css" type="${pageContext.request.contextPath}/text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/page.css" type="text/css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.0.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/help.center.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    <script type="text/javascript">
    $(function(){
    	if("${transid}"!=null && "transid"!=''){
			if("${transid.nickname}"!=null && "${transid.nickname}"!=''){
	        	  $("#nickname").text("${transid.nickname}"+"<spring:message  code='，欢迎您！'/>");
	          }else if("${transid.tel}"!=null && "${transid.tel}"!=''){
	        	  $("#nickname").text("${transid.tel}"+"<spring:message  code='，欢迎您！'/>");
	          }else if("${transid.email}"!=null && "${transid.email}"!=''){
	        	  $("#nickname").text("${transid.email}"+"<spring:message  code='，欢迎您！'/>");
	          }
		}else if("${clientid}"!=null && "clientid"!=''){
			 if("${clientid.userName}"!='' && "${clientid.userName}"!=null){
		   		 $("#nickname").text('${clientid.userName}'+"<spring:message code=',欢迎您!'/>");
		   	 }else if('${clientid.tel}'!=null && '${clientid.tel}'!=null){
		   		 $("#nickname").text('${clientid.tel}'+"<spring:message code=',欢迎您!'/>");
		   	 }else if('${clientid.emaile}'!=null && '${clientid.emaile}'!=null){
		   		 $("#nickname").text('${clientid.emaile}'+"<spring:message code=',欢迎您!'/>");
		   	 }
		}
  		/* var tnickname = "${transid.nickname}";
  		var unickname = "${clientid.userName}"
  		if(tnickname!=""){
  			$("#nickname").text(tnickname+"<spring:message  code='，欢迎您！'/>");
  			
  		}else if (unickname!="") {
  			$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>");
  			} */

    	  var answerList='${answerList}';
    	  
      })
    function addQuestion(){
      var question='${question}';
  	  var type=$("select option:selected").val();
  	  var problemContent=$("#problemContent").val();
  	  if(type==""){
  		  layer.msg("<spring:message  code='提示：请输入详细问题类型！'/>", {icon: 2});
  	  }else if(problemContent==""){
  		 layer.msg("<spring:message  code='提示：请输入详细问题内容！'/>", {icon: 2});
  	  }else{
  		  $.post("/index/indexAction_addQuestion.do?type="+type+"&question="+problemContent,function(data){
  		      if(data.result=='success'){
  		    	layer.alert('<spring:message  code="您已提交问题,我们会尽快处理您的问题"/>', {
					icon: 1,
					title: "<spring:message  code='提示'/>",
					end: function () {
						window.location.href="/questionAndAnswer/findAnswer.do?question="+question;
						}
					});
  		      }
  		  },"json");  
  	}
  	  
    }
  //头标签效果显示  开始
	$(document).ready(function(){
	    $(".navbg").capacityFixed();
	    $("#navul > li").not(".navhome").hover(function(){
	      $(this).addClass("navmoon");
	    },function(){
	      $(this).removeClass("navmoon");
	    });
	  })

	  $.fn.capacityFixed = function(options) {
	        var opts = $.extend({},$.fn.capacityFixed.deflunt,options);
	        var FixedFun = function(element) {
	            var top = opts.top;
	            element.css({
	                "top":top
	            });
	            element.find(".close-ico").click(function(event){
	                element.remove();
	                event.preventDefault();
	            })
	        };
	        return $(this).each(function() {
	            FixedFun($(this));
	        });
	    };
	    $.fn.capacityFixed.deflunt={
			right : 0,//相对于页面宽度的右边定位
	        top:95
		};
	  //头标签效果显示 结束
    </script>
  </head>
  <body>

   <!--      头标签开始      -->
  	<c:if test="${clientid.id!=null || transid.id!=null }">
  	<div class="publickNav">
  		<div class="public_nav"> 
           <nav class="container" style="padding:0 20px;"> 
           <div class="navbar-left"><a href="${pageContext.request.contextPath}/questionAndAnswer/findAnswer.do?lang=zh_CN&question=javascript:${question}" class="navbar-link" onclick="in18(this)">中文</a> | <a href="${pageContext.request.contextPath}/questionAndAnswer/findAnswer.do?lang=en_US&question=javascript:${question}" class="navbar-link" onclick="in18(this)">English</a></div><a style="padding-left:50px;" href="/forwardAction/forward_toIndex.do"><spring:message  code='首页'/></a>
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
                     	<a href="${pageContext.request.contextPath}/questionAndAnswer/findAnswer.do?lang=zh_CN&question=javascript:${question}" class="navbar-link" onclick="in18(this);">中文</a> | <a href="${pageContext.request.contextPath}/questionAndAnswer/findAnswer.do?lang=en_US&question=javascript:${question}" class="navbar-link" onclick="in18(this);" >English</a></div><a style="padding-left:50px;" href="/forwardAction/forward_toIndex.do"><spring:message  code='首页'/></a>
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
    <!--   正文内容   -->
    <div class="container">

      <!--   帮助中心 logo   -->
      <div class="search_logo">
        <a href="javascript:;"></a>
      </div>

      <!--   帮助中心 搜索    -->
      <!-- <div class="help_center_search">
        <div class="input-group">
          <input type="text" class="form-control" placeholder="请输入查询的问题" id="queryByType">
          <span class="input-group-btn">
            <button class="btn btn-info" type="button" id="search">搜 索</button>
          </span>
        </div>
      </div> -->
    
		
      <!--  常见问题  -->
      <div class="common_problem">
        <div class="common_problem_title">
          <h4><spring:message  code='常见问题'/></h4>
        </div>
        <div class="common_problem_content">
          <div class="common_problem_text">
            <ul class="problems_ul" ></ul>
            <h5><spring:message  code='问：'/></h5>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<li>${answerList[0]}</li>
          </div>
          <div class="common_problem_text">
            <ul class="problems_ul" ></ul>
            <h5><spring:message  code='答：'/></h5>
             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<li>${answerList[1]}</li>
          </div>
            
            
          <!--currentpage="1" numbercount="100"-->
          <div class="common_problem_page"><ul class="page" maxshowpageitem="3" pagelistcount="3"  id="page"></ul></div>
        </div>
      </div>

      <!--  我要提问  -->
       <div class="ask_question" >
        <div class="ask_question_title" style="float:left;border:1px   width:40%;">
          <h4><spring:message  code='我要提问'/></h4>
        </div>
        <form method="post" action="${pageContext.request.contextPath}/index/addQuestion.do">
        <div style="float:left;border:1px width:40%;margin-left: 50px";>
					<select class="form-control" name="type" id="type">
					    <option value="" selected="selected">-<spring:message  code='请选择您要提问的类型'/>-</option>
						<option value="<spring:message  code='关于爱译'/>" ><spring:message  code='关于爱译'/></option>
						<option value="<spring:message  code='关于客户'/>" ><spring:message  code='关于客户'/></option>
						<option value="<spring:message  code='关于译员'/>"><spring:message  code='关于译员'/></option>
						<option value="<spring:message  code='关于软件'/>"><spring:message  code='关于软件'/></option>
					</select>
				</div>
        <div class="ask_question_content">
          <textarea class="form-control question_textarea" rows="6" id="problemContent"></textarea>
          <button type="button" class="btn btn-info" name="button" onclick="addQuestion()"><spring:message  code='我要提交'/></button>
        </div>
        </form>
      </div>
</div>
   <!-- 尾标签开始 -->
<div id="gradient" class="footer_content">
      <!-- 用户指南  -->
      <div class="messages container">
     	 	<div class="message_more">
      			<div class="row"></div>
      			</div>
      				
      					<ul class="col-sm-2 message_more_li"><li><h2><spring:message  code='新手指南'/></h2></li><li><a href="/forwardAction/forward_toRegisterProcess.do"><spring:message  code='注册流程'/></a></li><li><a href="/forwardAction/forward_toRuleDescription.do"><spring:message  code='规则中心'/></a></li><li><a href="/forwardAction/forward_toIdentification.do"><spring:message  code='用户认证'/></a></li></ul>
      					<ul class="col-sm-2 col-sm-offset-1 message_more_li"><li><h2><spring:message  code='我是客户'/></h2></li><li><a href="/forwardAction/forward_toCustomerInstructions.do"><spring:message  code='客户须知'/></a></li><li><a href="/forwardAction/forward_toPublishProcess.do"><spring:message  code='项目发布'/></a></li><li><a href="/forwardAction/forward_toQuality.do"><spring:message  code='质量控制'/></a></li></ul>
      					<ul class="col-sm-2 col-sm-offset-1 message_more_li"><li><h2><spring:message  code='我是译员'/></h2></li><li><a href="/forwardAction/forward_toInterpreterTips.do"><spring:message  code='译员须知'/></a></li><li><a href="/forwardAction/forward_toTranslationProcess.do"><spring:message  code='任务接受'/></a></li><li><a href="/forward_toRemuneration.do"><spring:message  code='稿酬明细'/></a></li></ul>
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

  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
