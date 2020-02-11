<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="Keywords" content="......">      <!--content中，网页关键字-->
    <meta name="description" content="......">   <!--content中，网页描述文字-->
    <meta name="author" content="......">        <!--标注作者-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/publish.need.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/progress.bar.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/interpreter.show.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/interpreter.cards.css" type="text/css"/>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.0.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
    function isInteger(str)   
	  {   
	      if(/^-?\d+$/.test(str))   
	      {   
	          return true;   
	      }   
	      return false;   
	  }
    
    
    
      
    function overShowLength() {  
        var showDiv = document.getElementById('showDivLength');  
        showDiv.style.left = event.clientX;  
        showDiv.style.top = event.clientY;  
        showDiv.style.display = 'block';  
        showDiv.innerHTML = "<spring:message code='总翻译字数说明'/><br><font color='#00FF00'><spring:message code='总翻译字数'/></font><spring:message code='须和'/><font color='#00FF00'><spring:message code='提交的文档字数'/></font><spring:message code='相当，差异不得大于'/><font color='#00FF00'>500</font><spring:message code='字，否则以'/><font color='#00FF00'><spring:message code='提交文档的总字数'/></font><spring:message code='为准（即word文档计算的总字数）'/>";  
    }  
    function outHideLength() {  
        var showDiv = document.getElementById('showDivLength');  
        showDiv.style.display = 'none';  
        showDiv.innerHTML = '';  
    } 
    
    function overShowCycle() {  
        var showDiv = document.getElementById('showDivCycle');  
        showDiv.style.left = event.clientX;  
        showDiv.style.top = event.clientY;  
        showDiv.style.display = 'block';  
        showDiv.innerHTML = "<spring:message code='周期说明'/><br><font color='#00FF00'><spring:message code='一般'/></font><spring:message code='：翻译0~3000字/天 、校对0~6000字/天、审核0~8000字/天'/>        <br><font color='#00FF00'><spring:message code='加急'/></font><spring:message code='：翻译3000~4000字/天 、校对6000~8000字/天、审核8000~10000字/天'/><br><font color='#00FF00'><spring:message code='特急'/></font><spring:message code='：翻译4000~5000字/天 、校对8000~10000字/天、审核10000~15000字/天'/><br><font color='#00FF00'><spring:message code='特急'/>+</font><spring:message code='：翻译5000字/天以上 、校对10000字/天以上、审核15000字/天 以上'/><br>ps:<spring:message code='项目翻译周期由'/><font color='#00FF00'><spring:message code='项目过期时间'/></font><spring:message code='起，至'/><font color='#00FF00'><spring:message code='交稿日期'/></font><spring:message code='止。'/>";  
    }  
    function outHideCycle() {  
        var showDiv = document.getElementById('showDivCycle');  
        showDiv.style.display = 'none';  
        showDiv.innerHTML = '';  
    }
    
    /* function overShowTime() {  
        var showDiv = document.getElementById('showDivTime');  
        showDiv.style.left = event.clientX;  
        showDiv.style.top = event.clientY;  
        showDiv.style.display = 'block';  
        showDiv.innerHTML = "<spring:message code='项目过期时间说明'/><br><spring:message code='从'/><font color='#00FF00'><spring:message code='发布项目'/></font><spring:message code='或'/><font color='#00FF00'><spring:message code='保存项目'/></font><spring:message code='开始，到'/><font color='#00FF00'><spring:message code='项目过期时间'/></font><spring:message code='截止，这段时间可以允许译员接受任务，如果过了'/><font color='#00FF00'><spring:message code='项目过期时间'/></font><spring:message code='还没有译员接受任务，则'/><font color='#00FF00'><spring:message code='项目失效，不再能被译员浏览，检索和接受'/></font>";  
    }   */
    /* function outHideTime() {  
        var showDiv = document.getElementById('showDivTime');  
        showDiv.style.display = 'none';  
        showDiv.innerHTML = '';  
    } */
    
    function overShowLevel() {  
        var showDiv = document.getElementById('showDivLevel');  
        showDiv.style.left = event.clientX;  
        showDiv.style.top = event.clientY;  
        showDiv.style.display = 'block';  
        showDiv.innerHTML = "<spring:message code='译员等级说明'/><br>"+
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
    
    
    
  	$(function(){
  		 if("${clientid.userName}"!='' && "${clientid.userName}"!=null){
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
			$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>");
		}  */
		
		//发布需求按钮
    	$("#publishNeedClick").click(function (){
    		if("${clientid}"==null || "clientid"==''){
    			//layer.msg('hello');
    			//layer.msg('<spring:message code="兑换成功，稍后会由工作人员给您发货！"/>',{icon:1});
    			alert("您不是客户，不能进行发布项目操作！")
    		}else{
    			$("#publishNeedClick").prop("href","/cilentCustomer/publishNeed.do")
    		}
    	})
		
		$(".btn_more").click(function(){
		    if($(".publish_contents_lists").hasClass('height_list')){
		      $(".publish_contents_lists").removeClass('height_list');
		      $(".btn_more").html("<spring:message code='折叠'/>");
		    }else{
		      $(".publish_contents_lists").addClass('height_list');
		      $(".btn_more").html("<spring:message code='展开'/>");
		    }
		  })

		  $(".btn_more_job").click(function(){
		    if($(".publish_jobs_lists").hasClass('height_list')){
		      $(".publish_jobs_lists").removeClass('height_list');
		      $(".btn_more_job").html("<spring:message code='折叠'/>");
		    }else{
		      $(".publish_jobs_lists").addClass('height_list');
		      $(".btn_more_job").html("<spring:message code='展开'/>");
		    }
		  })
           
		  
		 /* $(".height_list li").click(function(){
		    if($(this).hasClass('check_color')){
		      $(this).removeClass('check_color')
		    }else{
		      $(this).addClass('check_color')
		    }

		  })
		*/
		 
		  var hotcard = $(".hot_cards_text").text();
		  hotcard.substring(0,20)
		  $(".hot_cards_text").text(hotcard.substring(0,20)+'......')
		 
		  $("#btn_add1").click(function(){  
	  			
	  			var a="<div class='row' style='height:37px'>"+
	  					"<label  class='col-xs-2 rowlabel'></label>"+
	  					"<div class='col-xs-3'>"+
	  					"</div>"+
	  					"<div class='col-xs-5'>"+
	  					"<a href='javascript:;' class='a-upload' id='file' class='a-upload'>"+
	  					"<input type='file' id='' name='filename' onchange='checkFile(this)'  lay-verify='required'/><spring:message code='点击这里上传文件'/></a>"+
	  					"</div>"+
	  				"</div>";
	  			$("#newUploadDiv").append(a);  
	  	   	 document.getElementById("btn_del1").removeAttribute("disabled");
	  	   });
		  
  		});
  	
  	
  	function bsStep(i) {
  		$('.step').each(function() {
  			var a, $this = $(this);
  			if(i > $this.find('li').length) {
  				console.log('<spring:message code="您输入数值已超过步骤最大数量"/>' + $this.find('li').length + '！！！');
  				a=$this.find('li').length;
  			} else if(i == undefined && $this.data('step') == undefined) {
  				a = 1
  			} else if(i == undefined && $this.data('step') != undefined) {
  				a = $(this).data('step');
  			} else {
  				a = i
  			}
  			$(this).find('li').removeClass('active');
  			$(this).find('li:lt(' + a + ')').addClass('active'); 
  		})
  	}
  		
  		
  		
  		//对比报价
  		function contrast(trandPrice,proofPrice,veriPrice,procedureType){
  			if("1"==procedureType){
  				
  			}else if("2"==procedureType){
  				
  			}else if("3"==procedureType){
  				
  			}
  		}

  		function assignedModel(){
  			var cycleValue=document.getElementById("cycle").value;
  			if("特急+"==cycleValue){
  				layer.alert('<spring:message code="由于项目翻译时间过短，平台提醒您项目只能以招标模式发布，您也可以联系客服，可能会更好的解决，客服电话：010-82893875"/>', {
  					icon: 5,
  					title: "<spring:message code='提示'/>"
  					});
  				return false;
  			}else{
  				var parentDIV=document.getElementById("transDiv");
  				var chilDIV=document.getElementsByName("append_cardId");//译员卡片
  				
  				//var chillength=parentDIV.childNodes.length;
  				//alert(chillength);
  				//alert(chilDIV.length);
  				
  				/* var selectModel=document.getElementById("selectedModel");//模式 */
  				$("#selectedModel").val("系统分配模式");
  				
  				if(parentDIV&&chilDIV){
  					for(var a=0;a<chilDIV.length;){
  						//alert(chilDIV[2]);
  						parentDIV.removeChild(chilDIV[a]);
  						//alert(chilDIV.length);
  					}
  							
  					document.getElementById("hiddenDiv").style.visibility="hidden";//隐藏
  				}
  				
  				
  				/* //移除原来的每千字表框
  				if($("#moneyKilo").length>0)
  				{
  				//存在
  					$("#ddd").empty();
  				} */
  			}
  		}


  		function unsolicitedBid(){
  			var parentDIV=document.getElementById("transDiv");
  			var chilDIV=document.getElementsByName("append_cardId");
  			//var chillength=parentDIV.childNodes.length;
  			//alert(chillength);
  			//alert(chilDIV.length);
  			
  			var selectModel=document.getElementById("selectedModel");
  			if(parentDIV&&chilDIV&&selectModel){
  				for(var a=0;a<chilDIV.length;){
  					//alert(chilDIV[2]);
  					parentDIV.removeChild(chilDIV[a]);
  					//alert(chilDIV.length);
  				}
  				
  				document.getElementById("hiddenDiv").style.visibility="hidden";//隐藏
  			}
  			
  			
  			$("#selectedModel").val("主动投标模式");
  			
  			
  			/* //移除原来的每千字表框
  			if($("#moneyKilo").length>0)
  			{
  			//存在
  				$("#ddd").empty();
  			} */
  			
  			
  			//$("#publish").submit();  
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
   		 layer.msg("<spring:message  code='译员名不能为空！'/>", {icon: 2});
   	 }
		
	}
  	</script>
    <style type="text/css">
  /*   *{
    webkit-box-sizing:inherit;
    -moz-box-sizing:inherit;
    box-sizing:inherit;
    } */
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

.layui-form-radio {
   width: 100px;
   height: 30px;
   margin-bottom: 20px;
   margin-left: 15px;
}
.rowlabel {
	text-align: right;
	padding: 6px;
}
.row {
    margin-top: 30px;
}
.modeBtn {
	width:25%;
	margin-left:20px;
	float:left;
}
#gradient{
		margin-top: 50px;
	    background: -moz-linear-gradient(top, #08A5E0 10%, #000099 100%);
	    background: -webkit-gradient(linear, left top, left bottom, color-stop(10%,#08A5E0), color-stop(100%,#000099));
	    background: -webkit-linear-gradient(top, #08A5E0 10%,#000099 100%);
	    background: -o-linear-gradient(top, #08A5E0 10%,#000099 100%);
	    background: -ms-linear-gradient(top, #08A5E0 10%,#000099 100%);
	    background: linear-gradient(to bottom, #08A5E0 10%,#000099 100%);
}
</style>
	<title><spring:message code='发布项目'/></title>
</head>
<body style="background:#f1f1f1;" id="body">
	<div id="bg"></div>
	<div id="show"></div>
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

      <!--  发布需求 开始  -->
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
          <div class="publish_contents_left col-sm-9" id="parentDiv">
            <form class="layui-form" id="form" action="/cilentCustomer/lookPublish.do"  method="post" id="publish" enctype="multipart/form-data">
              
            <div class="form-group row" id="msgDiv">
              	<c:if test="${transId==null || transId=='' }">
              		<div class="row">
              			<label  class="col-xs-2 rowlabel"><b><font color="red">*</font><spring:message code='选择翻译语言'/></b></label>
                 		<div class="list-inline publish_contents_lists height_list col-xs-8">
                    		<input type="radio" lay-filter="translang" name="languagePair" value="汉英" title="<spring:message code='汉译英'/>" <c:if  test="${clientCustomerNeed.languagePair=='汉英' }">checked="checked"</c:if>checked="checked"> 
		                    <input type="radio" lay-filter="translang" name="languagePair" value="英汉" title="<spring:message code='英译汉'/>" <c:if  test="${clientCustomerNeed.languagePair=='英汉' }">checked="checked"</c:if>>  
		                   	<input type="radio" lay-filter="translang" name="languagePair" value="韩汉" title="<spring:message code='韩译汉'/>" <c:if  test="${clientCustomerNeed.languagePair=='韩汉'}">checked="checked"</c:if>>
		                    <input type="radio" lay-filter="translang" name="languagePair" value="汉韩" title="<spring:message code='汉译韩'/>" <c:if  test="${clientCustomerNeed.languagePair=='汉韩' }">checked="checked"</c:if>>  
		                    <input type="radio" lay-filter="translang" name="languagePair" value="日汉" title="<spring:message code='日译汉'/>" <c:if  test="${clientCustomerNeed.languagePair=='日汉' }">checked="checked"</c:if>>  
		                    <input type="radio" lay-filter="translang" name="languagePair" value="汉日" title="<spring:message code='汉译日'/>" <c:if  test="${clientCustomerNeed.languagePair=='汉日' }">checked="checked"</c:if>>  
		                    <input type="radio" lay-filter="translang" name="languagePair" value="德汉" title="<spring:message code='德译汉'/>" <c:if  test="${clientCustomerNeed.languagePair=='德汉' }">checked="checked"</c:if>>  
		                    <input type="radio" lay-filter="translang" name="languagePair" value="汉德" title="<spring:message code='汉译德'/>" <c:if  test="${clientCustomerNeed.languagePair=='汉德'}">checked="checked"</c:if>>  
		                    <%-- <input type="radio" name="languagePair" value="俄汉" title="<spring:message code='俄译汉'/>" <c:if  test="${clientCustomerNeed.languagePair=='俄汉' }">checked="checked"</c:if>>  
		                    <input type="radio" name="languagePair" value="汉俄" title="<spring:message code='汉译俄'/>" <c:if  test="${clientCustomerNeed.languagePair=='汉俄' }">checked="checked"</c:if>>   --%>
		                    <input type="radio" lay-filter="translang" name="languagePair" value="法汉" title="<spring:message code='法译汉'/>" <c:if  test="${clientCustomerNeed.languagePair=='法汉' }">checked="checked"</c:if>>  
		                    <input type="radio" lay-filter="translang" name="languagePair" value="汉法" title="<spring:message code='汉译法'/>" <c:if  test="${clientCustomerNeed.languagePair=='汉法'}">checked="checked"</c:if>>   
                  		</div> 
                  		<label class="col-xs-1 btn_more"><spring:message code='展开'/></label>
              		</div>
              		
					<div class="row">
						<label  class="col-xs-2 rowlabel"><b><font color="red">*</font><spring:message code='选择项目领域'/></b></label>
                  		<div class="list-inline publish_jobs_lists height_list col-xs-8">
                  			<c:if test="${clientCustomerNeed.domainId == null || clientCustomerNeed.domainId == '' }">
	                  			<c:forEach items="${doaminList }" var="domains">
	                    			<input lay-filter="domains" type="radio" name="domain" value="${domains.id }" title="<spring:message code='${domains.field }'/>" <c:if test="${domains.id == '12' }">checked="checked"</c:if>>
	                    		</c:forEach>
                  			</c:if>
                  			<c:if test="${clientCustomerNeed.domainId != null && clientCustomerNeed.domainId != '' }">
	                    		<c:forEach items="${doaminList }" var="domains">
	                    			<input lay-filter="domains" type="radio" name="domain" value="${domains.id }" title="<spring:message code='${domains.field }'/>" <c:if test="${clientCustomerNeed.domainId==domains.id }">checked="checked"</c:if>>
	                    		</c:forEach>
                    		</c:if>
                  		</div>
                  		<label  class="col-xs-1 btn_more_job"><spring:message code='展开'/></label>
               		</div>

                	<div class="row">
                		<label  class="col-xs-2 rowlabel"><b><font color="red">*</font><spring:message code='译员等级'/></b></label>
                  		<div class="col-xs-3">
                    		<select class="form-control" lay-filter="level" name="level" id="level" lay-verify="required">
                    		  <option value="1" id="level1" <c:if test="${clientCustomerNeed.transLevel==1 }">selected = "selected"</c:if>>1<spring:message code='级'/></option>
		                      <option value="2" id="level2" <c:if test="${clientCustomerNeed.transLevel==2 }">selected = "selected"</c:if>>2<spring:message code='级'/></option>
		                      <option value="3" <c:if test="${clientCustomerNeed.transLevel==3 }">selected = "selected"</c:if>>3<spring:message code='级'/></option>
		                      <option value="4" <c:if test="${clientCustomerNeed.transLevel==4 }">selected = "selected"</c:if>>4<spring:message code='级'/></option>
		                      <option value="5" <c:if test="${clientCustomerNeed.transLevel==5 }">selected = "selected"</c:if>>5<spring:message code='级'/></option>
		                    </select>
                  		</div>
                  		<label  class="col-xs-1 rowlabel" style="text-align: left;"><a href="javascript:;" onmouseover="overShowLevel()" onmouseout="outHideLevel()"><font color="red"><b>?</b></font></a></label>
                		<label  class="col-xs-2 rowlabel"><b><font color="red">*</font><spring:message code='流程类型'/></b></label>
                  		<div class="col-xs-3">
                    		<select class="form-control" lay-filter="procedureType" name="procedureType" id="procedureType" lay-verify="required" >
		                      <c:forEach items="${procedureList }" var="procedure">
		                      	<option value="${procedure.id }" <c:if test="${clientCustomerNeed.procedureTypeId==procedure.id }">selected = "selected"</c:if>><spring:message code='${procedure.procedureType }'/></option>
		                      </c:forEach>
		                    </select>
                  		</div>
                	</div>
                	
                	<div id="showDivLevel" style="color:white;z-index: 999;display:none;position: absolute;margin-top:10px; background-color: #4169E1; border: 1px solid #4169E1;margin-left:10%;width:45%;text-align: center;border-radius:10px;padding:10px;"></div>
				</c:if>
               
               	<c:if test="${transId!=null &&transId!='' }">
               		<div class="row">
                		<label  class="col-xs-2 rowlabel"><b><font color="red">*</font><spring:message code='项目语言：'/></b></label>
                  		<div class="col-xs-3">
                    		<input type="text" class="form-control" value="<spring:message code='${clientCustomerNeed.languagePair }'/>" id="title" readonly="readonly" autocomplete="off" lay-verify="required">
              		     	<input type="hidden"  value="${clientCustomerNeed.languagePair }" name="languagePair" id="title" >
                  		</div>
                		<label  class="col-xs-2 rowlabel"><b><font color="red">*</font><spring:message code='项目领域：'/></b></label>
                  		<div class="col-xs-3">
                    		<input class="form-control" value="<spring:message code='${filed.field }'/>" id="domian" readonly="readonly" autocomplete="off" lay-verify="required">
                   	    	<input  name="domain" value="${filed.id }" type="hidden" autocomplete="off" lay-verify="required">
                  		</div>
                	</div>
                	
                	<div class="row">
                		<label  class="col-xs-2 rowlabel"><b><font color="red">*</font><spring:message code='译员等级：'/></b></label>
                  		<div class="col-xs-3">
                    		<input class="form-control" name="level" value="${clientCustomerNeed.transLevel }"id="level" readonly="readonly" autocomplete="off" lay-verify="required">
                  		</div>
                	</div>
                </c:if>
                <div class="row">
               		<label  class="col-xs-2 rowlabel"><b><font color="red">*</font><spring:message code='项目标题'/></b></label>
              		<div class="col-xs-9">
              			<input type="text" class="form-control" onblur="getValueByTitle(this)" placeholder="<spring:message code='请输入项目标题'/>" name="title" onchange="onlyTitly(this)" id="title" autocomplete="off" lay-verify="title|required">
              		</div>
              	</div>
                <div class="row">
                	<label  class="col-xs-2 rowlabel"><b><font color="red">*</font><spring:message code='翻译总字数'/></b></label>
                  	<div class="col-xs-9">
                    	<input type="text" class="form-control" placeholder="<spring:message code='翻译总字数（单位：字）'/><spring:message code='若原稿字数少于500字，平台将按500字计算支付金额'/>" name="length" id="length" onblur="iscycle()" lay-filter="length" autocomplete="off" lay-verify="length|required|number">
                  	</div>
                  	<label  class="col-xs-1 rowlabel" style="text-align: left;"><a href="javascript:;" onmouseover="overShowLength()" onmouseout="outHideLength()"><font color="red"><b>?</b></font></a></label>
                </div>
                
                <div id="showDivLength" style="color:white;z-index: 999;display:none;position: absolute; background-color: #4169E1; border: 1px solid #4169E1;margin-left:60%;width:35%;text-align: center;border-radius:10px;padding:10px;"></div>
                
                <div class="row">
                	<label  class="col-xs-2 rowlabel"><b><font color="red">*</font><spring:message code='交稿日期'/></b></label>
                  	<div class="col-xs-3">
                    	<input type="text" class="form-control" name="completeTime" id="completeTime" onblur="iscycle()" onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd',minDate:new Date()})" lay-verify="required"><!-- onchange="exteTime(this)" -->
                  	</div>
                  	<label  class="col-xs-3 rowlabel"><b><spring:message code='周期'/></b></label>
                  	<div class="col-xs-3">
                    	<input type="text" class="form-control" id="cycle2" readonly="readonly" lay-verify="required">
                    	<input name="cycle" id="cycle" readonly="readonly" lay-verify="required" type='hidden'>
                  	</div>
                  	<label  class="col-xs-1 rowlabel" style="text-align: left;"><a href="javascript:;" onmouseover="overShowCycle()" onmouseout="outHideCycle()"><font color="red"><b>?</b></font></a></label>
                </div>
                
                <div id="showDivCycle" style="color:white;z-index: 999;display:none;position: absolute; background-color: #4169E1; border: 1px solid #4169E1;margin-left:50%;width:45%;text-align: center;border-radius:10px;padding:10px;"></div>
                
                <div class="row" id="cycleDiv" hidden=true style="margin-top:5px;">
                	<label  class="col-xs-2 rowlabel"></label>
                	<label id='spanDIV' hidden=true class="col-xs-9 rowlabel" style='text-align:left;color:red;'><b><spring:message code='由于项目翻译时间过短，平台提醒您项目只能以招标模式发布，您也可以联系客服，可能会更好的解决，客服电话：010-82893875'/></b></label>
                </div>
                
                <%-- <div class="row">
                	<label  class="col-xs-2 rowlabel"><b><font color="red">*</font><spring:message code='项目过期时间'/></b></label>
                  	<div class="col-xs-3">
                    	<input type="text" class="form-control" name="trueTime" id="trueTime" onblur="iscycle()" onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d'})" lay-verify="required"><!--  onchange="exteTime(this)" -->
                  	</div>
                  	<label  class="col-xs-1 rowlabel" style="text-align: left;"><a href="javascript:;" onmouseover="overShowTime()" onmouseout="outHideTime()"><font color="red"><b>?</b></font></a></label>
                  	<div id="showDivTime" style="color:white;z-index: 999;display:none;position: absolute; background-color: #4169E1; border: 1px solid #4169E1;margin-left:45%;width:45%;text-align: center;border-radius:10px;padding:10px;"></div>
                </div> --%>
                
                <%-- <div class="row">
                	<label  class="col-xs-2 rowlabel"><b><font color="red">*</font><spring:message code='现在发布'/></b></label>
                  	<div class="col-xs-9">
                    	<input type="radio" value="Y" title="YES" name="need" autocomplete="off" lay-verify="required" lay-filter="needpublish" checked="checked">
                    	<input type="radio" value="N" title="NO" name="need" autocomplete="off" lay-verify="required"  lay-filter="needpublish">
                  	</div>
                </div> --%>
                
                <div class="row">
                	<label  class="col-xs-2 rowlabel"><b><font color="red">*</font><spring:message code='上传附件'/></b></label>
                  	<div class="col-xs-3">
                    	<a id="btn_add1" style="margin-left:20px;" class="btn btn-primary"><spring:message code='添加'/></a>
                    	<a id="btn_del1" style="margin-left:20px;" class="btn btn-primary" onclick="del_1();"><spring:message code='删除'/></a>
                  	</div>
                  	<div class="col-xs-5">
                    	<a href="javascript:;" class="a-upload" id="file1" class="a-upload" >
    						<input type="file" name="filename" lay-verify="required"/><spring:message code='点击这里上传文件'/><!-- onchange="checkFile(this)" -->
						</a>
                  	</div>
                </div>
                
                <div style="width:100%" id="newUploadDiv"></div>
                
                <div class="row">
                	<label  class="col-xs-2 rowlabel"><b><font color="red">*</font><spring:message code='项目类型'/></b></label>
              		<div class="col-xs-3">
                    	<select class="form-control" lay-filter="projectTypeId" name="projectTypeId" id="projectTypeId" lay-verify="required">
		                  	<option value="5" ><spring:message code='全文翻译'/></option>
		                    <option value="1" >OA<spring:message code='翻译'/></option>
		                    <option value="2" ><spring:message code='部分全文翻译'/></option>
		                    <option value="3" ><spring:message code='摘要翻译'/></option>
		                    <option value="4" ><spring:message code='其他'/></option>
		            	</select>
                  	</div>
                </div>
                
                <div class="row">
               		<label  class="col-xs-2 rowlabel"><b><spring:message code='备注'/></b></label>
               		<div class="col-xs-9">
                    	<textarea rows="10" class="form-control layui-textarea" placeholder="<spring:message code='请输入备注信息'/>" name="description" id="description" autocomplete="off" lay-verify=""></textarea>
                  	</div>
            	</div>
                
                <c:if test="${transId==null || transId==''}">
                  <c:if test="${length==null}">
	                <div class="row">
	                	<label  class="col-xs-2 rowlabel"><b><font color="red">*</font><spring:message code='选择发布模式'/></b></label>
	                  	<div class="col-xs-6">
	                    	<%-- <button type="submit" class="form-control btn-info modeBtn" name="button" onclick="unsolicitedBid()"><spring:message code='招标模式'/></button>
	                    	<button type="submit" class="form-control btn-info modeBtn" id="submit_button" name="button" onclick="assignedModel(this)" ><spring:message code='系统分配模式'/></button>
	                    	<button type="button" class="form-control btn-info modeBtn" name="button" onclick="selectedTransModel()"><spring:message code='选定译员模式'/></button> --%>
	                  		<input id="tender" type="radio" name="submitModel" lay-filter="submitModel" value="1" title="<spring:message code='招标模式'/>" checked="">
	                  		<input id="systemDis" type="radio" name="submitModel" lay-filter="submitModel" value="2" title="<spring:message code='系统分配'/>">
	                  		<input id="selectInter" type="radio" name="submitModel" lay-filter="submitModel" value="3" onclick="selectedTransModel()" title="<spring:message code='选定译员'/>">
	                  	</div>
	                  	<label id="transCountLabel" class="col-xs-4 rowlabel" style="text-align:left;color:blue;display: none;"><spring:message code='符合条件的译员有'/><font color="red" id="transCountNum"></font><spring:message code='个'/></label>
	                </div>
	                
	                <div class="row" style="margin-top: 0px;">
	                	<label  class="col-xs-2 rowlabel"></label>
	                	<label id="systemPs"  class="col-xs-9 rowlabel" style="text-align: left;display: none"><font color="red"><spring:message code='注意：当系统分配模式时的符合条件的译员为0时，系统会向所有译员推送消息，不再根据所填条件进行限制！'/></font></label>
	                </div>
	               </c:if>
                </c:if>
                
                <c:if test="${transId==null || transId==''}">
                <c:if test="${length!=null}">
	                <div class="row">
	                	<label  class="col-xs-2 rowlabel"><b><font color="red">*</font><spring:message code='选择发布模式'/></b></label>
	                  	<div class="col-xs-9">
	                    	<%-- <button type="submit" class="form-control btn-info modeBtn" name="button" onclick="unsolicitedBid()"><spring:message code='招标模式'/></button>
	                    	<button type="submit" class="form-control btn-info modeBtn" id="submit_button" name="button" onclick="assignedModel(this)" ><spring:message code='系统分配模式'/></button>
	                    	<button type="button" class="form-control btn-info modeBtn" name="button" onclick="selectedTransModel()"><spring:message code='选定译员模式'/></button> --%>
	                  		<input id="tender" type="radio" name="submitModel" lay-filter="submitModel" value="1" title="<spring:message code='招标模式'/>" >
	                  		<input id="systemDis" type="radio" name="submitModel" lay-filter="submitModel" value="2" title="<spring:message code='系统分配'/>">
	                  		<input id="selectInter" type="radio" name="submitModel" lay-filter="submitModel" value="3"  checked="" title="<spring:message code='选定译员'/>">
	                  	</div>
	                </div>
	                </c:if>
                </c:if>
                
                <input type="hidden" name="selected" id="selectedModel" value="">
                
                <c:if test="${clientid.userType != 2 }">
                	<div class="row" id='ddd' style="margin-top: 5px">
	                	<label  class='col-xs-2 rowlabel'><b><font color="red">*</font><spring:message code='价格'/></b></label>
				        <div class='col-xs-3'>
				        	<input style='color:red;' class='form-control' type='text' name='moneyKilo' id='moneyKilo' lay-verify='required'>
				        	<label class="rowlabel" style="width:100%;"><a href="javascript:getSystomPayNum();" style="color: blue"><spring:message code='还原为推荐价格'/></a></label>
				        </div>
				        <label  class='col-xs-1 rowlabel' style="text-align: left;"><b><spring:message code='元'/>/<spring:message code='千字'/></b></label>
				        <label  class="col-xs-2 rowlabel"><b><spring:message code='项目总价格：￥'/></b></label>
	              		<div class="col-xs-3">
	              			<input style="color:red;" type="text" readonly="readonly" class="form-control" placeholder="<spring:message code='需支付金额'/>" name="totalMoney" id="totalMoney">
	                   	 	<input type="hidden" id="hiddenPayNum" >
	              		</div>
				        
	                	<%-- <label  class="col-xs-2 rowlabel"><b><spring:message code='每千字'/></b></label>
	                	<div class="col-xs-2"><input style="color:red;" class="form-control" type="text" name="moneyKilo" id="moneyKilo" lay-verify="required"></div>
	                	<label  class="col-xs-1 rowlabel" style="text-align: left;"><b><spring:message code='元'/></b></label>
	                	<label  class="col-xs-6 rowlabel"><b><spring:message code='您选择的译员有'/><span style="color:red;" id="transCount">0</span><spring:message code='位'/></span></b></label> --%>
	                </div>
	                
	                <div class="row" style="margin-top: 5px">
	                	<div class='col-xs-6'></div>
	               		<label id="dddlabel" class='col-xs-4 rowlabel'></label>
	              	</div>
                </c:if>
                
                <c:if test="${clientid.userType == 2 }">
                	<div class="row" style="margin-top: 5px">
                		<label  class='col-xs-2 rowlabel'><b><font color="red"><spring:message code='客户支付价格'/></font></b></label>
                	</div>
                	<div class="row" id='ddd' style="margin-top: 5px">
	                	<label  class='col-xs-2 rowlabel'><b><font color="red">*</font><spring:message code='价格'/></b></label>
				        <div class='col-xs-3'>
				        	<input style='color:red;' class='form-control' type='text' name='moneyKilo' id='moneyKilo' lay-verify='required'>
				        	<label class="rowlabel" style="width:100%;"><a href="javascript:getSystomPayNum();" style="color: blue"><spring:message code='还原为推荐价格'/></a></label>
				        </div>
				        <label  class='col-xs-1 rowlabel' style="text-align: left;"><b><spring:message code='元'/>/<spring:message code='每千字'/></b></label>
				        <label  class="col-xs-2 rowlabel"><b><spring:message code='客户支付总价：￥'/></b></label>
	              		<div class="col-xs-3">
	              			<input style="color:red;" type="text" readonly="readonly" class="form-control" placeholder="<spring:message code='需支付金额'/>" name="totalMoney" id="totalMoney">
	                   	 	<input type="hidden" id="hiddenPayNum" >
	              		</div>
	                </div>
	                
	              	<div class="row" style="margin-top: 5px">
                		<label  class='col-xs-2 rowlabel'><b><font color="red"><spring:message code='支付译员价格'/></font></b></label>
                	</div>
                	<div class="row" style="margin-top: 5px">
	                	<label  class='col-xs-2 rowlabel'><b><font color="red">*</font><spring:message code='价格'/></b></label>
				        <div class='col-xs-3'>
				        	<input style='color:red;' class='form-control' type='text' name='transSingle' id='transSingle' onchange="transTotalC()" lay-verify='required'>
				        </div>
				        <label  class='col-xs-1 rowlabel' style="text-align: left;"><b><spring:message code='元'/>/<spring:message code='千字'/></b></label>
				        <label  class="col-xs-2 rowlabel"><b><spring:message code='支付译员总价：￥'/></b></label>
	              		<div class="col-xs-3">
	              			<input style="color:red;" type="text" readonly="readonly" class="form-control" placeholder="<spring:message code='支付译员金额'/>" name="transTotal" id="transTotal">
	              		</div>
	                </div>
	                
	                <div class="row">
	                	<div class="col-xs-6"></div>
	                	<label id="dddlabel" class='col-xs-4 rowlabel'></label>
	                </div>
	                
                </c:if>
                
                
                <div id="hiddenDiv" style="display: none;width: 100%;">
	                <div class="row">
	               	 	<div class="col-xs-1"></div>
	                	<div class="col-xs-11" style="text-align: center;" id="transDiv"></div>
	                </div>
	                
	                <div class="row">
	                	<label  class="col-xs-7 rowlabel"></label>
	                	<c:if test="${length==null}">
	                	<div class="col-xs-3" style="text-align: right;">
	                		<button type='button' class='btn btn-primary' name='button' onclick="selectedTransModel()"><spring:message code='换一批'/></button>
	                	</div>
	                	</c:if>
	                	<div class="col-xs-1">
	                		<button type='submit' class='btn btn-primary' name='button' id="publish" lay-filter="demo1" lay-submit=""><spring:message code='确认'/></button>
	                	</div>
	                </div>
                </div>
                
                <div class="row" id="nextStep">
                	<label  class="col-xs-10 rowlabel"></label>
                	<c:if test="${length==null}">
                  	<div class="col-xs-2">
                  		<button type="submit" id="nextStepBtn" style="width:100px;" class="btn btn-primary" name="button" onclick="" lay-filter="demo1" lay-submit=""><spring:message code='下一步'/></button>
                  	</div>
                   </c:if>
                </div>
                
                <c:if test="${transId!=null && transId !='' }">
                   <c:if test="${length==null }">
                	<input name="checkTrans" value="${transId }" type="hidden">
                	</c:if>
                	<c:if test="${length==null }">
                	<input name="checkTrans" value="${tranCard.id}" type="hidden">
                	</c:if>
                	<div class="col-sm-2" style="width:18%;">
                   		 <span><spring:message code='模式已选定为：'/></span><button type="button" class="form-control btn-info" ><spring:message code='选定译员模式'/></button>
                   		 <input name="selected" value="选定译员模式" type="hidden">
                  	</div>
                  	 <button type='submit' class='form-control btn-info' name='button' id="publish" lay-filter="demo1" lay-submit="" style="width: 30%"><spring:message code='确认'/></button>
                	<!-- <input name="selected" value="译员选中模式" type="hidden"> -->
                </c:if>
                
        	</div>
              	  
               
              
                
              <!--  <div class="form-group publish_contents_div">
                <div class="row">
                  <h5 class="col-sm-1 control-label">是否加急</h5>
                  <div class="col-sm-3">
                    <select class="form-control" name="cycle" lay-verify="required">
                      	<option value="特急">特急</option>
                      	<option value="加急">加急</option>
                      	<option value="一般">一般</option>
                    </select>
                  </div>
                </div>
              </div> -->
              
              <%-- <div class="publish_contents_div">
               <!--  <h5 class="control-label" style="margin-bottom:15px;">留下您的手机号,以便更好的为您服务</h5>
                <div class="form-group row" style="margin-bottom:15px;">
                  <label for="needtel" class="col-sm-1 control-label text_label"><span style="color:red;height:34px;line-height:34px">*</span>手机号</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" id="needtel" name="tel" autocomplete="off" lay-verify="required|number|phone">
                  </div>
                  <span style="color:red;height:34px;line-height:34px">必填</span>
                </div>
                <div class="form-group row">
                  <label for="needqq" class="col-sm-1 control-label text_label">QQ</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" id="needqq" name="qq" autocomplete="off" lay-verify="required|number">
                  </div>
                </div> -->
              </div>
			   <div class="publish_contents_div">
			     <h5 class="control-lalbel" style="display:inline-block;margin-bottom:15px;"><spring:message code='上传附件'/></h5>
			     <div class="form-group row">
                  <!-- <label for="needqq" class="col-sm-1 control-label text_label">附件1：</label> -->
                  <div id="newUpload1" style="width: 300px">
                  	<a id="btn_add1" class="btn btn-primary marR10"><spring:message code='添加'/></a>
			    	<a id="btn_del1" class="btn btn-primary marR10" onclick="del_1();"><spring:message code='删除'/></a><br>
                    <!-- <input type="file" name="filename" id="file1" lay-ext="doc|txt|docx|jpg" lay-type="file" lay-title="请上传文件" class="layui-upload-file">       -->
                    <a href="javascript:;" class="a-upload" id="file1" class="a-upload" >
    					<input type="file" name="filename" onclick="checkFile(this)" lay-verify="required" /><spring:message code='点击这里上传文件'/>
					</a><br><br>
                    
                    <!-- <input type="file" id="file1" name="filename" class="a-upload"/> -->
                  </div>
                 </div>
			   </div> --%>
			   <%-- <div class="publish_contents_div" id="model">
               <!--  <h5 class="control-label" style="display:inline-block;margin-bottom:15px;">明确需求标题和详情</h5> -->
               <!--  <span style="padding-left:30px;">参照发布实例</span> -->
                
               
                <c:if test="${transId!=null && transId !='' }">
                	<input name="checkTrans" value="${transId }" type="hidden">
                	<div class="col-sm-2" style="width:18%;">
                   		 <span><spring:message code='模式已选定为：'/></span><button type="button" class="form-control btn-info" ><spring:message code='选定译员模式'/></button>
                   		 <input name="selected" value="选定译员模式" type="hidden">
                  	</div>
                  	 <button type='submit' class='form-control btn-info' name='button' id="publish" lay-filter="demo1" lay-submit="" style="width: 30%"><spring:message code='确认'/></button>
                	<!-- <input name="selected" value="译员选中模式" type="hidden"> -->
                </c:if>
                <c:if test="${transId==null || transId=='' }">
                <div class="form-group row">
                 <!--  <div class="col-sm-5">
                    <input type="text" class="form-control" placeholder="请输入需求名称" name="description">
                  </div> -->
                  <div class="col-sm-2" style="width:18%;">
                    <button type="submit" class="form-control btn-info" name="button" onclick="unsolicitedBid()"><spring:message code='招标模式'/></button>
                  </div>
                 
                  <div class="col-sm-2" style="width:18%;">
                    <button type="submit" class="form-control btn-info" id="submit_button" name="button" onclick="assignedModel(this)" ><spring:message code='系统分配模式'/></button>
                  </div>
                  <div class="col-sm-2" style="width:18%;">
                    <button type="button" class="form-control btn-info" name="button" onclick="selectedTransModel()"><spring:message code='选定译员模式'/></button>
                  </div>
                </div>
                </c:if>
              </div> --%>
             <%--  <div id="hiddenDiv" style="display: none;">
               <div id="transDiv" >
                <h5 class="control-label" style="display:inline-block;margin-bottom:15px;"><spring:message code='您选择的译员有'/></h5>
				<span style="padding-left:30px;" id="parentCount"><spring:message code='您共选择译员'/><span id="transCount">0</span><spring:message code='位'/></span>
               </div>
 			   <div style="margin-left:50%;margin: ">
 			     <button type='button' class='form-control btn-info' name='button' onclick="selectedTransModel()" style="width: 30%"><spring:message code='换一批'/></button><br><br>
   			   	 <button type='submit' class='form-control btn-info' name='button' id="publish" lay-filter="demo1" lay-submit="" style="width: 30%"><spring:message code='确认'/></button>
 			   </div>
    		</div> --%>
            </form>
          </div>
          
          <div class="publish_contents_right col-sm-3">
            <!-- 热门需求  开始 -->
            <div class="hot_needs">
              <h4><spring:message code='发布模式简介'/></h4>

              <div class="hot_needs_cards">
                <h5><a href="#"><spring:message code='招标模式'/></a></h5>
                <p><spring:message code='点击“招标模式”按钮,进行主动投标模式项目的发布,此模式的项目需要译员主动上平台招标项目展示模块查找并接受该任务,在有满足项目需求的译员主动接受该项目是客户该项目会形成对应的订单。'/></p>
                <%-- <p class="hot_cards_text"><spring:message code='需要翻译的原文：中国自行车联赛组委会与各举办地共同举行盛大赛事'/></p>
                <p class="hot_text_weight"><spring:message code='价格：'/><span>500</span></p> --%>
              </div>
              <div class="hot_needs_cards">
                <h5><a href="#"><spring:message code='系统分配模式'/></a></h5>
                <p><spring:message code='点击“系统分配”按钮，进行系统分配模式项目的发布。选择此模式会针对满足项目需求的所有译员以短信通知的方式进行分批推送，在任何一个译员接受了请求之后则订单形成，平台同时停止推送。'/></p>
                <%-- <p class="hot_cards_text"><spring:message code='需要翻译的原文：中国自行车联赛组委会与各举办地共同举行盛大赛事'/></p>
                <p class="hot_text_weight"><spring:message code='价格：'/><span>500</span></p> --%>
              </div>
              <div class="hot_needs_cards">
                <h5><a href="#"><spring:message code='选定译员模式'/></a></h5>
                <p><spring:message code='点击“选定译员”按钮，进行选定译员模式项目的发布。选择此模式客户必须在平台已注册译员中选择一位或多位译员，针对发布项目,平台同时以短信方式通知各位译员，若某一个译员接受该项目则形成相应的订单。'/></p>
                <%-- <p class="hot_cards_text"><spring:message code='需要翻译的原文：中国自行车联赛组委会与各举办地共同举行盛大赛事'/></p>
                <p class="hot_text_weight"><spring:message code='价格：'/><span>500</span></p> --%>
              </div>
            </div>
            <!--  热门需求结束  -->
           <!--  <div class="hot_advert">
              <img src="http://via.placeholder.com/270x140" alt="">
            </div>
 -->
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
    var singlePrice = 0;
    var lastLanguage = "汉英";
    var lastDomain = "12";
    var lastLevel = "3";
    var lastProcedure = "1";
    var domainName="<spring:message code='日常'/>";
    var write="";
    var lastProcedureName="";
    function getValueByTitle(elem){
    	write=elem.value;
    	var num=0;
    	if(lastProcedure==1 || lastProcedure=='1'){
			num=3;
		}
		if(lastProcedure==2 || lastProcedure=='2'){
			num=5;	
		}
		if(lastProcedure==3 || lastProcedure=='3'){
			num=8;
		}
		
		write=write.substring(write.indexOf(lastProcedureName)+num);
    }
    
    
  //编辑项目标题
    function getTitle(){
    	var title="";
    	
    	if(lastLanguage!=null && lastLanguage!=''){
    		if(lastLanguage=="英汉"){
    			lastLanguage="<spring:message code='英汉'/>"
			}else if(lastLanguage=="汉英"){
				lastLanguage="<spring:message code='汉英'/>"
			}else if(lastLanguage=="日汉"){
				lastLanguage="<spring:message code='日汉'/>"
			}else if(lastLanguage=="汉日"){
				lastLanguage="<spring:message code='汉日'/>"
			}else if(lastLanguage=="韩汉"){
				lastLanguage="<spring:message code='韩汉'/>"
			}else if(lastLanguage=="汉韩"){
				lastLanguage="<spring:message code='汉韩'/>"
			}else if(lastLanguage=="德汉"){
				lastLanguage="<spring:message code='德汉'/>"
			}else if(lastLanguage=="汉德"){
				lastLanguage="<spring:message code='汉德'/>"
			}else if(lastLanguage=="法汉"){
				lastLanguage="<spring:message code='法汉'/>"
			}else if(lastLanguage=="汉法"){
				lastLanguage="<spring:message code='汉法'/>"
			}
    		
    		
    		title+=lastLanguage;
    	}
    	if(domainName!=null &&domainName!=''){
    		title+="-"+domainName;
    	}
    	if(lastProcedure!=null && lastProcedure!=''){
    		if(lastProcedure==1 || lastProcedure=='1'){
    			lastProcedureName="<spring:message code='仅翻译'/>";
    		}
    		if(lastProcedure==2 || lastProcedure=='2'){
    			lastProcedureName="<spring:message code='翻译+校对'/>";
    		}
    		if(lastProcedure==3 || lastProcedure=='3'){
    			lastProcedureName="<spring:message code='翻译+校对+审核'/>";
    		}
    		
    		title+="-"+lastProcedureName;
    	}
     	$("#title").val(title+write);
    }
    
    $(function(){
      if('${languagePair}'!=null && '${languagePair}'!=''){
    	  $("#title").val('${languagePair}'+"-"+'${domain}'+"-"+'${procedure}');
      }else{
    	  getTitle();
      }
      bsStep(1);//bsStep(i) i 为number 可定位到第几步 如bsStep(2)/bsStep(3)	
      
      $("#moneyKilo").change(function (){
    	  if("${clientid.userType}"+"" != "2"){
    		  var url = "/cilentCustomer/getTotalPrice.do";
    		  var count = $("#moneyKilo").val();
    		  count = parseFloat(count);
    		  /* singlePrice = parseFloat(parseFloat); */
    		  var modelElms = document.getElementsByName("submitModel");
    		  var modelVal;
    		  for(var i = 0; i < modelElms.length; i++){
    			  if(modelElms[i].checked == true){
    				  modelVal = modelElms[i].value;
    			  }
    		  }
    		  if(modelVal != 1 && count < singlePrice){
    			  layer.alert("<spring:message code='该模式价格不得小于'/> <font color='red'>"+singlePrice+"</font> <spring:message code='元'/>/<spring:message code='每千字！'/>");
    			  $("#moneyKilo").val(singlePrice);
    		  }else{
    			  var length = $("#length").val();
    			  if(count != null && count != '' && length != null && length != ''){
    				  var totalPrice = $.post(url,"length="+length+"&count="+count,function(data){
    					  if(data > 0){
    						  $("#totalMoney").val(data);
    					  }
    				  });
    			  }else{
    				  $("#totalMoney").val("");
    			  }
    		  }
    		  
    		  if(modelVal==1 || modelVal=='1'){
    			  var kilo=$("#moneyKilo").val();
    			  if(count<=0){
    				  layer.alert("<spring:message code='项目价格必须大于0元'/>");
    				  $("#moneyKilo").val("");
    			  }
    			  
    		  }
    	  }else{
    		  var url = "/cilentCustomer/getTotalPrice.do";
    		  var count = $("#moneyKilo").val();
    		  count = parseFloat(count);
    		  var length = $("#length").val();
			  if(count != null && count != '' && length != null && length != ''){
				  var totalPrice = $.post(url,"length="+length+"&count="+count,function(data){
					  if(data > 0){
						  $("#totalMoney").val(data);
					  }
				  });
			  }else{
				  $("#totalMoney").val("");
			  }
    	  }
	  });
	  
	  $("#length").change(function (){
		  var url = "/cilentCustomer/getTotalPrice.do";
		  var count = $("#moneyKilo").val();
		  var length = $("#length").val();
		  if(count != null && count != '' && length != null && length != ''){
			  var totalPrice = $.post(url,"length="+length+"&count="+count,function(data){
				  if(data > 0){
					  $("#totalMoney").val(data);
				  }
			  });
		  }else{
			  $("#totalMoney").val("");
		  }
	  });
    })
        	 
	//表单验证
	layui.use(['form', 'layedit', 'laydate'], function(){  
	      var form = layui.form()  
	      ,layer = layui.layer  
	      ,layedit = layui.layedit  
	      ,laydate = layui.laydate;  
	     // form.render();
	      //自定义验证规则  
	      form.verify({  
	            title: function(value){  
	              if((value.length < 1) && (value.length>21)){  
	                return '<spring:message code="标题至少得1个字符最多20字符"/>';  
	              }  
	            } /* , description: function(value){  
	              if(value.length < 10){  
	                return '详情不能少于10个字符';  
	              }  
	            } */, length: function(value){  
	              if(value< 1){  
	                return '<spring:message code="翻译总数不能小于1"/>';  
	              }  
	            }  
	           /*  ,phone: [/^1[3|4|5|7|8]\d{9}$/, '手机必须11位，只能是数字！']  
	            ,email: [/^[a-z0-9._%-]+@([a-z0-9-]+\.)+[a-z]{2,4}$|^1[3|4|5|7|8]\d{9}$/, '邮箱格式不对']    */
	      });  
	        
	      //创建一个编辑器  
	      layedit.build('LAY_demo_editor'); 
	      
	      //模式监听
	      form.on('radio(submitModel)', function(data){
				console.log(data.elem); //得到radio原始DOM对象
				console.log(data.value); //被点击的radio的value值
				$("#transCount").html(0);
				$("#selectedModel").val("");
				var parentDIV=document.getElementById("transDiv");
			  	var chilDIV=document.getElementsByName("append_cardId");
			  	//var chillength=parentDIV.childNodes.length;
			  	//alert(chillength);
			  	//alert(chilDIV.length);
			  	var selectModel=document.getElementById("selectedModel");
			  	if(parentDIV&&chilDIV&&selectModel){
			  		for(var a=0;a<chilDIV.length;){
			  			//alert(chilDIV[2]);
			  			parentDIV.removeChild(chilDIV[a]);
			  			//alert(chilDIV.length);
			  	}
			  		
			  		/* document.getElementById("hiddenDiv").style.visibility="hidden";//隐藏 */
			  	}
				if(data.value == '3'){
					selectedTransModel();
				}else{
					singleMoney();
					//移除原来的每千字表框
	  				$("#dddlabel").empty();
			  		$("#hiddenDiv").css('display','none');
					$("#nextStep").css('display','block');
					$("#nextStepBtn").html("<spring:message code='下一步'/>");
				}
				if(data.value != '2'){
					$("#transCountLabel").css("display","none");
					$("#systemPs").css("display","none");
				}else{
					getCountTrans();
				}
				if(data.value == '1'){
					$("#level1").attr("disabled", false);
					$("#level2").attr("disabled", false);
					form.render();
				}else{
					if($("#level").val() == '1' || $("#level").val() == '2'){
						$("#level").val('3');
					}
					$("#level1").attr("disabled", true);
					$("#level2").attr("disabled", true);
					form.render();
				}
			}) ;
	      
	      //语言监听
	      form.on('radio(translang)', function(data){
				console.log(data.elem); //得到radio原始DOM对象
				console.log(data.value); //被点击的radio的value值
				var modelElms = document.getElementsByName("submitModel");
				var modelVal;
				for(var i = 0; i < modelElms.length; i++){
					if(modelElms[i].checked == true){
						modelVal = modelElms[i].value;
					}
				}
				if(modelVal == 3){
					if(data.value != lastLanguage){
						cleanInter();
						selectedTransModel();
					}
				}else if(modelVal == 2){
					getCountTrans();
				}
				lastLanguage = data.value;
				singleMoney();
				getTitle();
			}) ;
	      
	    //领域监听
	      form.on('radio(domains)', function(data){
				console.log(data.elem); //得到radio原始DOM对象
				console.log(data.value); //被点击的radio的value值
				var modelElms = document.getElementsByName("submitModel");
				var modelVal;
				for(var i = 0; i < modelElms.length; i++){
					if(modelElms[i].checked == true){
						modelVal = modelElms[i].value;
					}
				}
				domainName=data.elem.title;
				if(modelVal == 3){
					if(data.value != lastDomain){
						lastDomain = data.value;
						
						cleanInter();
						selectedTransModel();
					}
				}else if(modelVal == 2){
					getCountTrans();
				}
				singleMoney();
				getTitle();
			}) ;
	    
	    //译员等级监听
	      form.on('select(level)', function(data){
				console.log(data.elem); //得到radio原始DOM对象
				console.log(data.value); //被点击的radio的value值
				var modelElms = document.getElementsByName("submitModel");
				var modelVal;
				for(var i = 0; i < modelElms.length; i++){
					if(modelElms[i].checked == true){
						modelVal = modelElms[i].value;
					}
				}
				if(modelVal == 3){
					if(data.value != lastLevel){
						cleanInter();
						selectedTransModel();
					}
				}else if(modelVal == 2){
					getCountTrans();
				}
				lastLevel = data.value;
				singleMoney();
			}) ;
	    
	    //流程监听
	      form.on('select(procedureType)', function(data){
				console.log(data.elem); //得到radio原始DOM对象
				console.log(data.value); //被点击的radio的value值
				var modelElms = document.getElementsByName("submitModel");
				var modelVal;
				for(var i = 0; i < modelElms.length; i++){
					if(modelElms[i].checked == true){
						modelVal = modelElms[i].value;
					}
				}
				if(modelVal == 3){
					if(data.value != lastProcedure){
						cleanInter();
						selectedTransModel();
					}
				}else if(modelVal == 2){
					getCountTrans();
				}
				lastProcedure = data.value;
				singleMoney();
				getTitle();
			}) ;
	    
	    
	     /* //翻译总字数监听
	      form.on('text(length)', function(data){
				console.log(data.elem); //得到radio原始DOM对象
				console.log(data.value); //被点击的radio的value值
				sumtp();
			}) ; */
	       
	   	  //radio监听
	     /*  form.on('radio(needpublish)', function(data){
	    	  console.log(data.elem); //得到radio原始DOM对象
	    	  console.log(data.value); //被点击的radio的value值
	    	  //alert(data.value);
	    	  if(data.value=='Y'){
	    		  //对比余额
	    		  if("${clientid.balance}"<=0){
	    			  alert("余额不够，请充值,否则无法发布！");
	    		  }
	    	  }
	    	});   */
	      
	      //监听提交  
	      form.on('submit(demo1)', function(data){ 	    	 
	    	  params = data.field;
		      submit($,params);
		    	}); 
	        //return false;  
	        
	      form.render(); //更新全部
	    })
	    
	    //删除file插件
  		function del_1(){  
  		    	var odel=document.getElementById("newUploadDiv");
  		    	   var ofile=odel.lastElementChild;
  		    	   var name="";
  		    	   name = ofile.getAttribute("id");
  		    	   if(name=='file1'){
  		    		   document.getElementById("btn_del1").setAttribute("disabled","true");
  		    	   }else{
  		    		   odel.removeChild(ofile);
  		    	   }
  		       }
    
  //选定模式下根据条件查找译员
		function selectedTransModel(){
	  		$("#nextStepBtn").html("loading...");
	  		loadDiv("加载中...");
	  		Position();
	  		LayerShow("加载中...");
			var cycleValue=document.getElementById("cycle").value;
			if("特急+"==cycleValue){
				LayerHide();
				cleanInter();
				layer.alert('<spring:message code="由于项目翻译时间过短，平台提醒您项目只能以招标模式发布，您也可以联系客服，可能会更好的解决，客服电话：010-82893875"/>', {
					icon: 5,
					title: "<spring:message code='提示'/>"
					});
				//$(this).prop("id","");
				//return false;
			}else{
			/* var selectedModel="<input type='hidden' name='selected' value='选定译员模式' id='selectedModel'>"; */
			$("#selectedModel").val("选定译员模式");
			
			//周期
			var cycle=document.getElementById("cycle").value;
			//加急天数
			var addTime=0;
			/* if("特急+"==cycle){
				addTime=document.getElementById("addTime").value;
			} */
			
			//翻译字数
			var length = document.getElementById("length").value;
			
			//根据流程查找译员
			var procedureType=document.getElementById("procedureType").value;
			
			
			//获取译员语言
			var languagePair=document.getElementsByName("languagePair");
			var transLanguage="";
			for(var i=0;i<languagePair.length;i++){
				if(languagePair[i].checked){
					transLanguage=languagePair[i].value;
				}
			}
			
			//获取译员翻译领域
			var domain=document.getElementsByName("domain");
			var transDomain="";
			for(var i=0;i<domain.length;i++){
				if(domain[i].checked){
					transDomain=domain[i].value;
				}
			}
			
			//获取译员等级
			var level=document.getElementById("level").value;
			//跳转路径
			var url="/translator/findByWhere.do";
			
			   /*  $.ajax({
			    	url : url,
			    	async : false,
			    	type : "POST",
			    	dataType : "json",
			    	data : {
			    		transLanguage : transLanguage,
			    		transDomain : transDomain,
			    		level : level,
			    		procedureType : procedureType,
			    		length : length,
			    		cycle : cycle,
			    		time : addTime
			    	},
			    	success : function(data){
						
						$("#moneyKilo").val(""+data[2]);
						
						$("#ddd").css('display','block');
						$("#nextStep").css('display','none');
						
						//旧Div，类型list
						var append_cardId=document.getElementsByName("append_cardId");
						//外围Div
						var parentDiv=document.getElementById("transDiv");
						//被选中的Div 类型list
						var checkTrans=document.getElementsByName("checkTrans");
						var checkCount=0;
						for(var i=0;i<checkTrans.length;){
							if(!(checkTrans[i].checked)){
								//alert("bu被选中");
								parentDiv.removeChild(append_cardId[i]);
							}else{
								//alert("xuanzhong");
								i++;
								checkCount=checkCount+1;
							}
						}
						if(data[1]>0){
							var procedureType=document.getElementById("procedureType").value;
							if((6-checkCount)>0){
								for(var i=0;i<(6-checkCount);i++){
									if(i<data[1]){
										var title="";
										if('1'==procedureType){
											title=data[0][i].tranPrice;
										}
										if('2'==procedureType){
											title=data[0][i].prooPrice;					
																}
										if('3'==procedureType){
											title=data[0][i].auditPrice;
										}
										if(level == 3){
									    	starlevel = "<font size='4px' color='green'><b>★★★</b></font>"
									    }
									    if(level == 4){
									    	starlevel = "<font size='4px' color='	#FFBB00'><b>★★★★</b></font>"
									    }
									    if(level == 5){
									    	starlevel = "<font size='4px' color='	#FF0000'><b>★★★★★</b></font>"
									    }
										var cards_one = "<div class='append_card' name='append_cardId'>"+
									    "<div class='cards_one text-right fl' style='padding:0px;padding-left:10px;height:310px;'>"+
									    "<input name='checkTrans' id='"+data[0][i].id+"' type='checkbox' title='"+title+"' onclick='transKilo("+data[0][i].tranPrice+","+data[0][i].prooPrice+","+data[0][i].auditPrice+","+data[2]+")' value='"+data[0][i].id+"' style='display: block;' >"+
									    "<p style='width:165px;margin-left:20px;text-align: left;'>"+"<span style='width:165px;' class='card_name' id='nickname'><font color='#000088'>"+data[0][i].nickname+"</font></span>"+"</p>"+
									    "<img class='card_img' src='userUrl' alt='' width='80px' height='100px' >"+"<br>"+
									    "<p hidden=''>"+"<span id='transId'>"+"</span>"+data[0][i].id+"</p>"+"<p>"+
									    "<span id='level'>"+starlevel+"</span>"+"</p>"+"<p>"+
									    "<span id='languages'>"+transLanguage+"</span>"+"</p>"+"<p>"+
									    "<span id='degree'>"+data[0][i].degree+"</span>"+"</p>"+
									    "<div class='texts_left'>"+
									    "<p>"+"<spring:message  code='专业领域：'/>"+"<span id='trandomain'>"+transDomain+"</span>"+"</p>"+
									    "<p>"+"<spring:message  code='翻译经验：'/>"+"<span>"+data[0][i].tranExperience+"</span>"+"</p>"+
									    "<p>"+"<spring:message  code='校对经验：'/>"+"<span>"+data[0].prooExperience+"</span>"+"</p>"+
									    "</div>"+"<div class='append_card_btn'>"+
									    "<a href='javascript:checked("+data[0][i].id+","+data[0][i].tranPrice+","+data[0][i].prooPrice+","+data[0][i].auditPrice+","+data[2]+")' class='append_card_btn01' id='selectIt'><span><spring:message code='选'/>TA</span></a>"+
									    "<a href='/translator/translatorAction_findTransById.do?transId="+data[0][i].id+"' class='append_card_btn02' id='lookTrans' >"+"详情"+"</a>"+"</div>"+
									    "</div>"+
									    "</div>";
									$("#transDiv").append(cards_one);
									}
									
									}
							}
							
							
							$("#hiddenDiv").show();
						}else{
							selectedModel="<input type='hidden' name='selected' value='主动投标模式' id='selectedModel'>";
							layer.open({
								  content: '<spring:message code="暂时没找到符合条件的译员，建议改为译员主动投标模式？"/>'
								  ,btn: ['<spring:message code="确定"/>', '<spring:message code="取消"/>']
								  ,btn1: function(index, layero){
								    //按钮【按钮一】的回调
								    layer.close(index);
								    $("#hiddenDiv").hide();
								    
								  }
								  ,btn2: function(index, layero){
								    //按钮【按钮二】的回调
								    layer.close(index);
								    $("#hiddenDiv").hide();
								   // 
								    
								    //return false 开启该代码可禁止点击该按钮关闭
								  }
								  ,cancel: function(){ 
								    //右上角关闭回调
								    layer.close(index);
								    $("#hiddenDiv").hide();
								   // 
								    //return false 开启该代码可禁止点击该按钮关闭
								  }
								});
						}
					  },
					  error : function(){
						  if($("#length").val() == null || isInteger($("#length").val()) == false || $("#length").val() == ''){
							  layer.alert("请正确填写上述信息！");
						  }else{
							  layer.alert("数据请求失败！");
						  }
						  $("#nextStepBtn").html("下一步");
					  }
			    }); */
			    $.post(url,"transLanguage="+transLanguage+"&transDomain="+transDomain+"&level="+level+"&procedureType="+procedureType+"&length="+length+"&cycle="+cycle+"&time"+addTime,function(data){
			    
			    		var ddd = "<b><spring:message code='您选择的译员有'/><span style='color:red;' id='transCount'>0</span><spring:message code='位'/></span></b>";
						
			    		$("#dddlabel").empty();
			            $("#dddlabel").append(ddd);
	            
				$("#moneyKilo").val(""+data[2]);
				singlePrice = data[2];
				/* singlePrice = parseFloat(parseFloat); */
				
				$("#nextStep").css('display','none');
				
				//旧Div，类型list
				var append_cardId=document.getElementsByName("append_cardId");
				//外围Div
				var parentDiv=document.getElementById("transDiv");
				//被选中的Div 类型list
				var checkTrans=document.getElementsByName("checkTrans");
				var checkTransValue="";
				var checkCount=0;
				for(var i=0;i<checkTrans.length;){
					if(!(checkTrans[i].checked)){
						parentDiv.removeChild(append_cardId[i]);
					}else{
						checkCount=checkCount+1;
						checkTransValue=checkTransValue+checkTrans[i].value+",";//存储被选中译员Id
						i++;
					}
				}
				
				if(data[1]>0){
					var procedureType=document.getElementById("procedureType").value;
					if((6-checkCount)>0){
						for(var i=0;i<(6-checkCount);i++){
							if(i<data[1]){
								
								//对比是否有被选中的译员，如果有被选中的译员，则不再连接卡片，若没有，连接卡片
								var isCheckCard=true;//默认是没有
								var arryTransId=new Array();
								arryTransId=checkTransValue.split(","); 
								for(var n=0;n<arryTransId.length-1;n++){
									//alert(arryTransId[n]+","+data[0][i].id);
									if(arryTransId[n]==data[0][i].id){
										isCheckCard=false;//有
									} 
										
								} 
								if(isCheckCard){
									var title="";
									var Transerprice;
									var tranlevels=0;//等级
									if('1'==procedureType || procedureType == 1){
										title=data[0][i].tranPrice;
										tranlevels=data[0][i].tranlevels;
									}
									if('2'==procedureType || procedureType == 2){
										title=data[0][i].prooPrice;		
										tranlevels=data[0][i].proolevels;
															}
									if('3'==procedureType || procedureType == 3){
										title=data[0][i].auditPrice;
										tranlevels=data[0][i].auditlevels;
									}
									if(tranlevels == 3){
								    	starlevel = "<font size='4px' color='green'><b>★★★</b></font>"
								    }
								    if(tranlevels == 4){
								    	starlevel = "<font size='4px' color='	#FFBB00'><b>★★★★</b></font>"
								    }
								    if(tranlevels == 5){
								    	starlevel = "<font size='4px' color='	#FF0000'><b>★★★★★</b></font>"
								    }
								   
								    
								 	//语言
								    var languageCard="";
								    if(data[0][i].languages=="英汉"){
								    	languageCard="<spring:message code='英汉'/>"
									}else if(data[0][i].languages=="汉英"){
										languageCard="<spring:message code='汉英'/>"
									}else if(data[0][i].languages=="日汉"){
										languageCard="<spring:message code='日汉'/>"
									}else if(data[0][i].languages=="汉日"){
										languageCard="<spring:message code='汉日'/>"
									}else if(data[0][i].languages=="韩汉"){
										languageCard="<spring:message code='韩汉'/>"
									}else if(data[0][i].languages=="汉韩"){
										languageCard="<spring:message code='汉韩'/>"
									}else if(data[0][i].languages=="德汉"){
										languageCard="<spring:message code='德汉'/>"
									}else if(data[0][i].languages=="汉德"){
										languageCard="<spring:message code='汉德'/>"
									}else if(data[0][i].languages=="法汉"){
										languageCard="<spring:message code='法汉'/>"
									}else if(data[0][i].languages=="汉法"){
										languageCard="<spring:message code='汉法'/>"
									}
								    
								    
								    //专业
									var degree="";
									if(data[0][i].degree=="大专"){
										degree="<spring:message code='大专'/>"
									}else if(data[0][i].degree=="本科"){
										degree="<spring:message code='本科'/>"
									}else if(data[0][i].degree=="研究生"){
										degree="<spring:message code='研究生'/>"
									}else if(data[0][i].degree=="硕士"){
										degree="<spring:message code='硕士'/>"
									}else if(data[0][i].degree=="博士"){
										degree="<spring:message code='博士'/>"
									} 
								    
									//领域
									var domainCardString=domainName;
									var domainCard=new Array();
									
									/* if(data[0][i].languages==""){
										domainCard
									} */
									
									/* if(data[0][i].domain!=null && data[0][i].domain!=''){
										domainCard=data[0][i].domain.split(","); 
									}else {
										domainCardString="";
									}
									for(var n=0;n<domainCard.length;n++){
										if(n==domainCard.length-1){
											//n==domainCard.length-1   说明是最后一个领域，不需要加“，”
											domainCardString=domainCardString+"<spring:message code='"+domainCard[n]+"'/>";
										}else{
											domainCardString=domainCardString+"<spring:message code='"+domainCard[n]+"'/>"+"，";
										}
										
									}  */
									/* alert(domainCardString);
									domainCardString.length=domainCardString.length-2;//去掉最后的“，” 
									alert(domainCardString); */
									
								  //判断是否有对应的经验值 majorTotal+proofTotal
								    var majorTotal="";
								    var proofTotal="";
								    if(data[0][i].majorTotals!=null && data[0][i].majorTotals!=''){
								    	majorTotal="<span>"+data[0][i].majorTotals+"<spring:message code='字'/></span>"
								    }
								    if(data[0][i].prooTotal!=null && data[0][i].prooTotal!=''){
								    	proofTotal="<span>"+data[0][i].prooTotal+"<spring:message code='字'/></span>"
								    }
								    
								    
									var cards_one = "<div  class='append_card' name='append_cardId'>"+
								    "<div class='cards_one text-right fl "+data[0][i].id+"' style='padding:0px;padding-left:10px;height:310px;border-radius:10px;'>"+
								    "<input style='display:none' name='checkTrans' id='"+data[0][i].id+"' type='checkbox' lay-verify='required' title='"+title+"' onclick='transKilo("+data[0][i].tranPrice+","+data[0][i].prooPrice+","+data[0][i].auditPrice+","+data[2]+")' value='"+data[0][i].id+"' style='display: block;' >"+
								    "<label style='height:10px;width:70px;text-align:left;'><font color='red'>￥"+title+"</font></label>"+
								    "<p style='width:165px;margin-left:20px;text-align: left;'>"+"<span style='width:165px;' class='card_name' id='nickname'><font color='#000088'>"+data[0][i].nickname+"</font></span>"+"</p>"+
								    "<img class='card_img' src='userUrl' alt='' width='80px' height='100px' >"+"<br>"+
								    "<p hidden=''>"+"<span id='transId'>"+"</span>"+data[0][i].id+"</p>"+"<p>"+
								    "<span id='level'>"+starlevel+"</span>"+"</p>"+"<p>"+
								    "<span id='languages'>"+lastLanguage+"</span>"+"</p>"+"<p>"+
								    "<span id='degree'>"+degree+"</span></p>"+
								    "<div class='texts_left'>"+
								    "<p style='white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden; '>"+"<spring:message  code='专业领域：'/>"+"<span id='trandomain'>"+domainCardString+"</span>"+"</p>"+
								    "<p>"+"<spring:message  code='翻译经验：'/>"+majorTotal+"</p>"+
								    "<p>"+"<spring:message  code='校对经验：'/>"+proofTotal+"</p>"+
								    "</div>"+"<div class='append_card_btn'>"+
								    "<a href='javascript:checked("+data[0][i].id+","+data[0][i].tranPrice+","+data[0][i].prooPrice+","+data[0][i].auditPrice+","+data[2]+")' class='append_card_btn01' id='selectIt'><span><spring:message code='点此选定'/></span></a>"+
								    "<a href='/translator/translatorAction_findTransById.do?transId="+data[0][i].id+"' class='append_card_btn02' id='lookTrans' target='_blank'>"+"<spring:message code='详情'/>"+"</a>"+"</div>"+
								    "</div>"+
								    "</div>";
								$("#transDiv").append(cards_one);
								}
							}
							
							}
					}
					
					
					$("#hiddenDiv").show();
				}else{
					/* selectedModel="<input type='hidden' name='selected' value='主动投标模式' id='selectedModel'>"; */
					/* layer.open({
						  content: '<spring:message code="暂时没找到符合条件的译员，建议改为译员主动投标模式？"/>'
						  ,btn: ['<spring:message code="确定"/>', '<spring:message code="取消"/>']
						  ,btn1: function(index, layero){
						    //按钮【按钮一】的回调
						    layer.close(index);
						    $("#hiddenDiv").hide();
						    
						  }
						  ,btn2: function(index, layero){
						    //按钮【按钮二】的回调
						    layer.close(index);
						    $("#hiddenDiv").hide();
						   // 
						    
						    //return false 开启该代码可禁止点击该按钮关闭
						  }
						  ,cancel: function(){ 
						    //右上角关闭回调
						    layer.close(index);
						    $("#hiddenDiv").hide();
						   // 
						    //return false 开启该代码可禁止点击该按钮关闭
						  }
						}); */
					layer.alert('<spring:message code="暂时没找到符合条件的译员，建议改为招标模式"/>', {
		  				icon: 5,
		  				title: "<spring:message code='提示'/>"
		  				});
					cleanInter();
				}
				sumtp();
				LayerHide();
			  })
			  .error(function(){
				  LayerHide();
				  if($("#length").val() == null || isInteger($("#length").val()) == false || $("#length").val() == ''){
					  layer.alert("<spring:message code='请正确填写上述信息！'/>");
				  }else{
					  layer.alert("<spring:message code='数据请求失败！'/>");
				  }
				  $("#nextStepBtn").html("<spring:message code='下一步'/>");
			  });
		   }
  }
  
  
		function GetDateStr(AddDayCount) {  
		    var dd = new Date();  
		    dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期  
		    var y = dd.getFullYear();  
		    var m = dd.getMonth()+1;//获取当前月份的日期  
		    var d = dd.getDate();  
		    return y+"-"+m+"-"+d;  
		}  
		
		function iscycle(){
			var modelElms = document.getElementsByName("submitModel");
			var modelVal;
			for(var i = 0; i < modelElms.length; i++){
				if(modelElms[i].checked == true){
					modelVal = modelElms[i].value;
				}
			}
  			$("#submit_button").prop("type","submit");
  			//alert("-----");
  			//cycle
  			//计算周期
  			var procedureType=document.getElementById("procedureType").value;
  			var length=document.getElementById("length").value;
  			var completeTime=document.getElementById("completeTime").value;
  	  		/* alert(procedureType+length+completeTime); */
  			if(procedureType!='' && length!='' && completeTime!='' && procedureType!=null && length!=null && completeTime!=null){//判断计算周期条件是否填写完整--》开始
  			
  				completeTime+=" 23:59:59"//项目交稿日期
	  			/* var trueTime=document.getElementById("trueTime").value;  //项目过期时间 */
	  			var trueTime=GetDateStr(1)+" 00:00:00";//项目发布时间
  				
  				//时间差
  	  			var date2 = new Date(completeTime);
  	  			var myDate=new Date(trueTime);
  	  			//var date1 = new Date(data.cusNeedList[i].publishTime);
  	  			 
  	  			var s1 = myDate.getTime(),s2 = date2.getTime();
  	  			var total = (s2 - s1)/1000;
  	  			 
  	  			 
  	  			var day = parseInt(total / (24*60*60));//计算整数天数

  	  			var transTime=Math.ceil(length/3000);//翻译需要时间
  	  			var proofTime=Math.ceil(length/6000);//校对时间
  	  			var audiTime=Math.ceil(length/8000);//审核时间
  	  			
  	  			var time=0;//流程处理时间 1天
  	  			if(procedureType==1){
  	  				time=time+transTime;
  	  			}else if(procedureType==2){
  	  				time=time+transTime+proofTime;
  	  			}else if(procedureType==3){
  	  				time=time+transTime+proofTime+audiTime;
  	  			}
  	  			$("#spanDIV").hide();
  	  			$("#cycleDiv").hide();
  	  			if(day<time){//加急--》开始
  	  				//加急情况 计算加急时间
  	  				time=1;
  	  		 		var transTime2=Math.ceil(length/4000);//翻译需要时间
  	  				var proofTime2=Math.ceil(length/8000);//校对时间
  	  				var audiTime2=Math.ceil(length/10000);//审核时间
  	  				if(procedureType==1){
  	  					time=time+transTime2;
  	  				}else if(procedureType==2){
  	  					time=time+transTime2+proofTime2;
  	  				}else if(procedureType==3){
  	  					time=time+transTime2+proofTime2+audiTime2;
  	  				}
  	  				$("#spanDIV").hide();
  	  				$("#cycleDiv").hide();
  	  				if(day<time){//特急--》开始
  	  					//特急情况 计算特急时间
  	  					time=1;
  	  					var transTime3=Math.ceil(length/5000);//翻译需要时间
  	  					var proofTime3=Math.ceil(length/10000);//校对时间
  	  					var audiTime3=Math.ceil(length/15000);//审核时间
  	  					if(procedureType==1){
  	  						time=time+transTime3;
  	  					}else if(procedureType==2){
  	  						time=time+transTime3+proofTime3;
  	  					}else if(procedureType==3){
  	  						time=time+transTime3+proofTime3+audiTime3;
  	  					}
  	  					$("#spanDIV").hide();
  	  					$("#cycleDiv").hide();
  	  					if(day<time){//加钱--》开始
  	  						//加钱
  	  						//alert(time-day);
  	  						$("#cycle").val("特急+");
  	  						$("#cycle2").val("<spring:message code='特急'/>+");
  	  						/*var hiddenInput="<input type='hidden' name='addTime' id='addTime' value='"+(time-day)+"'>"*/
  	  						/*var hiddenInput=""*/
  	  						$("#spanDIV").show();
  	  						$("#cycleDiv").show();
  	  						cleanInter();
  	  						singleMoney();
  	  					}else{
  	  						//特急
  	  						$("#cycle").val("特急");
  	  						$("#cycle2").val("<spring:message code='特急'/>");
  	  						singleMoney();
  	  						if(modelVal == 2){
  	  							getCountTrans();
  	  						}
  	  					}//加钱--》结束
  	  				}else{
  	  					//加急
  	  					$("#cycle").val("加急");
  	  					$("#cycle2").val("<spring:message code='加急'/>");
  	  					singleMoney();
  	  					if(modelVal == 2){
  							getCountTrans();
  						}
  	  				}//特急--》结束
  	  				
  	  			}else{
  	  				//一般情况
  	  				$("#cycle").val("一般");
  	  				$("#cycle2").val("<spring:message code='一般'/>");
  	  				singleMoney();
  	  				if(modelVal == 2){
  						getCountTrans();
  					}
  	  			}//加急--》结束
  			}//判断计算周期条件是否填写完整--》结束
  			if("${clientid.userType}"+"" == "2"){
  				transTotalC();
  			}
  		}
		
		function transKilo(trandPrice,proofPrice,veriPrice,obj){	
  			//最初需求报价每千字
  			var transKilo=document.getElementById("moneyKilo").value;
  			
  			//比较被选中的译员中报价最高者
  			var checkTrans=document.getElementsByName("checkTrans");
  			
  			var checkedTranArr;
  			var cValue=0;
  			var cValue1=0;
  			var cValue2=0;
  			var checkedTransString="";
  			for(var i=0;i<checkTrans.length;i++){
  				if(checkTrans[i].checked){
  					checkedTransString+=checkTrans[i].title+",";
  					}			
  			}
  			//被选中多选框数组
  			
  			checkedTransString=checkedTransString.substring(0,checkedTransString.length-1);
  			checkedTranArr=checkedTransString.split(",");
  			 
  			for(var i=0;i<checkedTranArr.length;i++){
  				if(i==0){
  					cValue=checkedTranArr[i]
  				}else{
  					if(cValue<parseFloat(checkedTranArr[i])){
  						cValue=parseFloat(checkedTranArr[i])
  					}
  				}

  			}
  			
  			if(cValue==0){
  				document.getElementById("moneyKilo").value=obj;
  				singlePrice = obj;
  				/* singlePrice = parseFloat(parseFloat); */
  			}else{
  				document.getElementById("moneyKilo").value=cValue;
  				singlePrice = cValue;
  				/* singlePrice = parseFloat(parseFloat); */
  			}
  				
  			var checkTrans=document.getElementsByName("checkTrans");
  			var checkTransCount=0;
  			for(var i=0;i<checkTrans.length;i++){
  				if(checkTrans[i].checked){
  					checkTransCount=checkTransCount+1;
  				}
  			}
  			//alert(checkTransCount);
  			var transCount=document.getElementById("transCount");
  			transCount.innerHTML = checkTransCount;
  			
  			sumtp();
  			
  			
  		}
		
		function checked(id,trandPrice,proofPrice,veriPrice,obj){
			var checkBox = document.getElementById(id);
			if(checkBox.checked == false){
				checkBox.checked = true;
				$("."+id+"").css('background-color','#DDDDDD');
			}else if(checkBox.checked == true){
				checkBox.checked = false;
				$("."+id+"").css('background-color','#fff');
			}
			transKilo(trandPrice,proofPrice,veriPrice,obj);
		}
		
		/* function checkModel(){
			var val = $('input:radio[name = submitModel]:checked').val();
			if(val == '3'){
				alert("选择译员！");
			}
		} */
		//遮罩层获取相对位置
		function Position() {  
			 $("#_MaskLayer_").width($(document).width());   
			  var deHeight = $(window).height();     
			  var deWidth = $(window).width();     
			  var scrollTop = document.body.scrollTop;
			  $("#_wait_").css({ left: (deWidth - $("#_wait_").width()) / 2 + "px", top: (((deHeight - $("#_wait_").height()) / 2) + scrollTop) + "px" }); 
			}
		//加载遮罩层
		function loadDiv(text) {
			var deHeight = document.body.scrollHeight;
		    var div = "<div id='_layer_'> <div id='_MaskLayer_' style='filter: alpha(opacity=30); -moz-opacity: 0.3; opacity: 0.3;background-color: #000; width: 100%; height: " + deHeight + "px; z-index: 1000; position: absolute;left: 0; top: 0; overflow: hidden; display: none'></div><div id='_wait_' style='z-index: 1005; position: absolute; width:430px;height:218px; display: none'  ><center><h3>" +                 "" + text + "<img src='/img/loading3.gif' /><br><button class='btn btn-primary' onclick='cancel()'><spring:message code='取消'/></button></h3></center></div></div>"; 
		   return div; 
		}
		//触发遮罩层
		function LayerShow(text) {
			var addDiv= loadDiv(text);  
		  	var element = $($.parseHTML("#" + addDiv, document, true)).appendTo(document.body);
		  	$(window).resize(Position);  
		  	var deHeight = $(document).height();    
			var deWidth = $(document).width();    
		 	Position();     
			$("#_MaskLayer_").show();
		  	$("#_wait_").show();
		}
		//隐藏遮罩层
		function LayerHide() { 
			$("#_MaskLayer_").hide(); 
			$("#_wait_").hide(); 
			del(); 
			}
		//清空div,避免产生重复
		function del() { 
			 var delDiv = document.getElementById("_layer_");     delDiv.parentNode.removeChild(delDiv);  
		}
		//清除译员模式
		function cleanInter(){
			$("#transCount").html(0);
			$("#selectedModel").val("");
			var parentDIV=document.getElementById("transDiv");
		  	var chilDIV=document.getElementsByName("append_cardId");
		  	//var chillength=parentDIV.childNodes.length;
		  	//alert(chillength);
		  	//alert(chilDIV.length);
		  	var selectModel=document.getElementById("selectedModel");
		  	if(parentDIV&&chilDIV&&selectModel){
		  		for(var a=0;a<chilDIV.length;){
		  			//alert(chilDIV[2]);
		  			parentDIV.removeChild(chilDIV[a]);
		  			//alert(chilDIV.length);
		  	}
		  		
		  		/* document.getElementById("hiddenDiv").style.visibility="hidden";//隐藏 */
		  	}
				$("#dddlabel").empty();
		  	$("#hiddenDiv").css('display','none');
			$("#nextStep").css('display','block');
			$("#nextStepBtn").html("<spring:message code='下一步'/>");
		}
		
		$("#form").submit(function(){
			var cycleValue=document.getElementById("cycle").value;
			var modelElms = document.getElementsByName("submitModel");
			var modelVal;
			for(var i = 0; i < modelElms.length; i++){
				if(modelElms[i].checked == true){
					modelVal = modelElms[i].value;
				}
			}
			if(modelVal == 3){
				var transCount = $("#transCount").html();
			  	if("特急+"!=cycleValue && $("#selectedModel").val() == "选定译员模式"){
			  		if(transCount > 0){
			  			return true
			  		}else{
			  			layer.alert("<spring:message code='请选择译员！'/>");
			  			return false;
			  		}
			  	}else{
					layer.alert("<spring:message code='请重新选择模式！'/>");
					return false;
				}
			}else if(modelVal == 2){
				assignedModel();
			}else if(modelVal == 1){
				unsolicitedBid();
			}else{
				layer.alert("<spring:message code='请选择发布模式！'/>");
				return false;
			}
		});
		
		//计算总价
		function sumtp(){
			  var url = "/cilentCustomer/getTotalPrice.do";
			  var count = $("#moneyKilo").val();
			  var length = $("#length").val();
			  if(count != null && count != '' && length != null && length != ''){
				  var totalPrice = $.post(url,"length="+length+"&count="+count,function(data){
					  if(data > 0){
						  $("#totalMoney").val(data);
					  }
				  });
			  }else{
				  $("#totalMoney").val("");
			  }
		  }
		
		//计算单价
		function singleMoney(){
			//语言
			var lang;
			var langList = document.getElementsByName("languagePair");
			for(var i = 0;i < langList.length;i++){
				if(langList[i].checked == true)
					lang = langList[i].value;
			}
			//领域
			var domain;
			var domainList = document.getElementsByName("domain");
			for(var i = 0;i < domainList.length;i++){
				if(domainList[i].checked == true)
					domain = domainList[i].value;
			}
			//等级
			var level = $("#level").val();
			//流程
			var procedureType = $("#procedureType").val();
			//周期
			var cycle = $("#cycle").val();
			
			if(lang != null && lang != "" && domain != null && domain != "" 
					&& level != null && level != "" && procedureType != null && procedureType != "" && cycle != null && cycle != ""){
				var url = "/cilentCustomer/getSinglePrice.do";
				$.post(url,"transLanguage="+lang+"&level="+level+"&transDomain="+domain+"&procedureType="+procedureType+"&cycle="+cycle,function(data){
					  if(data > 0){
						  $("#moneyKilo").val(data);
						  singlePrice = data;
						  /* singlePrice = parseFloat(parseFloat); */
						  sumtp();
					  }
				  }).error(function(){
					  layer.alert("<spring:message code='请求数据失败！'/>");
				  });
			}
		}
		
		function getSystomPayNum(){
			$("#moneyKilo").val(singlePrice);
			sumtp();
		}
   
		
	//验证标题唯一
    function onlyTitly(obj){
    	var title=obj.value;
    	$.post("/cilentCustomer/onlyTitle.do","title="+title,function(data){
    		//alert("data="+data.result);
    		if(data.result=='error'){
    			layer.alert("<spring:message code='项目标题已存在！'/>");
    			obj.value='';
    		}
    	},"json");
    }
    
    function  exteTime(obj){
    	//如果id=completeTime----》交稿时间---晚于现在的时间，
    	//如果id=trueTime----》有效时间---晚于现在的时间，前与交稿时间
    	var completeTime=$("#completeTime").val();
    	var trueTime=$("#trueTime").val();
    	$.post("/cilentCustomer/exteTime.do","completeTime="+completeTime+"&trueTime="+trueTime,function(data){
    		if(data.result!='success'){
    			//时间选择不正确
    			$("#trueTime").val("");
    			layer.alert(data.result);
    		}
    	},"json");
    	
    }
    
    
    //获取可选译员数量
    function getCountTrans(){
    	//周期
		var cycle=document.getElementById("cycle").value;
		//加急天数
		var addTime=0;
		/* if("特急+"==cycle){
			addTime=document.getElementById("addTime").value;
		} */
		
		//翻译字数
		var length = document.getElementById("length").value;
		
		//根据流程查找译员
		var procedureType=document.getElementById("procedureType").value;
		
		
		//获取译员语言
		var languagePair=document.getElementsByName("languagePair");
		var transLanguage="";
		for(var i=0;i<languagePair.length;i++){
			if(languagePair[i].checked){
				transLanguage=languagePair[i].value;
			}
		}
		
		//获取译员翻译领域
		var domain=document.getElementsByName("domain");
		var transDomain="";
		for(var i=0;i<domain.length;i++){
			if(domain[i].checked){
				transDomain=domain[i].value;
			}
		}
		
		//获取译员等级
		var level=document.getElementById("level").value;
		
		if(transLanguage != null && transLanguage != "" && transDomain != null && transDomain != "" 
				&& level != null && level != "" && procedureType != null && procedureType != "" && cycle != null && cycle != ""){
			//跳转路径
			var url="/cilentCustomer/getCountTrans.do";
			$.post(url,"transLanguage="+transLanguage+"&transDomain="+transDomain+"&level="+level+"&procedureType="+procedureType,function(data){
				$("#transCountNum").html(data.count);
				$("#transCountLabel").css("display","block");
				if(data.count == null || data.count == 0 || data.count == '0'){
					$("#systemPs").css("display","block");
				}else{
					$("#systemPs").css("display","none");
				}
			},"json")
		}
		
		
		
    }
    
    //验证上传文件
   /* function checkFile(file){	
        //判断是否有选择上传文件
            var imgPath = file.value;
            //alert(imgPath)
           if (imgPath == "") {
                alert("<spring:message code='请上传文件！'/>");
                return;
            };
            //判断上传文件的后缀名
            var strExtension = imgPath.substr(imgPath.lastIndexOf('.') + 1);
            var flag="strExtension != 'jpg' && strExtension != 'gif' "+
            		 "&& strExtension != 'png' && strExtension != 'bmp'"+
            		 "&& strExtension != 'JPG' && strExtension != 'GIF' "+
            		 "&& strExtension != 'PNG' && strExtension != 'BMP' "+
            		 "&& strExtension != 'pdf' && strExtension != 'PDF'  "+
            		 "&& strExtension != 'word' && strExtension != 'WORD' "+
            		 "&& strExtension != 'txt' && strExtension != 'word'"+
            		 "&& strExtension != 'rtf' && strExtension != 'RTF'"+
            		 "&& strExtension != 'doc' && strExtension != 'DOC'"+
            		 "&& strExtension != 'DOCX' && strExtension != 'docx'"
            if (flag) {
                alert("<spring:message code='问津只支持以下几种格式：'/>jpg、JPG、gif、GIF、png、PNG、bmp、BMP、pdf、PDF、word、WORD、txt、TXT、rtf、RTF、doc、DOC、docx、DOCX");
                file.value="";
                return;
            };
             //$("#srcForm").submit();     	
    }  */
    function cancel(){
    	LayerHide();
    	del();
     }
    
    function transTotalC(){
    	var count = ""
    	var url = "/cilentCustomer/getTotalPrice.do";
		var count = $("#transSingle").val();
		count = parseFloat(count);
		var length = $("#length").val();
		if(count != null && count != '' && length != null && length != ''){
			var totalPrice = $.post(url,"length="+length+"&count="+count,function(data){
				if(data > 0){
					$("#transTotal").val(data);
				}
			});
		}else{
			$("#transTotal").val("");
		}
    }
    </script>
<div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>