<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title><spring:message  code='译员中心-我是译员--寻找项目'/></title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.center.css"/>
    <link href="${pageContext.request.contextPath}/css/page.css" type="text/css" rel="stylesheet"/>
    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.center.js"></script> --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.customer.myneeds.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
	<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
   <%--  <script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script> --%>
    <style type="text/css">
    .keyword{color: red;font-weight: bold }
    #tip {width: 273px;height: 200px;border: 1px #B3B3B3 solid; display: none}
    </style>
    <script type="text/javascript">
    var lang = "${language}"
    	if(lang==""){
    		lang="zh";
    	}
     
	  
	    
     $(function(){
    	 
    	/* var tnickname = "${transid.nickname}";
 		var unickname = "${clientid.userName}"
 		if(tnickname!=""){
 			$("#nickname").text(tnickname+"<spring:message  code='，欢迎您！'/>");
 			
 		}else if (unickname!="") {
 			$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>!");
 			} */
    	 if("${transid.nickname}"!=null && "${transid.nickname}"!=''){
       	  $("#nickname").text("${transid.nickname}"+"<spring:message  code='，欢迎您！'/>");
         }else if("${transid.tel}"!=null && "${transid.tel}"!=''){
       	  $("#nickname").text("${transid.tel}"+"<spring:message  code='，欢迎您！'/>");
         }else if("${transid.email}"!=null && "${transid.email}"!=''){
       	  $("#nickname").text("${transid.email}"+"<spring:message  code='，欢迎您！'/>");
         }
 		
 		
    //项目展示分页	 
    	var totalCount = '${page.totalCount }';
    	var pageNum = '${page.pageNum}';
    	var msg ="";
    	var x=0;
    	var title="";
    	var publishModel="";
    	var publishway="";
    	var acceptState="";
       // currentPage 当前页码
       
      var GG = {
          "kk":function(mm){
        	  if(isNaN(mm)){
    	    		mm=1;
    	    	};
    	    	if(x!=2){ 
    	    		 type="mytask";
    	    		 jQuery.i18n.properties({
    				        name:'Messages', 
    				        path:'/i18n/', 
    				        mode:'both',
    				   		language:lang,
    				        checkAvailableLanguages: true,
    				        async: true,
    				        callback: function() {	
    	    	$.post("/translator/translatorAction_queryByPublishNeed.do","pageNum="+mm+"&msg="+msg+"&title="+title+"&publishModel="+publishModel+"&type="+type,function(data){
    	    	   //给予模糊查询字段赋值msg
					$("#queryByType").prop("value", msg);
    	    	   var transNeed=data.clientCustomerNeedList;
                   var transNeeds="<li class='myneeds_lists_li'><div class='number_li'><span id='publishTime'></span><span class='number_li_span' id='numberid'></span></div><div class='myneeds_lists_content'><div class='col-sm-6'><p ><spring:message  code='项目领域：'/><span style='padding-right:30px;' id='needDomain'></span><spring:message  code='项目语言：'/><span id='languagePair'></span></p><p class='col-sm-19'><spring:message  code='流程类别：'/><span style='padding-right:30px;' id='procedureTypeId'></span><spring:message  code='项目标题：'/><span id='title'></span></p></div><span class='col-sm-3' id='publishModel'></span><p hidden><span id='needid'></span></p><div class='col-sm-2 pull-right'><button type='button' class='btn btn-info' name='button' style='margin-top:60%;' id='lookNeed'><spring:message  code='查看详情'/><span></span></button></div></div></li> "; 	    		
                   $(".myneeds_lists_li").remove(); 
                  for(var i=0;i<transNeed.length;i++){
    	    	      $(".myneeds_lists").append(transNeeds);
    	    	      }
                      var append_needpublishTime=$(".number_li [id=publishTime]");
                      var append_numberid=$(".number_li [id=numberid]");
    	          	  var append_needDomain=$(".myneeds_lists_content [id=needDomain]");
    	          	  var append_languagePair=$(".myneeds_lists_content [id=languagePair]");
    	          	  var append_procedureTypeId=$(".myneeds_lists_content [id=procedureTypeId]");
    	          	  var append_publishModel=$(".myneeds_lists_content [id=publishModel]");
    	          	  var append_Needid=$(".myneeds_lists_content [id=needid]")
    	          	  var append_lookNeed=$(".myneeds_lists_content [id=lookNeed]")
    	          	  var append_title=$(".myneeds_lists_content [id=title]")
    	          	  var transNeedTitle;
    	          	  for(var j=0;j<transNeed.length;j++){
    	          		 append_needpublishTime[j].innerHTML=transNeed[j].publishTime;
    	          		if (transNeed[j].title.length >= 10) {
    	          			transNeedTitle=transNeed[j].title
									.substring(0, 10)
									+ "...";
						} else {
							transNeedTitle = transNeed[j].title;
						}
					     append_title[j].innerHTML=transNeedTitle;
    	          		 append_numberid[j].innerHTML='<spring:message  code="项目案号:"/>'+'&nbsp;'+transNeed[j].needReference;
    	          			if(transNeed[j].domainId=='12'){
    	          				append_needDomain[j].innerHTML='<spring:message  code="日常"/>';
    	          			}else if(transNeed[j].domainId=='13'){
    	          				append_needDomain[j].innerHTML='<spring:message  code="机械"/>';
    	          			}else if(transNeed[j].domainId=='14'){
    	          				append_needDomain[j].innerHTML='<spring:message  code="电子"/>';
    	          			}else if(transNeed[j].domainId=='15'){
    	          				append_needDomain[j].innerHTML='<spring:message  code="电器"/>';
    	          			}else if(transNeed[j].domainId=='16'){
    	          				append_needDomain[j].innerHTML='<spring:message  code="机电"/>';
    	          			}else if(transNeed[j].domainId=='17'){
    	          				append_needDomain[j].innerHTML='<spring:message  code="自动化"/>';
    	          			}else if(transNeed[j].domainId=='18'){
    	          				append_needDomain[j].innerHTML='<spring:message  code="计算机"/>';
    	          			}else if(transNeed[j].domainId=='19'){
    	          				append_needDomain[j].innerHTML='<spring:message  code="通信"/>';
    	          			}else if(transNeed[j].domainId=='20'){
    	          				append_needDomain[j].innerHTML='<spring:message  code="网络"/>';
    	          			}else if(transNeed[j].domainId=='21'){
    	          				append_needDomain[j].innerHTML='<spring:message  code="物理"/>';
    	          			}else if(transNeed[j].domainId=='22'){
    	          				append_needDomain[j].innerHTML='<spring:message  code="化学"/>';
    	          			}else if(transNeed[j].domainId=='23'){
    	          				append_needDomain[j].innerHTML='<spring:message  code="化工"/>';
    	          			}else if(transNeed[j].domainId=='24'){
    	          				append_needDomain[j].innerHTML='<spring:message  code="医药"/>';
    	          			}else if(transNeed[j].domainId=='25'){
    	          				append_needDomain[j].innerHTML='<spring:message  code="生化"/>';
    	          			}
    	          			if(transNeed[j].languagePair=="英汉"){
    	          				transNeed[j].languagePair=jQuery.i18n.prop("language1");
    	        			}else if(transNeed[j].languagePair=="汉英"){
    	        				transNeed[j].languagePair=jQuery.i18n.prop("language2");
    	        			}else if(transNeed[j].languagePair=="日汉"){
    	        				transNeed[j].languagePair=jQuery.i18n.prop("language3");
    	        			}else if(transNeed[j].languagePair=="汉日"){
    	        				transNeed[j].languagePair=jQuery.i18n.prop("language4");
    	        			}else if(transNeed[j].languagePair=="韩汉"){
    	        				transNeed[j].languagePair=jQuery.i18n.prop("language5");
    	        			}else if(transNeed[j].languagePair=="汉韩"){
    	        				transNeed[j].languagePair=jQuery.i18n.prop("language6");
    	        			}else if(transNeed[j].languagePair=="徳汉"){
    	        				transNeed[j].languagePair=jQuery.i18n.prop("language7");
    	        			}else if(transNeed[j].languagePair=="汉德"){
    	        				transNeed[j].languagePair=jQuery.i18n.prop("language8");
    	        			}else if(transNeed[j].languagePair=="法汉"){
    	        				transNeed[j].languagePair=jQuery.i18n.prop("language9");
    	        			}else if(transNeed[j].languagePair=="汉法"){
    	        				transNeed[j].languagePair=jQuery.i18n.prop("language10");
    	        			}
    	          	      append_languagePair[j].innerHTML=transNeed[j].languagePair;
    	          	      transNeed[j].procedureTypeId
    	          		if(transNeed[j].procedureTypeId=='1'){
    	          			append_procedureTypeId[j].innerHTML='<spring:message  code="仅翻译"/>';
    	          		}else if(transNeed[j].procedureTypeId=='2'){
    	          			append_procedureTypeId[j].innerHTML='<spring:message  code="翻译校对"/>';
    	          		}else if(transNeed[j].procedureTypeId=='3'){
    	          			append_procedureTypeId[j].innerHTML='<spring:message  code="翻译校对审核"/>';
    	          		}
    	          		  if(transNeed[j].publishModel=='主动投标模式'){
    	          			append_publishModel[j].innerHTML='<spring:message  code="主动投标模式"/>' ;
    	          		}else if(transNeed[j].publishModel=='选定译员模式'){
    	          			append_publishModel[j].innerHTML='<spring:message  code="选定译员模式"/>' ;
    	          		}else if(transNeed[j].publishModel=='系统分配模式'){
    	          			append_publishModel[j].innerHTML='<spring:message  code="系统分配模式"/>' ;
    	          		} 
    	          		/* append_publishModel[j].innerHTML=transNeed[j].publishModel; */ 
    	          		append_Needid[j].innerHTML=transNeed[j].id;
    	          		append_lookNeed[j].setAttribute("onclick","lookNeed("+transNeed[j].id+")");
    	          	  }
      	  },"json");
    		      }
    		 })	
    	   }
    	   x=1;
        }	
       }
      //判断总记录数是否为0
      if(totalCount==0){
      	//弹出框提示没有信息
  	         layer.msg('<spring:message  code="尚未查询到该项目信息！"/>', {icon: 5}); 
  	         $("#page").initPage(1, 1, 0);
        }else{
      	  $("#page").initPage(totalCount, pageNum, GG.kk);
        }
        
      $("#search").click("click", function() {// 绑定查询按扭
    	  findTransTask();
      });
      $("#publishway").change(function(){
        	 findTransTask();
         });
       function findTransTask(){
  
   		 msg=$("#queryByType").val();
   		publishModel=$("#publishway").val();
   	
   		acceptState=$("#acceptState").val();
         x = 2;
         type="accept";
         jQuery.i18n.properties({
		        name:'Messages', 
		        path:'/i18n/', 
		        mode:'both',
		   		language:lang,
		        checkAvailableLanguages: true,
		        async: true,
		        callback: function() {	
	      $.post("/translator/translatorAction_queryByPublishNeed.do","pageNum="+1+"&msg="+msg+"&title="+title+"&publishModel="+publishModel+"&type="+type+"&thirdmsg="+msg,function(data){
	    	  //给予模糊查询字段赋值msg
			   $("#queryByType").prop("value", msg);
	    	  var transNeed=data.clientCustomerNeedList;
	    	  var transNeeds="<li class='myneeds_lists_li'><div class='number_li'><span id='publishTime'></span><span class='number_li_span' id='numberid'></span></div><div class='myneeds_lists_content'><div class='col-sm-6'><p ><spring:message  code='项目领域：'/><span style='padding-right:30px;' id='needDomain'></span><spring:message  code='项目类别：'/><span id='languagePair'></span></p><p class='col-sm-19'><spring:message  code='流程类别：'/><span style='padding-right:30px;' id='procedureTypeId'></span><spring:message  code='项目标题：'/><span id='title'></span></p></div><span class='col-sm-3' id='publishModel'></span><p hidden><span id='needid'></span></p><div class='col-sm-2 pull-right'><button type='button' class='btn btn-info' name='button' style='margin-top:60%;' id='lookNeed'><spring:message  code='查看详情'/><span></span></button></div></div></li> ";  
              $(".myneeds_lists_li").remove();
                 for(var i=0;i<transNeed.length;i++){
	    	      $(".myneeds_lists").append(transNeeds);
	    	      }
              var append_needpublishTime=$(".number_li [id=publishTime]");
              var append_numberid=$(".number_li [id=numberid]");
           	  var append_needDomain=$(".myneeds_lists_content [id=needDomain]");
          	  var append_languagePair=$(".myneeds_lists_content [id=languagePair]");
          	  var append_procedureTypeId=$(".myneeds_lists_content [id=procedureTypeId]");
          	  var append_publishModel=$(".myneeds_lists_content [id=publishModel]");
          	  var append_Needid=$(".myneeds_lists_content [id=needid]")
          	  var append_lookNeed=$(".myneeds_lists_content [id=lookNeed]")
          	  var append_title=$(".myneeds_lists_content [id=title]")
          	   var checkMsg=$("#queryByType").val();
	          	  for(var j=0;j<transNeed.length;j++){
	          		 transNeedTitle=transNeed[j].title;
 	          		if (checkMsg != "" && checkMsg != null&& checkMsg != undefined) {
							if (transNeedTitle.indexOf(checkMsg) >= 0) {
								var str1 = transNeedTitle.substring(0,transNeedTitle.indexOf(checkMsg));
								var str2 = transNeedTitle.substring((transNeedTitle.indexOf(checkMsg) + checkMsg.length),transNeedTitle.length)
								transNeedTitle = str1+ "<font color=red>"+ checkMsg + "</font>"+ str2;
								if(transNeedTitle.length >= 10){
									transNeedTitle=transNeedTitle
									.substring(0, 35)
									+ "...";
								}
								append_title[j].innerHTML=transNeedTitle;
							}
						}else{
							 append_title[j].innerHTML=transNeed[j].title;
						}  
	          		append_needpublishTime[j].innerHTML=transNeed[j].publishTime;
	          		append_numberid[j].innerHTML="<spring:message  code='项目案号:'/>"+'&nbsp;'+transNeed[j].needReference;
	          		if(transNeed[j].domainId=='12'){
          				append_needDomain[j].innerHTML='<spring:message  code='日常'/>';
          			}else if(transNeed[j].domainId=='13'){
          				append_needDomain[j].innerHTML='<spring:message  code="机械"/>';
          			}else if(transNeed[j].domainId=='14'){
          				append_needDomain[j].innerHTML='<spring:message  code="电子"/>';
          			}else if(transNeed[j].domainId=='15'){
          				append_needDomain[j].innerHTML='<spring:message  code="电器"/>';
          			}else if(transNeed[j].domainId=='16'){
          				append_needDomain[j].innerHTML='<spring:message  code="机电"/>';
          			}else if(transNeed[j].domainId=='17'){
          				append_needDomain[j].innerHTML='<spring:message  code="自动化"/>';
          			}else if(transNeed[j].domainId=='18'){
          				append_needDomain[j].innerHTML='<spring:message  code="计算机"/>';
          			}else if(transNeed[j].domainId=='19'){
          				append_needDomain[j].innerHTML='<spring:message  code="通信"/>';
          			}else if(transNeed[j].domainId=='20'){
          				append_needDomain[j].innerHTML='<spring:message  code="网络"/>';
          			}else if(transNeed[j].domainId=='21'){
          				append_needDomain[j].innerHTML='<spring:message  code="物理"/>';
          			}else if(transNeed[j].domainId=='22'){
          				append_needDomain[j].innerHTML='<spring:message  code="化学"/>';
          			}else if(transNeed[j].domainId=='23'){
          				append_needDomain[j].innerHTML='<spring:message  code="化工"/>';
          			}else if(transNeed[j].domainId=='24'){
          				append_needDomain[j].innerHTML='<spring:message  code="医药"/>';
          			}else if(transNeed[j].domainId=='25'){
          				append_needDomain[j].innerHTML='<spring:message  code="生化"/>';
          			}
	          		if(transNeed[j].languagePair=="英汉"){
          				transNeed[j].languagePair=jQuery.i18n.prop("language1");
        			}else if(transNeed[j].languagePair=="汉英"){
        				transNeed[j].languagePair=jQuery.i18n.prop("language2");
        			}else if(transNeed[j].languagePair=="日汉"){
        				transNeed[j].languagePair=jQuery.i18n.prop("language3");
        			}else if(transNeed[j].languagePair=="汉日"){
        				transNeed[j].languagePair=jQuery.i18n.prop("language4");
        			}else if(transNeed[j].languagePair=="韩汉"){
        				transNeed[j].languagePair=jQuery.i18n.prop("language5");
        			}else if(transNeed[j].languagePair=="汉韩"){
        				transNeed[j].languagePair=jQuery.i18n.prop("language6");
        			}else if(transNeed[j].languagePair=="徳汉"){
        				transNeed[j].languagePair=jQuery.i18n.prop("language7");
        			}else if(transNeed[j].languagePair=="汉德"){
        				transNeed[j].languagePair=jQuery.i18n.prop("language8");
        			}else if(transNeed[j].languagePair=="法汉"){
        				transNeed[j].languagePair=jQuery.i18n.prop("language9");
        			}else if(transNeed[j].languagePair=="汉法"){
        				transNeed[j].languagePair=jQuery.i18n.prop("language10");
        			}
	          		append_languagePair[j].innerHTML=transNeed[j].languagePair;
	          		if(transNeed[j].procedureTypeId=='1'){
	          			append_procedureTypeId[j].innerHTML='<spring:message  code="仅翻译"/>';
	          		}else if(transNeed[j].procedureTypeId=='2'){
	          			append_procedureTypeId[j].innerHTML='<spring:message  code="翻译校对"/>';
	          		}else if(transNeed[j].procedureTypeId=='3'){
	          			append_procedureTypeId[j].innerHTML='<spring:message  code="翻译校对审核"/>';
	          		}
	          		if(transNeed[j].publishModel=='主动投标模式'){
	          			append_publishModel[j].innerHTML='<spring:message  code="主动投标模式"/>' ;
	          		}else if(transNeed[j].publishModel=='选定译员模式'){
	          			append_publishModel[j].innerHTML='<spring:message  code="选定译员模式"/>' ;
	          		}else if(transNeed[j].publishModel=='系统分配模式'){
	          			append_publishModel[j].innerHTML='<spring:message  code="系统分配模式"/>' ;
	          		} 
	          		append_lookNeed[j].innnerHTML=transNeed[j].id;
	          		
	          		append_lookNeed[j].setAttribute("onclick","lookNeed("+transNeed[j].id+")");
	          	  }   
             //判断总记录数是否为0 
          
             var page=data.page;
	          if(page.totalCount==0){
		      $("#page").initPage(1,page.pageNum, GG.kk); 
		     //弹出框提示没有信息
		       layer.msg('<spring:message  code="尚未查询到该项目信息！"/>', {icon: 5});
	          }else{
		      $("#page").initPage(data.page.totalCount,page.pageNum, GG.kk);
	      }
  	  },"json");
		        }
			})	
      }
    });  
  
     function lookNeed(id){
    	   window.location.href="/translator/translatorAction_findTransNeedById.do?id="+id;
    	  /*  window.open(url, '_blank');//新窗口打开   */
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

//             var pageCount = 1;
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
    
    
  </head>
  <body style="background: #f5f5f5;">
  <!--      顶部导航      -->
  	<c:if test="${clientid.id!=null || transid.id!=null }">
  	<div class="publickNav">
  		<div class="public_nav"> 
           <nav class="container" style="padding:0 20px;"> 
           <div class="navbar-left"><a href="?lang=zh_CN" class="navbar-link" onclick="in18(this)">中文</a> | <a href="?lang=en_US" class="navbar-link" onclick="in18(this)">English</a></div><a style="padding-left:50px;" href="/forwardAction/forward_toIndex.do"><spring:message  code='首页'/></a>
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
   <!--  <div class="publickNav"></div> -->
    <!--  logo 搜索栏  -->
    <div class="container">
      <nav class="publickSearch"></nav>
    </div>

    <!--  用户中心内容  -->
    <div class="user_center">
      <div class="container">
        <div class="title_public">
          <h2><spring:message  code="译员中心"/></h2>
        </div>


        <!--    用户中心 我是客户   -->
        <div class="my_customer">
          <div class="row">

            <!--    用户中心 我是译员 左侧导航   -->
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
           
           
           
           
            <!--    用户中心 我是议员 我的需求 右侧内容   -->
            <div class="my_customer_right col-sm-10">
              <!--  用户中心右侧 tab切换栏   -->
              <ul id="suerTab" class="nav nav-tabs">
              	<li class="active"><a href="" data-toggle="tab" ><spring:message  code='我的项目'/></a></li>
              </ul>

              <div  class="myTabContent" class="tab-content">
                <div class="myneeds_top">
                  <!-- <button type="button" class="btn btn-default col-sm-2" name="button" id="lookmyTask">我的任务</button> -->
                  <div class="col-sm-3">
                    <select class="form-control col-sm-2"  id="publishway" >
                      <option value="%%"><spring:message  code='请选择项目发布方式'/></option>
                      <option value="选定译员模式"><spring:message  code='选定译员模式'/></option>
                      <option value="系统分配模式"><spring:message  code='分配译员模式'/></option>
                      <option value="主动投标模式"><spring:message  code='主动投标模式'/></option>
                    </select>
               <%--  <button class="btn btn-default" type="button" id="search" title="译员可以按三种模式条件进行查看与自己对应的需求并可以选择接受或不接受任务。（除主动投标模式在查看需求中接受，其余任务在用户中心-寻找需求中进行接受）。主动投标模式下译员需要根据自身条件与需求条件进行对比，符合条件方可进行投标。接受任务后形成订单后，平台会第一时间以短信方式对于译员进行通知，督促译员保时保质保量完成需求任务。"><spring:message  code='查看帮助'/></button> --%>
                  </div>
                  <div class="col-sm-3"></div>
                  <!-- <div class="input-group col-sm-4">
                    <input type="text" class="form-control" placeholder="请输入要查询的需求标题"  id="queryByType">
                    <div class="input-group-addon"><i class="fa fa-search" aria-hidden="true" id="search" ></i></div>
                  </div> -->
                  <div class="input-group pull-center" >
              <input type="text" class="form-control" style="width:340px;" placeholder="<spring:message  code='请输入要查询的条件'/>" id="queryByType"  />
              <span class="input-group-btn">
                <button class="btn btn-info" type="button" id="search"><spring:message  code='搜索'/></button>
              </span>
            </div>
                </div>
                <div class="myneeds_body">
                  <ul class="myneeds_lists">
                   <!--  <li class="myneeds_lists_li">
                      <div class="number_li">
                        <span class="number_li_span">编号：</span>
                        <span ></span>
                      </div>
                      <div class="myneeds_lists_content">
                        <div class="col-sm-6">
                          <p class="bg-p-color">需求领域：<span style="padding-right:30px;"></span>需求类别：<span></span></p>
                          <p class="bg-p-color">流程类别：<span style="padding-right:30px;"></span> 完成时间：<span></span></p>
                        </div>
                        <span class="col-sm-2">中标任务</span>
                        <div class="col-sm-2 pull-right">
                          <button type="button" class="btn btn-default yiyuanmore" name="button" style="margin-top:60%;" >查看详情<span></span></button>
                        </div>
                      </div>
                    </li> -->
                    <!-- <li class="myneeds_lists_li">
                      <div class="number_li">
                        <span></span>
                        <span class="number_li_span">编号：</span>
                      </div>
                      <div class="myneeds_lists_content">
                        <div class="col-sm-6">
                          <p class="bg-p-color">需求领域：<span style="padding-right:30px;"></span>需求类别：<span></span></p>
                          <p class="bg-p-color">流程类别：<span style="padding-right:30px;"></span> 完成时间：<span></span></p>
                        </div>
                        <span class="col-sm-2">用户分配任务</span>
                        <div class="col-sm-2 pull-right">
                          <button type="button" class="btn btn-default yiyuanmore" style="margin-top:60%;" name="button" onclick="details()">查看详情<span class="list_badge">2</span></button>
                        </div>
                      </div>
                    </li> -->
                  </ul>

                  <!--currentpage="1" numbercount="100"-->
                  <div class="common_problem_page"><ul class="page pull-right" maxshowpageitem="5" pagelistcount="4"  id="page"></ul></div>
                </div>
                <a href="/cilentCustomer/findNeedListUI.do"><button class="btn btn-info"><spring:message  code='查看招标项目'/></button></a>
              </div>

				



            </div>
            <!--    用户中心 我是客户 我的需求 右侧内容 结束   -->

          </div>
          <!--    用户中心 我是客户 结束   -->
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
         $(".cus_iter_navlists").eq(1).find("a").addClass("useractive")
         
    	 
     })
     
    </script>
  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
