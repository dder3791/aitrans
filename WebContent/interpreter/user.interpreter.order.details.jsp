<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>     
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name=" Keywords" content="......">      <!--content中，网页关键字-->
    <meta name=" description" content="......">   <!--content中，网页描述文字-->
    <meta name="author" content="......">        <!--标注作者-->
    <title><spring:message  code='译员中心-我是译员-我的任务详情'/></title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.center.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.center.js"></script> --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
    <script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <style type="text/css">
      .myOrders .table{
        margin-top:20px;
      }
      .myOrders .table th{
        text-align: center;
        font-weight: 500;
        vertical-align: middle;
      }
      .myOrders .table td{
        text-align: center;
        line-height: 1.5;
        vertical-align: middle;
        border-left:1px solid #ddd;
        border-bottom:1px solid #ddd;
      }
      .myOrders .table td:first-child{
        border-left:none;
      }
      .liuchenglis,.buzoulis,.daylis{
        text-align: center;
      }
      .liuchenglis span{
        display: inline-block;
        width:81px;
        padding-bottom:8px;
      }
      .buzoulis span{
        display: inline-block;
        width:25px;
        height:25px;
        border-radius:50%;
        text-align: center;
        line-height:25px;
        border:1px solid #ddd;
      }
      .daylis span{
        display: inline-block;
        padding-top:8px;
        font-size: 12px;
        width:81px;
      }
      .buzoubg{
        color:#fff;
        background:#0a9f05;
      }
      .needdetails>div{
        min-height:420px;
      }
      .needdetails h4{
        font-size: 18px;
        font-weight: 700;
        margin:20px 0;
      }
      .needdetails .needdoc{
        border:1px solid #ddd;
        width:90%;
        padding:20px;
        min-height:400px;
      }
      .needdetails .needdoc p{
        font-size: 12px;
      }
      .needdetails .needdoc p:nth-child(2),
      .needdetails .needdoc p:nth-child(3){
        text-indent: 2em;
      }
      .downloads{
        margin:40px 0;
      }
      .downloads li{
        padding-right:15px;
      }
      .downloads li a{
        display: inline-bloxk;
        height:60px;
        padding-left: 10px;
        color: #337ab7;
        vertical-align: bottom;
      }
      .addfiles,.upfiles{
        width:70px;
        height:34px;
        position: relative;
        margin-left:20px;
      }
      .addfiles input,.upfiles input{
        opacity: 0;
        position: absolute;
        z-index: 999;
        cursor: pointer;
      }
      .addfiles button,.upfiles button{
        padding:5px 20px;
        position: absolute;
        top:0;
        left:0;
      }
    </style>
 <script type="text/javascript">
 function overShowTime() {  
     var showDiv = document.getElementById('showDivTime');  
     showDiv.style.left = event.clientX;  
     showDiv.style.top = event.clientY;  
     showDiv.style.display = 'block';  
     showDiv.innerHTML = "<spring:message code='订单流程说明'/><br><spring:message code='译员接受形成订单后'/>，<spring:message code='平台会根据项目的进展情况计算出每步流程所需要的日期以及百分比'/>，<spring:message code='译员应在保质保量的情况下'/>，<spring:message code='通过添加翻译文件点击上传'/>，<spring:message code='译员则可以对上传的文件进行浏览以及其他操作'/>，<spring:message code='需注意的是每次必须上传文件后才可以确认流程完成进入下一步'/>，<spring:message code='否则不允许通过'/>。";  
 }  
 function outHideTime() {  
     var showDiv = document.getElementById('showDivTime');  
     showDiv.style.display = 'none';  
     showDiv.innerHTML = '';  
 }
     $(function(){
    	 var orderstat=$("#orderstat").val();
    	 var procedureTypeId=$("#procedureTypeId").val();
    	 if(procedureTypeId==1){
    		 if(orderstat>=5){
    			 var buzou3=document.getElementById("buzou3");
    	      	   buzou3.setAttribute("class","buzoubg");
    	      	 $("#uploadFile").hide();
    		 }
    	 }
    	 if(procedureTypeId==2){
    		 if(orderstat==3){
    			 var buzou3=document.getElementById("buzou3");
    	      	   buzou3.setAttribute("class","buzoubg");
    		 }
    		 if(orderstat>=5){
    			 var buzou3=document.getElementById("buzou3");
    	     	   buzou3.setAttribute("class","buzoubg");
    	  		   var buzou4=document.getElementById("buzou4");
    	  		   buzou4.setAttribute("class","buzoubg");
    	  		 $("#uploadFile").hide();
    		 }
    	 }
    	 if(procedureTypeId==3){
    		  if(orderstat==3){
    		   var buzou3=document.getElementById("buzou3");
        	   buzou3.setAttribute("class","buzoubg");
    	   }
    	   if(orderstat==4){
    		  var buzou3=document.getElementById("buzou3");
       	   buzou3.setAttribute("class","buzoubg");
    		   var buzou4=document.getElementById("buzou4");
    		   buzou4.setAttribute("class","buzoubg");
    	   }
    	   if(orderstat>=5){
    		 var buzou3=document.getElementById("buzou3");
     	   buzou3.setAttribute("class","buzoubg");
  		   var buzou4=document.getElementById("buzou4");
  		   buzou4.setAttribute("class","buzoubg");
    		   var buzou5=document.getElementById("buzou5");
    		 buzou5.setAttribute("class","buzoubg");
    		 $("#uploadFile").hide();
    	   } 
    	 }
  	   /* if(orderstat==3){
  		   var buzou3=document.getElementById("buzou3");
      	   buzou3.setAttribute("class","buzoubg");
  	   }
  	   if(orderstat==4){
  		  var buzou3=document.getElementById("buzou3");
     	   buzou3.setAttribute("class","buzoubg");
  		   var buzou4=document.getElementById("buzou4");
  		   buzou4.setAttribute("class","buzoubg");
  	   }
  	   if(orderstat>=5){
  		 var buzou3=document.getElementById("buzou3");
   	   buzou3.setAttribute("class","buzoubg");
		   var buzou4=document.getElementById("buzou4");
		   buzou4.setAttribute("class","buzoubg");
  		   var buzou5=document.getElementById("buzou5");
  		 buzou5.setAttribute("class","buzoubg");
  	   } */
  	 
  	 /* if(procedureTypeId==1 || orderstat=5){
  		 $("#uploadFile").hide();
  	 } */
  		/* $("#proo").text("${orders.prooTime}");
  		$("#expert").text("${orders.expertTime}"); 
  	 }else if(procedureTypeId==2){
  		$("#expert").text("${orders.expertTime}"); 
  	 }
  	 if(procedureTypeId==1 && orderstat==3){
  		 $("#uploadFile").hide();
  	 }else if(procedureTypeId==1 && orderstat>=5){
  		 $("#uploadFile").hide();
  	 }
  	 if(procedureTypeId==2 && orderstat>=5){
  		 $("#uploadFile").hide();
  	 }
  	 if(procedureTypeId==3 && orderstat>=5){
  		$("#uploadFile").hide();
  	 } */
  	  
  	 
  	 /*  var publishModel=$("#publishModels").val();
     if(publishModel=='选定译员模式'){
   	  var totalMoney=$("#totalMoney").text();
   	  var finalMoney=totalMoney-(totalMoney/6);
   	  $("#totalMoney").text(finalMoney);
     }  */
     });
     var message="${message}";
     if(message.length>0 ){
 		layer.msg("<spring:message  code='上传成功!'/>", {icon: 1});
 	}
        //添加上传按钮 
       function addOne(){                                                                                                                                
          $("#addDown").append("<div id='addDiv' style='width: 450px;margin-top: 10px;'><input type='file' name='files' style='float: right;width:250px;padding:5px 0 5px 0' /><input type='button' class='btn btn-primary marR10' style='margin-left:128px;' value='<spring:message code='删除'/>' onclick='delOne(this)' ></div>");
       }  
       //删除上传按钮 
       function delOne(btn){  
           var div=btn.parentNode;  
           div.parentNode.removeChild(div);  
       }  
       function changeflow(){
    	   var ordersId=$("#ordersId").val();
    	   var orderstat=$("#orderstat").val();
    	   var procedureTypeId=$("#procedureTypeId").val();
    	   var transFiles=$("#transFiles").text();
    	   var prooFiles=$("#prooFiles").text();
    	   var auditFiles=$("#auditFiles").text();
    	   if(procedureTypeId==1){
    		   if(orderstat==2){
    	   if(transFiles==null || transFiles==''){
    		   layer.msg('<spring:message  code="尚未查到您上传的文件！"/>', {icon: 5}); 
    	   }else{
    		 $.post("/translator/translatorAction_updateTaskState.do","orderstat="+orderstat+"&ordersId="+ordersId+"&procedureTypeId="+procedureTypeId, function(data){
      		   if(data.result=="success"){
  	    	      window.location.href="/translator/translatorAction_lookOrder.do?id="+ordersId;
  	    		  }
       	     },"json");
    	   }
    	  }
    	 }
    	   
    	    if(procedureTypeId==2){
    		   if(orderstat==2){
    	   if(transFiles==null || transFiles==""){
    		   layer.msg('<spring:message  code="尚未查到您上传的文件！"/>', {icon: 5});
    	   }else{
    		 $.post("/translator/translatorAction_updateTaskState.do","orderstat="+orderstat+"&ordersId="+ordersId+"&procedureTypeId="+procedureTypeId, function(data){
      		   if(data.result=="success"){
  	    	      window.location.href="/translator/translatorAction_lookOrder.do?id="+ordersId;
  	    		  }
       	     },"json");
    	   }
    	  }
    	  if(orderstat==3){
    		  if(prooFiles==null || prooFiles==""){
    			  layer.msg('<spring:message  code="尚未查到您上传的文件！"/>', {icon: 5}); 
    	      }else{
    	          $.post("/translator/translatorAction_updateTaskState.do","orderstat="+orderstat+"&ordersId="+ordersId+"&procedureTypeId="+procedureTypeId, function(data){
      	    	   if(data.result=="success"){
      		    	  window.location.href="/translator/translatorAction_lookOrder.do?id="+ordersId;
      		        }
      	     	  },"json");
    	       } 
    	  }	   
    	 
    	 } 
    	   
    	    if(procedureTypeId==3){
    		   if(orderstat==2){
    	   if(transFiles==null || transFiles==""){
    		   layer.msg('<spring:message  code="尚未查到您上传的文件！"/>', {icon: 5}); 
    	   }else{
    		 
    		 $.post("/translator/translatorAction_updateTaskState.do","orderstat="+orderstat+"&ordersId="+ordersId+"&procedureTypeId="+procedureTypeId, function(data){
      		   if(data.result=="success"){
  	    	      window.location.href="/translator/translatorAction_lookOrder.do?id="+ordersId;
  	    		  }
       	     },"json");
    	   }
    	  }
    		   
           if(orderstat==3){
    	     if(prooFiles==null || prooFiles==""){
    	    	 layer.msg('<spring:message  code="尚未查到您上传的文件！"/>', {icon: 5});   
    	    }else{
    	       $.post("/translator/translatorAction_updateTaskState.do","orderstat="+orderstat+"&ordersId="+ordersId+"&procedureTypeId="+procedureTypeId, function(data){
     	    	  if(data.result=="success"){
     		        window.location.href="/translator/translatorAction_lookOrder.do?id="+ordersId;
     		     }
     	      },"json");
    	     }
    	  }
    		   
    		   
    	  if(orderstat==4){
    	     if(auditFiles==null || auditFiles==""){
    	    	 layer.msg('<spring:message  code="尚未查到您上传的文件！"/>', {icon: 5});  
    	       }else{
    	    	 $.post("/translator/translatorAction_updateTaskState.do","orderstat="+orderstat+"&ordersId="+ordersId+"&procedureTypeId="+procedureTypeId, function(data){
        	         if(data.result=="success"){
        		      window.location.href="/translator/translatorAction_lookOrder.do?id="+ordersId;
        		      }
        	     	},"json");
    	    	 }
    	     }
    	 }	  
       }

   </script>
  </head>
  <body style="background: #f5f5f5;">
   <!--      顶部导航      -->
  	<c:if test="${clientid.id!=null || transid.id!=null }">
  	<div class="publickNav">
  		<div class="public_nav"> 
           <nav class="container" style="padding:0 20px;"> 
           <div class="navbar-left"><a href="${pageContext.request.contextPath}/translator/translatorAction_lookOrder.do?lang=zh_CN&id=${orders.id }" class="navbar-link" onclick="in18(this)">中文</a> | <a href="${pageContext.request.contextPath}/translator/translatorAction_lookOrder.do?lang=en_US&id=${orders.id }" class="navbar-link" onclick="in18(this)">English</a></div><a style="padding-left:50px;" href="/forwardAction/forward_toIndex.do"><spring:message  code='首页'/></a>
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

        <!--    用户中心 我是议员   -->
        <div class="my_customer">
          <div class="row">

            <!--    用户中心 我是议员 左侧导航   -->
            <div class="my_interpreter_left col-sm-2">
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

            <!--    用户中心 我是议员 我的订单 右侧内容   -->
            <div class="my_customer_right col-sm-10">
              <div  class="myTabContent" class="tab-content" style="margin-top:0;">
               <a href="javascript:;" onmouseover="overShowTime()" onmouseout="outHideTime()" style="margin-left: 800px"><font color="red"><b><spring:message  code='查看帮助'/>?</b></font></a>
               <div id="showDivTime" style="color:#fff;z-index: 999;display:none;position: absolute; background-color: #3a3f51; border: 1px solid white;margin-left:45%;width:45%;text-align: center;border-radius:10px;padding:10px;"></div>
              <input type="hidden" value="${orders.id}" id="ordersId" name="orderId">
                <h3 style="padding-bottom:20px;margin-bottom:30px;border-bottom:2px solid #ddd;font-size:20px;font-weight:700;"><a href="user.interpreter.order.jsp"><spring:message  code='我的订单'/></a> -><spring:message  code='订单详情'/></h3>
                <div>
                  <ul class="buzoukuai">
                    <li class="liuchenglis">
                      <span><spring:message  code='生成订单'/></span>
                      <span><spring:message  code='翻译'/></span>
                      <c:if test="${clientCustomerNeed.procedureTypeId>1}">
                      <span><spring:message  code='校对'/></span>
                      </c:if>
                      <c:if test="${clientCustomerNeed.procedureTypeId>2}">
                      <span><spring:message  code='审核'/></span>
                      </c:if>
                      <span><spring:message  code='已返稿'/></span>
                      <span><spring:message  code='客户签收'/></span>
                      <span><spring:message  code='客户评价'/></span>
                      <span><spring:message  code='完成'/></span>
                    </li>
                    
                    
                    <li class="buzoulis">
                     <c:if test="${clientCustomerNeed.procedureTypeId==1 }">
                       <span class="buzoubg">1</span>————
                      <span id="buzou2" class="buzoubg">2</span>————
                      <span id="buzou3" >3</span>————
                      <span <c:if test="${orders.signTime!=null}">class="buzoubg"</c:if>>4</span>————
                       <span <c:if test="${orders.customerEvaluate!=null}">class="buzoubg"</c:if>>5</span>————
                        <span <c:if test="${orders.completeTime!=null}">class="buzoubg"</c:if>>6</span>
                      </c:if>
                      <c:if test="${clientCustomerNeed.procedureTypeId==2 }">
                       <span class="buzoubg">1</span>————
                      <span id="buzou2" class="buzoubg">2</span>————
                      <span id="buzou3" >3</span>————
                      <span id="buzou4" >4</span>————
                      <span <c:if test="${orders.signTime!=null}">class="buzoubg"</c:if>>5</span>————
                       <span <c:if test="${orders.customerEvaluate!=null}">class="buzoubg"</c:if>>6</span>————
                        <span <c:if test="${orders.completeTime!=null}">class="buzoubg"</c:if>>7</span>
                      </c:if>
                      <c:if test="${clientCustomerNeed.procedureTypeId==3 }">
                       <span class="buzoubg">1</span>————
                      <span id="buzou2" class="buzoubg">2</span>————
                      <span id="buzou3" >3</span>————
                      <span id="buzou4" >4</span>————
                      <span id="buzou5" >5</span>————
                      <span <c:if test="${orders.signTime!=null}">class="buzoubg"</c:if>>6</span>————
                       <span <c:if test="${orders.customerEvaluate!=null}">class="buzoubg"</c:if>>7</span>————
                        <span<c:if test="${orders.completeTime!=null}">class="buzoubg"</c:if>>8</span>
                      </c:if>
                      
                    <li class="daylis">
                      <span id="generated" >${orders.generatedTime}</span><%-- <fmt:formatDate value="${transTime}" pattern="yyyy年MM月dd日HH时mm分"/> --%>
                      <span ><spring:message  code='截止时间'/><br><fmt:formatDate value="${transTime}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></span>
                      <c:if test="${clientCustomerNeed.procedureTypeId>1}">
                      <span ><spring:message  code='截止时间'/><br><fmt:formatDate value="${proosTime}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></span>
                      </c:if>
                       <c:if test="${clientCustomerNeed.procedureTypeId>2}">
                      <span ><spring:message  code='截止时间'/><br><fmt:formatDate value="${auditTime}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></span>
                      </c:if>
                      <c:if test="${clientCustomerNeed.procedureTypeId>1}">
                      </c:if>
                      <span id="examination">${orders.examinationTime}</span>
                      <span id="sign">${orders.signTime}</span>
                      <span id="customer">${orders.customerEvaluate}</span>
                      <span id="complete">${orders.completeTime}</span>
                    </li>
                    
                     <li class="liuchenglis" style="margin-top: 5px">
                      <span></span>
                      <span>${transRatio}</span>
                      <c:if test="${clientCustomerNeed.procedureTypeId>1}">
                      <span >${proosRatio}</span>
                      </c:if>
                      <c:if test="${clientCustomerNeed.procedureTypeId>2}">
                      <span>${auditRatio}</span>
                      </c:if>
                      <span></span>
                      <span></span>
                      <span></span>
                      <span></span>
                      
                    </li>
                  </ul>
                </div>
                <div class="myOrders" style="margin-top: 30px">
                <div class="row" style="text-align: center;"><font size="4px" color="blue"><b>${orders.orderTitle}</b></font></div>
                  <table class="table myOrdersTable">
                    <tr>
                      <th><spring:message  code='订单生成时间'/></th>
                      <th><spring:message  code='订单号'/></th>
                      <th><spring:message  code='案号'/></th>
                      <th><spring:message  code='译员名'/></th>
                      <!-- <th>用户名</th> -->
                      <th><spring:message  code='任务状态'/></th>
                      <th><spring:message  code='金额'/></th>
                     <!--  <th>进行状态</th> -->
                    </tr>
                    <tr>
                      <td>${orders.generatedTime}</td>
                      <td>${orders.orderNumber}</td>
                      <td>${orders.orderReference}</td>
                      <td>${nickname}</td>
                     <%--  <td>${clientName}</td> --%>
                      <c:if test="${orders.taskStateId eq 1}"><td><spring:message  code='生成订单'/></td></c:if>
                      <c:if test="${orders.taskStateId eq 2}"><td><spring:message  code='翻译中'/></td></c:if>
                      <c:if test="${orders.taskStateId eq 3}"><td><spring:message  code='校对中'/></td></c:if>
                      <c:if test="${orders.taskStateId eq 4}"><td><spring:message  code='审核中'/></td></c:if>
                      <c:if test="${orders.taskStateId eq 5}"><td><spring:message  code='已返稿'/></td></c:if>
                      <c:if test="${orders.taskStateId eq 6}"><td><spring:message  code='客户签收'/></td></c:if>
                      <c:if test="${orders.taskStateId eq 7}"><td><spring:message  code='客户评价'/></td></c:if>
                      <c:if test="${orders.taskStateId eq 8}"><td><spring:message  code='已完成'/></td></c:if>
                      <c:if test="${orders.taskStateId eq 9}"><td><spring:message  code='已取消'/></td></c:if>
                      <c:if test="${orders.taskStateId eq 10}"><td><spring:message  code='拒签'/></td></c:if>
                      <td><font color="red">${orders.payNumber}</font><br></td>
                      <td id="td1">
                      <input type="hidden" id="orderstat" name="orderstat" value="${orders.taskStateId}">
                      </td>
                  </table>
                </div>
                <div class="row">
                	<div class="col-xs-9"></div>
                	<div class="col-xs-3"><spring:message code='交稿日期'/>&nbsp;&nbsp;:&nbsp;&nbsp;<font color="blue">${clientCustomerNeed.completeTime }</font></div>
                </div>
                <div class="row needdetails">
                  <div class="col-sm-6">
                    <h4><spring:message  code='项目详情'/></h4>
                    <div class="needdoc">
                       <input type="hidden" id="publishModels"  name="publishModels" value="${clientCustomerNeed.publishModel }">
<%--                       <p style="font-size:14px;text-indent: 0;" id="finalMoney"><spring:message  code='总价'/>：<span id="totalMoney"><font color="red">${clientCustomerNeed.totalMoney }</font></span><spring:message  code='元'/></p>
 --%>                      <p style="font-size:14px;text-indent: 0;"><spring:message  code='流程状态'/>：<span><spring:message code='${clientCustomerNeed.cycle }'/></span></p>
                      <p style="font-size:14px;text-indent: 0;"><spring:message  code='项目语种'/>：<span><spring:message code='${clientCustomerNeed.languagePair }'/></span></p>
                      <p style="font-size:14px;"><spring:message  code='字数'/>：<span>${clientCustomerNeed.length }</span><spring:message  code='字'/></p>
                      <p style="font-size:14px;"><spring:message  code='项目类型'/>：<span><spring:message  code='${projectTypeId }'/></span></p>
                      <p style="font-size:15px;"><spring:message  code='项目描述：'/></p>
                      <p style="font-size:14px;">${clientCustomerNeed.description }</p>
                      <input type="hidden" value="${clientCustomerNeed.procedureTypeId}" name="procedureType" id="procedureTypeId">
                      <p style="font-size:14px;"></p>
                      <span></span>
                      <span><spring:message  code='项目附件'/>：</span>
                      <div style="margin-top: 10px"></div>
                      <c:forEach items="${needsNames }" var="needsNames">
                       <li>
                         <form action="${pageContext.request.contextPath}/translator/translatorAction_downloadTransFile.do" method="post" id="downloadForm">
                           <span style="margin-right: 30px" >${needsNames.key }</span>
                           <input type="hidden" name="url" id="url" value="${needsNames.value }">
                           <input type="hidden" name="filename" id="filename" value="${needsNames.key }">
                           <%-- <span style="color: red" onclick="down(this)"><spring:message  code='下载'/></span> --%>
                           <a style="color: red" href="javascript:void(0)" onclick="down(this)"><spring:message  code='下载'/></a>
                         </form>
                       </li>
                      </c:forEach>
                    </div>
                  </div> 
                     <!-- style="position:relative;" -->
                    <div class="col-sm-6">
                    <h4><spring:message  code='上传文件预览：'/></h4>
                       <ul class="list-inline transdownloads">
                        <li> <span style="color: BLUE" id="transNames"><spring:message  code='翻译文件：'/></span></li>
                      <c:forEach items="${transNames }" var="transNames">
                        <li>
                          <form action="${pageContext.request.contextPath}/translator/translatorAction_downloadTransFile.do" method="post">
                              <span style="margin-right: 30px" id="transFiles">${transNames.key }</span>
                              <input type="hidden" name="url"  id="url" value="${transNames.value }">
                             <%--  <span style="color: red" onclick="downTransFile(this)"><spring:message  code='下载'/></span> --%>
                              <a style="color: red"  href="javascript:void(0)" onclick="downTransFile(this)"><spring:message  code='下载'/></a>
                              <%-- <span style="color: red"  onclick="deleteFile(this)"><spring:message  code='删除'/></span> --%>                      
                              <a style="color: red" href="javascript:void(0)"  onclick="deleteFile(this)" ><spring:message  code='删除'/></a>                      
                          </form>
                        </li>
                      </c:forEach>
                      </ul>
                      <c:if test="${clientCustomerNeed.procedureTypeId>=2}">
                      <ul class="list-inline proofdownloads">
                       <li><span style="color: BLUE" ><spring:message  code='校对文件：'/></span></li>
                      <c:forEach items="${prooNames }" var="prooNames">
                       <li>
                       	<form action="${pageContext.request.contextPath}/translator/translatorAction_downloadTransFile.do" method="post" >
                       	  <span style="margin-right: 30px" id="prooFiles">${prooNames.key }</span>
                       	   <input type="hidden" name="url" value="${prooNames.value }">
                       	  <%--  <span style="color: red" onclick="downTransFile(this)"><spring:message  code='下载'/></span> --%>
                       	   <a style="color: red" href="javascript:void(0)"  onclick="downTransFile(this)"><spring:message  code='下载'/></a>
                       	  <%--  <span style="color: red"  onclick="deleteFile(this)" name="删除"><spring:message  code='删除'/></span> --%>
                       	   <a style="color: red" href="javascript:void(0)"  onclick="deleteFile(this)" name="删除"><spring:message  code='删除'/></a>
                       	</form>
                       </li>
                      </c:forEach>
                      </ul>
                      </c:if>
                       <c:if test="${clientCustomerNeed.procedureTypeId>=3}">
                      <ul class="list-inline auditdownloads">
                       <li><span style="color: BLUE"><spring:message  code='审核文件：'/></span></li>
                      <c:forEach items="${auditNames }" var="auditNames">
                       <li>
                         <form action="${pageContext.request.contextPath}/translator/translatorAction_downloadTransFile.do" method="post">
                           <span style="margin-right: 30px" id="auditFiles">${auditNames.key }</span>
                           <input type="hidden" name="url" value="${auditNames.value }">
                         <%--   <span style="color: red" onclick="downTransFile(this)"><spring:message  code='下载'/></span> --%>
                           <a style="color: red" href="javascript:void(0)"  onclick="downTransFile(this)"><spring:message  code='下载'/></a>
                           <%-- <span style="color: red"  onclick="deleteFile(this)"><spring:message  code='删除'/></span> --%>
                           <a style="color: red" href="javascript:void(0)"  onclick="deleteFile(this)"><spring:message  code='删除'/></a>
                         </form>
                       </li>
                      </c:forEach>
                      </ul>
                      </c:if>
                  </div>
                  
                 <div class="col-sm-6" style="margin-top:-89px;">
                  
			     <div class="form-group row" id="uploadFile" >
                  <label for="needqq" id="needqq">
                  </label>
                  
                 <form action="${pageContext.request.contextPath}/translator/translatorAction_uploadFile.do"  method="post" enctype="multipart/form-data"  id="addDown">  
                  <c:if test="${orders.taskStateId ==2}">
                  <span id="span1"><spring:message  code='翻译'/></span>
                  </c:if>
                  <c:if test="${orders.taskStateId ==3}">
                  <span id="span1"><spring:message  code='校对'/></span>
                  </c:if>
                  <c:if test="${orders.taskStateId ==4}">
                  <span id="span1"><spring:message  code='审核'/></span>
                  </c:if>
                    
                  <span><spring:message  code='文件上传：'/></span>
                   <input type="hidden" value="${orders.id}" id="ordersId" name="orderId">
                  <input type="hidden" id="current" value="${orders.taskStateId}" name="current">
                 <div id="addDiv" style="width: 450px;margin-top: 10px;">
                   <input type="file" name="files" style="width:250px;float: right;padding:5px 0 5px 0" />
                   <input type="submit" class="btn btn-primary marR10"  value="<spring:message  code='上传'/>" style="margin-right:10px;float: left">
                   <input type="button" value="<spring:message  code='添加'/>" class="btn btn-primary marR10"  onclick="addOne()" style="margin-right:10px;float: left">     
                   <input type='button' class='btn btn-primary marR10' value='<spring:message code='删除'/>' onclick='delOne(this)' disabled="disabled" > 
                 </div>      
                  </form> 
                 </div>
                 
			      <c:if test="${orders.taskStateId<5}">
                   <button class="btn btn-info sureOrder" onclick="changeflow()"><spring:message  code='确认流程完成'/></button>                 
			      </c:if>
			    </div>
                </div>
              </div>
            </div>
            <!--    用户中心 我是议员 我的订单 右侧内容 结束   -->
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
          $(".cus_iter_navlists").eq(3).find("a").addClass("useractive")
          
          
          if("${transid.nickname}"!=null && "${transid.nickname}"!=''){
        	  $("#nickname").text("${transid.nickname}"+"<spring:message  code='，欢迎您！'/>");
          }else if("${transid.tel}"!=null && "${transid.tel}"!=''){
        	  $("#nickname").text("${transid.tel}"+"<spring:message  code='，欢迎您！'/>");
          }else if("${transid.email}"!=null && "${transid.email}"!=''){
        	  $("#nickname").text("${transid.email}"+"<spring:message  code='，欢迎您！'/>");
          }
          /* var tnickname = "${transid.nickname}";
			var unickname = "${clientid.userName}"
			if(tnickname!=""){
				$("#nickname").text(tnickname+"<spring:message  code='，欢迎您！'/>");
				
			}else if (unickname!="") {
				$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>!");
				} */
          
          
          
      });
      //下载需求文件功能
      function down(obj,key){
   	  var inputElement=getNearEle(obj, 1);//获取下载按钮
   	  var spanEle=getNearEle(inputElement,1);//获取value的值为全路径
   	  var formEle=inputElement.parentNode;
   	 /*  var chan=spanEle.innerHTML.replace("\\","/"); */
   	  /* var url=inputElement.value.replace("\\","/"); */
   	 /*  formEle.action="${pageContext.request.contextPath}/translator/translatorAction_downloadTransFile.do?url="+url+"&filename="+spanEle.innerHTML;*/
   	  formEle.submit();
     }
       //下载译员文件功能
       function downTransFile(obj,key){
    	   var inputElement=getNearEle(obj, 1);//获取下载按钮
    	   var spanEle=getNearEle(inputElement,1);
     	  var formEle=inputElement.parentNode;
     	  var url=inputElement.value;
     	 formEle.action="${pageContext.request.contextPath}/translator/translatorAction_downloadTrans.do?url="+inputElement.value+"&filename="+spanEle.innerHTML;
    	 formEle.submit();
       }
       //获取相邻元素方法
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
     
      //执行删除文件功能
      function deleteFile(obj,key){
    	  var inputElement=getNearEle(obj, 1);//获取下载按钮
    	  var spanEle=getNearEle(inputElement,1);//获取value的值为全路径
    	  var spanElement=getNearEle(spanEle, 1);//获取文件名
    	  var span=spanEle.value; 
    	  var ordersId=$("#ordersId").val();
    	 var chan=span+"/"+spanElement.innerHTML;
    	  $.post("/translator/translatorAction_deleteFile.do","fileName="+chan, function(data){
    		 if(data.result=="success"){
    			 layer.alert('<spring:message  code="删除文件成功"/>', {
	  					icon: 1,
	  					title: "<spring:message  code='提示'/>",
	  					end: function () {
	  						 obj.parentNode.parentNode.parentNode.removeChild(obj.parentNode.parentNode);
	  						/*  window.location.href="/translator/translatorAction_lookOrder.do?id="+ordersId; */
							}
	  					});
	       }else if(data.result="fail"){
	    	   layer.alert('<spring:message  code="删除文件失败"/>', {
 					icon: 1,
 					title: "<spring:message  code='提示'/>",
 					});
	       }
    	 },"json");
      }	  
      
    </script>
  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
