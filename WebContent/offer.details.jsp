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
    <title><spring:message  code='报价详情'/></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/interpreter.cards.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/next.pic.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/offer.details.css"/>

    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
 
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/all.needs.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/offer.details.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
     <script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
		<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
  </head>
  <script type="text/javascript">
  $(function(){ 
	  
	  var lang = "${language}"
			if(lang==""){
				lang="zh";
			}
	     jQuery.i18n.properties({
	    	
		        name:'Messages', 
		        path:'/i18n/', 
		        mode:'both',
		   		language:"${language}",
		        checkAvailableLanguages: true,
		        async: true,
		        callback: function() { 
	        	
	    
		var tnickname = "${transid.nickname}";
		var unickname = "${clientid.userName}"
		if(tnickname!=""){
			$("#nickname").text(tnickname+"<spring:message  code='，欢迎您！'/>");
			
		}else if (unickname!="") {
			$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>!");
			}
	  

	
		//初始化页面数据，获取在线报价表格信息，以及在线报价条件信息
		
		
		$.ajax({
			type : "POST",
			url : "/onlineQuery/onlineQueryAction_queryByAll.do",
			cache : false,
			dataType : "json",
			success : function(data) {
				//接受译员等级系数集合
				var translatorLevels=data.translatorLevels;
				//接受基础价格集合
				var basicPrice = data.basicPrice.basicPrice;
				//接受领域系数集合
				var fields = data.fields;
				//接受当前所选的翻译语言类型
				var type = data.basicPrice.type
				//获取当前选择的基础价格类型
				var bps = data.bps;
				//获取周期系数集合
				var schedules = data.schedules;
				//隐藏查询资金信息
				//$("#omoney").hide();
				//隐藏译员人数信息
				//$("#ocount").hide();
				//循环添加领域信息
				for (var x = 0; x < fields.length; x++) {
					$("#field").append("<option value="+fields[x].factor+" title="+fields[x].field+">"+jQuery.i18n.prop("field"+fields[x].id)+"</option>")
				}
				//循环添加周期信息
				for (var x = 0; x < schedules.length; x++) {
					$("#schedule").append("<option title="+schedules[x].schedule+" value="+schedules[x].factor+">"+jQuery.i18n.prop("cycle"+schedules[x].id)+"</option>")
				}
				//循环添加译员等级信息
				for (var i = 0; i < translatorLevels.length; i++) {
					//判断译员等级大于2时，添加
					if(translatorLevels[i].level>2){
						$("#translatorLevel").append("<option value="+translatorLevels[i].factor+" title="+translatorLevels[i].level+">"+"<spring:message  code='等级'/>&nbsp"+translatorLevels[i].level+"</option>")
					}
					
				}
				//循环添加语言种类信息，分别像表格以及在线查询模块添加
				
				for (var i = 0; i < bps.length; i++) {
					/*$("#language").append("<option value="+bps[i].type+">"+bps[i].type+"</option>")*/
					
					
					$("#language1").append("<option value="+bps[i].basicPrice+" title="+bps[i].type+">"+jQuery.i18n.prop("language"+bps[i].id)+"</option>");
					
				}
				/*//创建tr td对象
				var offer_tr = '<tr class="offer_tr">'+'</tr>'
				var offer_td = '<td class="offer_td">'+'</td>'
				  // 循环表格
				  for(var i=0;i<translatorLevels.length;i++){
				    $(".offer_table").append(offer_tr);
				    for(var j=0;j<4;j++){
				      $(".offer_tr").eq(i).append(offer_td);
				    }
				  }
				  //表格中遍历内容
				  $.each(translatorLevels, function(inx,obj){
					  if(inx==0){
				    $(".offer_tr").eq(inx).find(".offer_td:first-child").html(type)
				    }
				    $(".offer_tr").eq(inx).find(".offer_td:nth-child(2)").html(obj.level+"级")
				    $(".offer_tr").eq(inx).find(".offer_td:nth-child(3)").html((obj.level)*basicPrice)
				    $(".offer_tr").eq(inx).find(".offer_td:nth-child(4)").html((obj.level)*basicPrice*0.8)
				  })
	*/
				  // 在线询价  帮助内容显示 隐藏
				  //议员等级
				    $(".dengjihelp").hover(function(){
				      $(".help_text").show();
				    },function(){
				      var tdengji=setTimeout(function(){
				        $(".help_text").hide();
				      },1000)
				    })
				    //周期
				    $(".zhouqihelp").hover(function(){
				      $(".help_zhouqi_text").show();
				    },function(){
				      var tzhouqi=setTimeout(function(){
				        $(".help_zhouqi_text").hide();
				      },1000)
				    })

				    

				}
			});
		
		//添加在线报价的点击事件
		$("#btn1").click(function (){
			//创建人员总数信息
			var count = 0
			//创建价格信息
			var money = 0
			//获取当前选择的领域系数
			var field = $("#field").val();

			//获取当前选择的周期系数
			var schedule = $("#schedule").val();

			//获取当前选择的译员等级系数
			
			var translatorLevel = $("#translatorLevel").val();

			//获取当前语言种类基础价格
			var basicPrice = $("#language1").val();
			//获取流程信息
			var flow = $("#flow").val();
			//未选择验证
			if(basicPrice==""){
				layer.msg('<spring:message  code="翻译语言尚未选择！！！！"/>', {icon: 2});
					
			}
			else if(field==""){
				layer.msg('<spring:message  code="翻译领域尚未选择！！！！"/>', {icon: 2});
			
			}else if (flow=="") {
				layer.msg('<spring:message  code="翻译流程尚未选择！！！！"/>' ,{icon: 2});
			
				
			}else if (translatorLevel=="") {
				layer.msg('<spring:message  code="译员等级尚未选择！！！！"/>',{icon: 2});
				
			}else if (schedule=="") {
				layer.msg( '<spring:message  code="翻译周期尚未选择！！！！"/>',{icon: 2});
			
			}	
			
			//添加流程算法并展示价格信息
			else if(flow=="仅翻译"){
				money = basicPrice*field*translatorLevel*schedule;
				money = money + "";
				if(money.length>6){
					money = money.substr(0,money.indexOf(".")+3);
				}
				$("#money").text(money);
				$("#omoney").show();
			}
			else if(flow=="翻译校对"){
				money = (basicPrice*field*translatorLevel*schedule)+((basicPrice*field*schedule)*0.5)/translatorLevel;
				money = money + "";
				if(money.length>6){
					money = money.substr(0,money.indexOf(".")+3);
				}
				$("#money").text(money);
				$("#omoney").show();
			}else if(flow=="翻译校对审核"){
				money = (basicPrice*field*translatorLevel*schedule)+(((basicPrice*field*schedule)*0.5)/translatorLevel)+((basicPrice*field*schedule)*0.5);
				money = money + "";
				if(money.length>6){
					money = money.substr(0,money.indexOf(".")+3);
				}
				$("#money").text(money);
				$("#omoney").show();
			}
			
		});
	/*	//创建表格信息查询的改变事件
		$("#language").change(function() {
			//获取当前语言类型
			var language = $("#language").val();
			//请求访问获取价格信息
			$.ajax({
				type : "POST",
				url : "/onlineQuery/onlineQueryAction_queryByLanguage.do",
				data :"language="+language,
				cache : false,
				dataType : "json",
				success : function(data) {
					//接受语言类型
					var type = data.basicPrice.type;
					//接受语言基础价格
					var basicPrice = data.basicPrice.basicPrice;
					//接受译员等级集合
					var translatorLevels=data.translatorLevels;
					//获取tr的所有对象
					var trs = $(".offer_tr")
					//删除之前的tr对象
						trs.remove();
					//创建tr对象
					var offer_tr = '<tr class="offer_tr">'+'</tr>'
					var offer_td = '<td class="offer_td">'+'</td>'
					  // 循环表格
					  for(var i=0;i<translatorLevels.length;i++){
					    $(".offer_table").append(offer_tr);
					    for(var j=0;j<4;j++){
					      $(".offer_tr").eq(i).append(offer_td);
					    }
					  }
					  //表格中遍历内容
					  $.each(translatorLevels, function(inx,obj){
						  if(inx==0){
					    $(".offer_tr").eq(inx).find(".offer_td:first-child").html(type)
					    }
					    $(".offer_tr").eq(inx).find(".offer_td:nth-child(2)").html(obj.level+"级")
					    $(".offer_tr").eq(inx).find(".offer_td:nth-child(3)").html((obj.level)*basicPrice)
					    $(".offer_tr").eq(inx).find(".offer_td:nth-child(4)").html((obj.level)*basicPrice*0.8)
					  })

					  // 在线询价  帮助内容显示 隐藏
					  //议员等级
					    $(".dengjihelp").hover(function(){
					      $(".help_text").show();
					    },function(){
					      var tdengji=setTimeout(function(){
					        $(".help_text").hide();
					      },1000)
					    })
					    //周期
					    $(".zhouqihelp").hover(function(){
					      $(".help_zhouqi_text").show();
					    },function(){
					      var tzhouqi=setTimeout(function(){
					        $(".help_zhouqi_text").hide();
					      },1000)
					    })

				}
				});
			
			
		})*/
	        }
	    });	

	})
		//快速发布需求的点击事件
			function publish(){
				var language = $("#language1 option:selected").attr("title");
				var domain = $("#field option:selected").attr("title");
				var level = $("#translatorLevel option:selected").attr("title");
				var procedure = $("#flow option:selected").val();
				var cycle = $("#schedule option:selected").attr("title");
				if(language!="" && domain !="" && level != "0" && procedure!="" && cycle!=""){
					var url = "/cilentCustomer/publishNeed.do?language="+language+"&domain="+domain+"&level="+level+"&procedure="+procedure+"&cycle="+cycle;
					window.location.href=url
				}else{
					layer.open({
						  title: '<spring:message  code="提示"/>'
						  ,content: '<spring:message  code="需填写完善询价信息才能进行快速发布！"/>'
						});
				} 
			}
		function getCount() {
		var language = $("#language1 option:selected").attr("title");
		var domain = $("#field option:selected").attr("title");
		var level = $("#translatorLevel option:selected").attr("title");
		//创建人员总数信息
		var count = 0
		//创建价格信息
		var money = 0
		//获取当前选择的领域系数
		var field = $("#field").val();

		//获取当前选择的周期系数
		var schedule = $("#schedule").val();

		//获取当前选择的译员等级系数
		
		var translatorLevel = $("#translatorLevel").val();

		//获取当前语言种类基础价格
		var basicPrice = $("#language1").val();
		//获取流程信息
		var flow = $("#flow").val();
		//未选择验证
		if(basicPrice!="" && field!="" && flow!="" && translatorLevel!="" &&  schedule!=""){	

		
			//添加流程算法并展示价格信息
		if(flow=="仅翻译"){
			money = basicPrice*field*translatorLevel*schedule;
			money = money + "";
			if(money.length>6){
				money = money.substr(0,money.indexOf(".")+3);
			}
			$("#money").text(money);
			$("#omoney").show();
		}
		else if(flow=="翻译校对"){
			money = (basicPrice*field*translatorLevel*schedule)+((basicPrice*field*schedule)*0.5)/translatorLevel;
			money = money + "";
			if(money.length>6){
				money = money.substr(0,money.indexOf(".")+3);
			}
			$("#money").text(money);
			$("#omoney").show();
		}else if(flow=="翻译校对审核"){
			money = (basicPrice*field*translatorLevel*schedule)+(((basicPrice*field*schedule)*0.5)/translatorLevel)+((basicPrice*field*schedule)*0.5);
			money = money + "";
			if(money.length>6){
				money = money.substr(0,money.indexOf(".")+3);
			}
			$("#money").text(money);
			$("#omoney").show();
		}
		}
		$.ajax({
			type : "POST",
			url : "/onlineQuery/onlineQueryAction_getCount.do",
			data :"language="+language+"&domain="+domain+"&level="+level,
			cache : false,
			dataType : "json",
			success : function(data) {
				var count = data.count;
				$("#count").html(count);
				$("#ocount").show();
			}
			});
			
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
		      function queryByInterpreter() {
   	 
   	 var nickName=$("#nickName").val();
   	 if(nickName!="" && nickName!="null" && nickName!=undefined){
   		 url="/translator/translatorAction_getTotalCount.do?msg="+nickName;
			window.open(url);
   	 }else{
   		 layer.msg('<spring:message  code="译员名不能为空！"/>', {icon: 2});
   	 }
		
	}
  </script>
  <body style="background:#f5f5f5;">

      <!--      头标签开始      -->
  	<c:if test="${clientid.id!=null || transid.id!=null }">
  	<div class="publickNav">
  		<div class="public_nav"> 
           <nav class="container" style="padding:0 20px;"> 
           <div class="navbar-left"><a href="?lang=zh_CN" class="navbar-link" onclick="in18(this)">中文</a> | <a href="?lang=en_US" class="navbar-link" onclick="in18(this)">English</a></div><a style="padding-left:50px;" href="/forwardAction/forward_toIndex.do"><spring:message  code='首页'/></a>
           <a style="padding-left:50px;"><spring:message  code='帮助热线：'/>010-82895385</a><a style="padding-left:50px;" target="_blank" href="http://www.aitrans.org:8081/"><spring:message  code='爱译社'/></a>
           <div class="navbar-right"> 
           <ul class="list-inline nav_lists">
           <%-- <li class="nav_lists_li"><a href="/ClientUser/clientUserAction_exit.do" class="navbar-link"><spring:message  code='退出登录'/></a></li>
           <li class="nav_lists_li"><a href="/cilentCustomer/findUI.do" target="_blank" class="navbar-link" style="position:relative;" ><spring:message  code='用户中心'/></a>
           <li class="nav_li_li"><a href="javascript:void(0);" class="navbar-link" ><font  id = "nickname"></font></a></li> --%>
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
                     	<a href="?lang=zh_CN" class="navbar-link" onclick="in18(this);">中文</a> | <a href="?lang=en_US" class="navbar-link" onclick="in18(this);" >English</a>
                     </div>
                     <a style="padding-left:50px;" href="/forwardAction/forward_toIndex.do"><spring:message  code='首页'/></a>
                     <a style="padding-left:50px;"><spring:message  code='帮助热线：'/>010-82895385</a><a style="padding-left:50px;" target="_blank" href="http://www.aitrans.org:8081/"><spring:message  code='爱译社'/></a>
                     <div class="navbar-right">
                     <ul class="list-inline nav_lists">
                      <%-- <li class="nav_lists_li"><a href="/forwardAction/forward_toLogin.do" class="navbar-link"><spring:message  code='登录'/></a></li>
                      <li class="nav_lists_li"><a href="/forwardAction/forward_toRegister.do" class="navbar-link"><spring:message  code='注册'/></a></li> --%>
                      <li class="nav_lists_li"><a href="/forwardAction/forward_toHelp.do" class="navbar-link"><spring:message  code='帮助中心'/></a></li>
                      </ul>
                      </div>
                      </nav>
                      </div>
                      <div style="height:35px;"></div>
                      </div>
	</c:if>
	<div class="container">
<nav class="publickSearch">
<nav class="search_nav">
              <div class="navbar-left">
              <span class="search_logo"></span>
              </div>
              <form class="navbar-form index_form_search navbar-left" role="search">
              <%-- <div class="input-group">
              <div class="input-group-btn">
              <button type="button" id="dLabel" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span><spring:message  code='找译员'/> </span><i class="fa fa-caret-down fa-2x" aria-hidden="true"></i></button>
              <ul class="dropdown-menu" aria-labelledby="dLabel">
              <li><a href="/cilentCustomer/findNeedListUI.do"><spring:message  code='找项目'/></a></li>
              <li><a href="/translator/translatorAction_getProfessorCount.do?level=5"><spring:message  code='找专家'/></a></li>
              <li role="separator" class="divider"></li>
              </ul>
              </div>
              <input type="text" id="nickName" class="form-control" aria-label="...">
              <div class="input-group-btn">
              <button type="button" class="btn btn-info" onclick="queryByInterpreter();"  style="width:115px;font-size: 17px;"><spring:message  code='搜索'/></button>
              </div>
              </div>
              <a href="javaScript:void(0);" class="btn btn-info requirements" id="publishNeedClick" ><spring:message  code='发布项目'/></a>
              <ul class="list-inline search_more">
              <li><spring:message  code='热门搜索：'/></li>
             <li><a href="/translator/translatorAction_getTransCount.do?language=EN"><spring:message  code='英语精英'/></a></li>
              <li><a href="/translator/translatorAction_getTransCount.do?language=JP"><spring:message  code='日语精英'/></a></li>
              <li><a href="/translator/translatorAction_getTransCount.do?language=GER"><spring:message  code='德语精英'/></a></li>
               <li><a href="/translator/translatorAction_getTransCount.do?language=FR"><spring:message  code='法语精英'/></a></li>
                <li><a href="/translator/translatorAction_getTransCount.do?language=KOR"><spring:message  code='韩语精英'/></a></li>
              </ul> --%>
              </form>
              </nav>
</nav>
      <!--  内容头部导航  -->
      <%-- <div class="contentNav">
 		<div class="navbg">
                      <ul id="navul">
                        <li class="navhome"><a href="/forwardAction/forward_toIndex.do"><spring:message  code='首页'/></a></li>
                        <li><a href="#"><spring:message  code='平台介绍'/></a>
                          <ul>
                          	<li><a href="/forwardAction/forward_toTeam.do"><spring:message  code='关于我们'/></a>
                            <li><a href="/forwardAction/forward_toOA.do"><spring:message  code='服务介绍'/></a></li>
                            <li><a href="/forwardAction/forward_toQuality.do"><spring:message  code='质量控制'/></a></li>
                            <li><a href="/forwardAction/forward_toRuleDescription.do"><spring:message  code='规则中心'/></a></li>
                            <li><a href="/forwardAction/forward_toSecurityCenter.do"><spring:message  code='安全中心'/></a></li>
                            <li><a href="/forwardAction/forward_toCustomerInstructions.do"><spring:message  code='客户须知'/></a></li>
                            <li><a href="/forwardAction/forward_toInterpreterTips.do"><spring:message  code='译员须知'/></a></li>
                            <li><a href="/forwardAction/forward_toTranslationProcess.do"><spring:message  code='翻译流程'/></a></li>
                          </ul>
                        </li>
                        <li><a href="/forwardAction/forward_toOffer.do"><spring:message  code='在线询价'/></a>
                        </li>
                        <li><a href="#"><spring:message  code='项目'/></a>
                    	<ul>
                    		<li><a href="/cilentCustomer/publishNeed.do"><spring:message  code='发布项目'/></a></li>
                    		<li><a href="/cilentCustomer/findNeedListUI.do"><spring:message  code='项目展示'/></a></li>
                    	</ul>
                    	</li>
                        <li><a href="#"><spring:message  code='专业译员'/></a>
                        <ul>
                        <li><a href="/translator/translatorAction_getProfessorCount.do?level=5"><spring:message  code='专家介绍'/></a></li>
                        <li><a href="/translator/translatorAction_getTransCount.do?language=EN"><spring:message  code='英语精英'/></a></li>
                        <li><a href="/translator/translatorAction_getTransCount.do?language=JP"><spring:message  code='日语精英'/></a></li>
                        <li><a href="/translator/translatorAction_getTransCount.do?language=KOR"><spring:message  code='韩语精英'/></a></li>
                        <li><a href="/translator/translatorAction_getTransCount.do?language=GER"><spring:message  code='德语精英'/></a></li>
                        <li><a href="/translator/translatorAction_getTransCount.do?language=FR"><spring:message  code='法语精英'/></a></li>
                        <li><a href="/translator/translatorAction_getTotalCount.do"><spring:message  code='译员查找'/></a></li>
                      </ul>
                        </li>
                        <li><a href="#"><spring:message  code='专利翻译软件'/></a>
                          <ul>
                          <li><a href="/forwardAction/forward_toSoftwareTranslation.do"><spring:message  code='软件下载'/></a></li>
                          <li><a href="/forwardAction/forward_toInstructions.do"><spring:message  code='软件界面说明'/></a></li>
                          <li><a href="/forwardAction/forward_toUse.do"><spring:message  code='软件翻译演示'/></a></li>
                          <li><a href="/forwardAction/forward_toFunction.do"><spring:message  code='软件功能介绍'/></a></li>
                          <li><a href="/forwardAction/forward_toMenu.do"><spring:message  code='功能表'/></a></li>
                          </ul>
                        </li>
                        <li><a href="#"><spring:message  code='专利知识库'/></a>
                          <ul>
                            <li><a href="/term/termAction_getTotalCount.do"><spring:message  code='术语库'/></a></li>
                            <li><a href="/corpus/corpusAction_getTotalCount.do"><spring:message  code='语料库'/></a></li>
                          </ul>
                        </li>
                        <li><a href="#"><spring:message  code='操作指南'/></a>
                        <ul>
                        <li><a href="/forwardAction/forward_toIdentification.do"><spring:message  code='用户认证流程'/></a></li>
                        <li><a href="/forwardAction/forward_toRegisterProcess.do"><spring:message  code='注册登陆流程'/></a></li>
                        <li><a href="/forwardAction/forward_toInterpreterOrders.do"><spring:message  code='译员接单流程'/></a></li>
                        <li><a href="/forwardAction/forward_toPublishProcess.do"><spring:message  code='项目发布流程'/></a></li>
                        <li><a href="/forwardAction/forward_toHelp.do"><spring:message  code='帮助中心'/></a></li>
                        <li><a href="/forwardAction/forward_toRemuneration.do"><spring:message  code='稿酬明细'/></a></li>
                        </ul>
                      </li>
                        <li><a href="#"><spring:message  code='资讯信息'/></a>
                        <ul>
                        <li><a href="/article/articleAction_getNoticeTotalCount.do"><spring:message  code='公告资讯'/></a></li>
                        <li><a href="/article/articleAction_getPlatformTotalCount.do"><spring:message  code='活动资讯'/></a></li>
                        <li><a href="/article/articleAction_getActivityTotalCount.do"><spring:message  code='平台资讯'/></a></li>
                        </ul>
                        </li>
                      </ul>
                    </div>
                   </div> --%> 
                   
        <div class="index_linguister_header" style="height:40px;margin-bottom: 0px;">
        	<ul id="navul" style="float:left;margin-left:20px;">
        		<c:if test="${clientid.id==null && transid.id==null }">
        			<li style="color:#FFF"><a href="/forwardAction/forward_toLogin.do"><spring:message  code='客户中心'/></a></li>
        			<li style="color:#FFF"><a href="javascript:;" id="publishNeedClick"><spring:message  code='发布项目'/></a></li>
        		</c:if>
        		<c:if test="${clientid.id!=null && clientid.id!='' }">
        			<li style="color:#FFF"><a href="/cilentCustomer/findUI.do"><spring:message  code='客户中心'/></a></li>
        			<li style="color:#FFF"><a href="javascript:;" id="publishNeedClick"><spring:message  code='发布项目'/></a></li>
        		</c:if>
        		<c:if test="${clientid.id==null && transid.id==null }">
        			<li style="color:#FFF"><a href="/forwardAction/forward_toLogin.do"><spring:message  code='译员中心'/></a></li>
        		</c:if>
        		<c:if test="${transid.id!=null && transid.id!='' }">
        			<li style="color:#FFF"><a href="/cilentCustomer/findUI.do"><spring:message  code='译员中心'/></a></li>
        		</c:if>
        		<li style="color:#FFF"><a href="/translator/interShowUI.do"><spring:message  code='查看译员'/></a></li>
        		<li style="color:#FFF"><a href="/cilentCustomer/findNeedListUI.do"><spring:message  code='查看项目'/></a></li>
        		<li style="color:#FFF"><a href="javascript:;"><spring:message  code='专利翻译软件'/></a>
        			<ul>
                    	<li><a href="/forwardAction/forward_toSoftwareTranslation.do"><spring:message  code='软件下载'/></a></li>
                        <li><a href="/forwardAction/forward_toInstructions.do"><spring:message  code='软件界面说明'/></a></li>
                        <li><a href="/forwardAction/forward_toUse.do"><spring:message  code='软件翻译演示'/></a></li>
                        <li><a href="/forwardAction/forward_toFunction.do"><spring:message  code='软件功能介绍'/></a></li>
                        <li><a href="/forwardAction/forward_toMenu.do"><spring:message  code='功能表'/></a></li>
                   	</ul>
        		</li>
        		<li style="color:#FFF"><a href="/forwardAction/forward_toTeam.do"><spring:message  code='关于我们'/></a>
        			<ul>
                       <li><a href="/forwardAction/forward_toOA.do"><spring:message  code='服务介绍'/></a></li>
                       <li><a href="/forwardAction/forward_toQuality.do"><spring:message  code='质量控制'/></a></li>
                       <li><a href="/forwardAction/forward_toRuleDescription.do"><spring:message  code='规则中心'/></a></li>
                       <li><a href="/forwardAction/forward_toSecurityCenter.do"><spring:message  code='安全中心'/></a></li>
                       <li><a href="/forwardAction/forward_toCustomerInstructions.do"><spring:message  code='客户须知'/></a></li>
                       <li><a href="/forwardAction/forward_toInterpreterTips.do"><spring:message  code='译员须知'/></a></li>
                       <li><a href="/forwardAction/forward_toTranslationProcess.do"><spring:message  code='翻译流程'/></a></li>
                   </ul>
        		</li>
        	</ul>
       	<c:if test="${clientid.id==null && transid.id==null }">
        	<div class="navbar-right" style="margin-right: 20px;line-height: 40px;">
               	<ul class="list-inline nav_lists">
                      <li class="nav_lists_li"><a href="/forwardAction/forward_toLogin.do" class="navbar-link"><spring:message  code='登录'/></a></li>
                      <li class="nav_lists_li"><a href="/forwardAction/forward_toRegister.do" class="navbar-link"><spring:message  code='注册'/></a></li>
                </ul>
           </div>
        </c:if>
       <c:if test="${clientid.id!=null || transid.id!=null }">
           <div class="navbar-right" style="margin-right: 20px;line-height: 40px;"> 
           		<ul class="list-inline nav_lists">
           			<li class="nav_lists_li" style="width: auto;"><a href="/ClientUser/clientUserAction_exit.do" class="navbar-link"><spring:message  code='退出登录'/></a></li>
           			<%-- <li class="nav_lists_li" style="width: auto;"><a href="/cilentCustomer/findUI.do" target="_blank" class="navbar-link" style="position:relative;" ><spring:message  code='用户中心'/></a></li> --%>
          			<li class="nav_li_li" style="color:#FFF"><font id = "nickname" style="color:#77FF00"></font></li>
           		</ul>
           </div>
       </c:if>
        </div> 
                   
      <!--  头标签结束 -->



      <!--  报价详情  -->
      <div class="offer_content">
        <h1><spring:message  code='报价详情'/></h1>

         <!--翻译报价表  开始 -->
         <!--<h4 class="offer_h4 offer_lan_h4">翻译报价表</h4>
        <div class="offer_select_table">
          <div class="offer_lan">
            <select class="form-control" id="language">
            </select>
          </div>
          <div class="">
            <table class="table table-bordered offer_table">
              <tr class="">
                <th>翻译语种</th>
                <th>翻译级别</th>
                <th>翻译价格</th>
                <th>校对价格</th>
              </tr>
            </table>
          </div>
        </div>-->
        <!-- 翻译报价表  结束 -->

       

        <!-- 在线询价 开始 -->
        <h4 class="offer_h4"><spring:message  code='在线询价'/></h4>
        <div class="offer_inquiry">
          <form class="form-horizontal" action="" method="post">
            <div class="form-group">
              <p class="col-sm-3 control-label"><spring:message  code='语种'/>：</p>
              <div class="col-sm-8 offer_width">
              
                <select class="form-control" id="language1" onchange="getCount()">
                  <option title="" value="" >-- <spring:message  code='请选择语种'/> --</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <p class="col-sm-3 control-label"><spring:message  code='翻译领域'/>：</p>
              <div class="col-sm-8 offer_width">
                <select class="form-control" id="field" onchange="getCount()">
                  <option title=""  value="">-- <spring:message  code='请选择翻译领域'/> --</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <p class="col-sm-3 control-label"><spring:message  code='流程类型'/>：</p>
              <div class="col-sm-8 offer_width">
                <select class="form-control" name="" id="flow"  onchange="getCount()">
                  <option value="">-- <spring:message  code='请选择翻译流程'/> --</option>
                  <option value="仅翻译"><spring:message  code='仅翻译'/></option>
                  <option value="翻译校对"><spring:message  code='翻译+校对'/></option>
                  <option value="翻译校对审核"><spring:message  code='翻译+校对+审核'/></option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <p class="col-sm-3 control-label"><spring:message  code='译员等级'/>：</p>
              <div class="col-sm-8 offer_width">
                <select class="form-control" name="" id="translatorLevel" onchange="getCount()">
                <option title="0" value="" >-- <spring:message  code='请选择译员等级'/> --</option>
                </select>
              </div>
              <a class="questions" style="position:relative;" href="javascript:;">
                <i class="fa fa-question dengjihelp" aria-hidden="true"></i>
                <span class="help_text" >
                  <spring:message  code='三级：三年相关技术领域翻译经验、通过爱译社考核'/><br />
                 <spring:message  code='四级：五年相关技术领域翻译经验、通过爱译社考核'/> <br />
                  <spring:message  code='五级：十年相关技术领域翻译经验、通过爱译社考核'/>
                </span>
              </a>
            </div>
            <div class="form-group">
              <p class="col-sm-3 control-label"><spring:message  code='周期'/>：</p>
              <div class="col-sm-8 offer_width">
                <select class="form-control" name="" id="schedule"  onchange="getCount()">
                <option value="">-- <spring:message  code='请选择翻译周期'/> -- </option>
                </select>
              </div>
              <a class="questions" href="javascript:;" style="position:relative;">
                <i class="fa fa-question zhouqihelp" aria-hidden="true"></i>
                <span class="help_zhouqi_text" >
                 <spring:message  code='一般情况：流程处理时间1天、3000字/天(翻译)、6000字/天(校对)、8000字/天(审核)'/> <br />
                  <spring:message  code='加急情况：流程处理时间1天、4000字/天（翻译）、8000字/天（校对）、10000字/天（审核）'/><br />
                  <spring:message  code='特急情况：5000字/天（翻译）、10000字/天（校对）、15000字/天（审核）'/>
                </span>
              </a>
            </div>
            <div class="form-group">
              <div class="row" >
                <span class="wait_pre col-sm-2 col-sm-offset-3" id="ocount" style="width: 250px;font-size:18px;display:none;"><spring:message  code='可选译员'></spring:message>&nbsp;<span id="count" style="color: red"></span>&nbsp;<spring:message  code='人'></spring:message></span>
                <span class="wait_pre col-sm-2 col-sm-offset-1" id="omoney" style="width: 300px;font-size:18px;display:none;"><spring:message  code='约合'></spring:message>&nbsp;:￥ <span ><font id="money" color="#FF0000"></font></span><spring:message  code='元'></spring:message>&nbsp;<spring:message  code='(千字/原文)'></spring:message></span>
              </div>
            </div>
            <div class="form-group" style="margin-top:40px;">
              <div class="col-sm-offset-4 col-sm-2">
                <a href="javascript:void(0)" class="btn btn-info" id="btn1"><spring:message  code='在线询价'></spring:message></a>
              </div>
              <div class="col-sm-2">
                <a href="javascript:void(0)" class="btn btn-info text-red" onclick="publish();"><spring:message  code='快速发布'></spring:message></a>
              </div>
            </div>
            <!-- <div class="form-group">
              <div class="offer_width col-sm-offset-3" style="margin-top:20px;">
                <button type="button" class="col-sm-3 btn btn-info offer_button">在线询价</button>
                <span class="offer_inquiry_price col-sm-3">￥2000.00</span>
                <span class="offer_wait_pre col-sm-4">等待人数 <span>555</span></span>
              </div>
            </div> -->
          </form>
        </div>

        <!-- 在线询价 结束 -->
         <!-- 备注  开始 -->
        <div class="offer_remark">
          <div class="col-sm-1">							
            <h4 class="offer_h4 offer_remark_h4"><spring:message  code='备注'/></h4>
          </div>
          <ul class="list-group col-sm-10 offer_remark_lists">
            <li>1、<spring:message  code='以上报价为每千字报价。'></spring:message><spring:message  code='中文稿件翻译字数统计均按照字符数计算，'></spring:message><spring:message  code='统计方式为'></spring:message> WORD 2007<spring:message  code='软件“字数统计”选项的第三栏，字符数（不计空格为准，），要包括文本框、注脚和注尾。单件笔译资料不足一千字的，一律收取最低收费。'></spring:message></li>
            <li>
             2、 <spring:message  code='翻译稿件的加急费用按正常收费的'></spring:message>30% - 80% <spring:message  code='收取。个别稀有语种另议。'/>
            </li>
            <li>
           3、  <spring:message  code='翻译稿件如果需要另外盖章，另加收50元/份的盖章费用。'></spring:message> 
            </li>
            <li>
              <p>4、<spring:message  code='关于稿件难易度划分遵循以下原则：'/></p>
              <p><spring:message  code='普通级别：用于帮助客户了解原文大意，仅供参考、内部交流资料，以白话文体现；'></spring:message></p>
              <p><spring:message  code='专业级别：学术、专业、工业等性质用于生产，交流，解读；译文表达贴近译后用语习惯、注重文件中专业术语的专业性和统一性。'></spring:message></p>
              <p><spring:message  code='出版级别：正式文件、法律文书或出版文稿以及公司宣传画册面向大众使用；在专业的基础上更加注重于译后用语习惯逐字逐句考究词汇的表达，行文流畅，用语有没，增加译后文字的可读性，完美体现原文的意境。采用有翻译出版书籍报刊经验的高级校对。'/>
              </p>
              <p>
                <spring:message  code='证件翻译收费；'/>130~200 <spring:message  code='元/每份，个别稀有语种另议，证件超过8份，可享有优惠政策，详情请拨打热线咨询。'/>
              </p>
            </li>
          </ul>
        </div>
        <div class="clear"></div>
        <!--  备注  结束  -->
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
  <!-- 尾标签结束 -->
  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
  	<script type="text/javascript">
	
	</script>
</html>
