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
    <title><spring:message  code="译员展示页面"/></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>      
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/page.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/interpreter.show.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/interpreter.cards.css" type="text/css"/>

    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
  <%--   <script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script> --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/all.needs.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
	<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script type="text/javascript">
    var lang = "${language}"
    	if(lang==""){
    		lang="zh";
    	}
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
      // 复选框  显示 隐藏
      var icon = '<i class="fa fa-angle-double-right" aria-hidden="true"></i>'
        $(".checkbox_click").click(function(){
          if($(".checbox_all").hasClass("checkbox_hide")){
            $(".checbox_all").removeClass("checkbox_hide");
            $(".checkbox_click").html("查看更多"+icon);
          }else{
            $(".checbox_all").addClass("checkbox_hide");
            $(".checkbox_click").text(" 收起");
          }
        })
      //  选他 数字加1
      $(".append_card_btn01").click(function(){
        parseInt($(this).find(".list_badge").text(parseInt($(this).find(".list_badge").text())+1))
      })
      
       //总记录数
		var totalCount = '${page.totalCount }';
		//当前页
		var pageNum = '${page.pageNum}';
		//区分是否是第一次进行分类跳转
		var o = 0;
		// 初始化加载分页下标
		//分类类型
		var languages = "${page.msgType}"
		var domains ="${page.thirdmsg}"
		var msgs = "${page.msg}"
		var levels="${page.secondmsg}"
		var degree="${page.namemsg}";
		if(msgs!=null || msgs!=""){
			$("#msg").val(msgs);
		}
    var GG = {
        "kk":function(mm){
      	//给予初始化赋值
				if (isNaN(mm)) {
					mm = 1;
				}
		   if(o!=2){//判断是否为搜索的页面初始化进入
			   jQuery.i18n.properties({
				   name:'Messages', 
			        path:'/i18n/', 
			        mode:'both',
			   		language:lang,
			        checkAvailableLanguages: true,
			        async: true,
			        callback: function() {	
			   var clientid="${clientid}";
			   var domain=$(".form-control select_wid").val();
 			   var language=$(".checkbox-inline").val();
      	       var msg=$("#msg").val();
      	       var level=$(".form-control level").val();
      	       var degree=$("#degree option:selected").val();
      	       var domainoptions = $("#domain option");
      	       var leveloptions=$("#level option");
      	        //给予模糊查询字段赋值msg
				$("#msg").prop("value", msg);
				
				/* alert(content)
				content=content.replace( /\%/g,"%25" );
				alert(content) */
            $.post("/translator/translatorAction_queryByAll.do","pageNum="+mm+"&domains="+domains+"&language="+languages+"&msg="+msg+"&levels="+levels+"&degree="+degree,function(data){
          	    var domains=data.domainList;
          	    var trans=data.translatorList;
          	    var translevel=data.translatorLevel;
            	 // 卡片循环添加
            	 $(".append_card").remove();
            	 var cards_one = "<div class='append_card'><div style='border-radius:10px;' class='cards_one text-right fl' style='border-radius:10px;height:300px;'><img class='card_img' id='transPhoto' src='/img/tuxiang.jpg ' alt='' width='80' height='90' ><p style='color: #000088;width:195px;margin-left:20px;text-align: left;'><span class='card_name' id='nickname'></span></p><p hidden=''><span id='transId'></span></p><p><span id='level' ></span></p><p><span id='languages'></span></p><p><span id='degree'></span></p><div class='texts_left'><p style='padding-top:20px'><spring:message  code='专业领域：'/><span id='trandomain'></span></p><p id='checkTransT'><spring:message  code='翻译经验：'/><span id='tranTotals'></span></p><p id='checkProoT'><spring:message  code='校对经验：'/><span id='prooTotals'></span></p></div><div class='append_card_btn'><a href='' class='append_card_btn01' id='checkTrans'><spring:message  code='选'/>TA</a><a href='' class='append_card_btn02' id='lookTrans' ><spring:message  code='详情'/></a></div></div></div>";
              for(var i=0;i<trans.length;i++){
                $("#transDiv").append(cards_one);
              }
          	//判断domainoptions标签是否已经被添加过
			 /*  if(!(domainoptions.length>1)){
          	 for(var j=0;j<domains.length;j++){
          		var pic='';
          		//alert(domains[j].id);
				if(domains[j].id==13){
  					pic="<spring:message  code='日常'/>"
  				}else if(domains[j].id==14){
  					pic="<spring:message  code='机械'/>"
  				}else if(domains[j].id==15){
  					pic="<spring:message  code='电子'/>"
  				}else if(domains[j].id==16){
  					pic="<spring:message  code='电器'/>"
  				}else if(domains[j].id==17){
  					pic="<spring:message  code='机电'/>"
  				}else if(domains[j].id==18){
  					pic="<spring:message  code='自动化'/>"
  				}else if(domains[j].id==19){
  					pic="<spring:message  code='计算机'/>"
  				}else if(domains[j].id==20){
  					pic="<spring:message  code='通信'/>"
  				}else if(domains[j].id==21){
  					pic="<spring:message  code='网络'/>"
  				}else if(domains[j].id==22){
  					pic="<spring:message  code='物理'/>"
  				}else if(domains[j].id==23){
  					pic="<spring:message  code='化学'/>"
  				}else if(domains[j].id==24){
  					pic="<spring:message  code='化工'/>"
  				}else if(domains[j].id==25){
  					pic="<spring:message  code='医药'/>"
  				}else if(domains[j].id==26){
  					pic="<spring:message  code='生化'/>"
  				}
          		 $("#domain").append("<option value="+domains[j].name+">"+pic+"</option>")
          	 }
          	 } */
			//判断leveloptions标签是否已经被添加过
			/*  if(!(leveloptions.length>1)){    
          	 for(var m=0;m<translevel.length;m++){
          		if(translevel[m].level>0){
          		 $("#level").append("<option value="+translevel[m].level+">"+translevel[m].level+"<spring:message  code='级'/></option>")
          	    }
          	  }
			} */
          	  //循环填入卡片信息
          	  var append_nickname=$(".append_card [id=nickname]");
          	  var append_transId=$(".append_card [id=transId]");
          	  var append_level=$(".append_card [id=level]");
          	  var append_language=$(".append_card [id=languages]");
          	  var append_degree=$(".append_card [id=degree]");
          	  var append_domain=$(".append_card [id=trandomain]");
          	  var lookTrans=$(".append_card [id=lookTrans]");
          	  var append_transphoto=$(".append_card [id=transPhoto]");
          	  var append_checkTrans=$('.append_card [id=checkTrans]');
          	  var append_tranTotal=$(".append_card [id=tranTotals]");
          	  var transTotal=$(".append_card [id=checkTransT]");
          	  var append_prooTotal=$(".append_card [id=prooTotals]");
          	  var prooTotal=$(".append_card [id=checkProoT]");
          	  var append_card_btn=$(".append_card_btn");
          	  var photo;
          	  for(var m=0;m<trans.length;m++){
          			  append_nickname[m].innerHTML=trans[m].nickname;
          			  append_transId[m].innerHTML=trans[m].id;
          			if(trans[m].language =='EN'){
        				 append_language[m].innerHTML='<spring:message  code="英语"/>';
        			  }else if(trans[m].language =='JP'){
        				append_language[m].innerHTML='<spring:message  code="日语"/>';
        			  }else if(trans[m].language =='KOR'){
        				append_language[m].innerHTML='<spring:message  code="韩语"/>';
        			  }else if(trans[m].language =='FR'){
        				append_language[m].innerHTML='<spring:message  code="法语"/>';
        			  }else if(trans[m].language =='GER')
        				append_language[m].innerHTML='<spring:message  code="德语"/>';
          			
          			var domainCard=trans[m].domain.split(",");
				   	//alert(domainCard[0])
				   	for(var z=0;z<domainCard.length;z++){
				   		if(domainCard[z]=='日常'){
				   			domainCard[z]="<spring:message  code='日常'/>"
		  				}else if(domainCard[z]=='机械'){
		  					domainCard[z]="<spring:message  code='机械'/>"
		  				}else if(domainCard[z]=='电子'){
		  					domainCard[z]="<spring:message  code='电子'/>"
		  				}else if(domainCard[z]=='电器'){
		  					domainCard[z]="<spring:message  code='电器'/>"
		  				}else if(domainCard[z]=='机电'){
		  					domainCard[z]="<spring:message  code='机电'/>"
		  				}else if(domainCard[z]=='自动化'){
		  					domainCard[z]="<spring:message  code='自动化'/>"
		  				}else if(domainCard[z]=='计算机'){
		  					domainCard[z]="<spring:message  code='计算机'/>"
		  				}else if(domainCard[z]=='通信'){
		  					domainCard[z]="<spring:message  code='通信'/>"
		  				}else if(domainCard[z]=='网络'){
		  					domainCard[z]="<spring:message  code='网络'/>"
		  				}else if(domainCard[z]=='物理'){
		  					domainCard[z]="<spring:message  code='物理'/>"
		  				}else if(domainCard[z]=='化学'){
		  					domainCard[z]="<spring:message  code='化学'/>"
		  				}else if(domainCard[z]=='化工'){
		  					domainCard[z]="<spring:message  code='化工'/>"
		  				}else if(domainCard[z]=='医药'){
		  					domainCard[z]="<spring:message  code='医药'/>"
		  				}else if(domainCard[z]=='生化'){
		  					domainCard[z]="<spring:message  code='生化'/>"
		  				}
				   	}
				   	
				   	var b = domainCard.join("，");
				   	/* alert(b); */
				    if(b!=null && b!=""){
				    	if(b.length >6){
					    	b= b.slice(0,5)+"...";
					    }
				    }
				    append_domain[m].innerHTML=b; 
				   	
       				/* if(trans[m].domain.length > 10){
          				append_domain[m].innerHTML= trans[m].domain.slice(0,9)+"...";
				    }else{
				    	 append_domain[m].innerHTML=trans[m].domain; 
				    } */
          			if(trans[m].level == 1){
          				append_level[m].innerHTML = "<font size='4px' color='#888888'><b>★</b></font>"
 				    }else if(trans[m].level == 2){
          				append_level[m].innerHTML = "<font size='4px' color='#00AAAA'><b>★★</b></font>"
 				    }else if(trans[m].level == 3){
          				append_level[m].innerHTML = "<font size='4px' color='#00AA00'><b>★★★</b></font>"
 				    }else if(trans[m].level == 4){
 				    	append_level[m].innerHTML= "<font size='4px' color='	#FFBB00'><b>★★★★</b></font>"
 				    }else if(trans[m].level == 5){
 				    	append_level[m].innerHTML = "<font size='4px' color='	#FF0000'><b>★★★★★</b></font>"
 				    }
          			if(trans[m].userUrl!=null){
          				userUrl="/"+trans[m].userUrl;
          			}else{
          				userUrl="/img/tuxiang.jpg";
          			}
          			if(trans[m].majorTotals!=0){
          				append_tranTotal[m].innerHTML=trans[m].majorTotals+"字";
				    }else{
				    	transTotal[m].style.display="none";
				    	append_card_btn[m].setAttribute("style", "margin-top:30px");
				    }
				    if(trans[m].prooTotals!=0){
				    	append_prooTotal.innerHTML=trans[m].prooTotals+"字";
				    }else{
				    	prooTotal[m].style.display="none";
				    	append_card_btn[m].setAttribute("style", "margin-top:30px");
				    }
				    if(trans[m].majorTotals==0 && trans[m].prooTotals==0 ){
				    	transTotal[m].style.display="none";
				    	prooTotal[m].style.display="none";
				    	append_card_btn[m].setAttribute("style", "margin-top:54px");
				    }
          			if(clientid!='' || clientid!="" ){
          				$(".append_card [id=checkTrans]").attr("onclick","findTransQuotation('"+trans[m].id+"')"); 
          				checkUrl="javaScript:void(0);";
          			}else{
          				$(".append_card [id=checkTrans]").attr("onclick","findClient();");
          				checkUrl="javaScript:void(0);";
          			}
          			if(trans[m].degree=="大专"){
   					    append_degree[m].innerHTML="<spring:message  code='大专'/>";
				    }
				    if(trans[m].degree=="本科"){
				    	 append_degree[m].innerHTML="<spring:message  code='本科'/>";
				    }
				    if(trans[m].degree=="研究生"){
				    	 append_degree[m].innerHTML="<spring:message  code='本科'/>";
				    }
				    if(trans[m].degree=="硕士"){
				    	 append_degree[m].innerHTML="<spring:message  code='硕士'/>";
				    }
				    if(trans[m].degree=="博士"){
				    	 append_degree[m].innerHTML="<spring:message  code='博士'/>";
				    }
				    if(trans[m].degree=='' ||trans[m].degree==null || trans[m].degree=='[]'  ){
				    	append_card_btn[m].setAttribute("style", "margin-top:54px");
				    } 
          			append_transphoto[m].setAttribute("src",userUrl);
          			append_checkTrans[m].setAttribute("href",checkUrl);
          			  lookTrans[m].setAttribute("href","/translator/translatorAction_findTransById.do?transId="+trans[m].id);
			 }  
          	
            },"json");
			        }
	    		 })	      
		   }
			o=1;//给予搜索后赋予另一个值来进行收索后的翻页执行
      }
    }
    $("#page").initPage(totalCount,pageNum,GG.kk);
		//给搜索添加点击事件
		$("#button").click(function(){
			  jQuery.i18n.properties({
			        name:'Messages', 
			        path:'/i18n/', 
			        mode:'both',
			   		language:lang,
			        checkAvailableLanguages: true,
			        async: true,
			        callback: function() { 	
			var clientid="${clientid}";
			//获取语言查询条件
			languages = $("input:checked").val();
			//获取领域查询条件
			 domains = $("#domain").val(); 
			//获取译员等级查询条件
			levels=$("#level").val();
			//获取模糊查询信息
			msgs=$("#msg").val();
			domain=$(".form-control select_wid").val();
      	    var language=$(".checkbox-inline").val();
      	        msg=$(".form-control").val();
      	    var level=$(".form-control level").val();
      	    var domainoptions = $("#domain option");
      	    var leveloptions=$("#level option");
      	    var degree=$("#degree option:selected").val();
      	    //给予模糊查询字段赋值msg
			$("#msg").prop("value", msgs);
            $.post("/translator/translatorAction_queryByAll.do","pageNum="+1+"&domains="+domains+"&language="+languages+"&msg="+msgs+"&levels="+levels+"&degree="+degree,function(data){
            	//给予o进行赋值重新初始化时不执行方法
				o = 2;
				//获取page对象
			  var page = data.page;
              var domains=data.domainList; 
          	  var trans=data.translatorList;
          	  var translevel=data.translatorLevel;
          	var cards_one = "<div class='append_card'><div style='border-radius:10px;' class='cards_one text-right fl' style='border-radius:10px;height:300px;'><img class='card_img' id='transPhoto' src='/img/tuxiang.jpg ' alt='' width='80' height='90' ><p style='color: #000088;width:195px;margin-left:20px;text-align: left;'><span class='card_name' id='nickname'></span></p><p hidden=''><span id='transId'></span></p><p><span id='level' ></span></p><p><span id='languages'></span></p><p><span id='degree'></span></p><div class='texts_left'><p style='padding-top:20px'><spring:message  code='专业领域：'/><span id='trandomain'></span></p><p id='checkTransT'><spring:message  code='翻译经验：'/><span id='tranTotals'></span></p><p id='checkProoT'><spring:message  code='校对经验：'/><span id='prooTotals'></span></p></div><div class='append_card_btn'><a href='' class='append_card_btn01' id='checkTrans'><spring:message  code='选'/>TA</a><a href='' class='append_card_btn02' id='lookTrans' ><spring:message  code='详情'/></a></div></div></div>";
             //二次点击删除之前卡片信息
          	 $(".append_card").remove();
             for(var i=0;i<trans.length;i++){
               $("#transDiv").append(cards_one);
             }
          	  var append_nickname=$(".append_card [id=nickname]");
          	  var append_transId=$(".append_card [id=transId]");
          	  var append_level=$(".append_card [id=level]");
          	  var append_language=$(".append_card [id=languages]");
          	  var append_degree=$(".append_card [id=degree]");
          	  var append_domain=$(".append_card [id=trandomain]");
          	 var append_checkTrans=$('.append_card [id=checkTrans]');
          	  var indexCard=$(".append_card");
          	 var append_transphoto=$(".append_card [id=transPhoto]");
              var lookTrans=$(".append_card [id=lookTrans]");
              var append_tranTotal=$(".append_card [id=tranTotals]");
          	  var transTotal=$(".append_card [id=checkTransT]");
          	  var append_prooTotal=$(".append_card [id=prooTotals]");
          	  var prooTotal=$(".append_card [id=checkProoT]");
          	  var append_card_btn=$(".append_card_btn");
          	  for(var m=0;m<append_nickname.length;m++){
          		 if(trans.length>=(m+1)){
          			  append_nickname[m].innerHTML=trans[m].nickname;
          			  append_transId[m].innerHTML=trans[m].id;
          			if(trans[m].language =='EN'){
       				 append_language[m].innerHTML='<spring:message  code="英语"/>';
       			  }else if(trans[m].language =='JP'){
       				append_language[m].innerHTML='<spring:message  code="日语"/>';
       			  }else if(trans[m].language =='KOR'){
       				append_language[m].innerHTML='<spring:message  code="韩语"/>'; 
       			  }else if(trans[m].language =='FR'){
       				append_language[m].innerHTML='<spring:message  code="法语"/>'; 
       			  }else if(trans[m].language =='GER')
       				append_language[m].innerHTML='<spring:message  code="德语"/>';
          			var domainCard=trans[m].domain.split(",");
				   	//alert(domainCard[0])
				   	for(var z=0;z<domainCard.length;z++){
				   		if(domainCard[z]=='日常'){
				   			domainCard[z]="<spring:message  code='日常'/>"
		  				}else if(domainCard[z]=='机械'){
		  					domainCard[z]="<spring:message  code='机械'/>"
		  				}else if(domainCard[z]=='电子'){
		  					domainCard[z]="<spring:message  code='电子'/>"
		  				}else if(domainCard[z]=='电器'){
		  					domainCard[z]="<spring:message  code='电器'/>"
		  				}else if(domainCard[z]=='机电'){
		  					domainCard[z]="<spring:message  code='机电'/>"
		  				}else if(domainCard[z]=='自动化'){
		  					domainCard[z]="<spring:message  code='自动化'/>"
		  				}else if(domainCard[z]=='计算机'){
		  					domainCard[z]="<spring:message  code='计算机'/>"
		  				}else if(domainCard[z]=='通信'){
		  					domainCard[z]="<spring:message  code='通信'/>"
		  				}else if(domainCard[z]=='网络'){
		  					domainCard[z]="<spring:message  code='网络'/>"
		  				}else if(domainCard[z]=='物理'){
		  					domainCard[z]="<spring:message  code='物理'/>"
		  				}else if(domainCard[z]=='化学'){
		  					domainCard[z]="<spring:message  code='化学'/>"
		  				}else if(domainCard[z]=='化工'){
		  					domainCard[z]="<spring:message  code='化工'/>"
		  				}else if(domainCard[z]=='医药'){
		  					domainCard[z]="<spring:message  code='医药'/>"
		  				}else if(domainCard[z]=='生化'){
		  					domainCard[z]="<spring:message  code='生化'/>"
		  				}
				   	}
				   	
				   	var b = domainCard.join("，");
				   	/* alert(b); */
				    if(b!=null && b!=""){
				    	if(b.length >6){
					    	b= b.slice(0,5)+"...";
					    }
				    }
				    append_domain[m].innerHTML=b; 
				   	
       				/* if(trans[m].domain.length > 10){
          				append_domain[m].innerHTML= trans[m].domain.slice(0,9)+"...";
				    }else{
				    	 append_domain[m].innerHTML=trans[m].domain; 
				    } */	
				    if(trans[m].level == 1){
          				append_level[m].innerHTML = "<font size='4px' color='#888888'><b>★</b></font>"
 				    }else if(trans[m].level == 2){
          				append_level[m].innerHTML = "<font size='4px' color='#00AAAA'><b>★★</b></font>"
 				    }else if(trans[m].level == 3){
          				append_level[m].innerHTML = "<font size='4px' color='#00AA00'><b>★★★</b></font>"
 				    }else if(trans[m].level == 4){
 				    	append_level[m].innerHTML= "<font size='4px' color='	#FFBB00'><b>★★★★</b></font>"
 				    }else if(trans[m].level == 5){
 				    	append_level[m].innerHTML = "<font size='4px' color='	#FF0000'><b>★★★★★</b></font>"
 				    }
  				  if(trans[m].degree=="大专"){
 					    append_degree[m].innerHTML="<spring:message  code='大专'/>";
				    }
				    if(trans[m].degree=="本科"){
				    	 append_degree[m].innerHTML="<spring:message  code='本科'/>";
				    }
				    if(trans[m].degree=="研究生"){
				    	 append_degree[m].innerHTML="<spring:message  code='本科'/>";
				    }
				    if(trans[m].degree=="硕士"){
				    	 append_degree[m].innerHTML="<spring:message  code='硕士'/>";
				    }
				    if(trans[m].degree=="博士"){
				    	 append_degree[m].innerHTML="<spring:message  code='博士'/>";
				    }
				    if(trans[m].degree=='' ||trans[m].degree==null ){
				    	append_degree[m].setAttribute("style", "margin-top:54px");
				    }
          			if(trans[m].userUrl!=null){
          				userUrl="/"+trans[m].userUrl;
          			}else{
          				userUrl="/img/tuxiang.jpg";
          			}
          			if(trans[m].majorTotals!=0){
          				append_tranTotal[m].innerHTML=trans[m].majorTotals+"字";
				    }else{
				    	transTotal[m].style.display="none";
				    	append_card_btn[m].setAttribute("style", "margin-top:30px");
				    }
				    if(trans[m].prooTotals!=0){
				    	append_prooTotal.innerHTML=trans[m].prooTotals+"字";
				    }else{
				    	prooTotal[m].style.display="none";
				    	append_card_btn[m].setAttribute("style", "margin-top:30px");
				    }
				    if(trans[m].majorTotals==0 && trans[m].prooTotals==0 ){
				    	transTotal[m].style.display="none";
				    	prooTotal[m].style.display="none";
				    	append_card_btn[m].setAttribute("style", "margin-top:54px");
				    }
          			if(clientid!='' || clientid!="" ){
          				$(".append_card [id=checkTrans]").attr("onclick","findTransQuotation('"+trans[m].id+"')"); 
          				checkUrl="javaScript:void(0);";
          			}else{
          				$(".append_card [id=checkTrans]").attr("onclick","findClient();");
          				checkUrl="javaScript:void(0);";
          			}
          			append_checkTrans[m].setAttribute("href",checkUrl);
          			append_transphoto[m].setAttribute("src",userUrl);
          			lookTrans[m].setAttribute("href","/translator/translatorAction_findTransById.do?transId="+trans[m].id);
			 	    } 
			}
          	//判断总记录数是否为0 
				if(page.totalCount==0){
					//初始化页面将总记录数为1
					$("#page").initPage(1,page.pageNum, GG.kk); 
					//弹出框提示没有信息
					layer.msg("<spring:message  code='尚未查询相关译员信息！'/>", {icon: 5});
				}else{
					//如果不为0则初始化页面
					$("#page").initPage(page.totalCount,page.pageNum, GG.kk); 
				}
            },"json");
			         } 
    		 })
		});
    })
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
    	      		 layer.msg("<spring:message  code='译员名不能为空！'/>", {icon: 2});
    	      	 }
    	   		
    	   	}
    	    function findClient(){
    	     layer.msg( '<spring:message  code="您不是客户，不能进行选定译员操作！"/>',{icon: 5});
    	   }
    	    function findTransQuotation(id){
        	    var url="/translator/translatorAction_findTransQuotation.do";
        	    $.post(url,"id="+id,function(data){
        	    	if(data.result=="success"){
     	  			  window.location.href="/cilentCustomer/transInfo.do?id="+id+"+&type=checkTrans";
        	    	}else{
        	    	  layer.msg( '<spring:message  code="该译员尚未完善个人报价信息，请重新选择"/>',{icon: 5});	
        	    	}
        	   },"json");
           } 
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

//   	             var pageCount = 1;
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
    </script>
    <style type="text/css">
    	.rowlabel {
			text-align: right;
			padding: 6px;
		}
		.row {
		    margin-top: 30px;
		}
		.radiolang {
			font-size: 18px;
			width:18%;
			text-align: center;
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
   <!--  <div class="container">
       logo 搜索栏 
      <nav class="publickSearch"></nav> -->

      <!--  内容头部导航  -->
      <!-- <div class="contentNav"></div> -->

      <div class="interpreter_conts">
        <!--  搜索翻译人员  -->
        <div class="interpreter_search">
          <form class="form-inline">
          		<div class="row">
               		<label  class="col-xs-2 rowlabel"><b><spring:message code='项目领域'/></b></label>
              		<div class="col-xs-2">
              			<select class="form-control select_wid" style="width:100%;" name="" id="domain">
			                <option value="0"><spring:message  code="请选择所属领域"/></option>
			                <option value="日常"><spring:message  code="日常"/></option>
			                <option value="机械"><spring:message  code="机械"/></option>
			                <option value="电子"><spring:message  code="电子"/></option>
			                <option value="电器"><spring:message  code="电器"/></option>
			                <option value="机电"><spring:message  code="机电"/></option>
			                <option value="自动化"><spring:message  code="自动化"/></option>
			                <option value="计算机"><spring:message  code="计算机"/></option>
			                <option value="通讯"><spring:message  code="通讯"/></option>
			                <option value="网络"><spring:message  code="网络"/></option>
			                <option value="物理"><spring:message  code="物理"/></option>
			                <option value="化学"><spring:message  code="化学"/></option>
			                <option value="化工"><spring:message  code="化工"/></option>
			                <option value="医药"><spring:message  code="医药"/></option>
			                <option value="生化"><spring:message  code="生化"/></option>
			            </select>
              		</div>
              		
              		<label  class="col-xs-1 rowlabel"><b><spring:message code='译员等级'/></b></label>
              		<div class="col-xs-2">
              			<select class="form-control level" style="width:100%;" name="" id="level">
			                <option value=""><spring:message  code="请选择等级"/></option>
			                <option value="3">3<spring:message  code="级"/></option>
			                <option value="4">4<spring:message  code="级"/></option>
			                <option value="5">5<spring:message  code="级"/></option>
			            </select>
              		</div>
              		
              		<label  class="col-xs-1 rowlabel"><b><spring:message code='译员学历'/></b></label>
              		<div class="col-xs-2">
              			<select class="form-control degree" style="width:100%;" name="" id="degree">
			                <option value=""><spring:message  code="请选择学历"/></option>
			                <option value="大专"><spring:message  code="大专"/></option>
			                <option value="本科"><spring:message  code="本科"/></option>
			                <option value="硕士"><spring:message  code="硕士"/></option>
			                <option value="博士"><spring:message  code="博士"/></option>
			            </select>
              		</div>
              	</div>
              	
              	<div class="row">
               		<label  class="col-xs-2 rowlabel"><b><spring:message code='选择语种'/></b></label>
              		<div class="col-xs-8">
              			<label class="checkbox-inline radiolang">
              				<input type="radio" name="language" value="汉英" ><spring:message  code="汉英"/>
              			</label> 
              			<label class="checkbox-inline radiolang" style="width:18%">
              				<input type="radio" name="language" value="英汉"><spring:message  code="英汉"/>
              			</label>
              			<label class="checkbox-inline radiolang" style="width:18%">
              				<input type="radio" name="language" value="日汉"><spring:message  code="日汉"/> 
						</label> 
						<label class="checkbox-inline radiolang" style="width:18%">
							<input type="radio" name="language"" value="汉日"><spring:message  code="汉日"/> 
						</label>
						<label class="checkbox-inline radiolang" style="width:18%">
							<input type="radio" name="language" value="韩汉"><spring:message  code="韩汉"/> 
						</label>
						<label style="width: 100%;height:5px;"></label>
						<label class="checkbox-inline radiolang">
							<input type="radio" name="language" value="汉韩"><spring:message  code="汉韩"/> 
						</label>
						<label class="checkbox-inline radiolang">
							<input type="radio" name="language" value="法汉"><spring:message  code="法汉"/> 
						</label>
						<label class="checkbox-inline radiolang">
							<input type="radio" name="language" value="汉法"><spring:message  code="汉法"/>
						</label>
						<label class="checkbox-inline radiolang">
							<input type="radio" name="language" value="德汉"><spring:message  code="德汉"/>
						</label>
						<label class="checkbox-inline radiolang">
							<input type="radio" name="language" value="汉德"><spring:message  code="汉德"/>
						</label>
              		</div>
              	</div>
              	
              	<div class="row">
               		<label  class="col-xs-2 rowlabel"><b><spring:message code='译员姓名'/></b></label>
              		<div class="col-xs-8">
              			<input type="text" class="form-control" style="width:100%;" placeholder="<spring:message  code="请输入要查询的译员姓名"/>" id="msg">
              		</div>
              	</div>
              	
              	<div class="row" style="margin-top: 5px;">
               		<label  class="col-xs-9 rowlabel"><b></b></label>
              		<div class="col-xs-1">
              			<button class="btn btn-default btn-primary" type="button" id="button"><spring:message  code="搜索"/></button>
              		</div>
              	</div>
            <%-- <div class="form-group">
            
              <select class="form-control select_wid" name="" id="domain">
                <option value="0"><spring:message  code="请选择所属领域"/></option>
              </select>
            </div> --%>
            
            <%-- <div class="form-group">
              <select class="form-control level" name="" id="level">
                <option value=""><spring:message  code="请选择等级"/></option>
              </select>
            </div> --%>
            <!-- <div class="form-group" >
              <select class="form-control rank" name="" id="rank">
                <option value="">排名</option>
                <option value="desc">从低到高</option>
                <option value="asc">从高到低</option>
              </select>
            </div> -->
            <%-- <div class="input-group pull-center" >
              <input type="text" class="form-control" style="width:340px;" placeholder="<spring:message  code="请输入要查询的译员姓名"/>" id="msg">
              <span class="input-group-btn">
                <button class="btn btn-default" type="button" id="button"><spring:message  code="搜 索"/></button>
              </span>
            </div> --%>
          </form>
          <%-- <div class="checks_langu row">
            <span class="col-sm-1"><spring:message  code="选择语种："/></span>
            <div class="col-sm-10">
             <label class="checkbox-inline"> <input type="radio"
						name="language" value="汉英" ><spring:message  code="汉译英"/>
					</label> <label class="checkbox-inline"> <input type="radio"
						name="language" value="英汉"><spring:message  code="英译汉"/> 
					</label> <label class="checkbox-inline"> <input type="radio"
						name="language" value="日汉"><spring:message  code="日译汉"/> 
					</label> <label class="checkbox-inline"> <input type="radio"
						name="language" value="汉日"><spring:message  code="汉译日"/> 
					</label> <label class="checkbox-inline"> <input type="radio"
						name="language" value="韩汉"><spring:message  code="韩译汉"/> 
					</label> <label class="checkbox-inline"> <input type="radio"
						name="language" value="汉韩"><spring:message  code="汉译韩"/> 
					</label> <label class="checkbox-inline"> <input type="radio"
						name="language" value="法汉"><spring:message  code="法译汉"/> 
					</label> <label class="checkbox-inline"> <input type="radio"
						name="language" value="汉法"><spring:message  code="汉译法"/>
					</label>
					
			   <div class="checbox_all">
						<label class="checkbox-inline"> <input type="radio"
							name="language" value="德汉"> <spring:message  code="德译汉"/>
						</label> <label class="checkbox-inline"> <input type="radio"
							name="language" value="汉德"> <spring:message  code="汉译德"/>
						</label>
					</div>		
              <span class="checkbox-inline checkbox_click"><spring:message  code="展示更多"/> <i class="fa fa-angle-double-right" aria-hidden="true"></i></span>
            </div>
          </div> --%>
        </div>

        <!--  译员展示   -->
        <div class="row">
        	<div id="transDiv" style='width:84%;margin-left: 7%;float: left;'></div>
        </div>
        
        <div class="clear"></div>
        <!--currentpage="1" numbercount="100"-->
        <div class="common_problem_page" style="padding-top:30px;"><ul class="page pull-right" maxshowpageitem="5" pagelistcount="8"  id="page"></ul></div>
        <div class="clear"></div>
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
</html>
