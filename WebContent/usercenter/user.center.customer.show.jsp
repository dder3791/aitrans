<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title><spring:message code='用户中心-我是用户信息内容'/></title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.center.css"/>


    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.0.min.js"></script> --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script> --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
	<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
	
	<style type="text/css">
		.col-sm-6 {
			width:530px;
		}
	</style>
	
	<script type="text/javascript">
	 var lang = "${language}"
	 if(lang==""){
		lang="zh";
	 }
	$(function(){
		$(".cus_iter_navlists a").removeClass("useractive");
  	  	$(".cus_iter_navlists").eq(0).find("a").addClass("useractive");
	    $(".cus_iter_navlists a").removeClass("useractive");
   	    $(".cus_iter_navlists").eq(0).find("a").addClass("useractive");
	    if("${clientid.userName}"!=''&& "${clientid.userName}"!=null){
	   		 $("#nickname").text('${clientid.userName}'+"<spring:message code=',欢迎您!'/>");
	   	 }else if('${clientid.tel}'!=null && '${clientid.tel}'!=null){
	   		 $("#nickname").text('${clientid.tel}'+"<spring:message code=',欢迎您!'/>");
	   	 }else if('${clientid.emaile}'!=null && '${clientid.emaile}'!=null){
	   		 $("#nickname").text('${clientid.emaile}'+"<spring:message code=',欢迎您!'/>");
	   	 }
		/* var tnickname = "${transid.nickname}";
		var unickname = "${clientid.userName}"
		if(tnickname!=""){
			$("#nickname").text(tnickname+"<spring:message  code='，欢迎您！'/>");
			
		}else if (unickname!="") {
			$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>!");
			} */
		
		
		$("#egRegister").click(function(){
			var width = $(this).width();
            if(width==50)
            {
                $(this).width(200);
                $(this).height(300);
            }
            else
            {
                $(this).width(50);
                $(this).height(50);
            }
		})
		
		/* var i = "<spring:message code='基本资料'/>";
	
        $(".checkbox").simpleSwitch({
         "theme": "FlatCircular"
        }); */

      })
	
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
      
	 function customer() {
         window.location.href = '/cilentCustomer/findUI.do?type=edit';
     }
	
	function vity(){
		var certificationState=document.getElementById("certificationState").value;
		//alert(certificationState);
		if("1"==certificationState){
			$("#realname").hide();
			$("#personname").hide();
			layer.alert('<spring:message code="等待管理员审核中"/>...', {
				icon: 5,
				title: "<spring:message code='提示'/>"
				});
		}
		else if ("2"==certificationState){
			$("#realname").hide();
			$("#personname").hide();
			layer.alert('<spring:message code="审核通过，认证成功！"/>', {
				icon: 5,
				title: "<spring:message code='提示'/>"
				});
		}
	}
	function getCountry(obj){
		var certificationState=document.getElementById("certificationState").value;
		//alert(certificationState);
		if("1"==certificationState){
			$("#realname").hide();
			layer.alert('<spring:message code="等待管理员审核中"/>...', {
				icon: 5,
				title: "<spring:message code='提示'/>"
				});
		}
		else if ("2"==certificationState){
			$("#realname").hide();
			layer.alert('<spring:message code="审核通过，认证成功！"/>', {
				icon: 5,
				title: "<spring:message code='提示'/>"
				});
		}else{
	        	$.post("/cilentCustomer/getCountry.do",function(data){
	    			//找国家
	    			//先移除
	    			 document.getElementById("country").options.length=1;
					/* $('#country option').length=1;
					//国家改变，省清空，城市清空
					$('#provincs option').length=1;
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
	        
	        
    	}
	}
	
	function getProvincs(obj){
		//alert("省");
		var countryKEY=document.getElementById("country").value;
		var countryValue=obj.options[obj.selectedIndex].text;/* document.getElementById("country").text; */
		var registrationAddress=document.getElementById("registrationAddress");
		registrationAddress.value=countryValue;
		$("#hiddenCountry").val(countryKEY);//国家
		$.post("/cilentCustomer/getCountry.do?country="+countryKEY,function(data){
		//找省份
		//先移除
		/* $('#provincs option').length=1;
		$('#city option').length=1; */
		document.getElementById("provincs").options.length=1;
		document.getElementById("city").options.length=1;
		
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
		document.getElementById("city").options.length=1;
		/* $('#city option').length=1; */
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
		
		function getTOPsrc(file,src){
			var maxsize =3*1024*1024*1024;//3M
			var size=file.files[0].size;
			//判断是否有选择上传文件
            var imgPath = $("#topSRC").val();
            //判断上传文件的后缀名
           // alert(imgPath);
            var strExtension = imgPath.substr(imgPath.lastIndexOf('.') + 1);
            if (strExtension != 'jpg' && strExtension != 'gif'
            && strExtension != 'png' && strExtension != 'bmp') {
            	//不符合图片格式
            	layer.alert('<spring:message code="请选择图片文件！"/>', {
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
            	//符合图片格式
            	var prevDiv="";
               if("imgDIVTOP"==src){//账面照片
            	   prevDiv= document.getElementById('imgDIVTOP');
                 	
               }else if("imgDIVBUTTOM"==src){//背面照片
            	   prevDiv = document.getElementById('imgDIVBUTTOM');
               }
               
               if (file.files && file.files[0]) {
          	      var reader = new FileReader();
          	      reader.onload = function(evt) {
          	      prevDiv.innerHTML = '<img src="' + evt.target.result + '" />';
          	      }
          	      reader.readAsDataURL(file.files[0]);
          	    } else {
          	      prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
          	    } 
            }
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
        <div class="title_public">
          <h2><spring:message code=''/><spring:message code='用户中心'/></h2>
        </div>

        <!--    用户中心 我是客户   -->
        <div class="my_customer">
          <div class="row">

            <!--    用户中心 我是客户 左侧导航   -->
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

            <!--    用户中心 我是客户 右侧内容   -->
            <div class="my_customer_right col-sm-10">

              <!--  用户中心右侧 tab切换栏   -->
              <div class="">
                <ul id="suerTab" class="nav nav-tabs">
                  <li class="active"><a href="#basicdata" data-toggle="tab"><spring:message code='基本资料'/> </a></li>
                  <%-- <c:if test="${clientid.certificationType eq 1 }">
                 	 <li><a href="#realname" data-toggle="tab" onclick="getCountry(this)"><spring:message code='企业认证'/></a></li>
                  </c:if>
                   <c:if test="${clientid.certificationType eq 0 }">
                  	 <li><a href="#personname" data-toggle="tab" onclick="vity()"><spring:message code='个人认证'/></a></li>
                  </c:if> --%>
                 <!--  <li><a href="#bindingsetting" data-toggle="tab">绑定设置</a></li> -->
                </ul>
              </div>
                <!--  tab面板对应内容   -->
                <div class="myTabContent tab-content">
                  <div class="tab-pane fade in active" id="basicdata" style="padding:50px 60px 80px 40px;">
                  <c:if test="${clientid.certificationType eq 1 }"> <h4><spring:message code='企业资料'/></h4></c:if>
                  <c:if test="${clientid.certificationType eq 0 }"> <h4><spring:message code='个人资料'/></h4></c:if>
                    <input type="hidden" value="${clientid.certificationState }" id="certificationState">
                    <div class="basic_data">
                    <!-- 客户类型为企业 -->
                    <c:if test="${clientid.certificationType eq 1 }">
                      <div id="onlineDIV">
                       	<input type="hidden" value="${onlineCustomer.id }" name="onlineCusId">
                       	<div class="basic_data_inp">
                       	  <div class="row">
                           <p class="col-sm-4"><spring:message code='企业全称：'/><span>${onlineCustomer.nameZH }</span></p>
                           <p class="col-sm-4"><spring:message code='企业简称：'/>
                           	<span>
	                         <c:if test="${sessionScope.language=='zh' || sessionScope.language=='' }">
	                          ${onlineCustomer.nameShort }
	                         </c:if>
	                         <c:if test="${sessionScope.language=='en'}">
	                          ${onlineCustomer.nameEN }
	                         </c:if>
	                        </span>
                          </div>
                        </div>
                        <div class="basic_data_inp">
	                      <div class="row">
	                      	<p class="col-sm-4"><spring:message code='注册号：'/><span>${onlineCustomer.registrationNumber }</span></p>
	                        <p class="col-sm-4"><spring:message code='企业注册地址：'/>
	                        <span>
	                        <input type='hidden' id="addressZH" value="${onlineCustomer.registrationAddress }">
	                        <input type='hidden' id="addressEN" value="${onlineCustomer.registrationAddressEN }">
	                         <c:if test="${sessionScope.language=='zh' || sessionScope.language=='' }">
	                          ${onlineCustomer.registrationAddress }
	                         </c:if>
	                         <c:if test="${sessionScope.language=='en'}">
	                          ${onlineCustomer.registrationAddressEN }
	                         </c:if>
	                        </span>
	                       </p>
	                      </div>
                        </div>
                        
                       <div class="basic_data_inp">
                       	  <div class="row">
                            <p class="col-sm-4"><spring:message code='银行账号：'/><span>${clientid.bankAccount }</span></p>
                            <p class="col-sm-4"><spring:message code='开户行：'/><span>${clientid.openingBank }</span></p>
	                      </div>
                       </div>  
                       
                        <div class="basic_data_inp">
                       	  <div class="row">
                            <p class="col-sm-4"><spring:message code='员工数量：'/><span>${onlineCustomer.size }</span></p>
                            <p class="col-sm-4"><spring:message code='营业范围：'/><span>${onlineCustomer.scope }</span></p>
	                      </div>
                       </div>  
                           
                        <div class="basic_data_inp">
                          <div class="row">
	                        <p class="col-sm-4"><spring:message code='电子邮箱：'/><span>${clientid.emaile }</span></p>
	                        <p class="col-sm-4"><spring:message code='传真：'/><span>${onlineCustomer.fax }</span></p>
	                      </div>
                        </div>
                        
                        <div class="basic_data_inp">
                          <div class="row">
	                        <p class="col-sm-4"><spring:message code='企业固定电话：'/><span>${onlineCustomer.cel }</span></p>
	                      </div>
                        </div>
                            
                        <div class="basic_data_inp">
                          <div class="row">
	                        <p class="col-sm-4"><spring:message code='常用地址：'/><span>${onlineCustomer.address }</span></p>
	                      </div>
                        </div>
                        
                        <div class="basic_data_inp">
                          <div class="row" >
	                        <p class="col-sm-4" style="width: 100%"><spring:message code='公司官网：'/><span>${onlineCustomer.ltd }</span></p>
	                      </div>
                        </div>
                        
                      </div><!-- 企业信息结束 -->
                      <hr style="border-left-style: solid;color: blue;width: 100%;margin-top: 50px;margin-buttom:50px;border-width: 2px">
                       <h4><spring:message code='联系人资料'/></h4>
                       <div class="basic_data_inp">
                       	 <div class="row">
                            <p class="col-sm-4"><spring:message code='姓名：'/><span>${clientid.realName }</span></p>
                            <p class="col-sm-4"><spring:message code='性别：'/><span>${clientid.sex}</span></p>
	                     </div>
                       </div>
                     
                       <div class="basic_data_inp">
                        <div class="row">
                            <p class="col-sm-4"><spring:message code='职位：'/><span>${clientid.job }</span></p>
                            <p class="col-sm-4"><spring:message code='手机号：'/><span>${clientid.tel }</span></p>
	                     </div>
                       </div>
                       <div class="basic_data_inp">
                         <label for="textarea01" style="width:10%;"><spring:message code='企业中文简介'/></label>
                         <textarea class="form-control" id="textarea01" rows="6" style="width:87%;" name="intro">${onlineCustomer.intro }</textarea>
                       </div>
                       <div class="basic_data_inp">
                         <label for="textarea01" style="width:10%;"><spring:message code='企业英文简介'/></label>
                         <textarea class="form-control" id="textarea01" rows="6" style="width:87%;" name="introEN">${onlineCustomer.introEN }</textarea>
                       </div>
                    </c:if>
                    <!-- 联系人信息结束 -->
                    <input type="hidden" value="${clientid.userType }"  name="userType">
                    <!-- 客户类型为个人 -->
                    <c:if test="${clientid.certificationType eq 0 }">
                      <div class="basic_data_inp">
                        <div class="row">
                          <p class="col-sm-4"><spring:message code='客户名称：'/><span>${clientid.realName }</span></p>
                          <p class="col-sm-4"><spring:message code='证件号：'/><span>${clientid.cardId }</span></p>
                        </div>
                      </div>
                      <div class="basic_data_inp">
                        <div class=row>
                          <p class="col-sm-4"><spring:message code='性别：'/><span><spring:message code='${clientid.sex}'/></span></p>
                          
                          <p class="col-sm-4"><spring:message code='用户类型：'/>
                          	<span>
                          	<c:if test="${clientid.certificationType==1 }"><spring:message code='企业'/></c:if>
                          	<c:if test="${clientid.certificationType==0 }"><spring:message code='个人'/></c:if>
                          	</span>
                          </p>
                        </div>
                      </div>
                      <div class="basic_data_inp">
                        <div class="row">
                          <p class="col-sm-4"><spring:message code='出生年月：'/><span>${clientid.birthday}</span></p>
                          <p class="col-sm-4"><spring:message code='现居地址：'/><span>${clientid.address }</span></p>
                        </div>
                      </div>
                      <div class="basic_data_inp">
                        <div class="row">
                          <p class="col-sm-4"><spring:message code='手机号：'/><span>${clientid.tel }</span></p>
                          <p class="col-sm-4"><spring:message code='电子邮箱：'/><span>${clientid.emaile }</span></p>
                        </div>
                      </div>
                      <div class="basic_data_inp">
                        <div class="row">
                          <p class="col-sm-4"><spring:message code='用户等级：'/>
                          	<span>
								<%-- <c:if test="${ clientid.userType==0}"><spring:message code='游客'/></c:if> --%>
                        		<c:if test="${ clientid.userType==0}"><spring:message code='普通客户'/></c:if>
                        		<c:if test="${ clientid.userType==1}"><spring:message code='vip客户'/></c:if>
                        		<c:if test="${ clientid.userType==2}"><spring:message code='内部客户'/></c:if>
							</span>
						  </p>
                        </div>
                      </div>
                      
                      <div class="basic_data_inp">
                        <div class="row">
                          <p class="col-sm-4"><spring:message code='工作单位：'/><span>${clientid.company}</span></p>
                          <p class="col-sm-4"><spring:message code='职位：'/><span>${clientid.job }</span></p>
                        </div>
                      </div>
                      
                      <div class="basic_data_inp">
                        <div class="row">
                          <p class="col-sm-4"><spring:message code='银行账号：'/><span>${clientid.bankAccount}</span></p>
                          <p class="col-sm-4"><spring:message code='认证状态：'/><span>
                          	<c:if test="${clientid.certificationState==2 }"><spring:message code='已认证'/></c:if>
                          	<c:if test="${clientid.certificationState==1 }"><spring:message code='等待审核'/></c:if>
                          	<c:if test="${clientid.certificationState==0 }"><spring:message code='未认证'/></c:if>
                          	</span>
                          </p>
                        </div>
                      </div>
                     </c:if>
                      
                     <div class="basic_data_inp" style="text-align:center;padding-top:60px;">
                       <button type="button" class="btn btn-info" onclick="customer()" name="button"><spring:message code='修改'/></button>
                     </div>
                     <!-- 上传头像 -->
                     <div class="file_head" style="padding-top:30px;">
                       <h4><spring:message code='用户头像'/></h4>
                       <c:if test="${clientid.headPortrait!=null && clientid.headPortrait!='' }">
                      	 	 <img src='${clientid.headPortrait}' alt="" style="width: 110px;height: 135px" id="headPortraitSRC">
                      	 </c:if>
                      	 <c:if test="${clientid.headPortrait ==null || clientid.headPortrait=='' }">
                      	 	 <!-- <img src="http://via.placeholder.com/110x135" alt=""> -->
                      	 	 <img src="http://via.placeholder.com/110x135" alt="" id="headPortraitSRC">
                      	 </c:if>
                        <form enctype="multipart/form-data" method="post" id="srcForm" action="/cilentCustomer/uploadheadPortraitSRC.do">
                       	<div class="file_span">
                         	 <input type="file" name="headPortrait" onchange="checkFile()" id="uploadFile">
                         	 <c:if test="${clientid.headPortrait!=null && clientid.headPortrait!='' }">
                         	 	 <span class=""><spring:message code='修改照片'/></span>
                         	 </c:if>
                         	 <c:if test="${clientid.headPortrait ==null || clientid.headPortrait=='' }">
                         	 	 <span class=""><spring:message code='上传照片'/></span>
                         	 </c:if>
                        	
                       	</div>
                       </form>
                       
                     </div>
                   </div>
                 </div>
                 <!-- 企业认证  开始 -->
               <c:if test="${clientid.certificationType eq 1 }">
               	<div class="tab-pane fade" id="realname">
               	<form class="layui-form" style="padding-top:30px;border:1px solid #ccc;" action="/cilentCustomer/companyCertification.do"  method="post" enctype="multipart/form-data">
                  <!--  <form class="layui-form" style="padding-top:30px;border:1px solid #ccc;" method="post"> -->
                  <input type="hidden" name="onlineCusId" value="${onlineCustomer.id }">
                   <div class="company_border">
                     <div class="form-horizontal">
                       <div class="form-group">
                         <div class="row" style="margin-left:0;margin-right:0;">
                           <label for="" class="col-sm-2 control-label"><spring:message code='企业全称'/><span style="color:red;font-size:10px;">*</span></label>
                           <div class="col-sm-6">
                             <input type="text" class="form-control" name="nameZH" placeholder="<spring:message code='请输入您的企业名称'/>" autocomplete="off"  lay-verify="required" value="${onlineCustomer.nameZH }">
                           </div>
                         </div>
                         <div class="row">
                           <p class="col-sm-offset-2" style="padding-left:30px;font-size:10px;"><spring:message code='请填写与营业执照上一致的名称：若您的名称里有生僻字，请点此打开生僻字库进行选择。'/></p>
                         </div>
                       </div>
					
					   <div class="form-group">
                         <label for="" class="col-sm-2 control-label" style="padding-left:0;"><spring:message code='企业英文简称'/></label>
                         <div class="col-sm-6">
                           <input type="text" class="form-control" name="nameEN" placeholder="请输入企业英文简称" autocomplete="off"  value="${onlineCustomer.nameEN }" lay-verify="english">
                         </div>
                       </div>
                       
                       <div class="form-group">
                         <div class="row" style="margin-left:0;margin-right:0;">
                         <label for="" class="col-sm-2 control-label" style="padding-left:0;"><spring:message code='企业简称'/><span style="color:red;font-size:10px;">*</span></label>
                         <div class="col-sm-6">
                           <input type="text" class="form-control" name="nameShort" placeholder="<spring:message code='请输入企业简称'/>" value="${onlineCustomer.nameShort }" autocomplete="off">
                         </div>
                        </div>
                        <div class="row">
                           <p class="col-sm-offset-2" style="padding-left:30px;font-size:10px;"><spring:message code='企业的简称可以是企业中文名称简写或企业英文名称。例如：北京环宇爱译科技有限公司，简称：Aitrans或环宇爱译'/></p>
                         </div>
                       </div>
					
					<div class="form-group">
                         <label for="" class="col-sm-2 control-label" style="padding-left:0;"><spring:message code='企业固定电话'/><span style="color:red;font-size:10px;">*</span></label>
                         <div class="col-sm-6">
                           <input type="text" class="form-control" name="cel" placeholder="<spring:message code='请输入企业固定电话'/>" value="${onlineCustomer.cel }" autocomplete="off"  lay-verify="tel">
                         </div>
                       </div>
                       
                       <!-- <div class="form-group">
                         <label for="" class="col-sm-2 control-label" style="padding-left:0;">企业移动电话<span style="color:red;font-size:10px;">*</span></label>
                         <div class="col-sm-6">
                           <input type="text" class="form-control" name="tel" placeholder="请输入企业移动电话" autocomplete="off"  lay-verify="phone|number|required">
                         </div>
                       </div> -->
					
					<%-- <div class="form-group">
                         <label for="" class="col-sm-2 control-label" style="padding-left:0;">企业邮箱<span style="color:red;font-size:10px;">*</span></label>
                         <div class="col-sm-6">
                           <input type="text" class="form-control" placeholder="请输入企业邮箱地址" autocomplete="off"  lay-verify="email|number|required" value="${clientid.emaile }">
                         </div>
                       </div> --%>
					
					<!-- 隐藏公司负责人 -->
					<input type="hidden" name="contact" value="${clientid.realName }">
					<input type="hidden" name="cilentUserId" value="${clientid.id }">
					
					<div class="form-group">
                         <label for="" class="col-sm-2 control-label" style="padding-left:0;"><spring:message code='企业传真'/></label>
                         <div class="col-sm-6">
                           <input type="text" class="form-control" name="fax" placeholder="<spring:message code='请输入企业传真'/>">
                         </div>
                       </div>
                       
                       <div class="form-group">
                         <label for="" class="col-sm-2 control-label" style="padding-left:0;"><spring:message code='营业执照注册号'/><span style="color:red;font-size:10px;">*</span><br><span style="color:red;font-size:10px;"><spring:message code='(统一社会使用代码)'/></span></label>
                         <div class="col-sm-6">
                           <input type="text" class="form-control" name="registrationNumber" placeholder="<spring:message code='请输入营业执照注册号'/>" autocomplete="off"  lay-verify="bess|required">
                         </div>
                       </div>

                       <div class="form-group">
                         <label for="" class="col-sm-2 control-label"><spring:message code='营业执照所在地'/><span style="color:red;font-size:10px;">*</span></label>
                         <div class="col-sm-3" style="width: 173px">
                           <select style="width: 153px" name="country" class="form-control" id="country" onchange="getProvincs(this)" >
                             <option value="">--<spring:message code='请选择国家'/>--</option>
                           </select>
                         </div>
                         <div class="col-sm-3" style="width: 173px">
                           <select style="width: 153px" name="province" class="form-control" id="provincs" onchange="getCity(this)">
                             <option value="">--<spring:message code='请选择省份'/>--</option>
                           </select>
                         </div>
                         <div class="col-sm-3" style="width: 173px">
                           <select style="width: 153px" name="city" class="form-control" id="city" onchange="getCC(this)">
                             <option value="">--<spring:message code='请选择城市'/>--</option>
                           </select>
                         </div>
                           <c:if test="${sessionScope.language=='zh' || sessionScope.language=='' }">
	                          <input type="hidden" style="width:160px"  class="form-control" id="registrationAddress" name="registrationAddress" value="${onlineCustomer.registrationAddress }" lay-verify="required" disabled="disabled">
	                          <input type="hidden" name='hiddenCountry' id="hiddenCountry" value="${onlineCustomer.country }">
	                       </c:if>
	                       <c:if test="${sessionScope.language=='en'}">
	                          <input type="hidden" style="width:160px"  class="form-control" id="registrationAddress" name="registrationAddress" value="${onlineCustomer.registrationAddress }" lay-verify="required" disabled="disabled">
	                          <input type="hidden" name='hiddenCountry' id="hiddenCountry" value="${onlineCustomer.countryEN }">
	                       </c:if>
                           
                       </div>

                       <div class="form-group">
                         <label for="" class="col-sm-2 control-label"><spring:message code='经营地址'/><span style="color:red;font-size:10px;">*</span></label>
                         <div class="col-sm-6">
                           <input type="text" class="form-control" name="address" placeholder="<spring:message code='请输入经营地址'/>" autocomplete="off" value="${onlineCustomer.address }"  lay-verify="required">
                         </div>
                       </div>

                      <!--  <div class="form-group">
                         <div class="row" style="margin-left:0;margin-right:0;">
                           <label for="" class="col-sm-2 control-label">营业年限</label>
                           <label class="col-sm-4 radio-inline">
                             <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 
                             <input type="text" class="form-control" style="margin-top:-8px;" onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd'})" placeholder="请选择营业有效日期"/>
                           </label>
                           <label class="col-sm-1 radio-inline">
                             <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="长期" checked="checked"> 长期
                           </label>
                         </div>
                         <div class="row">
                           <p class="col-sm-offset-2" style="padding-left:30px;font-size:10px;">若证件有效期为长期，请勾选长期。例如：有效期为2016.11.16——长期，则勾选为长期。</p>
                         </div>
                       </div> -->

                       <div class="form-group">
                         <label for="" class="col-sm-2 control-label"><spring:message code='经营范围'/></label>
                         <div class="col-sm-6">
                           <input type="text" class="form-control" name="scope" placeholder="<spring:message code='请输入企业经营范围'/>" autocomplete="off">
                         </div>
                       </div>
                       
                       <div class="form-group">
                         <label for="" class="col-sm-2 control-label"><spring:message code='员工数量'/></label>
                         <div class="col-sm-6">
                           <input type="text" class="form-control" name="size" value="0" placeholder="<spring:message code='请输入企业员工数量'/>" autocomplete="off"  lay-verify="number1">
                         </div>
                       </div>

						<div class="form-group">
                         <label for="" class="col-sm-2 control-label" style="padding-left:0;"><spring:message code='公司官网'/></label>
                         <div class="col-sm-6">
                           <input type="text" class="form-control"  name="Ltd" value="${onlineCustomer.ltd }" placeholder="<spring:message code='请输入公司官网'/>">
                         </div>
                       </div>
					
					
					   <div class="form-group">
                         <label for="" class="col-sm-2 control-label" style="padding-left:0;"><spring:message code='企业中文简介'/></label>
                         <div class="col-sm-6">
                           <textarea class="form-control" name="intro"  placeholder="<spring:message code='请输入企业中文简介'/>">${onlineCustomer.intro }</textarea>
                         </div>
                       </div>
                       
                       <div class="form-group">
                        <label for="" class="col-sm-2 control-label" style="padding-left:0;"><spring:message code='企业英文简介'/></label>
                        <div class="col-sm-6">
                          <textarea  class="form-control" name="introEN" placeholder="<spring:message code='请输入企业英文简介'/>">${onlineCustomer.introEN }</textarea>
                        </div>
                       </div>

                       <div class="form-group" style="height:auto;">
                         <label for="" class="col-sm-2 control-label" style="padding-left:0;width: 180px"><spring:message code='营业执照副本扫描件'/><span style="color:red;font-size:10px;">*</span></label>
                         <div class="col-sm-5 zhizao_file">
                             <input type="file" class="zhizao_file_inp" name=registrationURL id="registrationURL" lay-verify="picture">
                         </div>
                         <div class="col-sm-3">
                           <div>
                             <!-- <img src="http://via.placeholder.com/50x50" alt=""> -->
                             <img alt="" src="${pageContext.request.contextPath}/img/register2.jpg" style="width: 50px;height: 50px"  id="egRegister">
                             <p><spring:message code='拍照指南'/></p>
                           </div>
                         </div>
                       </div>
                       <div class="form-group">
                         <p class="col-sm-offset-2" style="padding-left:30px;font-size:12px;padding-top:30px;">
                         <spring:message code='证件要求：'/>  <br>
                         <spring:message code='请上传由中国大陆工商局颁发的，在有效期内且年检章齐全（当年成立的公司无年检章）的证件图片。'/><br>
                          <spring:message code='请提供清晰、完整的扫描件或数码照，仅支持jpg、bmp、png、gif的图片格式，图片大小不超过3M。'/>  
                         </p>
                       </div>

                       <div class="form-group" style="margin-top:20px;">
                         <div class="col-sm-offset-2 col-sm-3">
                           <button type="submit" class="btn btn-info form-control" lay-filter="demo1" lay-submit=""><spring:message code='下一步'/></button>
                         </div>
                       </div>
                     </div>
                   </div>
                 </form>
                 </div>
                </c:if>
                 <!-- 企业认证  结束 -->

                  <!-- 个人认证  开始 -->
                 <c:if test="${clientid.certificationType eq 0 }">
                  <div class="tab-pane fade" id="personname">
                    <form class="form-horizontal layui-form" style="padding-top:30px;border:1px solid #ccc;" enctype="multipart/form-data" method="post" id="form02" action="/cilentCustomer/personCertification.do">
                      <div class="form-group" style="margin-bottom:30px;">
                        <div class="row">
                            <label for="names" class="col-sm-2 control-label"><spring:message code='真实姓名'/></label>
                            <div class="col-sm-3">
                              <input type="text" class="form-control"  value="${clientid.realName }" id="names" placeholder="<spring:message code='请输入姓名'/>" name="realName" autocomplete="off"  lay-verify="namesVeri|required">
                            </div>
                            <p class="col-sm-7"><spring:message code='注：需与银行用户名一致，否则不能通过，无法申请提现'/></p>
                        </div>
                      </div>
                       <!-- 隐藏id -->
                      <input type="hidden" name="cilentUserId" value="${clientid.id }">
                      <div class="form-group" style="margin-bottom:30px;">
                        <div class="row">
                          <label for="nums" class="col-sm-2 control-label"><spring:message code='证件号'/></label>
                          <div class="col-sm-3">
                            <input type="text" class="form-control" id="nums" value="${clientid.cardId }" placeholder="<spring:message code='请输入有效证件号码'/>" name="cardID" autocomplete="off"  lay-verify="identity|required">
                          </div>
                          <p class="col-sm-7">
                         	 <spring:message code='证件包括：身份证，驾照以及护照'/>
                          </p>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="row">
                          <label for="password03" class="col-sm-2 control-label"><spring:message code='证件正面'/></label>
                          <div class="col-sm-3">
                            <div class="money_file">
                              <div class="money_img_block" id="imgDIVTOP">
                                <img src="http://via.placeholder.com/260x260" alt="">
                                <span><spring:message code='上传手持证件'/><br><spring:message code='正面图片'/></span>
                              </div>
                              <div class="money_file_block">
                                <input type="file" name="topSRC" id="topSRC"  lay-verify="picture" onchange="getTOPsrc(this,'imgDIVTOP')">
                                <button class="btn btn-info" id="getTopURL"><spring:message code='上传正面图片'/></button>
                              </div>
                            </div>
                          </div>
                          <div class="col-sm-7" style="padding-top:20px;">
                            <p>1. <spring:message code='请上传本人手持证件正面头部照片和上半身照片；'/></p>
                            <p>2. <spring:message code='照片为免冠、未化妆的数码照片原始图片，'/><span style="color:red;"><spring:message code='请勿编辑修改'/></span>；</p>
                            <p>3. <spring:message code='必须看清证件信息，且证件信息不能被遮挡，持证人五官清晰可见；'/></p>
                            <p>4. <spring:message code='仅支持.jpg.bmp.png.gif的图片格式。'/><span style="color:red;"><spring:message code='建议图片大小不超过3M'/></span> ；</p>
                            <p>5. <spring:message code='您提供的照片时间信息财富将予以保护，不会用其他用途；'/></p>
                            <p>6. <a style="color:#68a373;font-weight:700;" href=""><spring:message code='[示例：查看手持身份证正面照]'/></a></p>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                          <div class="row">
                            <label for="password03" class="col-sm-2 control-label"><spring:message code='证件背面'/></label>
                            <div class="col-sm-3">
                              <div class="money_file">
                                <div class="money_img_block" id="imgDIVBUTTOM">
                                  <img src="http://via.placeholder.com/260x260" alt="">
                                  <span><spring:message code='上传手持证件'/><br><spring:message code='背面图片'/></span>
                                </div>
                                <div class="money_file_block">
                                  <input type="file" name="buttomSRC" id="buttomSRC" lay-verify="picture" onchange="getTOPsrc(this,'imgDIVBUTTOM')">
                                  <button class="btn btn-info"><spring:message code='上传背面图片'/></button>
                                </div>
                              </div>
                            </div>
                            <div class="col-sm-7" style="padding-top:30px;">
                              <p>1. <spring:message code='必须看到证件信息，且证件信息不能遮挡；'/></p>
                              <p>2. <spring:message code='仅支持.jpg.bmp.png.gif的图片格式。'/><span style="color:red;"><spring:message code='建议图片大小不超过3M；'/></span></p>
                              <p>3. <spring:message code='您提供的照片时间信息财富将予以保护，不会用其他用途；'/></p>
                              <p>4. <a style="color:#68a373;font-weight:700;" href=""><spring:message code='[示例：查看手持身份证背面照]'/></a></p>
                            </div>
                          </div>
                        </div>
                      <div class="form-group" style="margin-bottom:70px;">
                        <div class="row">
                          <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-info" style="padding-left:35px;padding-right:35px;" lay-filter="demo2" lay-submit=""><spring:message code='提交审核'/></button>
                          </div>
                        </div>
                      </div>
                    </form>
                  </div>
                  <!-- 个人认证  结束 -->
                 </c:if>
                  <div class="tab-pane fade" id="bindingsetting">
                    33
                  </div>
                </div>
                <!--  tab面板切换内容结束！  -->
              </div>

            <!--    用户中心 我是客户 右侧内容 结束   -->


        </div>
      </div>
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
    <script type="text/javascript">
     
    
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
                      return '<spring:message code="请输入真实姓名"/>';
                  }
              },
	    	  english: [/^[A-Za-z]+$/, '只能输入英文']  , 
			  tel:[/^0[0-9]{2,3}[2-9][0-9]{6,7}|(\(\d{3,4}\)|\d{3,4}-|\s)?\d{8}$/, '<spring:message code="固定电话格式不正确"/>'],
			  bess:[/[1-9A-GY]{1}[1239]{1}[1-5]{1}[0-9]{5}[0-9A-Z]{10}/,'<spring:message code="营业执照注册号不正确"/>'],
			  picture:[/^[a-zA-Z]:(\\.+)(.JPG|.jpg|.GIF|.gif|.BMP|.bmp|.GIF|.gif)$/,'<spring:message code="图片格式不支持"/>'],
              number1:[/^\+?[1-9][0-9]*|^(|[0-9]+)$/,'<spring:message code="请输入正确员工数量"/>']
	      })
	      //创建一个编辑器  
	      layedit.build('LAY_demo_editor');  
	      
	     /*  
	      $('#registrationURL').on('click', function(){  	    	 
	    	  //判断是否有选择上传文件
	            var imgPath = $("#registrationURL").val();
	            if (imgPath == "") {
	                alert("请选择上传图片！");
	                return;
	            };
	            //判断上传文件的后缀名
	            var strExtension = imgPath.substr(imgPath.lastIndexOf('.') + 1);
	            if (strExtension != 'jpg' && strExtension != 'gif'
	            && strExtension != 'png' && strExtension != 'bmp') {
	                alert("请选择图片文件");
	                return;
	            };
          
			});  */
	      
	     /*  $('#topSRC').on('click', function(){  	    	 
	    	  //判断是否有选择上传文件
	            var imgPath = $("#topSRC").val();
	            if (imgPath == "") {
	                alert("请选择上传图片！");
	                return;
	            };
	            //判断上传文件的后缀名
	            var strExtension = imgPath.substr(imgPath.lastIndexOf('.') + 1);
	            if (strExtension != 'jpg' && strExtension != 'gif'
	            && strExtension != 'png' && strExtension != 'bmp') {
	                alert("请选择图片文件");
	                return;
	            }else{
	            	//上传文件
	            	
	            };
          
			}); 
	      
	      $('#buttomSRC').on('onchange', function(){  	    	 
	    	  //判断是否有选择上传文件
	            var imgPath = $("#buttomSRC").val();
	            /* if (imgPath == "") {
	                alert("请选择上传图片！");
	                return;
	            }; 
	            //判断上传文件的后缀名
	            var strExtension = imgPath.substr(imgPath.lastIndexOf('.') + 1);
	            if (strExtension != 'jpg' && strExtension != 'gif'
	            && strExtension != 'png' && strExtension != 'bmp') {
	                //alert("请选择图片文件");
	                return;
	            }else{
	            	alert("已选择")
	            };
          
			});  */


	     form.on('submit(demo1)', function(data){
	    	 layer.alert('<spring:message code="等待管理员审核中"/>...', {
					icon: 5,
					title: "<spring:message code='提示'/>"
					});
	    	  params = data.field;
	    	  submit($,params);
	      }); 
	    form.on('submit(demo2)', function(data){ 
	    	layer.alert('<spring:message code="等待管理员审核中"/>...', {
				icon: 5,
				title: "<spring:message code='提示'/>"
				});
	    	  params = data.field;
	    	  submit($,params);
	      }); 
	})
	
	
	function checkFile(){	
        //判断是否有选择上传文件
            var imgPath = $("#uploadFile").val();
            if (imgPath == "") {
                alert("<spring:message code='请选择上传图片！'/>");
                return;
            };
            //判断上传文件的后缀名
            var strExtension = imgPath.substr(imgPath.lastIndexOf('.') + 1);
            if (strExtension != 'jpg' && strExtension != 'gif'
            && strExtension != 'png' && strExtension != 'bmp'&& strExtension != 'JPG' && strExtension != 'GIF'
                && strExtension != 'PNG' && strExtension != 'BMP') {
                alert("<spring:message code='图片只支持一下几种格式：'/>jpg、JPG、gif、GIF、png、PNG、bmp、BMP");
                return;
            };
             $("#srcForm").submit();     	
    }
  
    </script>
  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
