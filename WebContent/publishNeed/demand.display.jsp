<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="com.web.domain.ClientCustomerNeed"%> --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name=" Keywords" content="......">
<!--content中，网页关键字-->
<meta name=" description" content="......">
<!--content中，网页描述文字-->
<meta name="author" content="......">
<!--标注作者-->
<title><spring:message code='项目展示'/></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/public.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/page.css" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/demand.display.css" />
<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/interpreter.cards.css" type="text/css"/> --%>

<script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/js/public.nav.footer.js"></script> --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/all.needs.js"></script>
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/js/page.js"></script> --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
<style type="text/css">
	.divCol-sm-10{
		right:50px
	}
	.rowlabel {
		text-align: right;
		padding: 6px;
	}
	.row {
	    margin-top: 25px;
	}
	.checkbox-inline{
		width:90px;
	}
</style>
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

//            var pageCount = 1;
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
            appendStr+="<li class='"+prePageClass+"' page-data='1' page-rel='firstpage'><spring:message code='首页'/></li>";
            appendStr+="<li class='"+prePageClass+"' page-data='"+prePage+"' page-rel='prepage'>&lt;<spring:message code='上一页'/></li>";
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
            appendStr+="<li class='"+nextPageClass+"' page-data='"+nextPage+"' page-rel='nextpage'><spring:message code='下一页'/>&gt;</li>";
            appendStr+="<li class='"+nextPageClass+"' page-data='"+pageCount+"' page-rel='lastpage'><spring:message code='尾页'/></li>";
           return appendStr;

        }
    }
    
    
</script>
<script type="text/javascript">
	$(function() {
		if("${transid}"!=null && "transid"!=''){
			if("${transid.nickname}"!=null && "${transid.nickname}"!=''){
	        	  $("#nickname").text("${transid.nickname}"+"<spring:message  code='，欢迎您！'/>");
	          }else if("${transid.tel}"!=null && "${transid.tel}"!=''){
	        	  $("#nickname").text("${transid.tel}"+"<spring:message  code='，欢迎您！'/>");
	          }else if("${transid.email}"!=null && "${transid.email}"!=''){
	        	  $("#nickname").text("${transid.email}"+"<spring:message  code='，欢迎您！'/>");
	          }
			var mess="";
			if("${transid.certificationStatus}"==3 || "${transid.certificationStatus}"=='3' || "${transid.certificationStatus}"=='0' || "${transid.certificationStatus}"==0){
				mess="<li class='nav_lists_li'><span style='color: white;'>您还没有实名认证</span><a href='/translator/newIdentity.do' style='color: red'>点击这里进行实名认证</a></li>";
			}else if("${transid.isVerifty}"==3 || "${transid.isVerifty}"=='3' || "${transid.isVerifty}"=='0' || "${transid.isVerifty}"==0 || "${transid.isProofread}"==3 || "${transid.isProofread}"=='3' || "${transid.isProofread}"=='0' || "${transid.isProofread}"==0 || "${transid.isAudit}"==3 || "${transid.isAudit}"=='3' ||  "${transid.isAudit}"=='0' ||  "${transid.isAudit}"==0){
				mess="<li class='nav_lists_li'><span style='color: white;'>您还没有资格认证</span><a href='/translator/newLanguage.do' style='color: red'>点击这里进行资格认证</a></li>"
			}
			$("#ulMess").append(mess);
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
			$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>!");
			} */
		
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
	  		/* 
	  		var tnickname = "${transid.nickname}";
	  		var unickname = "${clientid.userName}"
	  		if(tnickname!=""){
	  			$("#nickname").text(tnickname+",欢迎您!");
	  			
	  		}else if (unickname!="") {
	  			$("#nickname").text(unickname+",欢迎您!");
	  			} */

		//总记录数
		var totalCount = '${page.totalCount }';
		//alert(totalCount);
		//当前页
		var pageNum = '${page.pageNum}';
		
		var language="";
		var field="";
		var length="";
		var lev=1000;//随意给值，但必须大于实际等级最高等级
		var cycle="";
		var proce=1000;//随意给值，但必须大于实际最高流程id号
		var msg="";
		
		var o=0;

		var GG = {
			"kk" : function(mm) {
				//给予初始化赋值
				if (isNaN(mm)) {
					mm = 1;
				}
				var yuyan = "";
			if(o!=2){
				$.post("/cilentCustomer/findNeedList.do?mm="+ mm + "&domain=" + field+ "&languagePair=" + language + "&msg="+ msg + "&length=" + length+"&cycle="+cycle+"&lev="+lev+"&procedure="+proce,function(data) {
								if(totalCount>0){ 
									//清除原来的计时器
									var eleTimer=document.getElementsByName("timerInput");
									for(var i=0;i<eleTimer.length;i++){
										var timerNum=eleTimer[i].value;
										//alert(timerNum);
										window.clearInterval(timerNum);
										//alert("ok");
										
									}
									for(var i=0;i<eleTimer.length;){
										document.getElementById("timerDiv").removeChild(eleTimer[i]);
									}
									
									//移除原来的li
									var lis = document.getElementsByName("liname");
									var ul = document.getElementById("needUL");
									for (var i = 0; i < lis.length;) {
										ul.removeChild(lis[i]);
									}
									
									
									//拼接需求卡片
									for (var i = 0; i < data.cusNeedList.length; i++) {
										
										//判断语言
										if ( data.cusNeedList[i].languagePair == '汉英') {
											yuyan = "<p><spring:message code='源语言：'/><span><spring:message code='中文'/></span> <spring:message code='目标语言：'/><spna><spring:message code='英语'/></span>";
										}
										if ( data.cusNeedList[i].languagePair == '英汉') {
											yuyan = "<p><spring:message code='源语言：'/><span><spring:message code='英语'/></span> <spring:message code='目标语言：'/><spna><spring:message code='中文'/></span>";
										}
										if ( data.cusNeedList[i].languagePair == '汉日') {
											yuyan = "<p><spring:message code='源语言：'/><span><spring:message code='中文'/></span> <spring:message code='目标语言：'/><spna><spring:message code='日语'/></span>";
										}
										if ( data.cusNeedList[i].languagePair == '日汉') {
											yuyan = "<p><spring:message code='源语言：'/><span><spring:message code='日语'/></span> <spring:message code='目标语言：'/><spna><spring:message code='中文'/></span>";
										}
										if ( data.cusNeedList[i].languagePair == '汉韩') {
											yuyan = "<p><spring:message code='源语言：'/><span><spring:message code='中文'/></span> <spring:message code='目标语言：'/><spna><spring:message code='韩语'/></span>";
										}
										if ( data.cusNeedList[i].languagePair == '韩汉') {
											yuyan = "<p><spring:message code='源语言：'/><span><spring:message code='韩语'/></span> <spring:message code='目标语言：'/><spna><spring:message code='中文'/></span>";
										}
										if ( data.cusNeedList[i].languagePair == '汉法') {
											yuyan = "<p><spring:message code='源语言：'/><span><spring:message code='中文'/></span> <spring:message code='目标语言：'/><spna><spring:message code='法语'/></span>";
										}
										if ( data.cusNeedList[i].languagePair == '法汉') {
											yuyan = "<p><spring:message code='源语言：'/><span><spring:message code='法语'/></span> <spring:message code='目标语言：'/><spna><spring:message code='中文'/></span>";
										}
										if ( data.cusNeedList[i].languagePair == '汉德') {
											yuyan = "<p><spring:message code='源语言：'/><span><spring:message code='中文'/></span> <spring:message code='目标语言：'/><spna><spring:message code='德语'/></span>";
										}
										if ( data.cusNeedList[i].languagePair == '德汉') {
											yuyan = "<p><spring:message code='源语言：'/><span><spring:message code='德语'/></span> <spring:message code='目标语言：'/><spna><spring:message code='中文'/></span>";
										}

										var need = "<li class='list-group-item' name='liname' style='border-bottom-right-radius: 40px;border: 1px solid #777;'>"
												/* + "<h5>置顶</h5>" */
												+ "<div class='row list_content' style='margin-top:0;'>"
												+ "<div class='col-sm-7 list_one'>"
												+ "<p><span class='text-primary'>&nbsp;"
												+ "<span>"
												+  data.cusNeedList[i].title
												+ "</span></p>"
												+
												yuyan
												+ "</p><p><spring:message code='字数：'/><span>"+data.cusNeedList[i].length+"<spring:message code='字'/></span></p>"
												+ "</div>"
												/* + "<span class='col-sm-1 states'>已托管</span>" */
												+ "<div class='col-sm-4 attend_preson'><p><span class='text-primary' style='color:red;'>￥"+data.cusNeedList[i].totalMoney+"</span></p>"
												+ "<p><a href='/cilentCustomer/lookPublishNeedById.do?id="+data.cusNeedList[i].id+"' target='_blank'><span style='color:blue;'><spring:message code='查看详情'/></span></a></p>"
												+ "<p id='lastTime"+i+"'></p>"
												+ "</div>"
												+ "<div class='col-sm-2'>"
												+ "</div>"
												+ "</div>"
												+ "</li>"
										$("#needUL").append(need);
												
										//倒计时，有效时间
										/*  var lastTime=""; */
										if(data.cusNeedList[i].completeTime!=null && data.cusNeedList[i].completeTime!=''){
											//alert("时间转换前");
											var date = ""+data.cusNeedList[i].completeTime;
											var dateStr = date.replace(/-/g,"/");
											var oDate1 = new Date(dateStr+" 23:59:59");
											//alert("时间转换后");
											var year=oDate1.getFullYear();    //获取完整的年份(4位)
											var month=oDate1.getMonth()+1;       //获取正确月份
											var day=oDate1.getDate();        //获取当前日(1-31)
											var hour=oDate1.getHours();       //获取当前小时数(0-23)
											var minute=oDate1.getMinutes();     //获取当前分钟数(0-59)
											var second=oDate1.getSeconds();
											//alert(year+"------"+month+"---------"+day)
											//var ele=document.getElementById("lastTime"+i);
											var endtime= year+"/"+month+"/"+day+" "+hour+":"+minute+":"+second;
											/*  var leftTime = (new Date(year,month-1,day,hour,minute,second)) - (new Date()); */ 
											var date1 = new Date();
											date1.setFullYear(year, month-1, day);
											date1.setHours(hour, minute, second, 0);
											var leftTime = (date1.getTime() - new Date().getTime());
											 
											 if(leftTime>0){
												 
												 var s=setInterval("leftTimer("+year+","+month+","+day+","+hour+","+minute+","+second+","+i+")",1000);
												 $("#timerDiv").append("<input name='timerInput' value='"+s+"' type='hidden'>");
												 //clearInterval( setInterval("leftTimer("+year+","+month+","+day+","+hour+","+minute+","+second+","+i+")",1000)) ;
												 
											 }else{
												 //
												 document.getElementById("lastTime"+i).innerHTML ="<spring:message code='已过期'/>";
											 }
												 
											
											/* setInterval("leftTimer("+data.cusNeedList[i].expirydate+","+i+")",1000);  */
											
											/* setInterval(leftTimer(data.cusNeedList[i].expirydate,ele),1000);  */
										}/* else{
											lastTime="";
										}  */  
									}         
								}else{
									layer.alert("<spring:message code='没有找到符合条件的项目'/>", {
										icon: 5,
										title: "<spring:message code='提示'/>"
										});
								} 

							}, "json");
				}
				o=1;//给予搜索后赋予另一个值来进行收索后的翻页执行
			}
		}
		
		//判断总记录数是否为0 
	      if(totalCount==0){
	    	//弹出框提示没有信息
		         layer.msg("<spring:message code='没有找到符合条件的项目'/>", {icon: 5}); 
		         $("#page").initPage(1, 1, 0);
	      }else{
	    	  $("#page").initPage(totalCount, pageNum, GG.kk);
	      }
		//给搜索按钮添加点击事件
		 function findBypage(){
				// alert("进入搜索框查询");
				//整理各种查询条件
				//1.语言
				var language = $("#languagePair").val();
				/* var languagePair = document.getElementsByName("languagePair");
				for (var i = 0; i < languagePair.length; i++) {
					if (languagePair[i].selected) {
						language = languagePair[i].value;
					}
				} */
				// alert("进入搜索框查询"+language);
				//2.领域 
				var field = $("#field").val();
				/* var fileds = document.getElementsByName("field");
				for (var i = 0; i < fileds.length; i++) {
					if (fileds[i].selected) {
						field = fileds[i].value;
					}
				} */
				// alert("进入搜索框查询"+field);
				//等级
				lev = document.getElementById("lev").value;
				//周期
				cycle=document.getElementById("cycle").value;
				//流程
				proce=document.getElementById("proce").value;
				//3.字数
				length = document.getElementById("length").value;
				// alert("进入搜索框查询"+length);
				//4.搜索框
				msg = document.getElementById("searchInput").value; 
				// alert("进入搜索框查询"+msg);
		   $.post("/cilentCustomer/findNeedList.do?mm="+1+ "&domain=" + field+ "&languagePair=" + language + "&msg="+ msg + "&length=" + length+"&cycle="+cycle+"&lev="+lev+"&procedure="+proce,function(data){
			   o=2;
			   
			 //清除原来的计时器
				var eleTimer=document.getElementsByName("timerInput");
				for(var i=0;i<eleTimer.length;i++){
					var timerNum=eleTimer[i].value;
					//alert(timerNum);
					window.clearInterval(timerNum);
					//alert("ok");
					
				}
				for(var i=0;i<eleTimer.length;){
					document.getElementById("timerDiv").removeChild(eleTimer[i]);
				}
				
			   
			   //移除原来的li
				var lis = document.getElementsByName("liname");
				//alert(lis.length);
				var ul = document.getElementById("needUL");
				for (var i = 0; i < lis.length;) {
					//alert(lis.length);
					ul.removeChild(lis[i]);
					//alert(lis.length);
				}

				//拼接需求卡片
				for (var i = 0; i < data.cusNeedList.length; i++) {
					//判断语言
					if ( data.cusNeedList[i].languagePair == '汉英') {
						yuyan = "<p><spring:message code='源语言：'/><span><spring:message code='中文'/></span> <spring:message code='目标语言：'/><spna><spring:message code='英语'/></span>";
					}
					if ( data.cusNeedList[i].languagePair == '英汉') {
						yuyan = "<p><spring:message code='源语言：'/><span><spring:message code='英语'/></span> <spring:message code='目标语言：'/><spna><spring:message code='中文'/></span>";
					}
					if ( data.cusNeedList[i].languagePair == '汉日') {
						yuyan = "<p><spring:message code='源语言：'/><span><spring:message code='中文'/></span> <spring:message code='目标语言：'/><spna><spring:message code='日语'/></span>";
					}
					if ( data.cusNeedList[i].languagePair == '日汉') {
						yuyan = "<p><spring:message code='源语言：'/><span><spring:message code='日语'/></span> <spring:message code='目标语言：'/><spna><spring:message code='中文'/></span>";
					}
					if ( data.cusNeedList[i].languagePair == '汉韩') {
						yuyan = "<p><spring:message code='源语言：'/><span><spring:message code='中文'/></span> <spring:message code='目标语言：'/><spna><spring:message code='韩语'/></span>";
					}
					if ( data.cusNeedList[i].languagePair == '韩汉') {
						yuyan = "<p><spring:message code='源语言：'/><span><spring:message code='韩语'/></span> <spring:message code='目标语言：'/><spna><spring:message code='中文'/></span>";
					}
					if ( data.cusNeedList[i].languagePair == '汉法') {
						yuyan = "<p><spring:message code='源语言：'/><span><spring:message code='中文'/></span> <spring:message code='目标语言：'/><spna><spring:message code='法语'/></span>";
					}
					if ( data.cusNeedList[i].languagePair == '法汉') {
						yuyan = "<p><spring:message code='源语言：'/><span><spring:message code='法语'/></span> <spring:message code='目标语言：'/><spna><spring:message code='中文'/></span>";
					}
					if ( data.cusNeedList[i].languagePair == '汉德') {
						yuyan = "<p><spring:message code='源语言：'/><span><spring:message code='中文'/></span> <spring:message code='目标语言：'/><spna><spring:message code='德语'/></span>";
					}
					if ( data.cusNeedList[i].languagePair == '德汉') {
						yuyan = "<p><spring:message code='源语言：'/><span><spring:message code='德语'/></span> <spring:message code='目标语言：'/><spna><spring:message code='中文'/></span>";
					}

					var need = "<li class='list-group-item' name='liname' style='border-bottom-right-radius: 40px;border: 1px solid #777;'>"
							/* + "<h5>置顶</h5>" */
							+ "<div class='row list_content' style='margin-top:0;'>"
							+ "<div class='col-sm-7 list_one'>"
							+ "<p>&nbsp;"
							+ "<span>"
							+  data.cusNeedList[i].title
							+ "</span></p>"
							+
							yuyan
							+ "</p><p><spring:message code='字数：'/><span>"+data.cusNeedList[i].length+"<spring:message code='字'/></span></p>"
							+ "</div>"
							/* + "<span class='col-sm-1 states'>已托管</span>" */
							+ "<div class='col-sm-4 attend_preson'><p><span class='text-primary' style='color:red;'>￥"+data.cusNeedList[i].totalMoney+"</span></p>"
							+ "<p><a href='/cilentCustomer/lookPublishNeedById.do?id="+data.cusNeedList[i].id+"' target='_blank'><span style='color:blue;'><spring:message code='查看详情'/></span></a></p>"
							+ "<p id='lastTime"+i+"'></p>"
							+ "</div>"
							+ "<div class='col-sm-2'>"
							+ "</div>"
							+ "</div>"
							+ "</li>"
					$("#needUL").append(need);
					
					//倒计时，有效时间
					/*  var lastTime=""; */
					if(data.cusNeedList[i].completeTime!=null && data.cusNeedList[i].completeTime!=''){
						//alert("时间转换前");
						var date = ""+data.cusNeedList[i].completeTime;
						var dateStr = date.replace(/-/g,"/");
						var oDate1 = new Date(dateStr+" 23:59:59");
						//alert("时间转换后");
						var year=oDate1.getFullYear();    //获取完整的年份(4位)
						var month=oDate1.getMonth()+1;       //获取正确月份
						var day=oDate1.getDate();        //获取当前日(1-31)
						var hour=oDate1.getHours();       //获取当前小时数(0-23)
						var minute=oDate1.getMinutes();     //获取当前分钟数(0-59)
						var second=oDate1.getSeconds();
						//alert(year+"------"+month+"---------"+day)
						//var ele=document.getElementById("lastTime"+i);
						 var endtime= year+"/"+month+"/"+day+" "+hour+":"+minute+":"+second;
						/*  var leftTime = (new Date(year,month-1,day,hour,minute,second)) - (new Date()); */ 
						var date1 = new Date();
						date1.setFullYear(year, month-1, day);
						date1.setHours(hour, minute, second, 0);
						var leftTime = (date1.getTime() - new Date().getTime());
						 
						 if(leftTime>0){
							 
							 var s=setInterval("leftTimer("+year+","+month+","+day+","+hour+","+minute+","+second+","+i+")",1000);
							 $("#timerDiv").append("<input name='timerInput' value='"+s+"' type='hidden'>");
							 //clearInterval( setInterval("leftTimer("+year+","+month+","+day+","+hour+","+minute+","+second+","+i+")",1000)) ;
							 
						 }else{
							 document.getElementById("lastTime"+i).innerHTML ="<spring:message code='已过期'/>";
						 }
					}		
				}

				var page=data.page;
				//判断总记录数是否为0 
				if(page.totalCount==0){
					//初始化页面将总记录数为1
					$("#page").initPage(1,page.pageNum, GG.kk); 
					//弹出框提示没有信息
					layer.msg("<spring:message code='没有找到符合条件的项目'/>", {icon: 5});
				}else{
					//如果不为0则初始化页面
					$("#page").initPage(page.totalCount,page.pageNum, GG.kk); 
				}
		   },"json");
		};
		
		
		//搜索按钮点击事件
		$("#searchButton").click(function(){
			findBypage();
		});
	})
	
	function leftTimer(year,month,day,hour,minute,second,i){ 
		
		//String 转化为date类型
		//str = EXPIRYDATE.replace("/-/g", "/");
		     //获取当前秒数(0-59)
	 var leftTime = (new Date(year,month-1,day,hour,minute,second)) - (new Date()); //计算剩余的毫秒数 
	 var days = parseInt(leftTime / 1000 / 60 / 60 / 24 , 10); //计算剩余的天数 
	 var hours = parseInt(leftTime / 1000 / 60 / 60 % 24 , 10); //计算剩余的小时 
	 var minutes = parseInt(leftTime / 1000 / 60 % 60, 10);//计算剩余的分钟 
	 var seconds = parseInt(leftTime / 1000 % 60, 10);//计算剩余的秒数 
	 days = checkTime(days);  
	 hours = checkTime(hours); 
	 minutes = checkTime(minutes); 
	 seconds = checkTime(seconds);
	 //alert(days+"---"+hours);
	// setInterval("leftTimer(EXPIRYDATE)",1000); 
	//var id=;
	//alert("----------"+ele);
	/* alert(document.getElementById("\"lastTime"+num+"\"")); */
	/* if(days.indexOf("-")>0 &&hours.indexOf("-")>0 && minutes.indexOf("-")>0 && seconds.indexOf("-")>0){  */
	if(leftTime<=0){ 
		document.getElementById("lastTime"+i).innerHTML ="<spring:message code='已过期'/>";
	}else{ 
	    document.getElementById("lastTime"+i).innerHTML ="<spring:message code='倒计时：'/>&nbsp;&nbsp;"+days+" <spring:message code='天'/> " + hours+" : " + minutes+" : "+seconds; 
	 } 
	}
	function checkTime(i){ //将0-9的数字前面加上0，例1变为01 
	 if(i<10) 
	 { 
	  i = "0" + i; 
	 } 
	 return i; 
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
</head>
<body style="background: #f5f5f5;">
	<!--      顶部导航      -->
   	<c:if test="${clientid.id!=null || transid.id!=null }">
  	<div class="publickNav">
  		<div class="public_nav"> 
           <nav class="container" style="padding:0 20px;"> 
           <div class="navbar-left"><a href="?lang=zh_CN" class="navbar-link" onclick="in18(this)">中文</a> | <a href="?lang=en_US" class="navbar-link" onclick="in18(this)">English</a></div><a style="padding-left:50px;" href="/forwardAction/forward_toIndex.do"><spring:message  code='首页'/></a>
           <a style="padding-left:50px;"><spring:message  code='帮助热线：'/>010-82895385</a><a style="padding-left:50px;" target="_blank" href="http://www.aitrans.org:8081/"><spring:message  code='爱译社'/></a>
           <div class="navbar-right"> 
           <ul class="list-inline nav_lists" id="ulMess">
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
		<!--  需求展示  开始  -->
		<div class="demand_display_content">
		
			<div class="row">
				<div class="demand_left col-sm-9">
					<div class="demand_form">
					<h2><b><spring:message code='招标项目'/></b></h2>
					<hr>
						<form class="form-inline">
							<div class="row">
								<label class="col-xs-2 rowlabel"><b><spring:message code='选择周期：'/></b></label>
								<div class="col-xs-3">
									<select class="form-control" name="cycle" id="cycle" style="width: 100%">
										<option value="" selected="selected"><spring:message code='请选择'/></option>
										<option value="一般" ><spring:message code='一般'/></option>
										<option value="加急" ><spring:message code='加急'/></option>
										<option value="特急" ><spring:message code='特急'/></option>
									</select>
								</div>
								
								<label class="col-xs-2 rowlabel"><b><spring:message code='选择流程：'/></b></label>
								<div class="col-xs-3">
									<select class="form-control" name="proce" id="proce" style="width: 100%">
										<option value="1000" selected="selected"><spring:message code='请选择'/></option>
										<option value="1" ><spring:message code='仅翻译'/></option>
										<option value="2" ><spring:message code='翻译+校对'/></option>
										<option value="3" ><spring:message code='翻译+校对+审核'/></option>
									</select>
								</div>
							</div>
							
							<div class="row">
								<label class="col-xs-2 rowlabel"><b><spring:message code='字数范围：'/></b></label>
								<div class="col-xs-3">
									<select class="form-control" name="length" id="length" style="width: 100%">
										<option value="" selected="selected"><spring:message code='请选择'/></option>
										<option value="0-1000">1000<spring:message code='字以内'/></option>
										<option value="1000-2000">1000<spring:message code='字'/>—2000<spring:message code='字'/></option>
										<option value="2000-3000">2000<spring:message code='字'/>—3000<spring:message code='字'/></option>
										<option value="3000-4000">3000<spring:message code='字'/>—4000<spring:message code='字'/></option>
										<option value="4000-5000">4000<spring:message code='字'/>—5000<spring:message code='字'/></option>
										<option value="5000-6000">5000<spring:message code='字'/>—6000<spring:message code='字'/></option>
										<option value="6000-7000">6000<spring:message code='字'/>—7000<spring:message code='字'/></option>
										<option value="7000-8000">7000<spring:message code='字'/>—8000<spring:message code='字'/></option>
										<option value="8000-9000">8000<spring:message code='字'/>—9000<spring:message code='字'/></option>
									</select>
								</div>
								
								<label class="col-xs-2 rowlabel"><b><spring:message code='选择等级：'/></b></label>
								<div class="col-xs-3">
									<select class="form-control" name="lev" id="lev" style="width: 100%">
										<option value="1000" selected="selected"><spring:message code='请选择'/></option>
										<option value="3" >3<spring:message code='级'/></option>
										<option value="4" >4<spring:message code='级'/></option>
										<option value="5" >5<spring:message code='级'/></option>
									</select>
								</div>
							</div>
							
						</form>
					</div>
					<div class="checks_langu row">
						<label class="col-xs-2 rowlabel"><b><spring:message code='选择语种：'/></b></label>
						<div class="col-xs-8">
							<select name="languagePair" id="languagePair" class="form-control">
								<option id="langue03" value="" selected="selected"><spring:message code='请选择'/></option>
								<option id="langue01" value="汉英"><spring:message code='汉英'/></option>
								<option id="langue02" value="英汉"><spring:message code='英汉'/></option>
								<option id="langue03" value="汉韩"><spring:message code='汉韩'/></option>
								<option id="langue03" value="韩汉"><spring:message code='韩汉'/></option>
								<option id="langue03" value="汉日"><spring:message code='汉日'/></option>
								<option id="langue03" value="日汉"><spring:message code='日汉'/></option>
								<option id="langue03" value="汉法"><spring:message code='汉法'/></option>
								<option id="langue03" value="法汉"><spring:message code='法汉'/></option>
								<option id="langue03" value="汉德"><spring:message code='汉德'/></option> 
								<option id="langue03" value="德汉"><spring:message code='德汉'/></option>
							</select>
								
							<%-- <label class="checkbox-inline"> <input type="radio" id="langue03" value="" name="languagePair"> <spring:message code='全部'/> </label>
							<label class="checkbox-inline"> <input type="radio" id="langue01" value="汉英" name="languagePair"> <spring:message code='汉英'/></label>
							<label class="checkbox-inline"> <input type="radio" id="langue02" value="英汉" name="languagePair"> <spring:message code='英汉'/></label>
							<label class="checkbox-inline"> <input type="radio" id="langue03" value="汉韩" name="languagePair"> <spring:message code='汉韩'/></label>
							<label class="checkbox-inline"> <input type="radio" id="langue03" value="韩汉" name="languagePair"> <spring:message code='韩汉'/></label>
							<label class="checkbox-inline"> <input type="radio" id="langue03" value="汉日" name="languagePair"> <spring:message code='汉日'/></label>
							<label class="checkbox-inline"> <input type="radio" id="langue03" value="日汉" name="languagePair"> <spring:message code='日汉'/></label>
							<label class="checkbox-inline"> <input type="radio" id="langue03" value="汉法" name="languagePair"> <spring:message code='汉法'/></label>
							<label class="checkbox-inline"> <input type="radio" id="langue03" value="法汉" name="languagePair"> <spring:message code='法汉'/></label>
							<label class="checkbox-inline"> <input type="radio" id="langue03" value="汉德" name="languagePair"> <spring:message code='汉德'/> </label> 
							<label class="checkbox-inline"> <input type="radio" id="langue03" value="德汉" name="languagePair"> <spring:message code='德汉'/> </label>  --%>
						</div>
					</div>	
								
						<%-- <span class="col-sm-1"></span>
						<div class="col-sm-10 divCol-sm-10">
							<label class="checkbox-inline"> <input type="radio" id="langue01" value="汉英" name="languagePair"> <spring:message code='汉英'/>
							</label> <label class="checkbox-inline"> <input type="radio" id="langue02" value="英汉" name="languagePair"> <spring:message code='英汉'/>
							</label> <label class="checkbox-inline"> <input type="radio" id="langue03" value="汉韩" name="languagePair"> <spring:message code='汉韩'/>
							</label> <label class="checkbox-inline"> <input type="radio" id="langue03" value="韩汉" name="languagePair"> <spring:message code='韩汉'/>
							</label> <label class="checkbox-inline"> <input type="radio" id="langue03" value="汉日" name="languagePair"> <spring:message code='汉日'/>
							</label> <label class="checkbox-inline"> <input type="radio" id="langue03" value="日汉" name="languagePair"> <spring:message code='日汉'/>
							</label> <label class="checkbox-inline"> <input type="radio" id="langue03" value="汉法" name="languagePair"> <spring:message code='汉法'/>
							</label> <label class="checkbox-inline"> <input type="radio" id="langue03" value="法汉" name="languagePair"> <spring:message code='法汉'/>
							</label>
							<div class="checbox_all languageClass">
								<label class="checkbox-inline"> <input type="radio" id="langue03" value="汉德" name="languagePair"> <spring:message code='汉德'/> </label> 
								<label class="checkbox-inline"> <input type="radio" id="langue03" value="德汉" name="languagePair"> <spring:message code='德汉'/> </label> 
								<label class="checkbox-inline"> <input type="radio" id="langue03" value="" name="languagePair"> <spring:message code='不限制'/> </label>
							</div>
							<span class="checkbox-inline checkbox_click languageClassSpan"><spring:message code='展示更多'/> <i class="fa fa-angle-double-right" aria-hidden="true"></i></span>
						</div> --%>
					
					<div class="checks_langu row">
						<label class="col-xs-2 rowlabel"><b><spring:message code='选择领域：'/></b></label>
						<div class="col-xs-8">
							<select name="field" id="field" class="form-control">
								<option id="field" value="" selected="selected"><spring:message code='请选择'/></option>
								<option id="field" value="12"><spring:message code='日常'/></option> 
								<option id="field" value="13"><spring:message code='机械'/></option> 
								<option id="field" value="14"><spring:message code='电子'/></option> 
								<option id="field" value="15"><spring:message code='电器'/></option> 
								<option id="field" value="16"><spring:message code='机电'/></option> 
								<option id="field" value="17"><spring:message code='自动化'/></option>
								<option id="field" value="18"><spring:message code='计算机'/></option>
								<option id="field" value="19"><spring:message code='通信'/></option>
								<option id="field" value="20"><spring:message code='网络'/></option>
								<option id="field" value="21"><spring:message code='物理'/></option>
								<option id="field" value="22"><spring:message code='化学'/></option>
								<option id="field" value="23"><spring:message code='化工'/></option>
								<option id="field" value="24"><spring:message code='医药'/></option>
								<option id="field" value="25"><spring:message code='生化'/></option>
							</select>
							<%-- <label class="checkbox-inline"> <input type="radio" id="field" value="" name="field"> <spring:message code='全选'/> </label>
							<label class="checkbox-inline"> <input type="radio" id="field" value="12" name="field"> <spring:message code='日常'/> </label> 
							<label class="checkbox-inline"> <input type="radio" id="field" value="13" name="field"> <spring:message code='机械'/> </label> 
							<label class="checkbox-inline"> <input type="radio" id="field" value="14" name="field"> <spring:message code='电子'/> </label> 
							<label class="checkbox-inline"> <input type="radio" id="field" value="15" name="field"> <spring:message code='电器'/> </label> 
							<label class="checkbox-inline"> <input type="radio" id="field" value="16" name="field"> <spring:message code='机电'/> </label> 
							<label class="checkbox-inline"> <input type="radio" id="field" value="17" name="field"> <spring:message code='自动化'/> </label>
							<label class="checkbox-inline"> <input type="radio" id="field" value="18" name="field"> <spring:message code='计算机'/> </label>
							<label class="checkbox-inline"> <input type="radio" id="field" value="19" name="field"> <spring:message code='通信'/> </label>
							<label class="checkbox-inline"> <input type="radio" id="field" value="20" name="field"> <spring:message code='网络'/> </label>
							<label class="checkbox-inline"> <input type="radio" id="field" value="21" name="field"> <spring:message code='物理'/>	</label>
							<label class="checkbox-inline"> <input type="radio" id="field" value="22" name="field"> <spring:message code='化学'/> </label>
							<label class="checkbox-inline"> <input type="radio" id="field" value="23" name="field"> <spring:message code='化工'/> </label>
							<label class="checkbox-inline"> <input type="radio" id="field" value="24" name="field"> <spring:message code='医药'/> </label>
							<label class="checkbox-inline"> <input type="radio" id="field" value="25" name="field"> <spring:message code='生化'/> </label> --%>
						</div>
						
						
						
						<%-- <span class="col-sm-1"><spring:message code='选择领域：'/></span>
						<div class="col-sm-10 divCol-sm-10">
							<label class="checkbox-inline"> <input type="radio" id="field" value="12" name="field"> <spring:message code='日常'/> </label> 
							<label class="checkbox-inline"> <input type="radio" id="field" value="13" name="field"> <spring:message code='机械'/> </label> 
							<label class="checkbox-inline"> <input type="radio" id="field" value="14" name="field"> <spring:message code='电子'/> </label> 
							<label class="checkbox-inline"> <input type="radio" id="field" value="15" name="field"> <spring:message code='电器'/> </label> 
							<label class="checkbox-inline"> <input type="radio" id="field" value="16" name="field"> <spring:message code='机电'/> </label> 
							<label class="checkbox-inline"> <input type="radio" id="field" value="17" name="field"> <spring:message code='自动化'/> </label>
							<label class="checkbox-inline"> <input type="radio" id="field" value="18" name="field"> <spring:message code='计算机'/> </label>
							<label class="checkbox-inline"> <input type="radio" id="field" value="19" name="field"> <spring:message code='通信'/> </label>
							<div class="checbox_all filedClass">
								<label class="checkbox-inline"> <input type="radio" id="field" value="20" name="field"> <spring:message code='网络'/> </label>
								<label class="checkbox-inline"> <input type="radio" id="field" value="21" name="field"> <spring:message code='物理'/>	</label>
								<label class="checkbox-inline"> <input type="radio" id="field" value="22" name="field"> <spring:message code='化学'/> </label>
								<label class="checkbox-inline"> <input type="radio" id="field" value="23" name="field"> <spring:message code='化工'/> </label>
							</div>
							<div class="checbox_all filedClass">
								<label class="checkbox-inline"> <input type="radio" id="field" value="24" name="field"> <spring:message code='医药'/> </label>
								<label class="checkbox-inline"> <input type="radio" id="field" value="25" name="field"> <spring:message code='生化'/> </label>
								<label class="checkbox-inline"> <input type="radio" id="field" value="" name="field"> <spring:message code='不限制'/> </label>
							</div>
							<span class="checkbox-inline checkbox_click filedClassSpan"><spring:message code='展示更多'/> <i class="fa fa-angle-double-right" aria-hidden="true"></i></span>
						</div> --%>
					</div>
					<div class="checks_langu row">
						<div class="col-xs-2"></div>
						<div class="col-xs-8">
							<input type="text" class="form-control" placeholder="Search for..." id="searchInput">
						</div>
						<div class="col-xs-1">
							<span class="input-group-btn">
								<button class="btn btn-info" type="button" id="searchButton"><spring:message code='搜索'/></button>
							</span>
						</div>
					</div>
					
					<div class="input-group pull-right" style="bottom: 10px;right:170px;width: 70%">
					 <%-- <input type="text" class="form-control" placeholder="Search for..." id="searchInput"> 
					 <span class="input-group-btn">
						<button class="btn btn-info" type="button" id="searchButton"><spring:message code='搜索'/></button>
					 </span> --%>
					</div>
					<br><br>
					<div id="timerDiv" style="display: none;"></div>
					<!--  我要投标列表  -->
					<div class="demand_lists">
						<ul class="list-group" id="needUL">
							<!--  <li class="list-group-item">
                  <h5>置顶</h5>
                  <div class="row list_content">
                    <div class="col-sm-6 list_one">
                      <p><span class="text-primary">￥2000.00</span><span>帝吧出征之朱镕基回答台湾问题新闻稿件</span></p>
                      <p>源语言：<span>中文</span> 目标语言：<spna>阿拉伯语</span> | 字数：<span>460字</span></p>
                    </div>
                    <span class="col-sm-1 states">已托管</span>
                    <div class="col-sm-3 attend_preson">
                      <p><span>10</span>人参与 | 招标</p>
                      <p>已截止</p>
                    </div>
                    <div class="col-sm-2">
                      <button type="button" class="btn btn-info" disabled name="button">我要投标</button>
                    </div>
                  </div>
                </li>

                <li class="list-group-item">
                  <h5>置顶</h5>
                  <div class="row list_content">
                    <div class="col-sm-6 list_one">
                      <p><span class="text-primary">￥2000.00</span><span>百度-点心项目 俄语</span></p>
                      <p>源语言：<span>中文</span> 目标语言：<spna>俄语</span> | 字数：<span>7608字</span></p>
                    </div>
                    <span class="col-sm-1 states">已托管</span>
                    <div class="col-sm-3 attend_preson">
                      <p><span>10</span>人参与 | 招标</p>
                      <p>2天后截止</p>
                    </div>
                    <div class="col-sm-2">
                      <button type="button" class="btn btn-info" name="button">我要投标</button>
                    </div>
                  </div>
                </li> -->


						</ul>
						<!--currentpage="1" numbercount="100"-->
						<div class="common_problem_page">
							<ul class="page pull-right" style="margin-top: 20px;"
								maxshowpageitem="5" pagelistcount="10" id="page"></ul>
						</div>
					</div>

				</div>
				<div class="demand_right col-sm-3">
					<h5><spring:message code='热点项目'/></h5>
					<div class="wraper_need">
					
					<c:forEach items="${needList}" var="need" varStatus="i">
					<%-- <%int i=0;i++; %> --%>
						<div class="hot_need">
							<c:if test="${need.domainId==12 }"><img src="/img/日常.jpg" style="width: 230px;height: 120px"></c:if>
							<c:if test="${need.domainId==13 }"><img src="/img/机械.jpg" style="width: 230px;height: 120px"></c:if>
							<c:if test="${need.domainId==14 }"><img src="/img/电子.jpg" style="width: 230px;height: 120px"></c:if>
							<c:if test="${need.domainId==15 }"><img src="/img/电器.jpg" style="width: 230px;height: 120px"></c:if>
							<c:if test="${need.domainId==16 }"><img src="/img/机电.jpg" style="width: 230px;height: 120px"></c:if>
							<c:if test="${need.domainId==17 }"><img src="/img/自动化.jpg" style="width: 230px;height: 120px"></c:if>
							<c:if test="${need.domainId==18 }"><img src="/img/计算机.jpg" style="width: 230px;height: 120px"></c:if>
							<c:if test="${need.domainId==19 }"><img src="/img/通信.jpg" style="width: 230px;height: 120px"></c:if>
							<c:if test="${need.domainId==20 }"><img src="/img/网络.jpg" style="width: 230px;height: 120px"></c:if>
							<c:if test="${need.domainId==21 }"><img src="/img/物理.jpg" style="width: 230px;height: 120px"></c:if>
							<c:if test="${need.domainId==22 }"><img src="/img/化学.jpg" style="width: 230px;height: 120px"></c:if>
							<c:if test="${need.domainId==23 }"><img src="/img/化工.jpg" style="width: 230px;height: 120px"></c:if>
							<c:if test="${need.domainId==24 }"><img src="/img/医药.jpg" style="width: 230px;height: 120px"></c:if>
							<c:if test="${need.domainId==25 }"><img src="/img/生化.jpg" style="width: 230px;height: 120px"></c:if>
						
							
							<p class="explian">
								<spring:message code='截止日：'/>
								<span style="color: red">
								<%-- ${i.count } --%>
								<%-- <%
								List list=(List)request.getAttribute("needList");
								ClientCustomerNeed clientCustomerNeed=(ClientCustomerNeed)list.get(i);
								String expirydte=clientCustomerNeed.getEXPIRYDATE();
								SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
							    Date date;
								date = (Date) formatter.parse(expirydte);
								%>
								<%=date %> --%>
								   <fmt:parseDate value="${need.completeTime} 23:59:59" pattern="yyyy-MM-dd HH:mm:ss" var="myDate"/>
								   <fmt:formatDate value="${myDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</span>
							</p>
							<p class="explian"><spring:message code='${need.languagePair}'/>/
								<c:if test="${need.domainId==12 }"><spring:message code='日常'/></c:if>
								<c:if test="${need.domainId==13 }"><spring:message code='机械'/></c:if>
								<c:if test="${need.domainId==14 }"><spring:message code='电子'/></c:if>
								<c:if test="${need.domainId==15 }"><spring:message code='电器'/></c:if>
								<c:if test="${need.domainId==16 }"><spring:message code='机电'/></c:if>
								<c:if test="${need.domainId==17 }"><spring:message code='自动化'/></c:if>
								<c:if test="${need.domainId==18 }"><spring:message code='计算机'/></c:if>
								<c:if test="${need.domainId==19 }"><spring:message code='通信'/></c:if>
								<c:if test="${need.domainId==20 }"><spring:message code='网络'/></c:if>
								<c:if test="${need.domainId==21 }"><spring:message code='物理'/></c:if>
								<c:if test="${need.domainId==22 }"><spring:message code='化学'/></c:if>
								<c:if test="${need.domainId==23 }"><spring:message code='化工'/></c:if>
								<c:if test="${need.domainId==24 }"><spring:message code='医药'/></c:if>
								<c:if test="${need.domainId==25 }"><spring:message code='生化'/></c:if>
								<c:if test="${need.domainId=='' ||need.domainId==null  }"><spring:message code='不限制'/></c:if>
								
								
								/<spring:message code='翻译总字数：'/><spring:message code='${need.length }'/>
							</p>
							<p class="explian">
								<span>￥${need.totalMoney }</span> <a href="/cilentCustomer/lookPublishNeedById.do?id=${need.id }" target="_blank"><spring:message code='查看项目'/></a>
							</p>
						</div>
					</c:forEach>
						
						<%-- <div class="hot_need">
							<img src="http://via.placeholder.com/230x120" alt="">
							<p class="explian"><spring:message code='翻译/英语翻译/医学翻译/机械翻译/化妆品翻译/说明书翻译'/></p>
							<p class="explian">
								<span><spring:message code='价格'/> <span>120.00</span></span> <a href="javascript:;"><spring:message code='查看需求'/></a>
							</p>
						</div> --%>
					</div>
				</div>
			</div>
		</div>
		<!--  需求展示结束  -->
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
		var icon = '<i class="fa fa-angle-double-right" aria-hidden="true"></i>'
		$(".languageClassSpan").click(function() {
			if ($(".languageClass").hasClass("checkbox_hide")) {
				$(".languageClass").removeClass("checkbox_hide");
				$(".languageClassSpan").html(" <spring:message code='展示更多'/> " + icon);
			} else {
				$(".languageClass").addClass("checkbox_hide");
				$(".languageClassSpan").text(" <spring:message code='收起'/>");
			}
		})
		
		
		$(".filedClassSpan").click(function() {
			if ($(".filedClass").hasClass("checkbox_hide")) {
				$(".filedClass").removeClass("checkbox_hide");
				$(".filedClassSpan").html(" <spring:message code='展示更多'/> " + icon);
			} else {
				$(".filedClass").addClass("checkbox_hide");
				$(".filedClassSpan").text(" <spring:message code='收起'/>");
			}

		})
		
	</script>

<div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
