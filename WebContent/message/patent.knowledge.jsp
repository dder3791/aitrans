<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
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
<title><spring:message  code='术语库'/></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/patent.knowledge.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/page.css" type="text/css" />


<script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
     <script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
<script type="text/javascript">
$.fn.extend({ 
	    "initPage":function(listCount,currentPage,fun){
	    	//
	        var maxshowpageitem = $(this).attr("maxshowpageitem");
	        if(maxshowpageitem!=null&&maxshowpageitem>0&&maxshowpageitem!=""){
	            page.maxshowpageitem = maxshowpageitem;
	        }

	    
	        var pagelistcount = $(this).attr("pagelistcount");
	        if(pagelistcount!=null&&pagelistcount>0&&pagelistcount!=""){
	            page.pagelistcount = pagelistcount;
	        }

	        
	        var pageId = $(this).attr("id");
	        page.pageId=pageId;
	        if(listCount<0){
	            listCount = 0;
	        }
	        if(currentPage<=0){
	            currentPage=1;
	        }
	        page.setPageListCount(pageId,listCount,currentPage,fun);

	    }
	});


	var  page = {
	/*   "maxshowpageitem":5,//最多显示的页码个数
	    "pagelistcount":10,//每一页显示的内容条数
	*/   /**
	     * 初始化分页界面
	     * @param listCount 列表总量
	     */
	    "initWithUl":function(pageId,listCount,currentPage){

//	        var pageCount = 1;
	        if(listCount>0){
	            var pageCount = listCount%page.pagelistcount>0?parseInt(listCount/page.pagelistcount)+1:parseInt(listCount/page.pagelistcount);
	        }
	        var appendStr = page.getPageListModel(pageCount,currentPage);
	        $("#"+pageId).html(appendStr);
	    },
	    /**
	     * 设置列表总量和当前页码
	     * @param listCount 列表总量
	     * @param currentPage 当前页码
	     */
	    "setPageListCount":function(pageId,listCount,currentPage,fun){
	        listCount = parseInt(listCount);
	        currentPage = parseInt(currentPage);
	        page.initWithUl(pageId,listCount,currentPage);
	        page.initPageEvent(pageId,listCount,fun);
	        if(typeof fun == "function"){
	            fun(currentPage);
	        }
	    },
	    "initPageEvent":function(pageId,listCount,fun){
	        $("#"+pageId +">li[class='pageItem']").on("click",function(){
	            page.setPageListCount(pageId,listCount,$(this).attr("page-data"),fun);
	        });
	    },
	    "getPageListModel":function(pageCount,currentPage){
	        var prePage = currentPage-1;
	        var nextPage = currentPage+1;
	        var prePageClass ="pageItem";
	        var nextPageClass = "pageItem";
	        if(prePage<=0){
	            prePageClass="pageItemDisable";
	        }
	        if(nextPage>pageCount){
	            nextPageClass="pageItemDisable";
	        }
	        var appendStr ="";
	        appendStr+="<li class='"+prePageClass+"' page-data='1' page-rel='firstpage'><spring:message  code='首页'/></li>";
	        appendStr+="<li class='"+prePageClass+"' page-data='"+prePage+"' page-rel='prepage'>&lt;<spring:message  code='上一页'/></li>";
	        var miniPageNumber = 1;
	        if(currentPage-parseInt(page.maxshowpageitem/2)>0&&currentPage+parseInt(page.maxshowpageitem/2)<=pageCount){
	            miniPageNumber = currentPage-parseInt(page.maxshowpageitem/2);
	        }else if(currentPage-parseInt(page.maxshowpageitem/2)>0&&currentPage+parseInt(page.maxshowpageitem/2)>pageCount){
	            miniPageNumber = pageCount-page.maxshowpageitem+1;
	            if(miniPageNumber<=0){
	                miniPageNumber=1;
	            }
	        }
	        var showPageNum = parseInt(page.maxshowpageitem);
	        if(pageCount<showPageNum){
	            showPageNum = pageCount
	        }
	        for(var i=0;i<showPageNum;i++){
	            var pageNumber = miniPageNumber++;
	            var itemPageClass = "pageItem";
	            if(pageNumber==currentPage){
	                itemPageClass = "pageItemActive";
	            }

	            appendStr+="<li class='"+itemPageClass+"' page-data='"+pageNumber+"' page-rel='itempage'>"+pageNumber+"</li>";
	        }
	        appendStr+="<li class='"+nextPageClass+"' page-data='"+nextPage+"' page-rel='nextpage'><spring:message  code='下一页'/>&gt;</li>";
	        appendStr+="<li class='"+nextPageClass+"' page-data='"+pageCount+"' page-rel='lastpage'><spring:message  code='尾页'/></li>";
	       return appendStr;

	    }
	}

	$(function() {

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

	

		//总记录数
		var totalCount = '${page.totalCount }';
		//当前页
		var pageNum = '${page.pageNum}';
		//分类类型
		var language = ""
		var domainId =""
		var msg = ""
		//区分是否是第一次进行分类跳转
		var o = 0;
		// 初始化加载分页下标
		// currentPage 当前页码

		//翻页的点击事件
		var GG = {
			"kk" : function(mm) {
				//给予初始化赋值
				if (isNaN(mm)) {
					mm = 1;
				}''				
				/* alert(language+"            "+domain+"           "+msg); */
				
				if(o!=2){//判断是否为搜索的页面初始化进入
				$.ajax({
					type : "POST",
					url : "/term/termAction_queryByAll.do",
					data : "pageNum=" + mm + "&language=" + language + "&domain="
							+ domain + "&msg=" + msg,
					cache : false,
					dataType : "json",
					success : function(data) {
						//获取所有领域信息
						var domains = data.domains;
						//获取所有术语信息
						var terms = data.terms;
						//获取所有options对象
						var options = $("#domain option");
						//给予模糊查询字段赋值msg
						$("#msg").prop("value",msg);	
					/* 	for (var int = 1; int < options.length; int++) {
							options[int].remove();
						} */
						//判断options标签是否已经被添加过
						if(!(options.length>1)){
						//未被添加进行领域信息的添加
							  jQuery.i18n.properties({
	    	
							        name:'Messages', 
							        path:'/i18n/', 
							        mode:'both',
							   		language:"${language}",
							        checkAvailableLanguages: true,
							        async: true,
							        callback: function() { 
						for (var x = 0; x < domains.length; x++) {
							
							//添加领域信息值为domainId
							var str =jQuery.i18n.prop("domain"+domains[x].id);
								$("#domain").append(
													"<option value="+domains[x].id+">"
													+str+ "</option>")
							
						}	
							        }
							  });
						}
						//获取所有的术语信息标签对象
						var trs = $(".infor_tr");
						//遍历删除所有标签
						for (var ii = 0; ii < trs.length; ii++) {
							trs[ii].remove();
						}
						//遍历术语对象进行添加元素标签，填充页面
						for (var j = 0; j<terms.length ; j++) {
							var termOrigin=""
								termOrigin=terms[j].termOrigin
							if(msg!="" && msg!=null && msg!=undefined){
								
								if(termOrigin.indexOf(msg)>=0){
								var str1 = termOrigin.substring(0, termOrigin.indexOf(msg));
								var str2 = termOrigin.substring((termOrigin.indexOf(msg)+msg.length),termOrigin.length)
								termOrigin =str1+"<font color=red>"+msg+"</font>"+str2;
								}
							}
							var td1 = "<td style='padding: 15px 10px;'  >"+termOrigin+"</td>"
							var td2 ="<td style='padding: 15px 10px;'  >"+terms[j].termTarget+"</td>";
							var tr = '<tr  class="infor_tr">' + td1+td2 + '</tr>';
							$(".table").append(tr)
						}
					}
				});
				
				}
				
				o=1;//给予搜索后赋予另一个值来进行收索后的翻页执行
		}
		}
		//初始化分页栏设置
		$("#page").initPage(totalCount, pageNum, GG.kk);
		
		//给搜索添加点击事件
		$("#button").click(function(){
			//给予语言类型进行赋值
			language = $("input:checked").val();
			//给予领域类型进行赋值
			domainId = $("select option:selected" ).val();
			//给予模糊查询字段进行赋值
			msg = $("#msg").val();
			//进行请求访问并查询条件查询数据
			$.ajax({
				type : "POST",
				url : "/term/termAction_queryByAll.do",
				data : "pageNum=" + 1 + "&language=" + language + "&domainId="
						+ domainId + "&msg=" + msg,
				cache : false,
				dataType : "json",
				success : function(data) {
					//给予o进行赋值重新初始化时不执行翻译方法
					o = 2;
					//获取所有领域对象
					var domains = data.domains;
					//获取所有术语信息对象
					var terms = data.terms;
					//获取所有options对象
					var options = $("#domain option");
					//获取page对象
					var page = data.page;
					
			/* 		for (var int = 1; int < options.length; int++) {
						alert(options[int].value);
						if(options[int].value==domainId){
							options.prop("selected","selected");
						}
					} */
				/* 
					for (var x = 0; x < domains.length; x++) {
						if(domainId==domains[x].id){
						$("#domain").append("<option selected='selected' value="+domains[x].id+">"+domains[x].name+"</option>")
						}else{
							$("#domain").append("<option value="+domains[x].id+">"+domains[x].name+"</option>")
						}
					}	 */
					//获取所有的术语元素对象并删除
					var trs = $(".infor_tr");
					for (var ii = 0; ii < trs.length; ii++) {
						trs[ii].remove();
					}
					//遍历添加返回的术语信息
					for (var j = 0; j<terms.length ; j++) {
						var termOrigin=terms[j].termOrigin
						if(msg!="" && msg!=null && msg!=undefined){
							
							if(termOrigin.indexOf(msg)>=0){
							var str1 = termOrigin.substring(0, termOrigin.indexOf(msg));
							var str2 = termOrigin.substring((termOrigin.indexOf(msg)+msg.length),termOrigin.length)
							termOrigin =str1+"<font color=red>"+msg+"</font>"+str2;
							}
						}
						var td1 = "<td style='padding: 15px 10px;'  >"+termOrigin+"</td>"
						var td2 ="<td style='padding: 15px 10px;'  >"+terms[j].termTarget+"</td>";
						var tr = '<tr  class="infor_tr">' + td1+td2 + '</tr>';
						$(".table").append(tr)
					}
					//判断总记录数是否为0 
					if(page.totalCount==0){
						//初始化页面将总计路数为1
						$("#page").initPage(1,page.pageNum, GG.kk); 
						//弹出框提示没有信息
						layer.msg('<spring:message  code="尚未查询到该领域的术语信息！"/>', {icon: 5});
					}else{
						//如果不为0则造常规初始化页面
						$("#page").initPage(page.totalCount,page.pageNum, GG.kk); 
					}
				}
				
			});
		
		});
	});
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
</head>
<body style="background: #f5f5f5;">
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
		<!--  专利知识库 开始  -->
		<div class="patent_knowledge">
			<h3><spring:message  code='术语库'/></h3>
			<br>
			<div class="patent_search">
				<div class="input-group">
					<div class="input-group-btn">
						<!--   <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">查领域 <span class="caret"></span></button> -->
						<select class="btn btn-default dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="domain" name = "domain">
							<option value="0" ><spring:message  code='查领域'/></option>
						</select>
						<!--   <ul class="dropdown-menu">
                <li><a href="#">日常</a></li>
                <li><a href="#">生化</a></li>
                <li><a href="#">微积分</a></li>
              </ul> -->
					</div>
					<!-- /btn-group -->
					<input type="text" class="form-control" aria-label="..." id="msg">
					<div class="input-group-btn">
						<button type="button" class="btn btn-info" id="button" ><spring:message  code='搜索'/></button>
					</div>
				</div>
				<!-- /input-group -->
			</div>

			<div class="checks_langu row">
				<span class="col-sm-1"><spring:message  code='选择语种：'/></span>
				<div class="col-sm-10">
					<label class="checkbox-inline"> <input type="radio"
						name="language" value="中英"  > <spring:message  code='汉译英'/>
					</label> <label class="checkbox-inline"> <input type="radio"
						name="language" value="英中" checked ="checked">  <spring:message  code='英译汉'/>
					</label> <label class="checkbox-inline"> <input type="radio"
						name="language" value="日中"> <spring:message  code='日译汉'/>
					</label> <label class="checkbox-inline"> <input type="radio"
						name="language" value="中日"> <spring:message  code='汉译日'/>
					</label> <label class="checkbox-inline"> <input type="radio"
						name="language" value="韩中"> <spring:message  code='韩译汉'/>
					</label> <label class="checkbox-inline"> <input type="radio"
						name="language" value="中韩"><spring:message  code='汉译韩'/> 
					</label> <label class="checkbox-inline"> <input type="radio"
						name="language" value="法中"> <spring:message  code='法译汉'/> 
					</label> <label class="checkbox-inline"> <input type="radio"
						name="language" value="中法"> <spring:message  code='汉译法'/> 
					</label>
					<div class="checbox_all">
						<label class="checkbox-inline"> <input type="radio"
							name="language" value="中德"> <spring:message  code='德译汉'/> 
						</label> <label class="checkbox-inline"> <input type="radio"
							name="language" value="德中"> <spring:message  code='汉译德'/> 
						</label>
					</div>
					<span class="checkbox-inline checkbox_click"><spring:message  code='查看更多'/> <i
						class="fa fa-angle-double-right" aria-hidden="true"></i></span>
				</div>
			</div>

			<div class="patent_lists">
				<table class="table table-bordered text-center">
					<tr style="width: 50px; font-size: 16px;">
						<th class="text-center"><spring:message  code='术语原文'/></th>
						<th class="text-center"><spring:message  code='术语译文'/></th>
					</tr>
<!-- 					<tr class="patent_li" style="cursor: pointer;"
						onclick="shuyudetails()" >
						<td style="padding: 15px 10px;"  >术语原文</td>
						<td style="padding: 15px 10px;"  >译文内容</td>
					</tr> -->
				</table>
			</div>
			<!--currentpage="1" numbercount="100"-->
			<div class="common_problem_page pull-right"
				style="padding-top: 30px;">
				<ul class="page" maxshowpageitem="5" pagelistcount="8" id="page"></ul>
			</div>
			<div class="clear"></div>
		</div>

		<!--  专利知识库 结束  -->



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
	<script type="text/javascript">
		var icon = '<i class="fa fa-angle-double-right" aria-hidden="true"></i>'
		$(".checkbox_click").click(function() {
			if ($(".checbox_all").hasClass("checkbox_hide")) {
				$(".checbox_all").removeClass("checkbox_hide");
				$(".checkbox_click").html("<spring:message  code='查看更多'/>" + icon);
			} else {
				$(".checbox_all").addClass("checkbox_hide");
				$(".checkbox_click").text(" <spring:message  code='收起'/>");
			}
		});

	/* 	var td = $(".patent_li").html()
		var tr = '<tr>' + td + '</tr>'
		for (var i = 0; i < 5; i++) {
			$(".table").append(tr)
		}

		function shuyudetails() {
			window.location.href = "patent.knowledge.details.html"
		} */
	</script>
<div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
