<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name=" Keywords" content="......">      <!--content中，网页关键字-->
    <meta name=" description" content="......">   <!--content中，网页描述文字-->
    <meta name="author" content="......">        <!--标注作者-->
    <title><spring:message  code='帮助中心'/></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/help.center.css"/>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
   
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.0.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    <%-- <SCRIPT type=text/javascript>kfguin="3182008172";ws="www.ctrlc.com.cn"; companyname="环宇爱译"; welcomeword="您好,欢迎光临   Ctrlc.com.cn<brT>请问,有什么可以帮到您的吗?"; type="1";</SCRIPT>
    <SCRIPT src="${pageContext.request.contextPath}/js/kf.js" type=text/javascript></SCRIPT>   --%>
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
		});
	function findAnswer(obj){
		
		var msg=obj;
		//取到当前参数设置属性的值并改变href属性的值转到后台
		$(".hrefa").attr("href","/questionAndAnswer/findAnswer.do?question="+msg);
	}
     function searchs() {
    	 var mm=1;
    	 var msg=$("#searchs").val();
    	 var totalCount="${page.totalCount }"
     		/* //判断总记录数是否为0 
  			if(totalCount==0 ){
  				//弹出框提示没有信息
  				layer.msg('尚未查询到该问题信息！', {icon: 5});
  			} */
    	 //同步跳转到后台页面
    	 /* window.location.href="/questionAndAnswer/questionAndAnswer_queryByQuestions.do?pageNum="+mm+"&msg="+msg; */
    	  window.open("/questionAndAnswer/getTotalQuestionCount.do?msg="+msg);
	}  
     
     var success="${success}";
     if(success.trim().length != 0 ){
 		
 		layer.msg(success, {icon: 1});
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
  <body >
  
   <!--      头标签开始      -->
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

    <!--   正文内容   -->
    <div class="container">

      <!--   帮助中心 logo   -->
      <div class="help_center_logo" style="font-size: 20px">
        <a href="javascript:;"></a>
        <br>
        <h4><spring:message  code='帮助中心'/></h4>
      </div>

      <!--   帮助中心 搜索    -->
      <div class="help_center_search">
        <div class="input-group">
          <input type="text" class="form-control" placeholder="<spring:message  code='请输入关键字查询'/>" id="searchs">
          <span class="input-group-btn">
            <button class="btn btn-info" type="button" onclick="searchs()"><spring:message  code='搜索'/></button>
          </span>
        </div>
      </div>

      <!--   常见问题    -->
      <div class="common_question">
        <div class="common_question_title">
          <span><spring:message  code='常见问题'/></span>
        </div>
        <div class="common_question_tab">
          <ul id="myTab" class="nav nav-tabs">
          	<li class="active"><a href="#tab01" data-toggle="tab" id="AboutAitrans" onclick="findAitrans()" title="关于爱译" ><spring:message  code='关于爱译'/></a></li>
            <li><a href="#tab02" data-toggle="tab" id="AboutClient" title="关于客户"><spring:message  code='关于客户'/></a></li>
          	<li><a href="#tab03" data-toggle="tab" id="AboutTransfer"  title="关于译员"><spring:message  code='关于译员'/></a></li>
          	<li><a href="#tab04" data-toggle="tab" id="AboutSoftware" title="关于软件"><spring:message  code='关于软件'/></a></li>
          </ul>
          <div id="myTabContent" class="tab-content">
          	<div class="tab-pane fade in active" id="tab01">
          	<a class="pull-right" target="_blank" href="${pageContext.request.contextPath}/questionAndAnswer/getTotalCount.do?msg=关于爱译" target='_blank' ><spring:message  code='更多'/>>></a>
              <div class="row">
                <ul class="col-sm-6 common_question_list" id="leftUL01">
                </ul>
                 <ul class="col-sm-6 common_question_list" id="rightUL01">
                 </ul>
              </div>
            </div>
          	<div class="tab-pane fade" id="tab02">
          	<a class="pull-right" target="_blank" href="${pageContext.request.contextPath}/questionAndAnswer/getTotalCount.do?msg=关于客户" target='_blank' ><spring:message  code='更多'/>>></a>
              <div class="row">
                <ul class="col-sm-6 common_question_list"  id="leftUL02">
                </ul>
                 <ul class="col-sm-6 common_question_list" id="rightUL02">
                 </ul>
              </div>
          	</div>
            <div class="tab-pane fade" id="tab03">
            <a class="pull-right"  href="${pageContext.request.contextPath}/questionAndAnswer/getTotalCount.do?msg=关于译员" target='_blank' ><spring:message  code='更多'/>>></a>
              <div class="row">
                <ul class="col-sm-6 common_question_list" id="leftUL03">
                </ul>
                <ul class="col-sm-6 common_question_list"  id="rightUL03">
                 </ul>
              </div>
          	</div>
          	
          	 <div class="tab-pane fade" id="tab04">
            <a class="pull-right"  href="${pageContext.request.contextPath}/questionAndAnswer/getTotalCount.do?msg=关于软件" target='_blank' ><spring:message  code='更多'/>>></a>
              <div class="row">
                <ul class="col-sm-6 common_question_list" id="leftUL04">
                </ul>
                <ul class="col-sm-6 common_question_list"  id="rightUL04">
                 </ul>
              </div>
          	</div>
          	
          </div>
        </div>
      </div>

      <!--   联系我们   -->
      <div class="common_contact_us">
        <div class="common_question_title">
          <span><spring:message  code='联系我们'/></span>
        </div>
        <div class="contact_us">
          <div class="row">
            <div class="col-sm-4">
              <h4><spring:message  code='客服电话'/></h4>
              <p><spring:message  code='预约客服，主动回电'/></p>
                                         <spring:message  code='客服'/>QQ:3182008172<br>
                                         <spring:message  code='客服电话：'/>010-82893875                     
             <%--  <a href="javascript:;" class="btn btn-info" name="button"><spring:message  code='点此预约'/></a> --%>
            </div>
            <div class="col-sm-4" >
            <h4><spring:message  code='在线客服'/></h4>
              <p><spring:message  code='在线解答您的咨询，高效、便捷'/></p>
              <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=3182008172&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:1043426430:51" alt="<spring:message  code='点击这里给我发消息'/>" title="<spring:message  code='点击这里给我发消息'/>"/></a>
              <!-- <button class="layui-btn site-demo-layim" data-type="chat">点此咨询</button> -->
              <!-- <a href="javascript:;" class="btn btn-info" name="button">点此咨询</a> -->
                  
            </div>
            <div class="col-sm-4">
              <h4><spring:message  code='提建议'/></h4>
              <p><span><spring:message  code='对帮助中心提建议'/></span><br><span><spring:message  code='邮件留言'/>info@aitrans.cn</span></p>
              <a href="javascript:;" class="btn btn-info" name="button" id="voice" ><spring:message  code='我要留言'/></a> 
            </div>
          </div>
        </div>
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
      					<ul class="col-sm-2 col-sm-offset-1 message_more_li"><li><h2><spring:message  code='我是译员'/></h2></li><li><a href="/forwardAction/forward_toInterpreterTips.do"><spring:message  code='译员须知'/></a></li><li><a href="/forwardAction/forward_toTranslationProcess.do"><spring:message  code='任务接受'/></a></li><li><a href="/forwardAction/forward_toRemuneration.do"><spring:message  code='稿酬明细'/></a></li></ul>
      				<ul class="col-sm-2 col-sm-offset-1 message_more_li"><li><h2><spring:message  code='爱译智能'/>-PAT</h2></li><li><a href="/forwardAction/forward_toFunction.do"><spring:message  code='软件功能介绍'/></a></li><li><a href="/forwardAction/forward_toSoftwareTranslation.do"><spring:message  code='在线视频教学'/></a></li><li><a href="/forwardAction/forward_toSoftwareTranslation.do"><spring:message  code='直接下载'/></a></li></ul>
      			
      </div>

      <!--------  login footer  -------->
      <footer class="container register_footer cl">
      		<ul class="list-inline">
      			<li>
      			<a href="/forwardAction/forward_toTeam.do" ><spring:message  code='关于我们'/></a>
      			</li> | <li><a href="/forwardAction/forward_toTeam.do"><spring:message  code='联系方式'/></a>
      			</li> | <li><a href="http://www.aitrans.net"><spring:message  code='爱译智能'/>-CAT</a></li> | 
      			<li><a href="javascript:;"><spring:message  code='支付方式'/></a></li> | 
      			<li><a href="http://www.aitrans.org"><spring:message  code='友情链接'/></a></li> | 
      			<li><a href="/forwardAction/forward_toSecurityCenter.do" ><spring:message  code='安全中心'/></a></li>
      			</ul>
      			<p class="footer_adress">Copyright 2005-2017 123.com版权所有 渝ICP备1234567-4号 渝B2-12134567 渝公安网备 1234567890号 互联网违法和不良信息举报电话：1234567 邮箱：123456.com</p>
      </footer>


    </div>

    <script>
	$(function () {
		findAitrans();
		$("#AboutClient").click(function() {
			var aboutClient=$("#AboutClient").attr("title");
			var uls=$("#tab02 ul");
			var lis=uls[0].getElementsByTagName("li");
			for(var i=0;i<uls.length;i++){
				var lis=uls[i].getElementsByTagName("li");
				for(var j=0;j<lis.length;){
					uls[i].removeChild(lis[j]);
				}
			}
			if(lis.length === 0 ){
			$.post("/questionAndAnswer/findByType.do?type="+aboutClient,function(data){
				 for(var i=0;i<=6;i++){
					 var leftul02=$("#leftUL02"); 
					 var rightul02=$("#rightUL02");
					 if(i<3){
						 leftul02.append("<li><a class='hrefa' href='javascript:"+data[i].question+"' target='_blank'   onclick=findAnswer(this)>"+data[i].question+"</a></li>");
					 }
					 if(i>=3){
						 rightul02.append("<li><a class='hrefa' href='javascript:"+data[i].question+"' target='_blank'   onclick=findAnswer(this)>"+data[i].question+"</a></li>");
					 }
				 }  
			},"json");}
		});
		$("#AboutTransfer").click(function() {
			var AboutTransfer=$("#AboutTransfer").attr("title");
			 var uls=$("#tab03 ul"); 
			 var lis=uls[0].getElementsByTagName("li");
			 for(var i=0;i<uls.length;i++){
					var lis=uls[i].getElementsByTagName("li");
					for(var j=0;j<lis.length;){
						uls[i].removeChild(lis[j]);
					}
				}
			  if(lis.length === 0){
			$.post("/questionAndAnswer/findByType.do?type="+AboutTransfer,function(data){
				 for(var i=0;i<=6;i++){
					 var leftul03=$("#leftUL03"); 
					 var rightul03=$("#rightUL03"); 
					 if(i<3){
						 leftul03.append("<li><a class='hrefa' href='javascript:"+data[i].question+"'  target='_blank'  onclick=findAnswer(this)>"+data[i].question+"</a></li>");
					 }
					 if(i>=3){
						 rightul03.append("<li><a class='hrefa' href='javascript:"+data[i].question+"' target='_blank'   onclick=findAnswer(this)>"+data[i].question+"</a></li>");
					 }
				 }  
			},"json");}
		});
		
		$("#AboutSoftware").click(function() {
			var AboutSoftware=$("#AboutSoftware").attr("title");
			var uls=$("#tab04 ul");
			var lis=uls[0].getElementsByTagName("li");
			for(var i=0;i<uls.length;i++){
				var lis=uls[i].getElementsByTagName("li");
				for(var j=0;j<lis.length;){
					uls[i].removeChild(lis[j]);
				}
			}
			if(lis.length === 0 ){
			$.post("/questionAndAnswer/findByType.do?type="+AboutSoftware,function(data){
				 for(var i=0;i<=6;i++){
					 var leftul02=$("#leftUL04"); 
					 var rightul02=$("#rightUL04");
					 if(i<3){
						 leftul02.append("<li><a class='hrefa' href='javascript:"+data[i].question+"' target='_blank'   onclick=findAnswer(this)>"+data[i].question+"</a></li>");
					 }
					 if(i>=3){
						 rightul02.append("<li><a class='hrefa' href='javascript:"+data[i].question+"'  target='_blank'  onclick=findAnswer(this)>"+data[i].question+"</a></li>");
					 }
				 }  
			},"json");}
		});
		
		
	});
	function findAitrans() {
		var aboutAitrans=$("#AboutAitrans").attr("title");
		var uls=$("#tab01 ul");
		 var lis=uls[0].getElementsByTagName("li"); 
		for(var i=0;i<uls.length;i++){
			var lis=uls[i].getElementsByTagName("li");
			for(var j=0;j<lis.length;){
				uls[i].removeChild(lis[j]);
			}
		}
		if(lis.length === 0 ){
		 $.post("/questionAndAnswer/findByType.do?type="+aboutAitrans,function(data){
			 var leftul01=$("#leftUL01"); 
			 var rightul01=$("#rightUL01"); 
			 for(var i=0;i<=6;i++){
				 if(i<3){
					 //this参数取得是当前属性值
					 leftul01.append("<li><a class='hrefa' href='javascript:"+data[i].question+"' target='_blank'  onclick=findAnswer(this)>"+data[i].question+"</a></li>");
				 }
				 if(i>=3){
					 rightul01.append("<li><a class='hrefa' href='javascript:"+data[i].question+"' target='_blank'  onclick=findAnswer(this)>"+data[i].question+"</a></li>");
					
				 }
			}
	      },"json");}
	}
	$("#voice").click(function () {
   	      pageii = layer.open({
   			title : "<spring:message  code='新增留言'/>",
   			type : 2,
   			area : [ "600px", "80%" ],
   			content : '${pageContext.request.contextPath}/forwardAction/forward_toUserVoice.do'
   		});
		});

	
			
</script>

  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
