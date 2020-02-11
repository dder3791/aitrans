<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name=" Keywords" content="......">      <!--content中，网页关键字-->
    <meta name=" description" content="......">   <!--content中，网页描述文字-->
    <meta name="author" content="......">        <!--标注作者-->
    <title><spring:message code='用户中心-我是用户信息'/></title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.center.css"/>


    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    
    <script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
	<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
	
   <script type="text/javascript">
   var lang = "${language}"
  if(lang==""){
	lang="zh";
  }
   $(function(){
	    
	   if("${clientid.userName}"!='' && "${clientid.userName}"!=null){
	   		 $("#nickname").text('${clientid.userName}'+"<spring:message code=',欢迎您!'/>");
	   	 }else if('${clientid.tel}'!=null && '${clientid.tel}'!=null){
	   		 $("#nickname").text('${clientid.tel}'+"<spring:message code=',欢迎您!'/>");
	   	 }else if('${clientid.emaile}'!=null && '${clientid.emaile}'!=null){
	   		 $("#nickname").text('${clientid.emaile}'+"<spring:message code=',欢迎您!'/>");
	   	 }
	  	/*  var tnickname = "${transid.nickname}";
		 var unickname = "${clientid.userName}"
		if(tnickname!=""){
			$("#nickname").text(tnickname+"<spring:message  code='，欢迎您！'/>");
			
		}else if (unickname!="") {
			$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>!");
			} */
		
		checkValue();
		//添加国家
		$.post("/cilentCustomer/getCountry.do",function(data){
		//找国家
		//先移除
			/* $('#country option').length=1; */
			document.getElementById("country").options.length=1;
		//国家改变，省清空，城市清空
			/* $('#provincs option').length=1;
			$('#city option').length=1; */
			document.getElementById("provincs").options.length=1;
			document.getElementById("city").options.length=1;
			var address=getAddress();
			var countryAdd="";
			if(lang=="" || lang=="zh"){
				countryAdd=address[1][0]//中文国家
			 }else{
				countryAdd=address[0][0]//英文国家
			 }
			for(var i in data){
				if(countryAdd!=data[i]){
					 var option="<option value='"+i+"'>"+data[i]+"</option>"; 
				}else{
					 var option="<option value='"+i+"' selected>"+data[i]+"</option>"; 
				}
				
				$("#country").append(option);  
			}
			
			
			var count=document.getElementById("country");
			var countVal=document.getElementById("country").value;
	        if(countVal!=null && countVal!=""){
	        	getProvincs(count);	
	        }
	  },"json");
   })
   function checkValue(){
	   var val_payPlatform = $('#checkDIV input[name="certificationType"]:checked ').val();
		if("0"==val_payPlatform){
			$("#onlineDIV").hide();
			$("#prosenDIV").show();
		}else{
			$("#onlineDIV").show();
			$("#prosenDIV").hide();
		}
   }
   
   function getAddress(){
		var addressEN=$("#addressEN").val();//注册地址
       var addressZH=$("#addressZH").val();//注册地址
       var addressENArr=new Array();
       var addressZHArr=new Array();
       addressENArr=addressEN.split("  ");  
       addressZHArr=addressZH.split("  ");  
       
       var address=new Array();
       address=[addressENArr,addressZHArr];
       return address;
	}
   
   
   function getProvincs(obj){
		//alert("省");
		var countryKEY=document.getElementById("country").value;
		var countryValue=obj.options[obj.selectedIndex].text;/* document.getElementById("country").text; */
		var registrationAddress=document.getElementById("registrationAddress");
		registrationAddress.value=countryValue;
		$("#hiddenCountry").val(countryValue);//国家
		$.post("/cilentCustomer/getCountry.do?country="+countryKEY,function(data){
		//找省份
		//先移除
		document.getElementById("provincs").options.length=1;
		document.getElementById("city").options.length=1;
			/* $('#provincs option').length=1;
			$('#city option').length=1; */
		
		//添加新的option
		var address=getAddress();
		var provincesAdd="";
		if(lang=="" || lang=="zh"){
			provincesAdd=address[1][1]//中文国家
		 }else{
			 provincesAdd=address[0][1]//英文国家
		 }
		for(var i in data){
			if(provincesAdd!=data[i]){
				 var option="<option value='"+i+"'>"+data[i]+"</option>"; 
			}else{
				 var option="<option value='"+i+"' selected>"+data[i]+"</option>"; 
			}
			 $("#provincs").append(option); 
		}	
		
		
		var priv=document.getElementById("provincs");
		var privVal=document.getElementById("provincs").value;
        if(privVal!=null && privVal!=""){
        	 getCity(priv);
        }
	  },"json");
}
		  
	
	function getCity(obj){
		var registrationAddressValue=document.getElementById("registrationAddress").value;
		var countryKEY=document.getElementById("country").value;
		var provincKEY=document.getElementById("provincs").value; 
		var provincVAL=obj.options[obj.selectedIndex].text;
		var registrationAddress=document.getElementById("registrationAddress");
		registrationAddress.value=registrationAddressValue+"  "+provincVAL;
		$.post("/cilentCustomer/getCountry.do?country="+countryKEY+"&provinces="+provincKEY,function(data){
		//找省份
		//先移除
			/* $('#city option').length=1; */
			document.getElementById("city").options.length=1;
		
		//添加新的option
		var address=getAddress();
		var cityAdd="";
		if(lang=="" || lang=="zh"){
			cityAdd=address[1][2]//中文国家
		 }else{
			cityAdd=address[0][2]//英文国家
		 }
		for(var i in data){
			if(cityAdd!=data[i]){
				 var option="<option value='"+i+"'>"+data[i]+"</option>"; 
			}else{
				 var option="<option value='"+i+"' selected>"+data[i]+"</option>"; 
			}
			 $("#city").append(option); 
		}
	  },"json");
   }
	
   function getCC(obj){
	    var countryValue=document.getElementById("registrationAddress").value;
		/* var provincValue=document.getElementById("provincs").value; */
		var cityValue=obj.options[obj.selectedIndex].text;;
		var registrationAddress=document.getElementById("registrationAddress");
		registrationAddress.value=countryValue+"  "+cityValue;
   }
   
   function exportTel(obj){
   	  //判断手机号是否重复
   	  var url="${pageContext.request.contextPath}/cilentCustomer/exportCardId.do"
   	  $.post(url,"tel="+obj.value,function(data){
   		  if(data.result=='error'){
   			  layer.alert("<spring:message code='手机号已存在！'/>", {
 					icon: 1,
 					title: "<spring:message code='提示'/>",
 					})  ;
   			  $("#exportTEL").val(1);
   		  }
   	  },"json")
     }
   </script>
  </head>
  <body style="background:#f5f5f5;">
    <!--      顶部导航      -->
  <c:if test="${clientid.id!=null || transid.id!=null }">
	<div class="publickNav">
		<div class="public_nav">
			<nav class="container" style="padding:0 20px;">
				<div class="navbar-left">
					<a href="/cilentCustomer/findUI.do?lang=zh_CN" class="navbar-link" onclick="in18(this)">中文</a> | <a href="/cilentCustomer/findUI.do?lang=en_US" class="navbar-link" onclick="in18(this)">English</a>
				</div>
				<a style="padding-left: 50px;" href="/forwardAction/forward_toIndex.do"><spring:message code='首页' /></a>
				<a style="padding-left:50px;"><spring:message  code='帮助热线：'/>010-82895385</a><a style="padding-left:50px;" target="_blank" href="http://www.aitrans.org:8081/"><spring:message  code='爱译社'/></a><div class="navbar-right">
					<ul class="list-inline nav_lists">
						<li class="nav_lists_li"><a href="/ClientUser/clientUserAction_exit.do" class="navbar-link"><spring:message code='退出登录' /></a></li>
						<li class="nav_lists_li"><a href="/cilentCustomer/findUI.do" target="_blank" class="navbar-link" style="position: relative;"><spring:message code='用户中心' /></a> 
						<li class="nav_li_li"><a href="javascript:void(0);" class="navbar-link"><font id="nickname"></font></a></li>
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
             <a href="/cilentCustomer/findUI.do?lang=zh_CN" class="navbar-link" onclick="in18(this);">中文</a> | <a href="/cilentCustomer/findUI.do?lang=en_US" class="navbar-link" onclick="in18(this);">English</a>
			</div>
			<a style="padding-left:50px;" href="/forwardAction/forward_toIndex.do"><spring:message code='首页' /></a>
            <a style="padding-left:50px;"><spring:message  code='帮助热线：'/>010-82895385</a><a style="padding-left:50px;" target="_blank" href="http://www.aitrans.org:8081/"><spring:message  code='爱译社'/></a><div class="navbar-right">
             <ul class="list-inline nav_lists">
              <li class="nav_lists_li"><a href="/login.jsp" class="navbar-link"><spring:message code='登录' /></a></li>
              <li class="nav_lists_li"><a href="/register.jsp" class="navbar-link"><spring:message code='注册' /></a></li>
              <li class="nav_lists_li"><a href="/help.center.jsp" class="navbar-link"><spring:message code='帮助中心' /></a></li>
             </ul>
            </div>
           </nav>
        </div>
        <div style="height:35px;"></div>
     </div>
	</c:if>
	<!--  logo 搜索栏  -->
    <div class="container">
      <nav class="publickSearch"></nav>
    </div>

    <!--  用户中心内容  -->
    <div class="user_center">
      <div class="container">

        <!--    用户中心 我是译员   -->
        <div class="title_public">
          <h2><spring:message code='用户中心'/></h2>
        </div>
        <div class="my_customer">
          <div class="row">

            <!--    用户中心 我是译员 左侧导航   -->
            <div class="my_customer_left col-sm-2">
			  <ul class="my_customer_ul">
			   <li class="cus_iter_navlists"> <a href="/cilentCustomer/findUI.do"> <spring:message code='个人信息'/> </a> </li>    
		       <li class="cus_iter_navlists"> <a href="/cilentCustomer/myneedsUI.do"><spring:message code='我的项目'/> </a> </li>  
		       <li class="cus_iter_navlists"> <a href="/cilentCustomer/mywallet.do"> <spring:message code='我的备用金'/> </a> </li>  
		       <li class="cus_iter_navlists"> <a href="/cilentCustomer/myOrdersUI.do"> <spring:message code='我的订单'/> </a> </li>  
		       <li class="cus_iter_navlists"> <a href="/cilentCustomer/exchangeUI.do"> <spring:message code='积分兑换'/></a> </li>  
		       <li class="cus_iter_navlists"> <a href="/forwardAction/forward_toCustomerReputation.do"> <spring:message code='我的信誉'/> </a> </li>  
		     <!-- <li class="cus_iter_navlists"> <a href="user.customer.ranking.html"> 我的排名 </a> </li>  */
		    /*  <li class="cus_iter_navlists"> <a href="user.customer.myeValuate.html"> 我的评价 </a> </li>  */
		     /*  <li class="cus_iter_navlists"> <a href="javascript:;"> 我的账本 </a> </li> -->
		       <li class="cus_iter_navlists"> <a href="/forwardAction/forward_toCustomerPasswordProtection.do"> <spring:message code='密码保护'/></a> </li>  
		       <li class="cus_iter_navlists"> <a href="/cilentCustomer/findUI.do?type=password"> <spring:message code='修改密码'/> </a> </li>  
		       <li class="cus_iter_navlists"> <a href="/cilentCustomer/gradeUI.do"> <spring:message code='我的等级'/></a> </li>  
		       <li class="cus_iter_navlists"> <a href="/forwardAction/forward_toCustomerAgreement.do"> <spring:message code='签订协议'/> </a> </li>
		      </ul>
			</div>

            <!--    用户中心 我是译员 右侧内容   -->
            <div class="my_customer_right col-sm-10">

              <!--  用户中心右侧 tab切换栏   -->
              <div class="">
                <ul id="suerTab" class="nav nav-tabs">
                  <li class="active"><a href="#basicdata" data-toggle="tab"><spring:message code='基本资料'/></a></li>
                 <!--  <li><a href="#realname" data-toggle="tab">企业认证</a></li>
                  <li><a href="#personname" data-toggle="tab">个人认证</a></li>
                  <li><a href="#bindingsetting" data-toggle="tab">绑定设置</a></li> -->
                </ul>
              </div>

                <!--  tab面板对应内容   -->
                <div class="myTabContent tab-content">
                  <div class="tab-pane fade in active" id="basicdata">
                    <c:if test="${clientid.certificationType eq 1 }"> <h4><spring:message code='企业资料'/></h4></c:if>
                    <c:if test="${clientid.certificationType eq 0 }"> <h4><spring:message code='个人资料'/></h4></c:if>
                    <div class="basic_data">
                      <form class="form-inline" enctype="multipart/form-data" method="post" id="editForm" action="/cilentCustomer/editClientCustomer.do">
                       <div class="basic_data_inp" id="checkDIV">
                        <c:if test="${clientid.certificationState==0 || clientid.certificationState=='0'}">
                          <label><spring:message code='认证类型'/></label>
                          <div class="form-control" style="width: 220px;margin-right: 30px;text-align: center">
                          <!-- <div class="form-control" > -->
                           <c:if test="${clientid.certificationState==0 || clientid.certificationState=='0' }">
                          	 <input onchange="checkValue()" type="radio" name="certificationType" class="certificationType" value="0" <c:if test="${clientid.certificationType eq '0' }">checked</c:if> style="width: 10px"><spring:message code='个人'/>
                          	 <input onchange="checkValue()" type="radio" name="certificationType" class="certificationType" value="1" <c:if test="${clientid.certificationType eq '1' }">checked</c:if> style="width: 10px;margin-left: 20px"><spring:message code='企业'/>
                           </c:if>
                          </div>
                          </c:if>
                        </div>
                       
                        <%-- <c:if test="${clientid.certificationType eq 1 }"> --%>
                        <div id="onlineDIV">
                        	<input type="hidden" value="${onlineCustomer.id }" name="onlineCusId">
                        	<div class="basic_data_inp">
	                          <label for="name"><spring:message code='企业全称'/></label>
	                          <input type="text" class="form-control basic_data_mrg" id="nameZH" placeholder="<spring:message code='请输入企业全称'/>" name="nameZH" value="${onlineCustomer.nameZH }">
	                          <%-- <label for=""><spring:message code='企业简称'/></label>
	                          <input type="text" class="form-control" id="nameShort" placeholder="<spring:message code='请输入企业简称'/>" name="nameShort" value="${onlineCustomer.nameShort }"> --%>
                            </div>
                            <div class="basic_data_inp">
	                          <label for="name"><spring:message code='企业中文简称'/></label>
	                          <input type="text" class="form-control basic_data_mrg" id="nameEN" placeholder="<spring:message code='请输入企业中文简称'/>" name="nameShort" value="${onlineCustomer.nameShort }">
	                          <label for=""><spring:message code='企业英文简称'/></label>
	                          <input type="text" class="form-control" id="nameShort" placeholder="<spring:message code='请输入企业英文简称'/>" name="nameEN" value="${onlineCustomer.nameEN }">
                            </div>
                            
                            <div class="basic_data_inp">
	                          <label for=""><spring:message code='企业注册地址'/></label>
	                          <input type='hidden' id="addressZH" value="${onlineCustomer.registrationAddress }">
	                          <input type='hidden' id="addressEN" value="${onlineCustomer.registrationAddressEN }">
	                          <%-- ==${sessionScope}== --%>
	                          <c:if test="${sessionScope.language=='zh' || sessionScope.language==''}">
	                          <input type="text" style="width:120px;" class="form-control" id="registrationAddress" name="registrationAddress" value="${onlineCustomer.registrationAddress }" readonly="readonly">
	                          <input type="hidden" name='hiddenCountry' id="hiddenCountry" value="${onlineCustomer.country }">
	                          </c:if>
	                          <c:if test="${sessionScope.language=='en'}">
	                          <input type="text" style="width:120px;" class="form-control" id="registrationAddress" name="registrationAddress" value="${onlineCustomer.registrationAddressEN }" readonly="readonly">
	                          <input type="hidden" name='hiddenCountry' id="hiddenCountry" value="${onlineCustomer.countryEN }">
	                          </c:if>
	                          <!--  <div style="width:434px;text-align: right"> -->
	                          <select name="country" class="form-control" style="width:146px;" id="country" onchange="getProvincs(this)">
	                            <option value="">--<spring:message code='请选择国家'/>--</option>
	                          </select>
                              <select name="province" class="form-control" style="width:146px;" id="provincs" onchange="getCity(this)" >
                                <option value="">--<spring:message code='请选择省份'/>--</option>
                              </select>
                              <select name="city" class="form-control" style="width:146px;" id="city" onchange="getCC(this)">
                                <option value="">--<spring:message code='请选择城市'/>--</option>
                              </select>
                           <!--   </div> -->
                             </div>
                            
                            <div class="basic_data_inp">
                              <label for=""><spring:message code='企业传真'/></label>
	                          <input type="text" class="form-control basic_data_mrg" id="fax" placeholder="<spring:message code='请输入企业传真'/>" name="fax" value="${onlineCustomer.intro }">
                            
	                          <label for=""><spring:message code='企业固定电话'/></label>
	                          <input type="text" class="form-control basic_data_mrg" id="cel" placeholder="<spring:message code='请输入企业固定电话'/>" name="companycel" value="${onlineCustomer.cel }">
	                          <%-- <input type="text" class="form-control basic_data_mrg" id="name" placeholder="请输入企业全称" name="registrationAddress" value="${clientid.realName }"> --%>
                            </div>
                             
                             <div class="basic_data_inp">
	                          <label for=""><spring:message code='常用地址'/></label>
	                          <input type="text" class="form-control basic_data_mrg" id="companyaddress" placeholder="<spring:message code='请输入常用地址'/>" name="companyaddress" value="${onlineCustomer.address }">
	                          <label for=""><spring:message code='公司官网'/></label>
	                          <input type="text" class="form-control basic_data_mrg" id="Ltd" placeholder="<spring:message code='请输入公司官网'/>" name="Ltd" value="${onlineCustomer.ltd }">
                            </div>
                            
                            <div class="basic_data_inp">
	                          <label for="email"><spring:message code='电子邮箱'/></label>
	                          <input type="email" class="form-control" id="email" name="companyemail" value="${clientid.emaile }" onchange="exportEmail(this)">
	                        </div>
                            
                            <div class="basic_data_inp">
	                         <label for="textarea01" style="width:10%;"><spring:message code='中文备注'/></label>
	                         <textarea class="form-control" id="textarea01" rows="6" style="width:87%;" name="companyintro">${onlineCustomer.intro }</textarea>
	                         <br><br>
	                         <label for="textarea01" style="width:10%;"><spring:message code='英文备注'/></label>
	                          <textarea class="form-control" id="textarea01" rows="6" style="width:87%;" name="companyintroEN">${onlineCustomer.introEN }</textarea>
	                       </div>
	                       <hr style="border-left-style: solid;color: blue;width: 100%;margin-top: 50px;margin-buttom:50px;border-width: 2px">
                           <h4><spring:message code='账户资料'/></h4>
	                       <div class="basic_data_inp">
	                          <label for="bankAccount"><spring:message code='银行账号'/></label>
	                          <input type="text" class="form-control basic_data_mrg" id="bankAccount" value="${clientid.bankAccount }"  name="companybankAccount" placeholder="<spring:message code='请输入银行账号'/>" onblur="getOpenBank(this)">
	                       	  <label for="openingBank"><spring:message code='开户行'/></label>
	                          <input type="text" class="form-control basic_data_mrg" id="openingBank" name="copanyopeningBank" value="${clientid.openingBank }" placeholder="<spring:message code='请输入岗位名称'/>">
	                        </div>  
	                       
                           <hr style="border-left-style: solid;color: blue;width: 100%;margin-top: 50px;margin-buttom:50px;border-width: 2px">
                           <h4><spring:message code='联系人资料'/></h4>
                      		<div class="basic_data_inp">
	                          <label for="name"><spring:message code='姓名'/></label>
	                          <input type="text" class="form-control basic_data_mrg" id="name" placeholder="<spring:message code='请输入真实姓名'/>" name="companyrealName" value="${clientid.realName }">
	                        
	                          <label for="sex"><spring:message code='性别'/></label>
	                          <div class="form-control" style="width: 220px;margin-right: 30px;text-align: center">
	                          	 <input type="radio" name="sex" class="sex" value="男" <c:if test="${clientid.sex=='男' }">checked</c:if> style="width: 10px"><spring:message code='男'/>
	                          	 <input type="radio" name="sex" class="sex" value="女" <c:if test="${clientid.sex=='女' }">checked</c:if> style="width: 10px;margin-left: 20px"><spring:message code='女'/>
	                          </div>
	                        
	                        </div>
	                        <div class="basic_data_inp">
	                          <label for="job"><spring:message code='职位'/></label>
	                          <input type="text" class="form-control basic_data_mrg" id="job" name="companyjob" value="${clientid.job }" placeholder="<spring:message code='请输入岗位名称'/>">
	                          <label for="tel"><spring:message code='手机号'/></label>
	                          <input type="text" class="form-control basic_data_mrg" id="tel" name="companytel" value="${clientid.tel }" placeholder="<spring:message code='请输入手机号'/>" onchange="exportTel(this)">
	                        </div>
                        </div><!-- 企业资料 结束-->
                        <!-- 联系人资料结束 -->
                     <%--   </c:if> --%>
                       <input type="hidden" value="${clientid.userType }"  name="userType">
                       <!-- 个人资料修改 -->
                       <%--  <c:if test="${clientid.certificationType eq 0 }"> --%>
                          <div id="prosenDIV">	
                        	<div class="basic_data_inp">
	                          <label for="name"><spring:message code='姓名'/></label>
	                          <input type="text" class="form-control basic_data_mrg" id="name" placeholder="<spring:message code='请输入真实姓名'/>" name="realName" value="${clientid.realName }">
	                          <label for="nameid"><spring:message code='证件号'/></label>
	                          <input type="text" class="form-control" id="nameid" placeholder="<spring:message code='请输入有效证件号'/>" name="cardId" value="${clientid.cardId }" onblur="getBirthday(this)">
	                        </div>
	                        <div class="basic_data_inp">
	                          <label for="sex"><spring:message code='性别'/></label>
	                          <div class="form-control" style="width: 220px;margin-right: 30px;text-align: center">
	                          	 <input type="radio" name="sex" class="sex" value="男" <c:if test="${clientid.sex=='男' }">checked</c:if> style="width: 10px"><spring:message code='男'/>
	                          	 <input type="radio" name="sex" class="sex" value="女" <c:if test="${clientid.sex=='女' }">checked</c:if> style="width: 10px;margin-left: 20px"><spring:message code='女'/>
	                          </div>
	                         
	                          <!-- <input type="text"  placeholder="请输入性别"> -->
	                          <label for="roleName"><spring:message code='角色'/></label>
	                          <input type="text" class="form-control" id="roleName" name="roleName" value="客户" readonly="readonly">
	                        </div>
	                        <div class="basic_data_inp">
	                          <label for="birth"><spring:message code='出身年月'/></label>
	                          <input class="Wdate basic_data_mrg" type="text" id="birth" name="birthday" onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd',maxDate:new Date()})" value="${clientid.birthday}"/>
	                          <label for="adress"><spring:message code='现居地址'/></label>
	                          <input type="text" class="form-control" id="adress" name="address" placeholder="<spring:message code='请输入居住地址'/>" value="${clientid.address }">
	                        </div>
	                        <div class="basic_data_inp">
	                          <label for="tel"><spring:message code='手机号'/></label>
	                          <input type="text" class="form-control basic_data_mrg" id="tel" name="tel" value="${clientid.tel }" placeholder="<spring:message code='请输入手机号'/>" onchange="exportTel(this)">
	                          <label for="email"><spring:message code='电子邮箱'/></label>
	                          <input type="email" class="form-control" id="email" name="email" value="${clientid.emaile }" onchange="exportEmail(this)">
	                        </div>
	                        <input type="hidden" value="${clientid.userType }"  name="userType">
	                        <div class="basic_data_inp">
	                          <label for="userType"><spring:message code='用户等级'/></label>
	                          <c:if test="${clientid.userType ==0}"><input type="text" class="form-control basic_data_mrg" id="userType" value="<spring:message code='游客'/>" readonly="readonly"></c:if>
	                          <c:if test="${clientid.userType ==1}"><input type="text" class="form-control basic_data_mrg" id="userType" value="<spring:message code='普通用户'/>" readonly="readonly"></c:if>
	                          <c:if test="${clientid.userType ==2}"><input type="text" class="form-control basic_data_mrg" id="userType" value="<spring:message code='vip用户'/>" readonly="readonly"></c:if>
	                        </div>
	                         <div class="basic_data_inp">
	                          <label for="company"><spring:message code='工作单位'/></label>
	                          <input type="text" class="form-control basic_data_mrg" id="company" name="company" value="${clientid.company }" placeholder="<spring:message code='请输入工作单位'/>">
	                          <label for="job"><spring:message code='职位'/></label>
	                          <input type="text" class="form-control" id="job" name="job" value="${clientid.job }" placeholder="<spring:message code='请输入岗位名称'/>">
	                        </div>
	                        <div class="basic_data_inp">
	                          <label for="bankAccount"><spring:message code='银行账号'/></label>
	                          <input type="text" class="form-control basic_data_mrg" id="bankAccount" value="${clientid.bankAccount }"  name="bankAccount" placeholder="<spring:message code='请输入银行账号'/>" onblur="getOpenBank(this)">
	                       	  <label for="openingBank"><spring:message code='开户行'/></label>
	                          <input type="text" class="form-control basic_data_mrg" id="openingBank" name="openingBank" value="${clientid.openingBank }" placeholder="<spring:message code='请输入岗位名称'/>">
	                        </div>  
	                        <%-- <div class="basic_data_inp">
	                          <label for="choose">开户行分行</label>
	                          <input type="text" class="form-control"  style="width: 700px;"  id="openingBank" value="${clientid.openingBank }"  name="openingBank" placeholder="请输入开户行信息">
	                        </div> --%>
	                        
	                        <div class="basic_data_inp">
	                          <label for="textarea01" style="width:10%;"><spring:message code='备注'/></label>
	                          <textarea class="form-control" id="textarea01" rows="6" style="width:87%;" name="intro">${clientid.intro }</textarea>
	                        </div>
	                      </div>
                        <%-- </c:if> --%>
                       
                        <div style="height: 10px"></div>
                        <div class="basic_data_inp" style="text-align:center;">
                          <button type="button" class="btn btn-info" name="button" onclick="submitButton()"><spring:message code='保存'/></button>
                        </div>
                        <!-- 上传头像 -->
                        <div class="file_head" >
                          <h4><spring:message code='用户头像'/></h4>
                          <div id="headIMG">
	                         <c:if test="${clientid.headPortrait!=null && clientid.headPortrait!='' }">
	                       	 	 <img src='${clientid.headPortrait}' alt="" style="width: 110px;height: 135px" id="headPortraitSRC">
	                       	 </c:if>
	                       	 <c:if test="${clientid.headPortrait ==null || clientid.headPortrait=='' }">
	                       	 	 <img src="http://via.placeholder.com/110x135" alt="" id="headPortraitSRC">
	                       	 </c:if>
                          </div>
                          
                          <div class="file_span" id="wordDIV">
                            <input type="file" name="headPortrait" onchange="checkFile(this)" id="uploadFile">
                            <c:if test="${clientid.headPortrait!=null && clientid.headPortrait!='' }">
                          	 	 <span class="" ><spring:message code='修改照片'/></span>
                          	 </c:if>
                          	 <c:if test="${clientid.headPortrait ==null || clientid.headPortrait=='' }">
                          	 	 <span class=""><spring:message code='上传照片'/></span>
                          	 </c:if>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                  <!-- 企业认证  开始 -->
                	<!-- <div class="tab-pane fade" id="realname">
                    <div class="company_border">
                      <div class="form-horizontal">

                        <div class="form-group">
                          <div class="row" style="margin-left:0;margin-right:0;">
                            <label for="" class="col-sm-2 control-label">企业名称</label>
                            <div class="col-sm-6">
                              <input type="text" class="form-control" placeholder="请输入您的企业名称">
                            </div>
                          </div>
                          <div class="row">
                            <p class="col-sm-offset-2" style="padding-left:30px;font-size:10px;">请填写与营业执照上一致的名称：若您的名称里有生僻字，请点此打开生僻字库进行选择。</p>
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="" class="col-sm-2 control-label" style="padding-left:0;">营业执照注册号<br><span style="color:red;font-size:10px;">(统一社会使用代码)</span></label>
                          <div class="col-sm-6">
                            <input type="text" class="form-control" placeholder="请输入营业执照注册号">
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="" class="col-sm-2 control-label">营业执照所在地</label>
                          <div class="col-sm-3">
                            <select name="" class="form-control" id="">
                              <option value="--请选择省份--">--请选择省份--</option>
                            </select>
                          </div>
                          <div class="col-sm-3">
                            <select name="" class="form-control" id="">
                              <option value="--请选择城市--">--请选择城市--</option>
                            </select>
                          </div>
                          <div class="col-sm-3">
                            <select name="" class="form-control" id="">
                              <option value="--请选择地区--">--请选择地区--</option>
                            </select>
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="" class="col-sm-2 control-label">常用地址</label>
                          <div class="col-sm-6">
                            <input type="text" class="form-control" placeholder="请输入常用地址">
                          </div>
                        </div>

                        <div class="form-group">
                          <div class="row" style="margin-left:0;margin-right:0;">
                            <label for="" class="col-sm-2 control-label">营业年限</label>
                            <label class="col-sm-4 radio-inline">
                              <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 
                              <input type="text" class="form-control" style="margin-top:-8px;" onFocus="WdatePicker({isShowClear:false,readOnly:true})" placeholder="请选择日期"/>
                            </label>
                            <label class="col-sm-1 radio-inline">
                              <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 长期
                            </label>
                          </div>
                          <div class="row">
                            <p class="col-sm-offset-2" style="padding-left:30px;font-size:10px;">若证件有效期为长期，请勾选长期。例如：有效期为2016.11.16——长期，则勾选为长期。</p>
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="" class="col-sm-2 control-label">经营范围</label>
                          <div class="col-sm-6">
                            <input type="text" class="form-control" placeholder="请输入常用地址">
                          </div>
                        </div>

                        <div class="form-group" style="height:auto;">
                          <label for="" class="col-sm-2 control-label" style="padding-left:0;letter-spacing:-1px;">营业执照副本扫描件</label>
                          <div class="col-sm-5" style="height:120px;">
                            
                          </div>
                          <div class="col-sm-3" style="padding-top:50px;">
                            <div style="text-align:center;width:120px;margin-bottom:15px;">
                              <img src="http://via.placeholder.com/50x50" alt="">
                              <p>拍照指南</p>
                            </div>
                            <div class="zhizao_file">
                              <input type="file" class="zhizao_file_inp" name="" value="">
                              <button type="button" class="btn btn-default zhizao_file_btn" name="button">上传</button>
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <p class="col-sm-offset-2" style="padding-left:30px;font-size:12px;padding-top:30px;">
                            证件要求：<br>
                            请上传由中国大陆工商局颁发的，在有效期内且年检章齐全（当年成立的公司无年检章）的证件图片。<br>
                            请提供清晰、完整的扫描件或数码照，仅支持jpg、bmp、png、gif的图片格式，图片大小不超过3M。
                          </p>
                        </div>

                        <div class="form-group" style="margin-top:20px;">
                          <div class="col-sm-offset-2 col-sm-3">
                            <button type="submit" class="btn btn-info form-control">下一步</button>
                          </div>
                        </div>

                      </div>
                    </div>
                  </div> -->
                  <!-- 企业认证  结束 -->

                  <!-- 个人认证  开始 -->
                 <!--  <div class="tab-pane fade" id="personname">
                    <form class="form-horizontal" style="padding-top:30px;border:1px solid #ccc;">
                      <div class="form-group" style="margin-bottom:30px;">
                        <div class="row">
                            <label for="names" class="col-sm-2 control-label">真实姓名</label>
                            <div class="col-sm-3">
                              <input type="text" class="form-control" id="names" placeholder="请输入姓名">
                            </div>
                            <p class="col-sm-7">注：需与银行用户名一致，否则不能通过，无法申请提现</p>
                        </div>
                      </div>
                      <div class="form-group" style="margin-bottom:30px;">
                        <div class="row">
                          <label for="nums" class="col-sm-2 control-label">身份证号</label>
                          <div class="col-sm-3">
                            <input type="text" class="form-control" id="nums" placeholder="请输入有效身份证号码">
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="row">
                          <label for="password03" class="col-sm-2 control-label">证件正面</label>
                          <div class="col-sm-3">
                            <div class="money_file">
                              <div class="money_img_block">
                                <img src="http://via.placeholder.com/260x260" alt="">
                                <span>上传手持身份证<br>正面图片</span>
                              </div>
                              <div class="money_file_block">
                                <input type="file" name="" value="">
                                <button class="btn btn-info">上传正面图片</button>
                              </div>
                            </div>
                          </div>
                          <div class="col-sm-7" style="padding-top:20px;">
                            <p>1. 请上传本人手持身份证正面头部照片和上半身照片；</p>
                            <p>2. 照片为免冠、未化妆的数码照片原始图片，<span style="color:red;">请勿编辑修改</span>；</p>
                            <p>3. 必须看清证件信息，且证件信息不能被遮挡，持证人五官清晰可见；</p>
                            <p>4. 仅支持.jpg.bmp.png.gif的图片格式。<span style="color:red;">建议图片大小不超过3M</span> ；</p>
                            <p>5. 您提供的照片时间信息财富将予以保护，不会用其他用途；</p>
                            <p>6. <a style="color:#68a373;font-weight:700;" href="">[示例：查看手持身份证正面照]</a></p>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                            <label for="password03" class="col-sm-2 control-label">证件背面</label>
                            <div class="col-sm-3">
                              <div class="money_file">
                                <div class="money_img_block">
                                  <img src="http://via.placeholder.com/260x260" alt="">
                                  <span>上传手持身份证<br>背面图片</span>
                                </div>
                                <div class="money_file_block">
                                  <input type="file" name="" value="">
                                  <button class="btn btn-info">上传正面图片</button>
                                </div>
                              </div>
                            </div>
                            <div class="col-sm-7" style="padding-top:30px;">
                              <p>1. 必须看到证件信息，且证件信息不能遮挡；</p>
                              <p>2. 仅支持.jpg.bmp.png.gif的图片格式。<span style="color:red;">建议图片大小不超过3M</span> ；</p>
                              <p>3. 您提供的照片时间信息财富将予以保护，不会用其他用途；</p>
                              <p>4. <a style="color:#68a373;font-weight:700;" href="">[示例：查看手持身份证正面照]</a></p>
                            </div>
                          </div>
                        </div>
                      <div class="form-group" style="margin-bottom:70px;">
                        <div class="row">
                          <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-info" style="padding-left:35px;padding-right:35px;">提交审核</button>
                          </div>
                        </div>
                      </div>
                    </form>
                  </div> -->
                  <!-- 个人认证  结束 -->
                  <!-- <div class="tab-pane fade" id="bindingsetting">
                    33
                  </div> -->
                </div>
                <!--  tab面板切换内容结束！  -->
              </div>

            <!--    用户中心 我是客户 右侧内容 结束   -->


        </div>
      </div>
      <input type="hidden" id="exportCARDID">
      <input type="hidden" id="exportTEL">
      <input type="hidden" id="exportBANKNUMBER">
      <input type="hidden" id="exportEMAIL">
      <!--    用户中心 我是客户 结束   -->
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
  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
  
  <script type="text/javascript">
  //验证
  function vFunction(){
	 // alert("固定电话、证件号"+$("#nameid").val()+"手机号"+$("#tel").val()+"账号"+$("#bankAccount").val()+"邮箱"+$("#email").val())
	  var flag=true;
	  if($("#cel")!=undefined && $("#cel")!="undefined"){
		  if($("#cel").val()!=null && $("#cel").val()!=''){
		 		 var zz=/^0\d{2,3}-?\d{7,8}$/;
		 		 var value=$("#cel").val();
		 		 if(zz.test(value)!=true){
		 			 layer.alert('<spring:message code="企业固定电话格式错误！例如：010-82893875"/>', {
							icon: 5,
							title: "<spring:message code='提示'/>"
							});
		 			 flag=false;
		 		 }
		 	 } 
	  }
	  else if($("#nameid")!=undefined && $("#nameid")!="undefined"){
		 if($("#nameid").val()!=null && $("#nameid").val()!=''){
		 		 var cardIdzz=/^d{6}(19|20)*[0-99]{2}(0[1-9]{1}|10|11|12)(0[1-9]{1}|1[0-9]|2[0-9]|30|31)(\\w*)$/;
		 		 var hzzz1=/^[a-zA-Z]{5,17}$/
		 		 var hzzz2=/^[a-zA-Z0-9]{5,17}$/
		 		 if($("#exportCARDID").val()==1){
		 			 layer.alert('<spring:message code="证件号已存在！"/>', {
							icon: 5,
							title: "<spring:message code='提示'/>"
							});
		 			flag=false;
		 		 }else if(cardIdzz.test($("#nameid").val())!=true && hzzz1.test($("#nameid").val())!=true && hzzz2.test($("#nameid").val())!=true){
		 			 layer.alert('<spring:message code="证件号格式不正确！"/>', {
							icon: 5,
							title: "<spring:message code='提示'/>"
							});
		 			flag=false;
		 		 }
		 	 }
	  }
	  else if($("#tel")!=undefined && $("#tel")!="undefined"){
		  if($("#tel").val()!=null && $("#tel").val()!=''){
	 		 var zz=/^1(3|4|5|7|8)\d{9}$/;
	 		 if($("#exportTEL").val()==1){
	 			 layer.alert('<spring:message code="手机号已存在！"/>', {
						icon: 5,
						title: "<spring:message code='提示'/>"
						});
	 			flag=false;
	 		 }else if(zz.test($("#tel").val())!=true){
	 			 layer.alert('<spring:message code="手机号格式不正确！"/>', {
						icon: 5,
						title: "<spring:message code='提示'/>"
						});
	 			flag=false;
	 		 }
	 	 }
	  }
	  if($("#bankAccount")!=undefined && $("#bankAccount")!="undefined"){
		 if($("#bankAccount").val()!=null && $("#bankAccount").val()!=''){
	 		 var zz=/^(\d{16}|\d{19})$/;
	 		 if($("#exportBANKNUMBER").val()==1){
	 			 layer.alert('<spring:message code="银行卡号已存在！"/>', {
						icon: 5,
						title: "<spring:message code='提示'/>"
						});
	 			flag=false;
	 		 }else if(zz.test($("#bankAccount").val())!=true){
	 			 layer.alert('<spring:message code="银行卡号格式错误！"/>', {
						icon: 5,
						title: "<spring:message code='提示'/>"
						});
	 			flag=false;
	 		 }
	 	 }
	  }
	  if($("#email")!=undefined && $("#email")!="undefined"){
		  /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/
		 if($("#email").val()!=null && $("#email").val()!=''){
	 		 /* var zz=/^[a-zA-Z0-9_-]@[a-zA-Z0-9_-](\.[a-zA-Z0-9_-]+)+$/; */
	 		 var zz=/^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
	 		 if($("#exportEMAIL").val()==1){
	 			 layer.alert('<spring:message code="邮箱号已存在！"/>', {
						icon: 5,
						title: "<spring:message code='提示'/>"
						});
	 			flag=false;
	 		 } 
	 		 else if(zz.test($("#email").val())!=true){
	 			 layer.alert('<spring:message code="邮箱号格式不正确！"/>', {
						icon: 5,
						title: "<spring:message code='提示'/>"
						});
	 			flag=false;
	 		 }
	 	 }
	  }
	  
	  return flag;
  }
  
  
  //提交验证
  function submitButton(){
	 var flag=vFunction();
	 if(flag){
		 $("#editForm").submit();
	 }/* else{
		 layer.alert('<spring:message code="信息填写有误!"/>', {
				icon: 5,
				title: "<spring:message code='提示'/>"
				});
	 } */
 	 
  }
  
      $(function(){
        $(".cus_iter_navlists a").removeClass("useractive")
    	$(".cus_iter_navlists").eq(0).find("a").addClass("useractive") 
        $(".checkbox").simpleSwitch({
         "theme": "FlatCircular"
       });
      })
      
      function getBirthday(obj){
    	  $("#exportCARDID").val(" ");
    	  //判断证件号是否唯一。如果唯一，获取出生日期，否则提示重新填入证件号
    	  var url="${pageContext.request.contextPath}/cilentCustomer/exportCardId.do"
    	  $.post(url,"cardID="+obj.value,function(data){
    		  if(data.result=='success'){
    			  var getbirthday=obj.value.substring(6,14) ;//出生年月日
    	    	  var year=getbirthday.substring(0,4);//年
    	    	  var month=getbirthday.substring(4,6);//月
    	    	  var day=getbirthday.substring(6,8);//日
    	    	  
    	    	  var birthday=year+"-"+month+"-"+day;
    	    	  document.getElementById("birth").value=birthday;
    	    	  $("#exportCARDID").val(" ");
    		  }else{
    			  /* layer.alert("<spring:message code='证件号已存在！'/>", {
    					icon: 1,
    					title: "<spring:message code='提示'/>",
    					}); */
    			  $("#exportCARDID").val(1);
    		  }   		  
    	  },"json");
      }
      
      
     
      
      function exportEmail(obj){
    	  $("#exportEmail").val(" "); 
    	  var url="${pageContext.request.contextPath}/cilentCustomer/exportCardId.do"
        	  $.post(url,"email="+obj.value,function(data){
        		  if(data.result=='error'){
        			  /* layer.alert("<spring:message code='邮箱已存在！'/>", {
      					icon: 1,
      					title: "<spring:message code='提示'/>",
      					})  ; */
        			  $("#exportEmail").val(1);
        		  }else{
        			  $("#exportEmail").val(" "); 
        		  }
        	  },"json")
      }
      
      function getOpenBank(obj){
    	  $("#exportBANKNUMBER").val(" ");
    	  var url="${pageContext.request.contextPath}/cilentCustomer/getOpenBank.do";
    	  $.post(url,"bankNumber="+obj.value,function(data){
    		  if(data.msg==null || data.msg==''){
    			  layer.alert("<spring:message code='请输入正确的银行卡号'/>", {
  					icon: 1,
  					title: "<spring:message code='提示'/>",
  					})
  					$("#exportBANKNUMBER").val(" ");
    		  }else{
    			  url="${pageContext.request.contextPath}/cilentCustomer/exportCardId.do"
   				  $.post(url,"bankNumber="+obj.value,function(data){
   	        		  if(data.result=='error'){
   	        			  /* layer.alert("<spring:message code='银行卡号已存在！'/>", {
   	      					icon: 1,
   	      					title: "<spring:message code='提示'/>",
   	      					})  ; */
   	        			  $("#exportBANKNUMBER").val(1);
   	        		  }
   	        	  },"json")
    		  } 
    		  
    	  },'json')
      }
      
     function checkFile(file){
    	  var maxsize =3*1024*1024*1024;//3M
		  var size=file.files[0].size;
    	  //判断是否有选择上传文件
          var imgPath = $("#uploadFile").val();
          if (imgPath == "") {
              return;
          };
          //判断上传文件的后缀名
          var strExtension = imgPath.substr(imgPath.lastIndexOf('.') + 1);
          if (strExtension != 'jpg' && strExtension != 'gif'
          && strExtension != 'png' && strExtension != 'bmp' && strExtension != 'JPG' && strExtension != 'GIF'
              && strExtension != 'PNG' && strExtension != 'BMP' ) {
        	  layer.alert('<spring:message code="请选择图片文件!"/>', {
					icon: 5,
					title: "<spring:message code='提示'/>"
					});
              return;
          }else if(size>maxsize){
        	  layer.alert('<spring:message code="图片大小不能大于3M"/>', {
					icon: 5,
					title: "<spring:message code='提示'/>"
					});
          }else{
        	  var prevDiv=document.getElementById("headIMG");
        	  if (file.files && file.files[0]) {
          	      var reader = new FileReader();
          	      reader.onload = function(evt) {
          	      prevDiv.innerHTML = '<img alt="" style="width: 110px;height: 135px" src="' + evt.target.result + '" /></div>';
          	      }
          	      reader.readAsDataURL(file.files[0]);
          	    } else {
          	      prevDiv.innerHTML = '<div class="img" style="width: 110px;height: 135px;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
          	    } 
        	  //prevDiv.innerHTML ='<span class="" >修改照片</span>';
          };
         
      }
     
   
     
     
     
 </script>
</html>
