<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name=" Keywords" content="......">      <!--content中，网页关键字-->
    <meta name=" description" content="......">   <!--content中，网页描述文字-->
    <meta name="author" content="......">        <!--标注作者-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/publish.need.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/progress.bar.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/interpreter.show.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/interpreter.cards.css" type="text/css"/>

    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.0.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    <script type="text/javascript" language="JavaScript" src="js/jquery.i18n.properties-min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
	<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <style type="text/css">
    	.a-upload {
    padding: 4px 10px;
    height: 30px;
    line-height: 20px;
    position: relative;
    cursor: pointer;
    color: #888;
    background: #fafafa;
    border: 1px solid #ddd;
    border-radius: 4px;
    overflow: hidden;
    display: inline-block;
    *display: inline;
    *zoom: 1
}

/* .a-upload  input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
    filter: alpha(opacity=0);
    cursor: pointer
} */

.a-upload:hover {
    color: #444;
    background: #eee;
    border-color: #ccc;
    text-decoration: none
}

.languageUL{
	overflow: hidden;
}

.languageUL li{
	display: block;
	width:100px;
	height:40px;
	line-height: 40px;
	border:1px solid #111111;
	border-radius:12px;
	float: left;
	list-style: none;
	margin-left: 15px;
	
	overflow: hidden;
}

.languageUL li input{
	width: 16px;
	height: 16px;
	border: 1px solid #000000;
	border-radius:50%;
	margin-left: 15px;
}
.rowlabel {
	text-align: right;
	padding: 6px;
}
.row {
    margin-top: 20px;
}
</style>
<script type="text/javascript">
$(function(){//页面加载标签开始
	var lang = "${language}"
   	if(lang==""){
   		lang="zh";
   	}
	
	
	//获取登陆客户昵称
	 if("${clientid.userName}"!='' && "${clientid.userName}"!=null){
   		 $("#nickname").text('${clientid.userName}'+"<spring:message code=',欢迎您!'/>");
   	 }else if('${clientid.tel}'!=null && '${clientid.tel}'!=null){
   		 $("#nickname").text('${clientid.tel}'+"<spring:message code=',欢迎您!'/>");
   	 }else if('${clientid.emaile}'!=null && '${clientid.emaile}'!=null){
   		 $("#nickname").text('${clientid.emaile}'+"<spring:message code=',欢迎您!'/>");
   	 }
	/* var tnickname = "${transid.nickname}";
	var unickname = "${clientid.userName}";
	//欢迎语言
	if(tnickname!=""){
		$("#nickname").text(tnickname+"<spring:message  code='，欢迎您！'/>");
		
	}else if (unickname!="") {
		$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>");
	} */
	
	
	//发布需求按钮
	$("#publishNeedClick").click(function (){
		
		$("#backUpdate").attr("disabled",true );
    	$("#saveButton").attr("disabled",true );
    	$("#publish").attr("disabled",true );
		
    	if("${clientid}"==null || "clientid"==''){
			//layer.msg('hello');
			//layer.msg('<spring:message code="兑换成功，稍后会由工作人员给您发货！"/>',{icon:1});
			alert("您不是客户，不能进行发布项目操作！")
		}else{
			$("#publishNeedClick").prop("href","/cilentCustomer/publishNeed.do")
		}
	})
	
	
	//展示即将到期还没有发布项目   开始
	/* jQuery.i18n.properties({
        name:'Messages', 
        path:'/i18n/', 
        mode:'both',
   		language:lang,
        checkAvailableLanguages: true,
        async: true,
        callback: function() { */
        	var urlNeed="${pageContext.request.contextPath}/cilentCustomer/findSuccessFourNeed.do";
        	$.post(urlNeed,"type=lookPublish",function(data){
        		//有符合条件项目展示，若没有随便展示需求
        		//有符合条件项目展示，若没有随便展示需求
        		if(data.length>0){
        			$(".hot_needs").append("<h4><spring:message code='热点项目'/></h4>");
        			 // 循环找需求卡片
          		    for(var j=data.length-1;j>=0;j--){
          		    	var cycle="";//周期
          		    	var acceptState="";//接收状态
          		    	
          		    	if(data[j].cycle == "一般"){
          		    		cycle = "<font color='green'><spring:message  code='一般'/></font>"
          		    	}
          		    	if(data[j].cycle == "加急"){
          		    		cycle = "<font color='orange'><spring:message  code='加急'/></font>"
          		    	}
          				if(data[j].cycle == "特急"){
          					cycle = "<font color='red'><spring:message  code='特急'/></font>"
          				}
          				
          				if(data[j].domainId==12){
          					pic="/img/日常.jpg";
          				}else if(data[j].domainId==13){
          					pic="/img/机械.jpg";
          				}else if(data[j].domainId==14){
          					pic="/img/电子.jpg";
          				}else if(data[j].domainId==15){
          					pic="/img/电器.jpg";
          				}else if(data[j].domainId==16){
          					pic="/img/机电.jpg";
          				}else if(data[j].domainId==17){
          					pic="/img/自动化.jpg";
          				}else if(data[j].domainId==18){
          					pic="/img/计算机.jpg";
          				}else if(data[j].domainId==19){
          					pic="/img/通信.jpg";
          				}else if(data[j].domainId==20){
          					pic="/img/网络.jpg";
          				}else if(data[j].domainId==21){
          					pic="/img/物理.jpg";
          				}else if(data[j].domainId==22){
          					pic="/img/化学.jpg";
          				}else if(data[j].domainId==23){
          					pic="/img/化工.jpg";
          				}else if(data[j].domainId==24){
          					pic="/img/医药.jpg";
          				}else if(data[j].domainId==25){
          					pic="/img/生化.jpg";
          				}
          				if(data[j].acceptState=="已删除"){
          					acceptState="<spring:message code='已删除'/>";
          				}else if(data[j].acceptState=="发布中"){
          					acceptState="<spring:message code='发布中'/>";
          				}else if(data[j].acceptState=="订单"){
          					acceptState="<spring:message code='订单'/>";
          				}else if(data[j].acceptState=="失效"){
          					acceptState="<spring:message code='失效'/>";
          				}else if(data[j].acceptState=="未发布"){
          					acceptState="<spring:message code='未发布'/>";
          				}
          			    var needers_cards = "<div class='hot_needs_cards' style='padding:0px'><div class='needers_cards' style='margin:0px'>"+
          			    "<div class='needers_cards_title'>"+
          			    "<h5 align='left' style='margin-bottom:8px;margin-top:-3px'><spring:message  code='有效时间：'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data[j].completeTime+"</h5>"+
          			    "</div>"+ 
          			    "<div class='needers_cards_content'>"+
          			    "<div class='needers_cards_content_left pull-left' style='width:72px'>"+
          			    "<img src='"+pic+"' alt='' style='width:72px;height:85px;'>"+
          			    "<a style='line-height:35px' href='/cilentCustomer/lookPublishNeedById.do?id="+data[j].id+"&lookType=customerCenter' target='_blank'><spring:message  code='查看详情'/></a>"+
          			    "</div>"+
          			    "<div class='needers_cards_content_right pull-right' style='text-align: left;padding:0px;'>"+
          			    "<p><span style='white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden; '>"+data[j].needReference+"</span></p>"+
          			    "<p style='white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden; '>"+data[j].title+"</p>"+
          			    "<p>"+cycle+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+acceptState+"</p>"+
          			    "<p><span><font color='blue'>"+data[j].length+"</font><spring:message code='字'/></span><span><font color='#E63F00'>￥</font><font color='#E63F00' size='4px'>"+data[j].totalMoney+"</font></span></p>"+
          			    "</div></div></div></div>";
          			    $(".hot_needs").append(needers_cards);
          		    }
        		}
        		
        	},"json")
        	//展示即将到期还没有发布项目  结束
  /*       }
	})//i18n方法调用完毕 */

	
	
	
	//提醒充值开始
	var balance=0;//客户余额
	
	//点击发布按钮时间开始
	$("#publish").click(function(){
		
		$("#backUpdate").attr("disabled",true );
    	$("#saveButton").attr("disabled",true );
    	$("#publish").attr("disabled",true );
		
		$("#typePublish").val("publish");//区分是否发布
		var isUpdate=$("#updateType").val();//区分是修改，还是新项目添加，update表示修改，若是修改，需要修改form.action属性
		var clientNeedId=$("#clientNeedId").val();//区分是正常修改（我的项目--->修改项目）或返回修改（确认信息页面--->返回修改）
		
		//当clientNeedId!=null &&　clientNeedId!='',说明正是正常修改
		//当clientNeedId==null || clientNeedId=='',说明是返回修改
		if("update"==isUpdate && clientNeedId!=null && clientNeedId!=''){
			//说明从修改路劲跳转到look页面
			$("#publishForm").attr("action","/cilentCustomer/updatePublishNeed.do");
		}else{
			$("#publishForm").attr("action","/cilentCustomer/newPublishNeed.do");//新项目跳转路劲
		}
		
		getUserBlance();
	})//点击发布按钮时间结束
	
	//提醒充值结束
	
	
	 //保存按钮 开始
	 $("#saveButton").click(function(){
		 
		 $("#backUpdate").attr("disabled",true );
     	 $("#saveButton").attr("disabled",true );
     	 $("#publish").attr("disabled",true );
		 
		 $("#typePublish").val("save");//保存
		 var isUpdate=$("#updateType").val();//区分是修改，还是新项目添加，update表示修改，若是修改，需要修改form.action属性
		 var clientNeedId=$("#clientNeedId").val();//区分是正常修改（我的项目--->修改项目）或返回修改（确认信息页面--->返回修改）
		 if("update"==isUpdate && clientNeedId!=null && clientNeedId!=''){//说明从修改路劲跳转到look页面
			 $("#publishForm").attr("action","/cilentCustomer/updatePublishNeed.do");
		 }else{
			 $("#publishForm").attr("action","/cilentCustomer/newPublishNeed.do");//新项目跳转路劲
		 }
		 
		 $("#publishForm").submit();
	 })//保存按钮 结束
	
	 
	 //返回修改按钮
	 $("#backUpdate").click(function(){
		 
		 $("#backUpdate").attr("disabled",true );
     	 $("#saveButton").attr("disabled",true );
     	 $("#publish").attr("disabled",true );
		 
		 $("#typePublish").val("back");//返回
		 $("#publishForm").attr("action","/cilentCustomer/updateUI.do");
	     $("#publishForm").submit();
	 })
	 
	//头标签效果显示  开始
	jQuery(document).ready(function($) {
		$(".navbg").capacityFixed();
	});
	
	
	$("#navul > li").not(".navhome").hover(function(){
	      $(this).addClass("navmoon");
	},function(){
	      $(this).removeClass("navmoon");
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
	 
	
})//页面加载标签结束
	
	function bsStep(i) {
	$('.step').each(function() {
		var a, $this = $(this);
		if(i > $this.find('li').length){
			console.log('<spring:message code="您输入数值已超过步骤最大数量"/>' + $this.find('li').length + '！！！');
			a=$this.find('li').length;
		}else if(i == undefined && $this.data('step') == undefined) {
			a = 1
		} else if(i == undefined && $this.data('step') != undefined) {
			a = $(this).data('step');
		} else {
			a = i
		}
		
		$(this).find('li').removeClass('active');
		$(this).find('li:lt(' + a + ')').addClass('active'); 
	})//each方法结束
}


	function queryByInterpreter() {
		var nickName=$("#nickName").val();
		if(nickName!="" && nickName!="null" && nickName!=undefined){
			url="/translator/translatorAction_getTotalCount.do?msg="+nickName;
			window.open(url);
		}else{
			layer.msg('<spring:message  code="译员名不能为空！"/>', {icon: 2});
		}
	}
	
	
	//减法运算
	function numSub(num1, num2) {   
	    var baseNum, baseNum1, baseNum2;   
	    try {   
	        baseNum1 = num1.toString().split(".")[1].length;   
	    } catch (e) {   
	        baseNum1 = 0;   
	    }   
	    try {   
	        baseNum2 = num2.toString().split(".")[1].length;   
	    } catch (e) {   
	        baseNum2 = 0;   
	    }   
	    baseNum = Math.pow(10, Math.max(baseNum1, baseNum2));   
	    var precision = (baseNum1 >= baseNum2) ? baseNum1 : baseNum2;   
	    return ((num1 * baseNum - num2 * baseNum) / baseNum).toFixed(precision);   
	}; 
	
	
	//查找客户余额开始
	
	function getUserBlance(){
		var url="/cilentCustomer/getUserBlance.do"
		var userBanlance="";
		var totalMoney=document.getElementById("totalMoney").value;//需支付总金额
		$.post(url,function(data){
			userBanlance=data.userBanlance;
			if(parseFloat(userBanlance)<parseFloat(totalMoney) && (2!= "${clientid.userType}" || "2"!="${clientid.userType}")&&(1!= "${clientid.userType}" || "1"!="${clientid.userType}")){
				//var needMoney=numSub(totalMoney, userBanlance);
				layer.open({//充值提示框开始
					  content: "<spring:message code='余额不足,请先充值！'/>"
					  ,btn: ["<spring:message code='确定'/>", "<spring:message code='取消'/>"]
					  ,btn1: function(index, layero){
					    //按钮【按钮一】的回调
					    layer.close(index);
						window.open("/cilentCustomer/mywallet.do")//,"needMoney="+needMoney;
						$("#publish").attr("disabled",false );
					  }
					  ,btn2: function(index, layero){
					    //按钮【按钮二】的回调
					    $("#backUpdate").attr("disabled",false );
     	 				$("#saveButton").attr("disabled",false );
     	 				$("#publish").attr("disabled",false );
					    layer.close(index)
					    
					    //return false 开启该代码可禁止点击该按钮关闭
					  }
					  ,cancel: function(){ 
					    //右上角关闭回调 
					    $("#backUpdate").attr("disabled",false );
     	 				$("#saveButton").attr("disabled",false );
     	 				$("#publish").attr("disabled",false );
					    layer.close(index);
					    //return false 开启该代码可禁止点击该按钮关闭
					  }
					});//充值提示框结束
			}else{
				/* alert("可以提交")*/
	 			$("#publishForm").submit();
			}
		},'json');
		
		//return userBanlance;
	}
	
	
	//查找客户余额结束
	
</script>
<title><spring:message code='发布项目'/></title>
</head>
<body style="background:#f1f1f1;">
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
      <!--  发布项目 开始  -->
      <div class="publish_need">
        <div class="publish_progress">
          <ul class="nav nav-pills nav-justified step step-round" data-step="3">
    				<li>
    					<a><spring:message code='填写需求'/></a>
    				</li>
    				<li>
    					<a><spring:message code='确认需求'/></a>
    				</li>
    				<li>
    					<a><spring:message code='发布完成'/></a>
    				</li>
    			</ul>
        </div>

        <div class="publish_contents">
          <div class="publish_contents_left col-sm-9">
            <form class="" method="post" id="publishForm">
              <input type=hidden value="${needId }" name="clientNeedId" id="clientNeedId">
              <input type="hidden" value="${publish.acceptState }" name="acceptState">
              <%-- <input type="hidden" value="${userBanlance}" id="userBanlance"> --%>
			<div class="form-group publish_contents_div">
              	<%-- <div class="row">
                  <h5 class="col-sm-1 control-label"><spring:message code='翻译语言'/></h5>
                  <div class="col-sm-3">
                    <input value="<spring:message code='${publish.languagePair }'/>" class="form-control" readonly="readonly">
                    <input type="hidden" name="languagePair" value="${publish.languagePair }" class="form-control" readonly="readonly">
                  </div>
                </div> --%>
                
                <div class="row" style="margin-top:10px;">
               		<label  class="col-xs-2 rowlabel"><spring:message code='项目标题'/></label>
              		<div class="col-xs-8">
              			<input type="text" class="form-control" placeholder="<spring:message code='请输入需求标题'/>" name="title" id="title" value="${publish.title }" readonly="readonly" >
              		</div>
              	</div>
                
                <%-- <div class="row" style="margin-top:30px;">
               		<label  class="col-xs-2 rowlabel"><spring:message code='项目案号'/></label>
              		<div class="col-xs-8">
              			<input type="text" name="needReference" value="${publish.needReference}" class="form-control" readonly="readonly">
              		</div>
              	</div> --%>
                
                <div class="row" style="margin-top:30px;">
               		<label  class="col-xs-2 rowlabel"><spring:message code='翻译语言'/></label>
              		<div class="col-xs-3">
              			<input value="<spring:message code='${publish.languagePair }'/>" class="form-control" readonly="readonly">
                    	<input type="hidden" name="languagePair" value="${publish.languagePair }" class="form-control" readonly="readonly">
              		</div>
              		
              		<label  class="col-xs-2 rowlabel"><spring:message code='项目领域'/></label>
              		<div class="col-xs-3">
              			<input value="<spring:message code='${field.field}'/>" class="form-control" readonly="readonly">
                    	<input type="hidden" name="domainId" value="${publish.domainId}">
              		</div>
              	</div>
              	
              	<div class="row" style="margin-top:30px;">
               		<label  class="col-xs-2 rowlabel"><spring:message code='译员等级'/></label>
              		<div class="col-xs-3">
              			<input name="transLevel" value="${publish.transLevel }" class="form-control" readonly="readonly">
              		</div>
              		
              		<label  class="col-xs-2 rowlabel"><spring:message code='流程类型'/></label>
              		<div class="col-xs-3">
              			<input value="<spring:message code='${procedureName}'/>" class="form-control" readonly="readonly">
                  		<input type="hidden" name="procedureTypeId" value="${publish.procedureTypeId }">
              		</div>
              	</div>
              	
              	<div class="row" style="margin-top:30px;">
					<label  class="col-xs-2 rowlabel"><spring:message code='交稿时间'/></label>
              		<div class="col-xs-3">
              			<input type="text" class="form-control" name="completeTime" id="completeTime" readonly="readonly" value="${publish.completeTime}">
              		</div>   
              		           	
               		<label  class="col-xs-2 rowlabel"><spring:message code='周期'/></label>
              		<div class="col-xs-3">
              			<input value="<spring:message code='${publish.cycle }'/>" class="form-control" readonly="readonly">
              			<input name="cycle" type="hidden" value="${publish.cycle }" readonly="readonly">
              		</div>
              	</div>
              	
              	<div class="row" style="margin-top:30px;">
              		<label  class="col-xs-2 rowlabel"><spring:message code='项目类型'/></label>
              		<div class="col-xs-3">
              			<input type="text" class="form-control" readonly="readonly" value="<spring:message code='${projectTypeId}'/>">
              			<input type="hidden" class="form-control" name="projectTypeId" id="projectTypeId" readonly="readonly" value="${publish.clientProjectTypeId}">
              		</div> 
              	</div>
              	
              	<%-- <div class="row" style="margin-top:30px;">
              		<label  class="col-xs-2 rowlabel"><spring:message code='项目过期时间'/></label>
              		<div class="col-xs-3">
              			<input type="text" class="form-control" name="EXPIRYDATE" id="trueTime" readonly="readonly" value="${publish.EXPIRYDATE}">
              		</div>
              	</div> --%>
              	
              	<%-- <div class="row" style="margin-top:20px;">
               		<label  class="col-xs-4 rowlabel" style="text-align: left;"><b><spring:message code='留下您的手机号,以便更好的为您服务'/></b></label>
              	</div>
              	
              	<div class="row" style="margin-top:10px;">
               		<label  class="col-xs-2 rowlabel"><b><font color="red">*</font></b><spring:message code='手机号'/></label>
              		<div class="col-xs-3">
              			<input type="text" class="form-control" id="needtel" name="tel" value="${publish.tel}" readonly="readonly" >
              		</div>
              	</div> --%>
              	
              	<input type="hidden" name="fileURL" value="${publish.fileURL }">
              	<div class="row" style="margin-top:20px;">
               		<label  class="col-xs-2 rowlabel"><b><spring:message code='已上传附件'/></b></label>
              	</div>
              	
              	<c:forEach items="${fileNames }" var='fileName'>
              		<div class="row" style="margin-top:10px;">
	               		<label  class="col-xs-2 rowlabel"></label>
	              		<div class="col-xs-8">
	              			<input type="text" class="form-control" name="filename" value="${fileName}" readonly="readonly"/>
	              		</div>
	              	</div>
			    </c:forEach>
              	<c:if test="${publish.publishModel=='选定译员模式' }">
              		<div class="row" style="margin-top:20px;">
	               		<label  class="col-xs-2 rowlabel"><b><spring:message code='您选择的译员有：'/></b></label>
	              	</div>
	              	
	              	<div class="row">
	              		<label  class="col-xs-1 rowlabel" style="text-align: left;"><b></b></label>
		                <div class="col-xs-9" style="text-align: center;" id="transDiv">
		                	<c:forEach items="${listTranslator }" var='trans'>
					 			<div class='append_card' name='append_cardId'>
					 				<div class="cards_one fl" style="border-radius:10px;width:100%;height:120px;background-color: #f2f2f2;">
					 					<div style="height:80px;width:100px;float:left;">
					 						<img class='' src='userUrl' style='width:70px;height:80px;' alt=''>
					 						<input type="hidden" name="trans" value="${trans.id }">
					 					</div>
					 					<div style="height:80px;width:62%;float:left;">
					 						<div style="font-size:20px;float: left;margin-left: 10px;">
					 							<div class="row" style="margin-top: 5px;">
					 								<div style="float: left;"><span style="font-size:20px;color: #000088;"><b><spring:message code='${trans.nickname }'/>&nbsp;</b></span></div>
					 								<div style="float: left;margin-left: 80px"><span style="font-size:15px;"><b><spring:message code='${trans.degree }'/></b></span></div>
					 								<%-- <span style="font-size:15px;margin-left: 40px">${trans.degree }</span> --%>
					 							</div>
					 							<div class="row" style="margin-top: 20px;">
					 								<div style="margin-left: 20px;float: left;"><span style="font-size:15px;;"><b><spring:message code='翻译经验：'/></b>${trans.majorTotal }<b><spring:message code='字'/></b></span></div>
					 								<div style="margin-left: 40px;float: left;"><span style="font-size:15px;"><b><spring:message code='校对经验：'/></b>${trans.prooTotal }<b><spring:message code='字'/></b></span></div>
					 							</div>
					 						</div>
					 					</div>
					 				</div>
					 			</div>
				            </c:forEach>
		                </div>
		            </div>
	            </c:if>
	            
	            <div class="row" style="margin-top:30px;">
               		<label  class="col-xs-2 rowlabel"><spring:message code='备注'/></label>
              		<div class="col-xs-8">
              			<textarea cols="5" rows="5" class="form-control" name="description" id="description" readonly="readonly">${publish.description }</textarea>
              		</div>
              	</div>
              	
              	<div class="row" style="margin-top:30px;">
              		<label  class="col-xs-2 rowlabel"><spring:message code='总字数(字)'/></label>
              		<div class="col-xs-3">
              			<input type="text" class="form-control" placeholder="<spring:message code='翻译总字数'/>" name="length" id="length" value="${publish.length }" readonly="readonly" >
              		</div>
               		<label  class="col-xs-2 rowlabel"><spring:message code='发布模式'/></label>
              		<div class="col-xs-3">
              			<input type="text" class="form-control"  value="<spring:message code='${publish.publishModel }'/>" readonly="readonly" >
              			<input type="hidden" class="form-control" name="publishModel" id="hiddenPublishModel" value="${publish.publishModel }" readonly="readonly" >
              		</div>
              	</div>
              	
              	<c:if test="${clientid.userType != 2 }">
	              	<div class="row" style="margin-top:30px;">
	               		<label  class="col-xs-2 rowlabel"><spring:message code='单价(千字/元)'/></label>
	              		<div class="col-xs-3">
	              			<input type="text" class="form-control" placeholder="<spring:message code='项目单价（单位：千字/元）'/>" name="moneyKilo" value="${transKile }" readonly="readonly" >
	              		</div>
	              		<label  class="col-xs-2 rowlabel"><spring:message code='总价格(元)'/></label>
	              		<div class="col-xs-3">
	              			<input style="color:red;" type="text" class="form-control" placeholder="<spring:message code='需支付金额'/>" name="totalMoney"  id="totalMoney" value="${publish.totalMoney }"readonly="readonly">
	              			<%-- <a href="javascript:getSystomPayNum();" style="color: blue"><spring:message code='还原系统价格'/></a> --%>
	                   	 	<input type="hidden" id="hiddenPayNum" value="${publish.totalMoney  }">
	              		</div>
	              	</div>
              	</c:if>
              	
              	<c:if test="${clientid.userType == 2 }">
              		<div class="row" style="margin-top:30px;">
              			<label  class='col-xs-2 rowlabel'><b><font color="red"><spring:message code='客户支付价格'/></font></b></label>
              		</div>
              		
              		<div class="row" style="margin-top:5px;">
	               		<label  class="col-xs-2 rowlabel"><spring:message code='单价(千字/元)'/></label>
	              		<div class="col-xs-3">
	              			<input type="text" class="form-control" placeholder="<spring:message code='项目单价（单位：千字/元）'/>" name="moneyKilo" value="${transKile }" readonly="readonly" >
	              		</div>
	              		<label  class="col-xs-2 rowlabel"><spring:message code='总价格(元)'/></label>
	              		<div class="col-xs-3">
	              			<input style="color:red;" type="text" class="form-control" placeholder="<spring:message code='需支付金额'/>" name="totalMoney"  id="totalMoney" value="${publish.totalMoney }"readonly="readonly">
	              			<%-- <a href="javascript:getSystomPayNum();" style="color: blue"><spring:message code='还原系统价格'/></a> --%>
	                   	 	<input type="hidden" id="hiddenPayNum" value="${publish.totalMoney  }">
	              		</div>
	              	</div>
	              	
	              	<div class="row" style="margin-top:5px;">
	              		<label  class='col-xs-2 rowlabel'><b><font color="red"><spring:message code='支付译员价格'/></font></b></label>
	              	</div>
	              	
	              	<div class="row" style="margin-top:5px;">
	               		<label  class="col-xs-2 rowlabel"><spring:message code='单价(千字/元)'/></label>
	              		<div class="col-xs-3">
	              			<input type="text" class="form-control" placeholder="<spring:message code='项目单价（单位：千字/元）'/>" name="transSingle" value="${publish.transSingle }" readonly="readonly" >
	              		</div>
	              		<label  class="col-xs-2 rowlabel"><spring:message code='总价格(元)'/></label>
	              		<div class="col-xs-3">
	              			<input style="color:red;" type="text" class="form-control" placeholder="<spring:message code='需支付金额'/>" name="transTotal"  id="totalMoney" value="${publish.transTotal }"readonly="readonly">
	              			<%-- <a href="javascript:getSystomPayNum();" style="color: blue"><spring:message code='还原系统价格'/></a> --%>
	                   	 	<input type="hidden" id="hiddenPayNum" value="${publish.transTotal  }">
	              		</div>
	              	</div>
              	</c:if>
              	
              	<div class="row" style="margin-top:30px;">
              		<label  class="col-xs-4 rowlabel"></label>
              		<input type="hidden" name="type" id="typePublish"><!-- 是否发布隐藏域 -->
              		<input type="hidden" name="updateType" id="updateType" value="${updateType }"><!-- 辨别是否从修改路劲跳到look页面 -->
              		<div class="col-xs-2"><input type="button" class='form-control btn-info' name="button" id="backUpdate" value="<spring:message code='返回修改'/>"></div>
              		<div class="col-xs-2"><input type="button" class='form-control btn-info' name='button' id="saveButton" value="<spring:message code='保存为草稿'/>"></div>
              		<div class="col-xs-2"><input type="button" class='form-control btn-info' name='button' id="publish" value="<spring:message code='发布项目'/>"></div>
              	</div>
			</div>
              
              
             <%--  <div class="form-group publish_contents_div">
                <h5></h5>
                <div class="row">
                
                  <ul class="languageUL">
                    <li><input type="radio" name="languagePair" value="汉英" <c:if test="${publish.languagePair=='汉英' }">checked</c:if> readonly="readonly">汉译英</li>
                    <li><input type="radio" name="languagePair" value="英汉" <c:if test="${publish.languagePair=='英汉' }">checked</c:if> readonly="readonly">英译汉</li>
                    <li><input type="radio" name="languagePair" value="韩汉" <c:if test="${publish.languagePair=='韩汉' }">checked</c:if> readonly="readonly" >韩译汉</li>
                    <li><input type="radio" name="languagePair" value="汉韩" <c:if test="${publish.languagePair=='汉韩' }">checked</c:if> readonly="readonly" >汉译韩</li>
                    <li><input type="radio" name="languagePair" value="日汉" <c:if test="${publish.languagePair=='日汉' }">checked</c:if> readonly="readonly" >日译汉</li>
                    <li><input type="radio" name="languagePair" value="汉日" <c:if test="${publish.languagePair=='汉日' }">checked</c:if> readonly="readonly" >汉译日</li>
                    <li><input type="radio" name="languagePair" value="德汉" <c:if test="${publish.languagePair=='德汉' }">checked</c:if> readonly="readonly" >德译汉</li>
                    <li><input type="radio" name="languagePair" value="汉德" <c:if test="${publish.languagePair=='汉德' }">checked</c:if> readonly="readonly" >汉译德</li>
                    <li><input type="radio" name="languagePair" value="俄汉" <c:if test="${publish.languagePair=='法汉' }">checked</c:if> readonly="readonly" >法译汉</li>
                    <li><input type="radio" name="languagePair" value="汉俄" <c:if test="${publish.languagePair=='汉法' }">checked</c:if> readonly="readonly" >汉译法</li>
                  </ul>
                 <!--  <span class="col-sm-2 btn_more">展开更多</span> -->
                </div>
              </div>
 --%>
 			  <%-- <div class="form-group publish_contents_div">
                <div class="row">
                  <h5 class="col-sm-1 control-label"><spring:message code='项目案号'/></h5>
                  <div class="col-sm-3">
                    <input type="text" name="needReference" value="${publish.needReference}" class="form-control" readonly="readonly">
                  </div>
                </div>
              </div> --%>
 
 			  <%-- <div class="form-group publish_contents_div">
                <div class="row">
                  <h5 class="col-sm-1 control-label"><spring:message code='项目领域'/></h5>
                  <div class="col-sm-3">
                    <input value="<spring:message code='${field.field}'/>" class="form-control" readonly="readonly">
                    <input type="hidden" name="domain" value="${publish.domainId}">
                  </div>
                </div>
              </div> --%>
             <%--  <input type="hidden" value="${${sessionScope.user.username }  }"> --%>
             <%--  <div class="form-group publish_contents_div">
                <h5>需求领域</h5>
                <div class="row">
                <input name="domain" value="${publish.domainId }" class="form-control">
                  <ul class="languageUL">
                    <c:forEach items="${doaminList }" var="domain">
                    	<li><input type="radio" name="domain" value="${domain.id }" <c:if test="${publish.domainId==domain.id }">checked</c:if> readonly="readonly" >${domain.field }</li>
                    </c:forEach>
                  </ul>
                <!--   <span class="col-sm-2 btn_more_job">展开更多</span> -->
                </div>
              </div>
 --%>
              <%-- <div class="form-group publish_contents_div">
                <div class="row">
                  <h5 class="col-sm-1 control-label"><spring:message code='译员等级'/></h5>
                  <div class="col-sm-3">
                  <input name="level" value="${publish.transLevel }" class="form-control" readonly="readonly">
                    <select class="form-control" name="level" id="level" disabled="disabled">
                      <option value="3" <c:if test="${publish.transLevel==3 }">selected</c:if> >三级</option>
                      <option value="4" <c:if test="${publish.transLevel==4 }">selected</c:if>>四级</option>
                      <option value="5" <c:if test="${publish.transLevel==5 }">selected</c:if>>五级</option>
                    </select>
                  </div>
                </div>
              </div>

              <div class="form-group publish_contents_div">
                <div class="row">
                  <h5 class="col-sm-1 control-label"><spring:message code='流程类型'/></h5>
                  <div class="col-sm-3">
                  <input value="<spring:message code='${procedureName}'/>" class="form-control" readonly="readonly">
                  <input type="hidden" name="procedureType" value="${publish.procedureTypeId }">
                    <select class="form-control" name="procedureType" disabled="disabled">
                      <c:forEach items="${procedureList }" var="procedure">
                      	<option value="${publish.procedureTypeId }" <c:if test="${publish.procedureTypeId==procedure.id }">selected</c:if> >${procedure.procedureType }</option>
                      </c:forEach>
                    </select>
                  </div>
                </div>
              </div> --%>
              
               <%-- <div class="form-group publish_contents_div">
                <div class="row">
                  <h5 class="col-sm-1 control-label"><spring:message code='是否加急'/></h5>
                  <div class="col-sm-3">
                   <input name="cycle" value="${publish.cycle }" class="form-control" readonly="readonly">
                    <select class="form-control" name="cycle" disabled="disabled">
                      	<option value="特急" <c:if test="${publish.cycle==特急 }">selected</c:if> >特急</option>
                      	<option value="加急" <c:if test="${publish.cycle==加急 }">selected</c:if> >加急</option>
                      	<option value="一般" <c:if test="${publish.cycle==一般 }">selected</c:if> >一般</option>
                    </select>
                  </div>
                </div>
              </div> --%>
              
              <%-- <div class="publish_contents_div">
                <h5 class="control-label" style="margin-bottom:15px;"><spring:message code='留下您的手机号,以便更好的为您服务'/></h5>
                <div class="form-group row" style="margin-bottom:15px;">
                  <label for="needtel" class="col-sm-1 control-label text_label"><span style="color:red;height:34px;line-height:34px">*</span><spring:message code='手机号'/></label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" id="needtel" name="tel" value="${publish.tel}" readonly="readonly" >
                  </div>
                  <!-- <span style="color:red;height:34px;line-height:34px">必填</span> -->
                </div>
                <div class="form-group row">
                  <label for="needqq" class="col-sm-1 control-label text_label">QQ</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" id="needqq" name="qq" value="${publish.qq }" readonly="readonly" >
                  </div>
                </div>
              </div> --%>
              
              <%-- <input type="hidden" name="fileURL" value="${publish.fileURL }">
			   <div class="publish_contents_div">
			     <h5 class="control-label" style="display:inline-block;margin-bottom:15px;"><spring:message code='已上传附件'/></h5>
			     <div class="form-group row">
			       <c:forEach items="${fileNames }" var='fileName'>
			       	 <input type="text" class="form-control" name="filename" value="${fileName}" readonly="readonly"/><br><br><br><br>
			       </c:forEach>
                    
                  </div>
                 </div> --%>
			   <div class="publish_contents_div">
                <%-- <h5 class="control-label" style="display:inline-block;margin-bottom:15px;"><spring:message code='明确项目标题和详情'/></h5> --%>
               <!--  <span style="padding-left:30px;">参照发布实例</span> -->
                
                <div class="form-group row">
                  <%-- <div class="col-sm-5">
              		     <spring:message code='项目标题： '/><input type="text" class="form-control" placeholder="<spring:message code='请输入需求标题'/>" name="title" id="title" value="${publish.title }" readonly="readonly" >
                  </div><br><br><br><br> --%>
                  <%-- <div class="col-sm-5">
                   	    <spring:message code='项目详情：'/><input type="text" class="form-control" placeholder="<spring:message code='请输入需求详情'/>" name="description" id="description" value="${publish.description }" readonly="readonly" >
                  </div><br><br><br><br> --%>
                  <%-- <div class="col-sm-5">
                	 <spring:message code='翻译总字数（单位：字）'/><input type="text" class="form-control" placeholder="<spring:message code='翻译总字数'/>" name="length" id="length" value="${publish.length }" readonly="readonly" >
                  </div><br><br><br><br><br> --%>
                 <%--  <div class="col-sm-5">
                   	 <spring:message code='交稿时间：'/><input type="text" class="form-control" name="completeTime" id="completeTime" readonly="readonly" value="${publish.completeTime}">
                  </div><br><br><br><br>
                  <div class="col-sm-5">
                   	 <spring:message code='系统推荐价格：元'/><input type="text" class="form-control" placeholder="<spring:message code='需支付金额'/>" name="totalMoney" id="totalMoney" value="${publish.totalMoney }"><a onclick="getSystomPayNum()" style="color: blue"><spring:message code='系统价格'/></a>
                   	 				<input type="hidden" id="hiddenPayNum" value="${publish.totalMoney  }">
                  </div><br><br><br><br>
                   <div class="col-sm-5">
                   	 <spring:message code='项目过期时间：'/><input type="text" class="form-control" name="trueTime" id="trueTime" readonly="readonly" value="${publish.EXPIRYDATE}">
                  </div> --%>
                  
                </div>
                <br><br>
                
                <!--  <div class="form-group row">
                <span>需求模式:</span>
                  <div class="col-sm-5"> -->
                <%--  </div>
                  <c:if test="${publish.publishModel=='主动投标模式' }">
                  <div class="col-sm-2" style="width:18%;">
                    <button type="button" class="form-control btn-info" name="button" value="主动投标模式">主动投标模式</button>
                  </div>
                  </c:if>
                  
                  <c:if test="${publish.publishModel=='分配译员模式' }">
                  <div class="col-sm-2" style="width:18%;">
                  	<input type="hidden" name="tid" value="${tid }">
                  	<c:forEach items="${listTranslator }" var='trans'>
                  	<input type="hidden" name="trId" value="${trans.id }">
                  	</c:forEach>
                  	<c:if test="${(tid==null ||tid=='' )&& (listTranslator!=null && listTranslator=='') }">
                  		<span style="color: red">系统将会为您尽快匹配译员</span>
                  	</c:if>
                  	<!-- <input type='text' name='selected' value='分配译员模式' id='selectedModel'> -->
                    <button type="button" class="form-control btn-info" name="button" value="分配译员模式">分配译员模式</button>
                  </div>
                  </c:if>
             
             	  <c:if test="${publish.publishModel=='选定译员模式' }">
                  <div class="col-sm-2" style="width:18%;">
                    <button type="button" class="form-control btn-info" name="button" value="选定译员模式">选定译员模式</button>
                  </div>
                  </c:if>
             	 
                 <!--  <div class="col-sm-2" style="width:18%;">
                    <button type="button" class="form-control btn-info" name="button">选定译员模式</button>
                  </div> -->
                </div> --%>
              </div>
   			 
   			 <%-- <c:if test="${publish.publishModel=='选定译员模式' }">
	              <div id="hiddenDiv">
	               <div id="transDiv" >
	                <h5 class="control-label" style="display:inline-block;margin-bottom:15px;"><spring:message code='您选择的译员是'/></h5>
					<span style="padding-left:30px;" id="parentCount">您共选择译员<span id="transCount">${listLength }</span>位</span>
	               </div>
	               <c:forEach items="${listTranslator }" var='trans'>
	               	<div class='append_card' name='append_cardId'>
	 					<div class='cards_one text-right fl'  style='height:307px'>
	 						<img class='card_img' src='userUrl' style='width:65px;height:75px;' alt=''>
	 						<input type="hidden" name="trans" value="${trans.id }">
	 						<p><span class='card_name' id='nickname'>${trans.nickname }</span></p>
	 						<p><spring:message code='等级：'/><span id='level'>${trans.level }<spring:message code='级'/></span></p>
	 						<p><spring:message code='学历：'/><span id='degree'><spring:message code='${trans.degree }'/></span></p>
	 						<p><spring:message code='语种：'/><span id='languages'><spring:message code='${trans.language }'/></span></p>
	 						<div class='texts_left' style='padding-left:2px;'>
		 						<p><spring:message code='所学专业：'/><span></span></p>
		 						<p><spring:message code='专业领域：'/><span id='trandomain'><spring:message code='${trans.domain }'/></span></p>
		 						<p><spring:message code='翻译经验：'/><span>${trans.tranExperience }</span></p>
		 						<p><spring:message code='校对经验：'/><span>${trans.prooExperience }</span></p>
	 						</div>
	 					</div>
	 				</div>
	               </c:forEach>
	   			 </div>
   			 </c:if> --%>
   			 
   			  <%-- <div>
                <div class="col-sm-2" style="width:50%;">
                  <button type='button' class='form-control btn-info' name='button' id="publish" style="width: 30%"><spring:message code='发布项目'/></button>
                </div>
               
                <div class="col-sm-2" style="width:50%;">
                  <a class='form-control btn-info'  style="width: 30%;text-align: center;" href="${pageContext.request.contextPath}/cilentCustomer/publishNeed.do"><span style="color: #FFFFFF"><spring:message code='重新编辑'/></span></a>
                </div>
              </div> --%>
            </form>
          </div>

          <div class="publish_contents_right col-sm-3">
            <!-- 热门需求  开始 -->
            <div class="hot_needs">
              

              <%-- <div class="hot_needs_cards">
                <h5><a href="#"><spring:message code='主动投标模式'/></a></h5>
                <p><spring:message code='点击“主动投标”按钮，进行主动投标模式项目的发布，此模式的项目需要译员主动上平台招标项目展示模块查找并接受该任务 ,在有满足项目需求的译员主动接受该项目是客户该项目会形成对应的订单。'/></p>
                <p class="hot_cards_text"><spring:message code='需要翻译的原文：中国自行车联赛组委会与各举办地共同举行盛大赛事'/></p>
                <p class="hot_text_weight"><spring:message code='价格：'/><span>500</span></p>
              </div>
              <div class="hot_needs_cards">
                <h5><a href="#"><spring:message code='系统分配模式'/></a></h5>
                <p><spring:message code='点击“系统分配”按钮，进行系统分配模式项目的发布。选择此模式会针对满足项目需求的所有译员以短信通知的方式进行分批推送，在任何一个译员接受了请求之后则订单形成，平台同时停止推送。'/></p>
                <p class="hot_cards_text"><spring:message code='需要翻译的原文：中国自行车联赛组委会与各举办地共同举行盛大赛事'/></p>
                <p class="hot_text_weight"><spring:message code='价格：'/><span>500</span></p>
              </div>
              <div class="hot_needs_cards">
                <h5><a href="#"><spring:message code='选定译员模式'/></a></h5>
                <p><spring:message code='点击“选定译员”按钮，进行选定译员模式项目的发布。选择此模式客户必须在平台已注册译员中选择一位或多位译员，针对发布项目，平台同时以短信方式通知各位译员，若某一个译员接受该项目则形成相应的订单'/></p>
                <p class="hot_cards_text"><spring:message code='需要翻译的原文：中国自行车联赛组委会与各举办地共同举行盛大赛事'/></p>
                <p class="hot_text_weight"><spring:message code='价格：'/><span>500</span></p>
              </div> --%>
            </div>
            <!--  热门需求结束  -->
            <!-- <div class="hot_advert">
              <img src="http://via.placeholder.com/270x140" alt="">
            </div> -->

          </div>
          <div class="clear"></div>
        </div>
      </div>
      <div class="clear"></div>

      <!--  发布需求 结束  -->

  </div>
  <!-- 用户指南  -->
<div id="gradient" class="footer_content">
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
		<li><a href="/forwardAction/forward_toTeam.do"><spring:message  code='关于我们'/></a>|</li>  
		<li><a href="/forwardAction/forward_toTeam.do"><spring:message  code='联系方式'/></a>| </li> 
		<li><a href="http://www.aitrans.net"><spring:message  code='爱译智能'/>-CAT</a>|</li>  
		<li><a href="javascript:;"><spring:message  code='支付方式'/></a>|</li>  
		<li><a href="http://www.aitrans.org"><spring:message  code='友情链接'/></a>| </li> 
		<li><a href="/forwardAction/forward_toSecurityCenter.do"><spring:message  code='安全中心'/></a></li>
 	</ul>
    <p class="footer_adress">Copyright 2005-2017 123.com版权所有 渝ICP备1234567-4号 渝B2-12134567 渝公安网备 1234567890号 互联网违法和不良信息举报电话：1234567 邮箱：123456.com</p>
  </footer>
</div>
    <script type="text/javascript">
    $(function(){
        bsStep(2);
  				//bsStep(i) i 为number 可定位到第几步 如bsStep(2)/bsStep(3)
      })
    
    
    function getSystomPayNum(){
    	document.getElementById("totalMoney").value=document.getElementById("hiddenPayNum").value;
    }
  
    </script>
<div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>