<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name=" Keywords" content="......">      <!--content中，网页关键字-->
    <meta name=" description" content="......">   <!--content中，网页描述文字-->
    <meta name="author" content="......">        <!--标注作者-->
    <title><spring:message  code="译员作品详情页"/></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/interpreter.show.details.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/next.pic.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css" type="text/css"/>
    
    
    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/interpreter.show.works.details.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    <script type="text/javascript">
     $(function(){
    	 
    	//头标签效果显示  开始
 	    $(".navbg").capacityFixed();
 	    $("#navul > li").not(".navhome").hover(function(){
 	      $(this).addClass("navmoon");
 	    },function(){
 	      $(this).removeClass("navmoon");
 	    });
 	    
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
    	 
 	  /*  var tnickname = "${transid.nickname}";
		var unickname = "${clientid.userName}"
		if(tnickname!=""){
			$("#nickname").text(tnickname+"<spring:message  code='，欢迎您！'/>");
			
		}else if (unickname!="") {
			$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>!");
			} */
    		  $.post("/translator/translatorAction_findRandowTrans.do",function(data){
    	      var trans=data.translatorList;
    	      var transRandow="<li class='recommend_cards'><img id='transPhoto' src='/img/tuxiang.jpg ' alt='' width='100' height='100'><div class='demand_employer_details'><span id='nickname'></span><p><spring:message  code='等级'/>:<span id='level'></span></p><p><spring:message  code='语种'/>:<span id='language'></span></p><p></p></div><div class='recommend_btns'><div class='row'><a href='' id='checkTrans'  class='btn btn-info col-sm-5'><spring:message  code='选择他'/></a><a href='' class='btn btn-info col-sm-5 col-sm-offset-1' id='lookTran'><spring:message  code='详情'/></a></div></div></li>";
    	      $(".recommend_cards").remove();
    	      for(var i=0;i<3;i++){
    	      $(".list-groupTrans").append(transRandow);
    	      }
    	    //循环填入展示信息
    	      var clientid="${clientid}";
          	  var append_nickname=$(".demand_employer_details [id=nickname]");
          	  var append_level=$(".demand_employer_details [id=level]");
          	  var lookTrans=$(".recommend_btns [id=lookTran]");
          	  var transPhoto=$(".recommend_cards [id=transPhoto]");
          	  var checkTrans=$(".recommend_btns [id=checkTrans]");
          	  var language=$(".demand_employer_details [id=language]");
          	  for(var j=0;j<trans.length;j++){
          		 append_nickname[j].innerHTML=trans[j].nickname;
     			 append_level[j].innerHTML=trans[j].level;
     			if(trans[j].language=='EN'){
     				language[j].innerHTML="<spring:message  code='英语'/>";
			    } 
			    if(trans[j].language=="JP"){
			    	language[j].innerHTML="<spring:message  code='日语'/>";
			    }
			    if(trans[j].language=="KOR"){
			    	language[j].innerHTML="<spring:message  code='韩语'/>";
			    }
			    if(trans[j].language=="FR"){
			    	language[j].innerHTML="<spring:message  code='法语'/>";
			    }
			    if(trans[j].language=="GER"){
			    	language[j].innerHTML="<spring:message  code='德语'/>";
			    }
     			if(trans[j].userUrl!=null){
      				userUrl=trans[j].userUrl;
      			}else{
      				userUrl="/img/tuxiang.jpg";
      			}
     			if(clientid!='' || clientid!="" ){
      				checkUrl="/cilentCustomer/transInfo.do?id="+trans[j].id+"+&type=checkTrans";
      			}else{
      				$(".recommend_btns [id=checkTrans]").attr("onclick","findClient();");
      				checkUrl="javaScript:void(0);";
      			}
     			checkTrans[j].setAttribute("href",checkUrl);
     			transPhoto[j].setAttribute("src",userUrl);
     			 lookTrans[j].setAttribute("href","/translator/translatorAction_findTransById.do?transId="+trans[j].id);  
          	  }
    	  },"json"); 
     })
     
    	
     //查看个人代表作品
      function lookWorks(obj){
    	 layer.open({
    		  type: 1,
    		  title:"<spring:message  code='代表作品'/>",
    		  skin: 'layui-layer-rim', //加上边框
    		  area: ['820px', '440px'], //宽高
    		  content: $(".rowOrigin"+obj).text()
    		});
     }
     function checkTrans(obj){
    	 var id=obj.value;
    	window.location.href="/cilentCustomer/transInfo.do?id="+id+"&type=checkTrans";
     }
   //头标签部分结束
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
		td {
			text-align: center;
			padding:10px 0 10px 0;
		}
		th {
			text-align: center;
			padding:10px 0 10px 0;
		}
		table {
			border:1px solid #cccccc;
		}
		.thead th {
			background-color: #cccccc;
			color:#000;
		}
	</style>

  </head>
  <body style="background:#f5f5f5;">
   <!--      顶部导航      -->
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
    <!--      顶部导航      -->
  	<%-- <c:if test="${clientid.id!=null || transid.id!=null }"><div class="publickNav"></div></c:if>
    
    <c:if test="${clientid.id==null && transid.id==null }"><div class="publickNavs"></div></c:if> --%>

    <div class="container">
      <!--  logo 搜索栏  -->
      <nav class="publickSearch"></nav>

      <!--  内容头部导航  -->
      <div class="contentNav"></div>

      <!--  译员详情内容  开始  -->
      <div class="interpreter_details">
        <div class="row">
          <!--  译员详情内容  left  开始  -->
          <div class="interpreter_details_left col-sm-9">
        	<div class="basic_data clearfix" style="padding-bottom: 30px;">
              	<h4><spring:message  code='译员基本资料'/></h4>
              	<div class="head_portrait" style="float: left;">
                	<c:if test="${translators.userUrl!=null && translators.userUrl!='' }">
                  		<img src="${pageContext.request.contextPath}/${translators.userUrl}" style="width:150px;height:150px;margin-top:30px;" alt="" width="100" height="100" id="allUrl" alt="">
                	</c:if>
                	<c:if test="${translators.userUrl ==null || translators.userUrl=='' }">
                  		<img src="${pageContext.request.contextPath}/img/tuxiang.jpg" style="width:150px;height:150px;margin-top:10px;" alt="" width="100" height="100" >
                	</c:if>
                	<div class="row" style="margin-top:20px;">
              			<!-- <div class="col-xs-4"></div> -->
              			<div class="col-xs-12">
              				<c:if test="${clientid!=null }">
			                	<button style="width:100%;" type="submit" class="btn btn-info" name="button" id="chooseTran"  value="${translator.id }"   onclick="checkTrans(this)"><spring:message  code='选择他'/></button>
			                </c:if> 
              			</div>
              		</div>
              	</div>
             	<div style="width:78%;height:220px;float:left;margin-left: 2%">
              		
              		<div class="row">
              			<label class="rowlabel-right col-xs-2"><spring:message  code='昵称：'/></label>
              			<label class="rowlabel-left col-xs-6" style="font-size:20px;color:#000088;">
              				${translator.nickname }
              			</label>
              			<label class="rowlabel-right col-xs-2"><spring:message  code='学历：'/></label>
              			<label class="rowlabel-left col-xs-2"><spring:message  code='${translator.degree }'/></label>
              		</div>
              		
              		<div class="row">
              			<label class="rowlabel-right col-xs-2"><spring:message  code='手机绑定：'/></label>
              			<label class="rowlabel-left col-xs-2">
              				<c:if test="${translator.tel ==null}">
			                	<spring:message  code='未完成'/>
			                </c:if>
			                <c:if test="${translator.tel !=null}">
			                	<spring:message  code='完成'/>
			                </c:if>
                		</label>
              			<label class="rowlabel-right col-xs-2"><spring:message  code='邮箱绑定：'/></label>
              			<label class="rowlabel-left col-xs-2">
							<c:if test="${translator.email ==null || translator.email ==''}">
			                	<spring:message  code='未完成'/>
			                </c:if>
			                <c:if test="${translator.email !=null && translator.email !=''}">
			                	<spring:message  code='完成'/>
			                </c:if>
						</label>
						<label class="rowlabel-right col-xs-2"><spring:message  code='是否使用软件：'/></label>
	              		<label class="rowlabel-left col-xs-2">
							<c:if test="${translator.isToolUse ==1}">
				               	<spring:message  code='使用'/>
				            </c:if>
				       		<c:if test="${translator.isToolUse ==0}">
				  				<spring:message  code='不使用'/>
							</c:if>
						</label>
              		</div>
              		
              		
              		<div class="row">
              			<label class="rowlabel-right col-xs-2"><spring:message  code='实名认证：'/></label>
              			<label class="rowlabel-left col-xs-2">
							<c:if test="${translator.certificationStatus !=2 && translator.certificationStatus !='2'}">
			                	<spring:message  code='未完成'/>
			                </c:if>
			                <c:if test="${translator.certificationStatus ==2 || translator.certificationStatus =='2'}">
			                	<spring:message  code='完成'/>
			                </c:if>
						</label>
              			<c:if test="${translator.certificationStatus ==2 || translator.certificationStatus =='2'}">
	              			<label class="rowlabel-right col-xs-2"><spring:message  code='性别：'/></label>
	              			<label class="rowlabel-left col-xs-2">
								<c:if test="${translator.gender ==0 && translator.gender !='0'}">
				                	<spring:message  code='男'/>
				                </c:if>
				                <c:if test="${translator.gender ==1 || translator.gender =='1'}">
				                	<spring:message  code='女'/>
				                </c:if>
							</label>
						</c:if>
						<label class="rowlabel-right col-xs-2"><spring:message  code='最高等级：'/></label>
						<label class="rowlabel-left col-xs-2"><spring:message  code='${translator.level }级'/></label>
	              	</div>
              		
              		<div class="row">
              			<label class="rowlabel-right col-xs-2"><spring:message  code='语言对：'/></label>
              			<label class="rowlabel-left col-xs-4">${languagesStr}</label>
              			<label class="rowlabel-right col-xs-2"><spring:message  code='注册时间：'/></label>
              			<label class="rowlabel-left col-xs-4"><fmt:formatDate value="${translator.registerTime}"  pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></label>
              		</div>
              		
              		<div class="row">
              			<label class="rowlabel-right col-xs-2"><spring:message  code='领域：'/></label>
              			<label class="rowlabel-left col-xs-10">${domainsStr}</label>
              		</div>
              		
              		<div class="row">
              			<label class="rowlabel-right col-xs-2"><spring:message  code='完成订单数：'/></label>
              			<label class="rowlabel-left col-xs-2">${counts}</label>
              			<label class="rowlabel-right col-xs-2"><spring:message  code='评价数：'/></label>
              			<label class="rowlabel-left col-xs-2">${countEvaluate}</label>
              		</div>
              		
              	</div>
              <%-- <ul class="list-inline per_details">
                <li><p><spring:message  code='账户名：'/><span>${translator.nickname }</span></p></li>
                <li><p><spring:message  code='完成订单数：'/><span>${counts}</span></p></li>
                <li><p><spring:message  code='学历：'/><span>${translator.degree }</span></p></li>
                <li><p><spring:message  code='领域：'/><span>${translator.domain}</span></p></li>
                <li><p><spring:message  code='最高等级：'/><span>${translator.level}</span></p></li>
                <li>
                <p><spring:message  code='语种：'/>
                          <c:if test="${transLanguage!=null || transLanguage !=''}">
                          <c:forEach items="${transLanguage}" var="translatorQ" > 
                          <c:if test="${translatorQ.languages =='汉英' }">
                          <span><spring:message  code='汉英'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='英汉' }">
                          <span><spring:message  code='英汉'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='日汉' }">
                          <span><spring:message  code='日汉'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='汉日' }">
                          <span><spring:message  code='汉日'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='韩汉' }">
                          <span><spring:message  code='韩汉'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='汉韩' }">
                          <span><spring:message  code='汉韩'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='法汉' }">
                          <span><spring:message  code='法汉'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='汉法' }">
                          <span><spring:message  code='汉法'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='德汉' }">
                          <span><spring:message  code='德汉'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='汉德' }">
                          <span><spring:message  code='汉德'/></span>
                          </c:if>
                          </c:forEach>
                          </c:if>
                          <c:if test="${transLanguage=='[]'}">
                          <span><spring:message  code='未找到您的报价语言'/></span>
                          </c:if>
                </p></li>
                <li><p><spring:message  code='共有'/>${countEvaluate}<spring:message  code='条评价'/></p></li>
                <li><p><spring:message  code='手机绑定：'/>
                <c:if test="${translator.tel ==null}">
                <span><spring:message  code='未完成'/></span>
                </c:if>
                <c:if test="${translator.tel !=null}">
                <span><spring:message  code='完成'/></span>
                </c:if>
                </p></li>
                <li><p><spring:message  code='完成认证：'/>
                <c:if test="${translators.isVerifty ==0}">
                <span><spring:message  code='未完成'/></span>
                </c:if>
                <c:if test="${translators.isVerifty !=0}">
                <span><spring:message  code='完成'/></span>
                </c:if>
                </p></li>
                <li>
                <c:if test="${clientid!=null }">
                	<button type="submit" class="btn btn-info" name="button" id="chooseTran"  value="${translator.id }"   onclick="checkTrans(this)"><spring:message  code='选择他'/></button>
                </c:if>  
                </li>
              </ul> --%>
            </div>

            <div class="basic_data">
              	<h4><spring:message  code='译员技能'/></h4>
              	<c:if test="${transLanguages == null || transLanguages =='[]'}">
              		<br><br><br>
              		<label for="question02" class="col-sm-offset-4 col-sm-10"><font color="#B0C4DE"><spring:message  code='暂无'/></font></label>
              	</c:if> 
              	<c:if test="${transLanguages != null && transLanguages !='[]'}">
              		<table border="1" style="width:100%">
              			<tr>
              				<th>&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='领域'/>&nbsp;&nbsp;&nbsp;&nbsp;</th>
              				<th><spring:message  code='翻译'/></th>
              				<th><spring:message  code='翻译 & 校对'/></th>
              				<th><spring:message  code='翻译 & 校对 & 审核'/></th>
              			</tr>
              			<c:forEach items="${transLanguages}" var="transLanguage" varStatus="trans">
	              			<tr>
	              				<th style="text-align: center;font-size: 16px;color: #000088;" colspan="4"><spring:message  code='${transLanguage.languageName }'/></th>
	              			</tr>
	      					<c:forEach items="${transLanguage.quoList}" var="transDomain">
	      						<tr>
		              				<td><spring:message  code='${transDomain.domain }'/></td>
		              				<td>
			              				<font color="#0044BB">${transDomain.tranlevels }<spring:message  code='级'/></font>
			              				<c:if test="${transDomain.tranPrice != null && transDomain.tranPrice != 0 }">
			              					&nbsp;&nbsp;/&nbsp;
			              					<font color="#CC0000">￥${transDomain.tranPrice }&nbsp;(每千字)</font>
			              				</c:if>
			              			</td>
			              			<td>
			              				<font color="#0044BB">${transDomain.proolevels }<spring:message  code='级'/></font>
			              				<c:if test="${transDomain.prooPrice != null && transDomain.prooPrice != 0 }">
				              				&nbsp;&nbsp;/&nbsp;
				              				<font color="#CC0000">￥${transDomain.prooPrice }&nbsp;(每千字)</font>
			              				</c:if>
			              			</td>
			              			<td>
			              				<font color="#0044BB">${transDomain.auditlevels }<spring:message  code='级'/></font>
			              				<c:if test="${transDomain.auditPrice != null && transDomain.auditPrice != 0 }">
				              				&nbsp;&nbsp;/&nbsp;
				              				<font color="#CC0000">￥${transDomain.auditPrice }&nbsp;(每千字)</font>
			              				</c:if>
		              				</td>
		              			</tr>
	      					</c:forEach>
	              		</c:forEach>
              		</table>
	      			
              	</c:if>
              <!-- <div class="project">
                <strong>需求名称：<span></span></strong>
                <p class="lang_pre">源语言：<span>中文</span> 目标语言：<span></span> | 字数：<span></span></p>
                <p class="lang_pre">用时<span>80分钟</span> | 接单速度：<span></span></p>
              </div> -->
             <!--  <div class="works_pic">
                <h5><strong>作品图片</strong></h5>
                <div class="four_flash">
            			<div class="flashBg">
            				<ul class="mobile">
            					<li><img src="http://via.placeholder.com/75x85"/></li>
            					<li><img src="http://via.placeholder.com/75x85"/></li>
            					<li><img src="http://via.placeholder.com/75x85"/></li>
            					<li><img src="http://via.placeholder.com/75x85"/></li>
            				</ul>
            			</div>
            			<div class="but_pre"><i class="fa fa-angle-left fa-2x" aria-hidden="true"></i></div>
            			<div class="but_next"><i class="fa fa-angle-right fa-2x" aria-hidden="true"></i></div>
          		  </div>
              </div> -->
               <%-- <c:forEach items="${translatorQ}" var="translatorQ" varStatus="trans">
                    <div class="basic_data">
                      <div class="basic_data_inp">
                        <div class="row">
                          <p class="col-sm-4"><spring:message  code='翻译语言：'/>
                           <c:if test="${translatorQ.languages =='汉英' }">
                          <span><spring:message  code='汉英'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='英汉' }">
                          <span><spring:message  code='英汉'/></span>
                          </c:if>
                          <c:if test="${translatorQ.languages =='日汉' }">
                          <span><spring:message  code='日汉'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='汉日' }">
                          <span><spring:message  code='汉日'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='韩汉' }">
                          <span><spring:message  code='韩汉'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='汉韩' }">
                          <span><spring:message  code='汉韩'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='法汉' }">
                          <span><spring:message  code='法汉'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='汉法' }">
                          <span><spring:message  code='汉法'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='德汉' }">
                          <span><spring:message  code='德汉'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='汉德' }">
                          <span><spring:message  code='汉德'/></span>
                          </c:if>
                          </p>
                        <div class="row">
                          <p class="col-sm-4"><spring:message  code='所属领域：'/><span>${translatorQ.domain }</span></p>
                          <button id="lookWorks" class="btn btn-info"  onclick="lookWorks(${trans.index})"><spring:message  code='作品片段'/></button>
                        </div>
                        </div>
                      </div>
                       <div class="basic_data_inp" >
                        <div class="rowOrigin${trans.index}" hidden='true'>
                          <p class="col-sm-4"><spring:message  code='原文：'/><span >${translatorQ.worksOrigin }</span></p>
                          <p class="col-sm-4"><spring:message  code='译文：'/><span >${translatorQ.worksTarget }</span></p>
                        </div>
                      </div>
                       
                    </div>
				</c:forEach> --%> 
            </div>

            <div class="basic_data">
              <h4><spring:message  code='客户评价'/></h4>
               <c:if test="${translatorEvalute =='[]'  }"><br><br><br><label for="question02" class="col-sm-offset-4 col-sm-10"><h4><font color="#B0C4DE"><spring:message  code='暂无评价'/></font></h4></label></c:if> 
              <ul class="list-group customer_evaluate">
                  <c:forEach items="${translatorEvalute}" var="translatorEvalute">
                <li class="row">
                  <div class="col-sm-offset-1 col-sm-11"><p style="text-align:left;">${realName}</p></div>
                  <div class="customer_head col-sm-1">
                 
                  </div>
                    ${translatorEvalute.evaluateDetails}
                  <span class="col-sm-11">
                  </span>
                  <p class="col-sm-12">${translatorEvalute.generatedTime}</p>
                </li>
                  </c:forEach>
              </ul>
            </div>

          </div>
          <!--  译员详情内容  left  over  -->



          <!--  译员详情内容  right  开始  -->
          <div class="interpreter_details_right col-sm-3">
            <div class="recommend">
             <h4><spring:message  code='其他推荐译员'/></h4><!-- <button  id="changeTrans" onclick="changeTrans()">换一批</button> -->
              <div class="interpreter_recommend">
                <ul class="list-groupTrans">
                 <!--  <li class="recommend_cards">
                    <img src="http://via.placeholder.com/110x130" alt="">
                    <div class="demand_employer_details">
                      <p>张三</p>
                      <p>等级：<span>三级</span></p>
                      <p>完成量：<span>40</span></p>
                      <p>100%好评</p>
                    </div>
                    <div class="recommend_btns">
                      <div class="row">
                        <a href="javascript:;" class="btn btn-default col-sm-5">选择他</a>
                        <a href="interpreter.show.details.jsp" class="btn btn-default col-sm-5 col-sm-offset-1">查看译员</a>
                      </div>
                    </div>
                  </li>
                  <li class="recommend_cards">
                    <img src="http://via.placeholder.com/110x130" alt="">
                    <div class="demand_employer_details">
                      <p>张三</p>
                      <p>等级：<span>三级</span></p>
                      <p>完成量：<span>40</span></p>
                      <p>100%好评</p>
                    </div>
                    <div class="recommend_btns">
                      <div class="row">
                        <a href="javascript:;" class="btn btn-default col-sm-5">选择他</a>
                        <a href="interpreter.show.details.jsp" class="btn btn-default col-sm-5 col-sm-offset-1">查看译员</a>
                      </div>
                    </div>
                  </li> -->
                </ul>
              </div>
            </div>
          </div>
          
          <!--  译员详情内容  right  over  -->
          
          </div>
        </div>
        </div>
        <!--  译员详情内容  结束  -->
</div>
     <div id="gradient" class="footer_content">
      <!-- 用户指南  -->
      <div class="messages container">
     	 	<div class="message_more">
      			<div class="row"></div>
      			</div>
      			    <ul class="col-sm-2 message_more_li"><li><h2><spring:message  code='新手指南'/></h2></li><li><a href="/forwardAction/forward_toRegisterProcess.do"><spring:message  code='注册流程'/></a></li><li><a href="/forwardAction/forward_toRuleDescription.do"><spring:message  code='规则中心'/></a></li><li><a href="/forwardAction/forward_toIdentification.do"><spring:message  code='用户认证'/></a></li></ul>
      				<ul class="col-sm-2 col-sm-offset-1 message_more_li"><li><h2><spring:message  code='我是客户'/></h2></li><li><a href="/forwardAction/forward_toCustomerInstructions.do"><spring:message  code='客户须知'/></a></li><li><a href="/forwardAction/forward_toPublishProcess.do"><spring:message  code='项目发布'/></a></li><li><a href="/forwardAction/forward_toQuality.do"><spring:message  code='稿酬明细'/></a></li></ul>
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
    <!-- </div> -->
    
  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
