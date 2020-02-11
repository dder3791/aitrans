<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name=" Keywords" content="......">
<!--content中，网页关键字-->
<meta name=" description" content="......">
<!--content中，网页描述文字-->
<meta name="author" content="......">
<!--标注作者-->
<title><spring:message code='客户展示'/></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/case.demonstration.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/page.css" type="text/css"/>

<script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/public.nav.footer.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script>--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
<style type="text/css">
      .case_uls{
        margin-top: 50px;
      }
      .case_lists{
        border-left: none;
        border-right: none;
        background:#f2f2f2;
        margin: 5px auto;
        width: 80%;
      }
     /*  .case_lists a{
        color:#8db5e3;
        padding-left: 20px;
        display: inline-block;
        width: 80%;
        overflow: hidden;
      } */
      .case_lists span{
        padding-right:20px;
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

	//接收版本语言
	var lang = "${language}"
	 if(lang==""){
		lang="zh";
	 }
	$(function() {
		
		
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
		
		/*如果是zh，默认显示中国企业
		 *如果是en，默认显示外国企业
		 */
		 var islocal=0;
		if('zh'==lang){
			document.getElementById("islocal").value=1;
			islocal=1;
		}else if('en'==lang){
			document.getElementById("islocal").value=2;
			islocal=2;
		}
		
		//添加国家信息
		//存储值：1---国内、2---国外
		getCounttry(islocal);
		
		
		//总记录数
		var totalCount = '${page.totalCount }';
		//当前页
		var pageNum = '${page.pageNum}';
		//分类类型
		var country = '${page.msgType}';
		
		
		//区分是否是第一次进行分类跳转
		var o = 0;
		// 初始化加载分页下标
		// currentPage 当前页码
		
		
		$("#islocal").change(function(){
			var islocal=$("#islocal").val();
			var val=document.getElementById("msgInput").value;
			var country=$("#selectCountry").val(); 
			//alert("查找国家企业")
			if(islocal!=1){
				findCompany(islocal,val,country,'');
			}else{
				findCompany(islocal,val,"中国",country);
			}
			
			getCounttry(islocal);
		});
		
		//翻页的点击事件
		var GG = {
			"kk" : function(mm) {
				//给予初始化赋值
				if (isNaN(mm)) {
					mm = 1;
				}
				;

				// 判断是否是按类型分类的第一次，然后发起请求
				if (o != 2) {
					//异步请求调取查询后的数据
					$.ajax({
						type : "POST",
						url : "/index/getCustomerByCountry.do",
					 	data: {
						 "mm": mm,
						 "country":country,
						 "islocal":islocal,
						 "province":""
						 },
						cache : false,
						dataType : "json",
						success : function(data) {
							var signFrame = document.getElementById("companyTable");
							var tr = document.getElementsByName("companyTR"); 
							for(var i=0;i<tr.length;){
								tr[0].remove();
								} 
							if(data.onlineCustomerList.length>0){ 
								for(var i=0;i<data.onlineCustomerList.length;i++){
							        
									if('en'==lang && (islocal==1 || islocal=="1")){
										$("#companyTable").append(
								          '<tr name="companyTR">'+
								           '<td>'+
								          	'<a href="'+data.onlineCustomerList[i].web+'" target="_blank" style="margin-left:10px">'+
									          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].nameCH+'</span>'+
									        '</a>'+
									       '</td>'+
									       '<td>'+
									        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
									          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].countryCH+'</span>'+
									        '</a>'+
									       '</td>'+
									       '<td>'+
									        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
									          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].web+'</span>'+
									        '</a>'+
									       '</td>'+
									       '<td>'+
									        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
									          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].introZH+'</span>'+
									        '</a>'+
									       '</td>'+
								          '</tr>'
								        )
									}else if('zh'==lang && (islocal==2 || islocal=="2")){
										$("#companyTable").append(
								          '<tr name="companyTR">'+
								           '<td>'+
								          	'<a href="'+data.onlineCustomerList[i].web+'" target="_blank" style="margin-left:10px">'+
									          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].nameEN+'</span>'+
									        '</a>'+
									       '</td>'+
									       '<td>'+
									        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
									          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].countryEN+'</span>'+
									        '</a>'+
									       '</td>'+
									       '<td>'+
									        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
									          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].web+'</span>'+
									        '</a>'+
									       '</td>'+
									       '<td>'+
									        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
									          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].introEN+'</span>'+
									        '</a>'+
									       '</td>'+
								          '</tr>'
								        )
									}else{
										if('zh'==lang){
											$("#companyTable").append(
									          '<tr name="companyTR">'+
									           '<td>'+
									          	'<a href="'+data.onlineCustomerList[i].web+'" target="_blank" style="margin-left:10px">'+
										          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].nameCH+'</span>'+
										        '</a>'+
										       '</td>'+
										       '<td>'+
										        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
										          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].countryCH+'</span>'+
										        '</a>'+
										       '</td>'+
										       '<td>'+
										        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
										          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].web+'</span>'+
										        '</a>'+
										       '</td>'+
										       '<td>'+
										        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
										          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].introCH+'</span>'+
										        '</a>'+
										       '</td>'+
									          '</tr>'
									        )
										}else {
											$("#companyTable").append(
									          '<tr name="companyTR">'+
									           '<td>'+
									          	'<a href="'+data.onlineCustomerList[i].web+'" target="_blank" style="margin-left:10px">'+
										          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].nameEN+'</span>'+
										        '</a>'+
										       '</td>'+
										       '<td>'+
										        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
										          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].countryEN+'</span>'+
										        '</a>'+
										       '</td>'+
										       '<td>'+
										        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
										          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].web+'</span>'+
										        '</a>'+
										       '</td>'+
										       '<td>'+
										        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
										          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].introEN+'</span>'+
										        '</a>'+
										       '</td>'+
									          '</tr>'
									        )
										}
										
									}
									
							      }
							}else{
								layer.alert('<spring:message code="没有找到符合条件的客户"/>', {
									icon: 5,
									title: "<spring:message code='提示'/>"
									});
							}
						}

					});

				}
				o = 1;//给以第一次分类后进行特殊赋值处理
			}
		}
		
		//判断总记录数是否为0 
	      if(totalCount==0){
	    	//弹出框提示没有信息
		         layer.msg('<spring:message code="没有找到符合条件的客户"/>', {icon: 5}); 
		         $("#page").initPage(1, 1, 0);
	      }else{ 
	    	  $("#page").initPage(totalCount, pageNum, GG.kk);
	      }  
		//初始化分页栏设置
		
		
		function findCompany(islocal,val,country,province){
			/* country=$("#selectCountry").val(); */
			$.ajax({
				type : "POST",
				url : "/index/getCustomerByCountry.do",
			 	data: {
				 "mm": 1,
				 "country":country,
				 "msg":val,
				 "islocal":islocal,
				 "province":province
				 },
				cache : false,
				dataType : "json",
				success : function(data) {
					o=2;
					var signFrame = document.getElementById("companyTable");
					var tr = document.getElementsByName("companyTR"); 
					for(var i=0;i<tr.length;){
						tr[0].remove();
						} 
					
					if(data.onlineCustomerList.length>0){ 
						for(var i=0;i<data.onlineCustomerList.length;i++){
					        
							if('en'==lang && (islocal==1 || islocal=="1")){
								$("#companyTable").append(
						          '<tr name="companyTR">'+
						           '<td>'+
						          	'<a href="'+data.onlineCustomerList[i].web+'" target="_blank" style="margin-left:10px">'+
							          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].nameCH+'</span>'+
							        '</a>'+
							       '</td>'+
							       '<td>'+
							        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
							          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].countryCH+'</span>'+
							        '</a>'+
							       '</td>'+
							       '<td>'+
							        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
							          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].web+'</span>'+
							        '</a>'+
							       '</td>'+
							       '<td>'+
							        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
							          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].introCH+'</span>'+
							        '</a>'+
							       '</td>'+
						          '</tr>'
						        )
							}else if('zh'==lang && (islocal==2 || islocal=="2")){
								$("#companyTable").append(
						          '<tr name="companyTR">'+
						           '<td>'+
						          	'<a href="'+data.onlineCustomerList[i].web+'" target="_blank" style="margin-left:10px">'+
							          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].nameEN+'</span>'+
							        '</a>'+
							       '</td>'+
							       '<td>'+
							        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
							          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].countryEN+'</span>'+
							        '</a>'+
							       '</td>'+
							       '<td>'+
							        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
							          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].web+'</span>'+
							        '</a>'+
							       '</td>'+
							       '<td>'+
							        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
							          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].introEN+'</span>'+
							        '</a>'+
							       '</td>'+
						          '</tr>'
						        )
							}else{
								if('zh'==lang){
									$("#companyTable").append(
							          '<tr name="companyTR">'+
							           '<td>'+
							          	'<a href="'+data.onlineCustomerList[i].web+'" target="_blank" style="margin-left:10px">'+
								          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].nameCH+'</span>'+
								        '</a>'+
								       '</td>'+
								       '<td>'+
								        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
								          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].countryCH+'</span>'+
								        '</a>'+
								       '</td>'+
								       '<td>'+
								        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
								          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].web+'</span>'+
								        '</a>'+
								       '</td>'+
								       '<td>'+
								        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
								          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].introCH+'</span>'+
								        '</a>'+
								       '</td>'+
							          '</tr>'
							        )
								}else {
									$("#companyTable").append(
							          '<tr name="companyTR">'+
							           '<td>'+
							          	'<a href="'+data.onlineCustomerList[i].web+'" target="_blank" style="margin-left:10px">'+
								          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].nameEN+'</span>'+
								        '</a>'+
								       '</td>'+
								       '<td>'+
								        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
								          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].countryEN+'</span>'+
								        '</a>'+
								       '</td>'+
								       '<td>'+
								        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
								          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].web+'</span>'+
								        '</a>'+
								       '</td>'+
								       '<td>'+
								        '<a href="'+data.onlineCustomerList[i].web+'" target="_blank">'+
								          '<span style="white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;">'+data.onlineCustomerList[i].introEN+'</span>'+
								        '</a>'+
								       '</td>'+
							          '</tr>'
							        )
								}
								}
							
					      }
					}else{
						layer.alert('<spring:message code="没有找到符合条件的客户"/>', {
							icon: 5,
							title: "<spring:message code='提示'/>"
							});
					}
					//判断总记录数是否为0 
				      if(data.page.totalCount==0){
				    	//弹出框提示没有信息
					         layer.msg('<spring:message code="没有找到符合条件的客户"/>', {icon: 5}); 
					         $("#page").initPage(1, 1, 0);
				      }else{ 
				    		//重新初始化分页配置信息
							$("#page").initPage(data.page.totalCount,data.page.pageNum,GG.kk);
				      }  
				}

			});
		}
		
		
		//国家按钮
		$("#selectCountry").change(function(){
			var val=document.getElementById("msgInput").value;
			var country=$("#selectCountry").val(); 
			if(islocal!=1){
				findCompany(islocal,val,country,'');
			}else{
				findCompany(islocal,val,'中国',country);
			}
			getCounttry(islocal);
		}) 
		
		//搜索按钮
		$("#msgFind").click(function(){
			var val=document.getElementById("msgInput").value;
			var country=$("#selectCountry").val(); 
			if(islocal!=1){
				findCompany(islocal,val,country,'');
			}else{
				findCompany(islocal,val,'中国',country);
			}
		})
		
		getCounttry(islocal);
		
	});
	
	
    function queryByInterpreter() {
   	 
   	 var nickName=$("#nickName").val();
   	 if(nickName!="" && nickName!="null" && nickName!=undefined){
   		 url="/translator/translatorAction_getTotalCount.do?msg="+nickName;
			window.open(url);
   	 }else{
   		 layer.msg('<spring:message  code="译员名不能为空！"/>', {icon: 2});
   	 }
		
	}
    
    
    
    function getCounttry(islocal){
    	//添加国家
    	//先移除
		document.getElementById("selectCountry").options.length = 1; 
		
		//判断是要找国内国家、、国外国家
		if('1'==islocal || islocal==1){//1是国内
			$.post("/index/getCountry.do",{"country":1},function(data){
				for(var i in data ){
					jQuery.i18n.properties({
						 name:'Messages', 
					        path:'/i18n/', 
					        mode:'both',
					   		language:"${language}",
					        checkAvailableLanguages: true,
					        async: true,
					        callback: function() { 
					        	var province =jQuery.i18n.prop("province"+i);
								$("#selectCountry").append("<option value="+data[i]+">"+data[i]+"</option>")
					        }
						})
				}
			})
			/* if('zh'==lang){ */
				//查找省（中文）
			/* }else if('en'==lang){
				//查找省（英文）
				$("#selectCountry").append("<option value='China'>China</option>"); 
			} */
			
		}
		else if('2'==islocal || islocal==2){//2是国外
			$.post("/index/getCountry.do",function(data){
				for(var i in data ){
					if("中国"!=data[i]&& "China"!=data[i]){
						var option="<option value='"+data[i]+"'>"+data[i]+"</option>"; 
						$("#selectCountry").append(option);  
					}
					 
				}
			},"json");//添加国家结束
		}
		else{//没有选中国别时
			$.post("/index/getCountry.do",function(data){
				for(var i in data){
					var option="<option value='"+data[i]+"'>"+data[i]+"</option>";  
					$("#selectCountry").append(option);  
				}
			},"json");//添加国家结束
		}
     }
    
</script>

<style>
	.rowlabel {
		text-align: right;
		padding: 6px;
	}
	.row {
	    margin-top: 25px;
	}
	th{
		text-align: center;
		font-size: 16px;
	}
	td{
		text-align: center;
	}
	tr{
		background:#f2f2f2;
		height:50px;
	}
	#companyTable a{
		color:blue;
	}#companyTable a:hover{
		color:green;
	}
	p{
		margin-top:10px;
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

		 <!--  案例展示列表  开始  -->
		<div class="case_demo">
        	<div class="case_demo_content">
        	
        	
        	<h2 align="center" style="padding-left:40px;"><spring:message code='客户展示'/></h2>
        		<%--<div class="form-group" style="margin-top:20px;width:80%;margin-left:10%;padding:5px;border-radius:10px;">
        		
					<div class="row" style='width:96%;margin:2%;'>
						<div class="col-xs-6">
							<img src="${pageContext.request.contextPath}/img/AD2.jpg" width="100%" style="border-radius:10px;">
						</div>
						<div class="col-xs-6" style="text-align: center;">
							<p><font size="4px">•&nbsp;<font color="red">环宇爱译</font><font color="blue">——中国人工智能专利翻译第一品牌</font></font></p>
							<p>•&nbsp;贪玩蓝月：开局一条狗，装备全靠打</p>
							<p>•&nbsp;<font color="red">淘宝天猫双十一狂欢购物节，不止五折！</font></p>
							<p>•&nbsp;当当网：限24小时当当图书5折</p>
							<p>•&nbsp;只要在线就送钱！你的时间非常值钱</p>
						</div>
					</div>  
					
					<div class="row" style='width:96%;margin:2%;'>
						<div class="col-xs-12">
							<img src="${pageContext.request.contextPath}/img/AD3.jpg" width="100%" style='border-radius:10px;'>
						</div>
					</div>   
					
					<div class="row" style='width:96%;margin:2%;'>
						<div class="col-xs-12">
							<img src="${pageContext.request.contextPath}/img/AD4.jpg" width="100%" style='border-radius:10px;'>
						</div>
					</div>   
					
					<div class="row" style='width:96%;margin:2%;'>
						<div class="col-xs-12">
							<img src="${pageContext.request.contextPath}/img/AD5.jpg" width="100%" style='border-radius:10px;'>
						</div>
					</div> 
					
					<div class="row" style='width:96%;margin:2%;'>
						<div class="col-xs-2">
							<img src="${pageContext.request.contextPath}/img/apple.jpg" width="100%" style='border-radius:10px;'>
						</div>
						<div class="col-xs-2">
							<img src="${pageContext.request.contextPath}/img/microsoft.png" width="100%" style='border-radius:10px;'>
						</div>
						<div class="col-xs-2">
							<img src="${pageContext.request.contextPath}/img/intel.jpg" width="100%" style='border-radius:10px;'>
						</div>
						<div class="col-xs-2">
							<img src="${pageContext.request.contextPath}/img/asus.jpg" width="100%" style='border-radius:10px;'>
						</div>
						<div class="col-xs-2">
							<img src="${pageContext.request.contextPath}/img/hp.jpg" width="100%" style='border-radius:10px;'>
						</div>
						<div class="col-xs-2">
							<img src="${pageContext.request.contextPath}/img/samsung.jpg" width="100%" style='border-radius:10px;'>
						</div>
					</div>
					
					<div class="row" style='width:96%;margin:2%;margin-top:30px;'>
						<div class="col-xs-2">
							<img src="${pageContext.request.contextPath}/img/sony.jpg" width="100%" style='border-radius:10px;'>
						</div>
						<div class="col-xs-2">
							<img src="${pageContext.request.contextPath}/img/amd.png" width="100%" style='border-radius:10px;'>
						</div>
						<div class="col-xs-2">
							<img src="${pageContext.request.contextPath}/img/dell.jpg" width="100%" style='border-radius:10px;'>
						</div>
						<div class="col-xs-2">
							<img src="${pageContext.request.contextPath}/img/acer.jpg" width="100%" style='border-radius:10px;'>
						</div>
						<div class="col-xs-2">
							<img src="${pageContext.request.contextPath}/img/lenovo.jpg" width="100%" style='border-radius:10px;'>
						</div>
						<div class="col-xs-2">
							<img src="${pageContext.request.contextPath}/img/thinkpad.jpg" width="100%" style='border-radius:10px;'>
						</div>
					</div>     		
        		
        		</div>--%>
         	<div class="form-group" style="margin-top:20px;width:80%;margin-left:10%;padding:5px;border-radius:10px;">
					<div class="row" style='width:96%;margin:2%;'>
						<div class="col-xs-6">
							<a href="${ad1.web }">
								<img src="${pageContext.request.contextPath}${ad1.url}" width="100%" style="border-radius:10px;">
							</a>
						</div>
						<div class="col-xs-6" style="text-align: center;">
							<c:forEach items="${ad4 }" var="ad" varStatus="adc">
								<c:if test="${adc.count == 1 }">
									<p><a href="${ad.web }"><font size="4px" color="red">•&nbsp;${ad.context }</font></a></p>
								</c:if>
								<c:if test="${adc.count != 1 }">
									<p><a href="${ad.web }">•&nbsp;${ad.context }</a></p>
								</c:if>
							</c:forEach>
						</div>
					</div>
					
					<c:forEach items="${ad2 }" var="ad">
						<div class="row" style='width:96%;margin:2%;'>
							<div class="col-xs-12">
								<a href="${ad.web }">
									<img src="${pageContext.request.contextPath}${ad.url}" width="100%" style='border-radius:10px;'>
								</a>
							</div>
						</div>
					</c:forEach>
					
					<c:forEach items="${ad3 }" var="ad" varStatus="adc">
						<c:if test="${adc.count % 6 == 1 }">
							<div class="row" style='width:96%;margin:2%;margin-top:30px;'>
								<div class="col-xs-2">
									<a href="${ad.web }">
										<img src="${pageContext.request.contextPath}${ad.url}" width="100%" style='border-radius:10px;'>
									</a>
								</div>
						</c:if>
						<c:if test="${adc.count % 6 != 1 }">
							<div class="col-xs-2">
								<a href="${ad.web }">
									<img src="${pageContext.request.contextPath}${ad.url}" width="100%" style='border-radius:10px;'>
								</a>
							</div>
						</c:if>
						<c:if test="${adc.count % 6 == 0 or adc.last == true}">
							</div>
						</c:if>
					</c:forEach>
        		</div>
         	
     
     
         	<h3 style="padding-left:100px;margin-top:50px;color:gray;"><spring:message code='推荐企业'/></h3>
          		<div class="form-group" style="width:100%">
          
          			<div class="row">
	          			<div class="col-xs-1"></div>
	          			<div class="col-xs-2">
	          				<select class="form-control" id="islocal">
	          					<option value="">--<spring:message code='请选择'/>--</option>
	          					<option value="1"><spring:message code='国内'/></option>
	          					<option value="2"><spring:message code='国外'/></option>
	          				</select>
	          			</div>
          				<%-- <label  class='col-xs-1 rowlabel'><b><spring:message code='地区'/></b></label> --%>
          				<div class="col-xs-2">
          					<select class="form-control" id="selectCountry">
          						<option value="" class="chosePlz">--<spring:message code='请选择地区'/>--</option>
			          			<%-- <option value="中国" class="in"><spring:message code='中国'/></option>
			          			<option value="法国" class="out"><spring:message code='法国'/></option>
			          			<option value="美国" class="out"><spring:message code='美国'/></option>
			          			<option value="德国" class="out"><spring:message code='德国'/></option>
			          			<option value="日本" class="out"><spring:message code='日本'/></option> --%>
			          		</select>
          				</div>
          				<div class="col-xs-1"></div>
          				<div class="col-xs-3">
          					<input type="text" class="form-control" placeholder="<spring:message code='输入关键字'/>..." id="msgInput">
				            
          				</div>
          				<div class="col-xs-1">
          					<span class="input-group-btn">
					            <button class="btn btn-info" type="button" id="msgFind"><spring:message code='搜索'/></button>
					        </span>
          				</div>
          				
          			</div>
          			
          			<%-- <table class="case_uls list-group" style="width: 100%" id="companyTable">
          	 			<tr class="case_lists list-group-item clearfix">
              				<th><spring:message code='企业名称'/></th>
              				<th><spring:message code='官网'/></th>
            			</tr>
            			<tr>
            				<td></td>
            				<td></td>
            			</tr>
          			</table> --%>
          			
          			<table border="0"  cellpadding="0" style="width:80%;margin-left: 10%;margin-top:40px;" id="companyTable">
          				<tr>
          					<th style="width:20%"><spring:message code='企业名称'/></th>
          					<th style="width:12%"><spring:message code='国家'/></th>
          					<th style="width:40%"><spring:message code='官网'/></th>
          					<th style="width:28%"><spring:message code='简介'/></th>
          				</tr>
          				<tr style="background-color: white;height:10px;">
          					<th></th>
          					<th></th>
          					<th></th>
          					<th></th>
          				</tr>
          			</table>
          
          		</div>
          <%-- <div style="margin-top:30px;width:100%;">
          	<div style="width: 100px;margin:20px 100px 0;margin-right:28px">
          		<select class="form-control" id="selectCountry" onchange="selectCountry()">
          			<option value="中国"><spring:message code='中国'/></option>
          			<option value="法国"><spring:message code='法国'/></option>
          			<option value="美国"><spring:message code='美国'/></option>
          			<option value="德国"><spring:message code='德国'/></option>
          			<option value="日本"><spring:message code='日本'/></option>
          		</select>
          	</div>
          	<div class="input-group" style="width:500px;margin:-34px 200px 0px;margin-left:300px">
            <input type="text" class="form-control" placeholder="<spring:message code='输入关键字'/>..." id="msgInput">
            <span class="input-group-btn">
              <button class="btn btn-info" type="button" id="msgFind"><spring:message code='搜索'/></button>
            </span>
          	</div>
          </div> --%>
          
          <%-- <table class="case_uls list-group" style="text-align: center;width: 1000px" id="companyTable">
          	 <tr class="case_lists list-group-item clearfix" style="margin-bottom:10px;font-size:16px;font-weight:1000;">
              <td style="width: 160px;text-align: center"><span style=""><spring:message code='企业名称'/></span> </td>
              <td style="width: 150px;text-align: center"><span style=""><spring:message code='企业'/>log</span> </td>
              <td style="width: 470px;text-align: center"><span style=""><spring:message code='官网'/></span> </td>
            </tr>
          </table> --%>
          <!--currentpage="1" numbercount="100"-->
          <div class="common_problem_page pull-right" style="padding-top:30px;padding-right:120px;"><ul class="page" maxshowpageitem="5" pagelistcount="10"  id="page"></ul></div>
          <div class="clear"></div>
        </div>
      </div>
    </div>
    

	<div id="gradient" class="footer_content">
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
     </div>
     
<div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
