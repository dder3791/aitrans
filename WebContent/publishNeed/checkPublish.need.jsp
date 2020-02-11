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

    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.0.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
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
        showDiv.innerHTML = "<spring:message code='总翻译字数说明'/><br><font color='#00FF00'><spring:message code='总翻译字数'/></font><spring:message code='须和'/><font color='#00FF00'><spring:message code='提交的文档字数'/></font><spring:message code='相当，差异不得大于'/><font color='#00FF00'>500</font><spring:message code='字'/><spring:message code='，否则以'/><font color='#00FF00'><spring:message code='提交文档的总字数'/></font><spring:message code='为准（即word文档计算的总字数）'/>";  
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
    }  */ 
    function outHideTime() {  
        var showDiv = document.getElementById('showDivTime');  
        showDiv.style.display = 'none';  
        showDiv.innerHTML = '';  
    }
    
    
    
  	$(function(){
  		
  		/* var url="/cilentCustomer/transQuotationInfo.do";
  		$.post(url,"id="+"${tranCard.id}",function(data){
  			var quotationList=data.quotationList;//报价信息
  			if(quotationList!="" || quotationList!=null || quotationList.length>0){
  	      	  for (var i = 0; i < quotationList.length; i++) {
  	      		if(i==0){
  	      	    var sub="<input type='select' name='languagePair' value='"+quotationList[i].languages+"' title='"+quotationList[i].languages+"'>";
  	      		$("#tranLanguage").append(sub);
  	      		}
  	      		else{
  	      		var flag=true; 
  	      			for(var j=0;j<i;j++){
  	      				if(quotationList[i].languages==quotationList[j].languages){
  	      				flag=false;
  	      				}
  	      			}
  	      			if(flag){
  	      			  var sub="<input type='radio' name='languagePair' value='"+quotationList[i].languages+"' title='<spring:message code='"+quotationList[i].languages+"'/>' > ";
  	      			  $("#tranLanguage").append(sub);
  	      			}
  	      		}
  	  		  }
  	        }
  		},"json"); */
        
  		var checkLanguage = $('input:radio[name="languagePair"]:checked').val();
  		
  		 if("${clientid.userName}"!='' && "${clientid.userName}"!=null){
	   		 $("#nickname").text('${clientid.userName}'+"<spring:message code=',&&您!'/>");
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
		}  */
		
		//发布需求按钮
    	$("#publishNeedClick").click(function (){
    		if("${clientid}"==null || "clientid"==''){
    			layer.msg('hello');
    			//layer.msg('<spring:message code="兑换成功，稍后会由工作人员给您发货！"/>',{icon:1});
    			//alert("您不是客户，不能进行发布项目操作！")
    		}else{
    			$("#publishNeedClick").prop("href","/cilentCustomer/publishNeed.do")
    		}
    	})
    	
    	
		$(".btn_more").click(function(){
		    if($(".publish_contents_lists").hasClass('height_list')){
		      $(".publish_contents_lists").removeClass('height_list');
		    }else{
		      $(".publish_contents_lists").addClass('height_list');
		    }
		  })

		  $(".btn_more_job").click(function(){
		    if($(".publish_jobs_lists").hasClass('height_list')){
		      $(".publish_jobs_lists").removeClass('height_list');
		    }else{
		      $(".publish_jobs_lists").addClass('height_list');
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
		  var tranCard='${tranCard}';
			  $("#selectedModel").val("选定译员模式");
			  if(tranCard!=null){
			   /*  $("#length").val(transLength); */
			    $("#transDiv").show();
			    var transLevel='${tranCard.level}';
			    var transLanguage='${tranCard.language}';
			    var transDomain='${tranCard.domain}';
			    if(transLanguage=='EN'){
			    	languages="<spring:message  code='英语'/>";
			    } 
			    else if(transLanguage=="JP"){
			    	languages="<spring:message  code='日语'/>";
			    }
			    else if(transLanguage=="KOR"){
			    	languages="<spring:message  code='韩语'/>";
			    }
			    else if(transLanguage=="FR"){
			    	languages="<spring:message  code='法语'/>";
			    }
			    else if(transLanguage=="GER"){
			    	languages="<spring:message  code='德语'/>";
			    }
			    else{
			    	languages=transLanguage
			    }
			    if(transDomain.length > 10){
			    	transDomain = transDomain.slice(0,9)+"...";
			    }else{
			    	transDomain=transDomain;
			    }
			    var startlevel='';
			    if(transLevel == 1){
			    	startlevel = "<font size='4px' color='green'><b>★</b></font>"
			    }
			    if(transLevel == 2){
			    	startlevel = "<font size='4px' color='green'><b>★★</b></font>"
			    }
			     if(transLevel == 3){
			    	startlevel = "<font size='4px' color='green'><b>★★★</b></font>"
			    }
			    if(transLevel == 4){
			    	startlevel = "<font size='4px' color='	#FFBB00'><b>★★★★</b></font>"
			    }
			    if(transLevel == 5){
			    	startlevel = "<font size='4px' color='	#FF0000'><b>★★★★★</b></font>"
			    } 
			    var cards_one = "<div  class='append_card' name='append_cardId' >"+
			    "<div class='cards_one text-right fl' style='padding:0px;padding-left:10px;height:310px;border-radius:10px;background-color:#DDDDDD'>"+
			    "<p style='width:165px;margin-left:20px;text-align: left;'>"+"<span style='width:165px;' class='card_name' id='nickname'><font color='#000088'>"+'${tranCard.nickname}'+"</font></span>"+"</p>"+
			    "<img class='card_img' src='userUrl' alt='' width='80px' height='100px' >"+"<br>"+
			    "<p hidden=''>"+"<span id='transId'>"+'${tranCard.id}'+"</span>"+"</p>"+"<p>"+
			    "<span id='level'>"+startlevel+"</span>"+"</p>"+"<p>"+
			    "<span id='languages'>"+languages+"</span>"+"</p>"+"<p>"+
			    "<span id='degree'>"+'${tranCard.degree}'+"</span>"+"</p>"+
			    "<div class='texts_left' style='margin-top:30px;'>"+
			    "<p>"+"<spring:message  code='专业领域：'/>"+"<span id='trandomain'>"+transDomain+"</span>"+"</p>"+
			    "</div>"+"<div class='append_card_btn'>"+
			    "</div>"+
			    "</div>";
			$("#transDiv").append(cards_one);
			$("#hiddenDiv").show();
			var ddd = "<b><spring:message code='您选择的译员有'/><span style='color:red;' id='transCount'>1</span><spring:message code='位'/></span></b>";
			
            $("#dddlabel").append(ddd);
			  }
		  $("#btn_add1").click(function(){  
	  			
	  			var a="<div class='row' style='height:37px'>"+
	  					"<label  class='col-xs-2 rowlabel'></label>"+
	  					"<div class='col-xs-3'>"+
	  					"</div>"+
	  					"<div class='col-xs-5'>"+
	  					"<a href='javascript:;' class='a-upload' id='file' class='a-upload'>"+
	  					"<input type='file' id='' name='filename'  lay-verify='required'/><spring:message code='点击这里上传文件'/></a>"+
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
  				
  				$("#selectedModel").val("系统分配模式");
  				
  				if(parentDIV&&chilDIV){
  					for(var a=0;a<chilDIV.length;){
  						parentDIV.removeChild(chilDIV[a]);
  					}
  					document.getElementById("hiddenDiv").style.visibility="hidden";//隐藏
  				}
  			}
  		}


  		function unsolicitedBid(){
  			var parentDIV=document.getElementById("transDiv");
  			var chilDIV=document.getElementsByName("append_cardId");
  			 
  			
  			var selectModel=document.getElementById("selectedModel");
  			if(parentDIV&&chilDIV&&selectModel){
  				for(var a=0;a<chilDIV.length;){
  					parentDIV.removeChild(chilDIV[a]);
  				}
  				
  				document.getElementById("hiddenDiv").style.visibility="hidden";//隐藏
  			}
  			
  			
  			$("#selectedModel").val("主动投标模式");
  			
  		}
     function checkKilo(){
    	 var checkLanguage = $('input:radio[name="languagePair"]:checked').val();
    	 var checkDomain = $('input:radio[name="domain"]:checked').val();
    	 var checkLevel=$('#level option:selected').val();
    	 var procedureTypes=$('#procedureType option:selected').val();
    	 var moneyKilos=$("#moneyKilo").val();
    	 if(procedureTypes==1){
    		 $.post("/translator/translatorAction_checkTransPrice.do","languageDomain="+ checkLanguage+"&domain="+checkDomain+"&tranPrice="+moneyKilos ,function(data){ 
    			 if (moneyKilos < data.trans) {
 					layer.open({
 						title : '<spring:message  code="提示"/>',
 						content : '<spring:message  code="所输入价格不符合要求，请重新修改"/>',
 					});
 				} 
    		},"json");
         }
    	 if(procedureTypes==2){
    		 $.post("/translator/translatorAction_checkProoPrice.do","languageDomain="+ checkLanguage+"&domain="+checkDomain+"&tranPrice="+moneyKilos ,function(data){
    			 if (moneyKilos < data.proof) {
 					layer.open({
 						title : '<spring:message  code="提示"/>',
 						content : '<spring:message  code="所输入价格不符合要求，请重新修改"/>',
 					});
 				} 
    		 },"json");
         }	 
    	 if(procedureTypes==3){
    		 $.post("/translator/translatorAction_checkAuditPrice.do","languageDomain="+ checkLanguage+"&domain="+checkDomain+"&tranPrice="+moneyKilos ,function(data){
    			 if (moneyKilos < data.veri) {
 					layer.open({
 						title : '<spring:message  code="提示"/>',
 						content : '<spring:message  code="所输入价格不符合要求，请重新修改"/>',
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
    margin-top: 25px;
}
.modeBtn {
	width:25%;
	margin-left:20px;
	float:left;
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
            <form class="layui-form"  id="form" action="/cilentCustomer/lookPublish.do"  method="post" id="publish" enctype="multipart/form-data">
              <input type="hidden" value="${tranCard.id}" id="checkTrans" name="checkTrans">
            <div class="form-group row" id="msgDiv">
              	<div class="row">
               		<label  class="col-xs-2 rowlabel"><b><font color="red">*</font><spring:message code='项目标题'/></b></label>
              		<div class="col-xs-9">
              			<input type="text" class="form-control" placeholder="<spring:message code='请输入需求标题'/>" name="title" onchange="onlyTitly(this)" id="title" autocomplete="off" lay-verify="title|required">
              		</div>
              	</div>
              	
              	<c:if test="${transId==null || transId=='' }">
              	   <div class="row">
                		<label  class="col-xs-2 rowlabel"><b><font color="red">*</font><spring:message code='请选择项目语言'/></b></label>
                  		<div class="col-xs-3">
                  		     <select class="form-control" lay-filter="tranlanguage"  name="languagePair" id="languagePair" lay-verify="required" >
		                      	<option value=""><spring:message code='请选择翻译语言'/></option>
                  			<c:forEach items="${quotationList}" var="quotationList">
		                      	<option value="${quotationList.languages }"><spring:message code='${quotationList.languages }'/></option>
		                      </c:forEach>
		                   </select>   
                  		</div>
                		<label  class="col-xs-3 rowlabel"><b><font color="red">*</font><spring:message code='请选择项目领域'/></b></label>
                  		<div class="col-xs-3">
		                    <select class="form-control" lay-filter="domain" name="domain" id="domain" lay-verify="required" >
		                      	 <option value=""><spring:message code='请选择项目领域'/></option> 
		                   </select>  
                  		</div>
                	</div>
				 

                	<div class="row">
                		<label  class="col-xs-2 rowlabel"><b><font color="red">*</font><spring:message code='译员等级'/></b></label>
                  		<div class="col-xs-3">
                  		
                    		<select class="form-control" lay-filter="level" name="level" id="level" lay-verify="required" >
		                       <option value=""><spring:message code='请选择等级'/></option>
		                    </select>  
                  		</div>
                		<label  class="col-xs-3 rowlabel"><b><font color="red">*</font><spring:message code='流程类型'/></b></label>
                  		<div class="col-xs-3">
                    		<select class="form-control" lay-filter="procedureType" name="procedureType" id="procedureType" lay-verify="required" >
		                        <option value=""><spring:message code='请选择流程类型'/></option>
		                    </select> 
                  		</div>
                	</div>
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
                	<label  class="col-xs-2 rowlabel"><b><font color="red">*</font><spring:message code='翻译总字数'/></b></label>
                  	<div class="col-xs-9">
                    	<input type="text" class="form-control" placeholder="<spring:message code='翻译总字数 （单位： 字）'/><spring:message code='若原稿字数少于500字，平台将按500字计算支付金额'/>" name="length" id="length" onblur="iscycle()" lay-filter="length" autocomplete="off" lay-verify="length|required|number">
                  	</div>
                  	<label  class="col-xs-1 rowlabel" style="text-align: left;"><a href="javascript:;" onmouseover="overShowLength()" onmouseout="outHideLength()"><font color="red"><b>?</b></font></a></label>
                </div>
                
                <div id="showDivLength" style="color:white;z-index: 999;display:none;position: absolute; background-color: #4169E1; border: 1px solid #4169E1;margin-left:60%;width:35%;text-align: center;border-radius:10px;padding:10px;"></div>
                
                <div class="row">
                	<label  class="col-xs-2 rowlabel"><b><font color="red">*</font><spring:message code='交稿日期'/></b></label>
                  	<div class="col-xs-3">
                    	<input type="text" class="form-control" name="completeTime" id="completeTime" readonly="readonly" onblur="iscycle()" onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd'})" lay-verify="required"><!-- onchange="exteTime(this)" -->
                  	</div>
                  	<label  class="col-xs-3 rowlabel"><b><spring:message code='周期'/></b></label>
                  	<div class="col-xs-3">
                    	<input type="text" class="form-control" name="cycle" id="cycle" readonly="readonly" lay-verify="required">
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
                    	<input type="text" class="form-control" name="trueTime" id="trueTime" readonly="readonly" onblur="iscycle()" onchange="exteTime(this)" onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" lay-verify="required">
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
    						<input type="file" name="filename" lay-verify="required" /><spring:message code='点击这里上传文件'/>
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
                    	<textarea class="form-control layui-textarea" rows="10" placeholder="<spring:message code='请输入备注信息'/>" name="description" id="description" autocomplete="off" lay-verify=""></textarea>
                  	</div>
            	</div>
                <c:if test="${transId==null || transId==''}">
	                <div class="row">
	                	<label  class="col-xs-2 rowlabel"><b><font color="red">*</font>选择发布模式</b></label>
	                  	<div class="col-xs-9">
	                  		<input id="selectInter" type="radio" name="submitModel" lay-filter="submitModel" value="3"  checked="" title="<spring:message code='选定译员'/>">
	                  	</div>
	                </div>
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
                
                <div class="row" id='ddd'>
			        <label id="dddlabel" class='col-xs-4 rowlabel'></label>
                	<%-- <label  class="col-xs-2 rowlabel"><b><spring:message code='每千字'/></b></label>
                	<div class="col-xs-2"><input style="color:red;" class="form-control" type="text" name="moneyKilo" id="moneyKilo" lay-verify="required"></div>
                	<label  class="col-xs-1 rowlabel" style="text-align: left;"><b><spring:message code='元'/></b></label>
                	<label  class="col-xs-6 rowlabel"><b><spring:message code='您选择的译员有'/><span style="color:red;" id="transCount">0</span><spring:message code='位'/></span></b></label> --%>
                </div>
                
                
                <div id="hiddenDiv" style="display: none;width: 100%;">
	                <div class="row">
	               	 	<div class="col-xs-1"></div>
	                	<div class="col-xs-11" style="text-align: center;" id="transDiv"></div>
	                </div>
	                
	                <div class="row">
	                	<label  class="col-xs-7 rowlabel"></label>
	                	<%-- <c:if test="${length==null}">
	                	<div class="col-xs-3" style="text-align: right;">
	                		<button type='button' class='btn btn-primary' name='button' onclick="selectedTransModel()"><spring:message code='换一批'/></button>
	                	</div>
	                	</c:if> --%>
	                	<%-- <div class="col-xs-1">
	                		<button type='submit' class='btn btn-primary' name='button' id="publish" lay-filter="demo1" lay-submit=""><spring:message code='下一步'/></button>
	                	</div> --%>
	                </div>
                </div>
                <div class="row" id="nextStep">
                	<label  class="col-xs-10 rowlabel"></label>
                  	<div class="col-xs-2">
                  		<button type="submit" id="nextStepBtn" style="width:100px;" class="btn btn-primary" name="button" onclick="" lay-filter="demo1" lay-submit=""><spring:message code='确认'/></button>
                  	</div>
                </div>
                
                <c:if test="${transId!=null && transId !='' }">
                	<div class="col-sm-2" style="width:18%;">
                   		 <span><spring:message code='模式已选定为：'/></span><button type="button" class="form-control btn-info" ><spring:message code='选定译员模式'/></button>
                   		 <input name="selected" value="选定译员模式" type="hidden">
                  	</div>
                  	 <button type='submit' class='form-control btn-info' name='button' id="publish" lay-filter="demo1" lay-submit="" style="width: 30%"><spring:message code='确认'/></button>
                	<!-- <input name="selected" value="译员选中模式" type="hidden"> -->
                </c:if>
        	</div>
               
            </form>
          </div>
          
          <div class="publish_contents_right col-sm-3">
            <!-- 热门需求  开始 -->
            <div class="hot_needs">
              <h4><spring:message code='发布模式简介'/></h4>

              <div class="hot_needs_cards">
                <h5><a href="#"><spring:message code='招标模式'/></a></h5>
                <p><spring:message code='点击“主动投标”按钮，进行主动投标模式项目的发布，此模式的项目需要译员主动上平台招标项目展示模块查找并接受该任务 ,在有满足项目需求的译员主动接受该项目是客户该项目会形成对应的订单。'/></p>
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
                <p><spring:message code='点击“选定译员”按钮，进行选定译员模式项目的发布。选择此模式客户必须在平台已注册译员中选择一位或多位译员，针对发布项目，平台同时以短信方式通知各位译员，若某一个译员接受该项目则形成相应的订单'/></p>
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
    $(function(){
      bsStep(1);//bsStep(i) i 为number 可定位到第几步 如bsStep(2)/bsStep(3)	
      
      $("#moneyKilo").change(function (){
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
	      });  
	        
	      //创建一个编辑器  
	      layedit.build('LAY_demo_editor'); 
	      
	      
	      //语言监听
	       form.on('select(tranlanguage)', function(data){
				console.log(data.elem); //得到radio原始DOM对象
				console.log(data.value); //被点击的radio的value值
				var trandate=data.value;
				if(trandate!=0){
				var url="/cilentCustomer/transQuotationInfo.do";
				var transId=$("#transId").text();
		  		$.post(url,"language="+trandate+"&id="+transId,function(data){
		  			var quotationss=data.quotations;//报价信息
		  			$("#domain option").not(":first").remove(); 
		  			for(var i = 0; i < quotationss.length; i++){
			  			  $("#domain").append("<option value="+quotationss[i].id+">"+quotationss[i].field+"</option>");
		  			}
		            renderForm();//表单重新渲染，要不然添加完显示不出来新的option
		  			 
		  		},"json");
				}else{
					 layer.alert("<spring:message code='请选择语言！'/>");
				}
		  		 
			}) ; 
	      
	      
	        //领域监听
		      form.on('select(domain)', function(data){
				 console.log(data.elem); //得到radio原始DOM对象
				 console.log(data.value); //被点击的radio的value值
				  if(data.value!=0){
				    var languagePair=$('#languagePair option:selected').val();
					/* var transId=$("#transsId").val(); */
					var transId=$("#transId").text();
			        var domains=$('#domain option:selected').text();
			        var url="/translator/translatorAction_transQuotationInfos.do";	 
			           $.post(url,"language="+languagePair+"&domain="+domains+"&id="+transId,function(data){
			 			        var quotationlevel=data.quotationlevel;
			 			        $("#level option").not(":first").remove();
			 			        for (var i = 0; i < quotationlevel.length; i++) {
			 			         	$("#level").append("<option value="+quotationlevel[i]+">"+quotationlevel[i]+"</option>");
								}
			 			       renderForm();//表单重新渲染，要不然添加完显示不出来新的option
			           	
			           },"json"); 
				  }else{
					  layer.alert("<spring:message code='请选择领域！'/>"); 
				  }
				}) ;
	      
		      //译员等级监听
		      form.on('select(level)', function(data){
					console.log(data.elem); //得到radio原始DOM对象
					console.log(data.value); //被点击的radio的value值
					if(data.value){
					var languagePair=$('#languagePair option:selected').val();
					var transId=$("#transId").text();
			        var domains=$('#domain option:selected').text();
			        var levels=$('#level option:selected').text();
			        var url="/translator/translatorAction_procedureType.do";	 
			           $.post(url,"language="+languagePair+"&domain="+domains+"&id="+transId+"&level="+levels,function(data){
			 			        var transProcedureType=data.transProcedureType;
			 			        $("#procedureType option").not(":first").remove();
			 			         for (var i = 0; i < transProcedureType.length; i++) {
			 			         	$("#procedureType").append("<option value="+transProcedureType[i].keyd+">"+transProcedureType[i].valued+"</option>");
								}  
			 			       renderForm();//表单重新渲染，要不然添加完显示不出来新的option
			           },"json"); 
					}else{
						layer.alert("<spring:message code='请选择领域！'/>"); 
					}	
				}) ;
		    //流程监听
		      form.on('select(procedureType)', function(data){
					console.log(data.elem); //得到radio原始DOM对象
					console.log(data.value); //被点击的radio的value值
					if(data.value!=0){
					/* var languagePair=$('#languagePair option:selected').val();
					var transId=$("#transId").text();
			        var domains=$('#domain option:selected').text();
			        var levels=$('#level option:selected').text();
			        var procedureType=$('#procedureType option:selected').text();
			        var url="/translator/translatorAction_queryPrices.do";	
			        $.post(url,"language="+languagePair+"&domain="+domains+"&id="+transId+"&level="+levels+"&procedureType="+procedureType,function(data){
	 			        var transPrices=data.transPrices;
	 			        alert(transPrices.tranPrice);
	 			        if(procedureType=='仅翻译'){
	 			        	$("#moneyKilo").val(transPrices.tranPrice);
	 			        }
	 			        if(procedureType=='翻译校对'){
	 			        	$("#moneyKilo").val(transPrices.prooPrice);
	 			        }
	 			        if(procedureType=='翻译校对审核'){
	 			        	$("#moneyKilo").val(transPrices.auditPrice);
	 			        }
	              },"json"); */
					}else{
						layer.alert("<spring:message code='请选择流程种类'/>"); 
					}
					singleMoney();
				}) ;
	   
	       
		      function renderForm(){
		    	   layui.use('form', function(){
		    	    var form = layui.form();
		    	    form.render();
		    	   });
		    	  }
	      
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
    
  
		/* function iscycle(){
  			$("#submit_button").prop("type","submit");
  			//alert("-----");
  			//cycle
  			//计算周期
  			var procedureType=document.getElementById("procedureType").value;
  			var length=document.getElementById("length").value;
  			var completeTime=document.getElementById("completeTime").value;//项目交稿日期
  			var trueTime=document.getElementById("trueTime").value;  //项目过期时间
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
  			
  			var time=1;//流程处理时间 1天
  			if(procedureType==1){
  				time=time+transTime;
  			}else if(procedureType==2){
  				time=time+transTime+proofTime;
  			}else if(procedureType==3){
  				time=time+transTime+proofTime+audiTime;
  			}
  			$("#spanDIV").hide();
  			$("#cycleDiv").hide();
  			if(day<time){
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
  				if(day<time){
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
  					if(day<time){
  						//加钱
  						//alert(time-day);
  						$("#cycle").val("特急+");
  						$("#spanDIV").show();
  						$("#cycleDiv").show();
  						singleMoney();
  					}else{
  						//特急
  						$("#cycle").val("特急");
  						singleMoney();
  					}
  				}else{
  					//加急
  					$("#cycle").val("加急");
  					singleMoney();
  				}
  				
  			}else{
  				//一般情况
  				$("#cycle").val("一般");
  				singleMoney();
  			}
  		} */
		
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
		    var div = "<div id='_layer_'> <div id='_MaskLayer_' style='filter: alpha(opacity=30); -moz-opacity: 0.3; opacity: 0.3;background-color: #000; width: 100%; height: " + deHeight + "px; z-index: 1000; position: absolute;left: 0; top: 0; overflow: hidden; display: none'></div><div id='_wait_' style='z-index: 1005; position: absolute; width:430px;height:218px; display: none'  ><center><h3>" +                 "" + text + "<img src='/img/loading3.gif' /></h3></center></div></div>"; 
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
		  	var selectModel=document.getElementById("selectedModel");
		  	if(parentDIV&&chilDIV&&selectModel){
		  		for(var a=0;a<chilDIV.length;){
		  			parentDIV.removeChild(chilDIV[a]);
		  	}
		  		
		  	}
				$("#dddlabel").empty();
		  	$("#hiddenDiv").css('display','none');
			$("#nextStep").css('display','block');
			$("#nextStepBtn").html("下一步");
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
			  			layer.alert("请选择译员！");
			  			return false;
			  		}
			  	}else{
					layer.alert("请重新选择模式！");
					return false;
				}
			}else if(modelVal == 2){
				assignedModel();
			}else if(modelVal == 1){
				unsolicitedBid();
			}else{
				layer.alert("请选择发布模式！");
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
			var transPrices;
			var sysPrice;
			//语言
			var lang;
			var domain;
			lang=$('#languagePair option:selected').val();
			domain=$('#domain option:selected').val();
			//等级
			var level=$('#level option:selected').text();
			//流程
			var procedureType=$('#procedureType option:selected').val();
			//周期
			var cycle = $("#cycle").val();
    /* -------------------------------------------------------------------------------- */			
			var languagePair=$('#languagePair option:selected').val();
			var transId=$("#transId").text();
	        var domains=$('#domain option:selected').text();
	        var levels=$('#level option:selected').val();
	        var procedureTypes=$('#procedureType option:selected').text();
	        var url="/translator/translatorAction_queryPrices.do";	
	        if(languagePair != null && languagePair != '' && domains != null && domains != '' && levels != null && levels != '' && procedureTypes != null && procedureTypes != ''){
	        	if(lang != null && lang != "" && domain != null && domain != "" 
					&& level != null && level != "" && procedureType != null && procedureType != "" && cycle != null && cycle != ""){
	        		$.post(url,"language="+languagePair+"&domain="+domains+"&id="+transId+"&level="+levels+"&procedureType="+procedureTypes,function(data){
					        transPrices=data.transPrices;
					        $.post("/cilentCustomer/getSinglePrice.do","transLanguage="+lang+"&level="+level+"&transDomain="+domain+"&procedureType="+procedureType+"&cycle="+cycle,function(data){
								  if(data > 0){
									  sysPrice = data;
									  if(procedureTypes=='仅翻译'){
											if(sysPrice < transPrices.tranPrice){
												$("#moneyKilo").val(transPrices.tranPrice);
											}else{
												$("#moneyKilo").val(sysPrice);
											}
								        }else if(procedureTypes=='翻译校对'){
								        	if(sysPrice < transPrices.prooPrice){
												$("#moneyKilo").val(transPrices.prooPrice);
											}else{
												$("#moneyKilo").val(sysPrice);
											}
								        }else if(procedureTypes=='翻译校对审核'){
								        	if(sysPrice < transPrices.auditPrice){
												$("#moneyKilo").val(transPrices.auditPrice);
											}else{
												$("#moneyKilo").val(sysPrice);
											}
								        }
									  getAllPrice();
								  }
							  }).error(function(){
								  layer.alert("请求数据失败！");
							  });
		          },"json");
	        	}
	        }
		}
		
		function getSystomPayNum(){
			$("#moneyKilo").val(singlePrice);
			sumtp();
		}
    </script>
    <script type="text/javascript">
    //验证标题唯一
    function onlyTitly(obj){
    	var title=obj.value;
    	$.post("/cilentCustomer/onlyTitle.do","title="+title,function(data){
    		//alert("data="+data.result);
    		if(data.result=='error'){
    			layer.alert("项目标题已存在！");
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
    			layer.alert(data.result);
    		}
    	},"json");
    	
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
    
    function GetDateStr(AddDayCount) {  
	    var dd = new Date();  
	    dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期  
	    var y = dd.getFullYear();  
	    var m = dd.getMonth()+1;//获取当前月份的日期  
	    var d = dd.getDate();  
	    return y+"-"+m+"-"+d;  
	} 
    
    function getAllPrice(){
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
    </script>
<div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>