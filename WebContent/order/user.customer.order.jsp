<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name=" Keywords" content="......">      <!--content中，网页关键字-->
<meta name=" description" content="......">   <!--content中，网页描述文字-->
<meta name="author" content="......">        <!--标注作者-->
    <title><spring:message code='用户中心-我是客户-我的订单'/></title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.center.css"/>
    <link href="${pageContext.request.contextPath}/css/page.css" type="text/css" rel="stylesheet"/>


    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
   <%--  <script type="text/javascript" src="${pageContext.request.contextPath}/js/public.nav.footer.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.center.js"></script> --%>
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script> --%>
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
      .caozuo a{
        display: inline-block;
        width:70px;
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
	$(function(){
		 if("${clientid.userName}"!='' && "${clientid.userName}"!=null){
	   		 $("#nickname").text('${clientid.userName}'+"<spring:message code=',欢迎您!'/>");
	   	 }else if('${clientid.tel}'!=null && '${clientid.tel}'!=null){
	   		 $("#nickname").text('${clientid.tel}'+"<spring:message code=',欢迎您!'/>");
	   	 }else if('${clientid.emaile}'!=null && '${clientid.emaile}'!=null){
	   		 $("#nickname").text('${clientid.emaile}'+"<spring:message code=',欢迎您!'/>");
	   	 }
		
		//总记录数
		var totalCount = '${page.totalCount }';
		//alert(totalCount);
		//当前页
		var pageNum = '${page.pageNum}';
		
		
		var buttonValue="";
		var timeInut="";
		var msg="";
		
		var o=0;

		var GG = {
			"kk" : function(mm) {
				//给予初始化赋值
				if (isNaN(mm)) {
					mm = 1;
				}
			if(o!=2){
				$.post("/cilentCustomer/myOrders.do?mm="+ mm +"&buttonValue="+buttonValue,function(data) {
					
								if(totalCount>0){ 
									//移除原来的li
									var lis = document.getElementsByName("orderTable");
									var ul = document.getElementById("myOrders");
									for (var i = 0; i < lis.length;) {
										ul.removeChild(lis[i]);
									}
									
									//拼接需求卡片
									for (var i = 0; i < data.orderList.length; i++) {
										var orderState="";
										
										//定义变量，区分是否可以取消订单
										var deleteOrder="<a href='javaScript:deleteOrder("+data.orderList[i].id+","+data.orderList[i].taskStateId+")'><spring:message code='取消订单'/></a>";
										//定义变量，确定客户是否可以评价
										var evaluate="";
										if(data.orderList[i].taskStateId==1){
											orderState="<spring:message code='形成订单'/>";
										}
										if(data.orderList[i].taskStateId==2){
											orderState="<spring:message code='翻译中'/>";
										}
										if(data.orderList[i].taskStateId==3){
											orderState="<spring:message code='校对中'/>";
										}
										if(data.orderList[i].taskStateId==4){
											orderState="<spring:message code='审核中'/>";
										}
										if(data.orderList[i].taskStateId==5){
											orderState="<spring:message code='已返稿'/>";
											deleteOrder="";
										}
										if(data.orderList[i].taskStateId==6){
											orderState="<spring:message code='已签收'/>";
											deleteOrder="";

											/* evaluate="<a href='/cilentCustomer/valuateUI.do?orderId="+data.orderList[i].id+"' target='_blank'><spring:message code='评价'/></a>"; */

										}
										if(data.orderList[i].taskStateId==7){
											orderState="<spring:message code='客户评价'/>";
											deleteOrder="";
											evaluate="<a href='/cilentCustomer/valuateUI.do?orderId="+data.orderList[i].id+"' target='_blank'><spring:message code='评价'/></a>";
										}
										if(data.orderList[i].taskStateId==8){
											orderState="<spring:message code='完成'/>";
											deleteOrder="";
										}
										if(data.orderList[i].taskStateId==9){
											orderState="<spring:message code='订单已取消'/>";
											deleteOrder="";
										}
										if(data.orderList[i].taskStateId==10){
											orderState="<spring:message code='拒收'/>";
											deleteOrder="";
										}
										
										var payState="";
										if(data.orderList[i].payState==0){
											payState="<spring:message code='未支付'/>";
										}
										if(data.orderList[i].payState==1){
											payState="<spring:message code='已支付'/>";
										}
										var order ="<table class='table myOrdersTable' name='orderTable'>"+
												   	"<tr>"+
												   	 "<th>"+data.orderList[i].generatedTime+"</th>"+
												   	 "<th><spring:message code='订单标题'/></th>"+
												   	 "<th><spring:message code='译员名'/></th>"+
												   	/*  "<th>用户名</th>"+ */
												   	 "<th><spring:message code='金额'/></th>"+
												   	 "<th><spring:message code='状态'/></th>"+
												   	 "<th><spring:message code='操作'/></th>"+
												   	"</tr>"+
												   	"<tr>"+
												   	 "<td><spring:message code='订单案号'/><br>"+data.orderList[i].orderReference+"</td>"+
												   	 "<td>"+data.orderList[i].orderTitle+"</td>"+
												   	 "<td>"+data.trList[i].nickname+"</td>"+
												   	 /* "<td>"+data.orderList[i].clientUserId+"</td>"+ */
												   	 "<td>￥"+data.orderList[i].payNumber+"<br><span>"+payState+"</span></td>"+
												   	 "<td><span style='color:red;'>"+orderState+"</span></td>"+
												   	 "<td class='caozuo'>"+
												   	  evaluate+
												   	  "<a href='/cilentCustomer/lookOrderById.do?orderId="+data.orderList[i].id+"' target='_blank'><spring:message code='查看订单'/></a><br>"+
												   	  deleteOrder+
												   	 "</td>"+
												   	"</tr>"+
												   "</table>";
										$("#myOrders").append(order);
									} 
								 }else{
									layer.alert("<spring:message code='没有找到符合条件的订单'/>", {
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
	      if(totalCount<=0){
	    	//弹出框提示没有信息
		         layer.msg("<spring:message code='没有找到符合条件的订单'/>", {icon: 5}); 
		         $("#page").initPage(1,1,0);
	      }else{ 
	    	  $("#page").initPage(totalCount, pageNum, GG.kk);
	      } 
		//给搜索按钮添加点击事件
		 $("#allButton").click(function(){
			// alert("进入全部搜索");
			// timeInut=document.getElementById("selectTime").value;
			  $('#allButton').css('background','#0088A8');
			  $('#comButtom').css('background','');
			  $('#noComplete').css('background','');
			 buttonValue = document.getElementById("allButton").value; 
			 findOrder('','');
				
		}); 
		 $("#comButtom").click(function(){
			// alert("进入已完成搜索");
			 //timeInut=document.getElementById("selectTime").value;
			 $('#comButtom').css('background','#0088A8');
			 $('#allButton').css('background','');
			 $('#noComplete').css('background','');
			 buttonValue = document.getElementById("comButtom").value; 
			 findOrder(buttonValue,'');
				
		}); 
		 $("#noComplete").click(function(){
			// alert("进入未完成搜索");
			 //timeInut=document.getElementById("selectTime").value;
			 $('#noComplete').css('background','#0088A8');
			 $('#allButton').css('background','');
			 $('#comButtom').css('background','');
			 buttonValue = document.getElementById("noComplete").value; 
			 findOrder(buttonValue,'');
				
		}); 
		
		 
		 $("#selectTime").change(function(){
			 timeInut=document.getElementById("selectTime").value;
			 findOrder('',timeInut);
		 });
		 
		 
		 function findOrder(buttonValue,timeInut){
				$.post("/cilentCustomer/myOrders.do?mm=1&buttonValue="+buttonValue+"&timeInut="+timeInut,function(data) {
				   o=2;
				   var lis = document.getElementsByName("orderTable");
					var ul = document.getElementById("myOrders");
					for (var i = 0; i < lis.length;) {
						ul.removeChild(lis[i]);
					}
					
					//拼接需求卡片
					for (var i = 0; i < data.orderList.length; i++) {
						
						var orderState="";
						
						//定义变量，确定是否可以取消订单
						var deleteOrder="<a href='javaScript:deleteOrder("+data.orderList[i].id+","+data.orderList[i].taskStateId+")'><spring:message code='取消订单'/></a>";
						
						//定义变量，确定客户是否可以评价
						var evaluate="";
						
						if(data.orderList[i].taskStateId==1){
							orderState="<spring:message code='形成订单'/>";
						}
						if(data.orderList[i].taskStateId==2){
							orderState="<spring:message code='翻译中'/>";
						}
						if(data.orderList[i].taskStateId==3){
							orderState="<spring:message code='校对中'/>";
						}
						if(data.orderList[i].taskStateId==4){
							orderState="<spring:message code='审核中'/>";
						}
						if(data.orderList[i].taskStateId==5){
							orderState="<spring:message code='已返稿'/>";
							deleteOrder="";
						}
						if(data.orderList[i].taskStateId==6){
							orderState="<spring:message code='已签收'/>";
							deleteOrder="";
							/* evaluate="<a href='/cilentCustomer/valuateUI.do?orderId="+data.orderList[i].id+"'>评价</a>"; */
						}
						if(data.orderList[i].taskStateId==7){
							orderState="<spring:message code='客户评价'/>";
							deleteOrder="";
							evaluate="<a href='/cilentCustomer/valuateUI.do?orderId="+data.orderList[i].id+"' target='_blank'><spring:message code='评价'/></a>";
						}
						if(data.orderList[i].taskStateId==8){
							orderState="<spring:message code='完成'/>";
							deleteOrder="";
						}
						if(data.orderList[i].taskStateId==9){
							orderState="<spring:message code='订单已取消'/>";
							deleteOrder="";
						}
						
						var payState="";
						if(data.orderList[i].payState==0){
							payState="<spring:message code='未支付'/>";
						}
						if(data.orderList[i].payState==1){
							payState="<spring:message code='已支付'/>";
						}
						
						var order ="<table class='table myOrdersTable' name='orderTable'>"+
								   	"<tr>"+
								   	 "<th>"+data.orderList[i].generatedTime+"</th>"+
								   	 "<th><spring:message code='订单标题'/></th>"+
								   	 "<th><spring:message code='译员名'/></th>"+
								   	/*  "<th>用户名</th>"+ */
								   	 "<th><spring:message code='金额'/></th>"+
								   	 "<th><spring:message code='状态'/></th>"+
								   	 "<th><spring:message code='操作'/></th>"+
								   	"</tr>"+
								   	"<tr>"+
								   	 "<td><spring:message code='订单案号'/><br>"+data.orderList[i].orderReference+"</td>"+
								   	 "<td>"+data.orderList[i].orderTitle+"</td>"+
								   	 "<td>"+data.trList[i].realName+"</td>"+
								   	 /* "<td>"+data.orderList[i].clientUserId+"</td>"+ */
								   	 "<td>￥"+data.orderList[i].payNumber+"<br><span>"+payState+"</span></td>"+
								   	 "<td><span style='color:red;'>"+orderState+"</span></td>"+
								   	 "<td class='caozuo'>"+
								   	  evaluate+
								   	  "<a href='/cilentCustomer/lookOrderById.do?orderId="+data.orderList[i].id+"' target='_blank'><spring:message code='查看订单'/></a><br>"+
								   	  deleteOrder+
								   	 "</td>"+
								   	"</tr>"+
								   "</table>";
						$("#myOrders").append(order);
					} 
					
					var page=data.page;
					//判断总记录数是否为0 
					if(page.totalCount==0){
						//初始化页面将总记录数为1
						$("#page").initPage(1,page.pageNum, GG.kk); 
						//弹出框提示没有信息
						layer.msg("<spring:message code='没有找到符合条件的订单'/>", {icon: 5});
					}else{
						//如果不为0则初始化页面
						$("#page").initPage(page.totalCount,page.pageNum, GG.kk); 
					}
			   },"json");
			}
	})
		
	function deleteOrder(orderId,orderState){
		$.post("${pageContext.request.contextPath}/cilentCustomer/getDeleteMoney.do","orderId="+orderId+"&orderState="+orderState,function(data){
			/* alert(data.getDeleteMoney); */
			var money=data.getDeleteMoney;
			/* alert(money) */
			layer.open({
			  content: "<spring:message code='取消订单将会扣除相应费用"+money+"元，您确定要取消订单吗？'/><br>请输入密码:<input type='password' id='contentId'>"
			  ,btn: ["<spring:message code='确定'/>", "<spring:message code='取消'/>"]
			  ,btn1: function(index, layero){
			    //按钮【按钮一】的回调
			   /*  layer.close(index);
			    	//var payPassword=getPayPassword();//支付密码是否正确
			    	layer.prompt({
				    	 formType: 2,
				    	 title:'请输入密码',
				    	 
			    	},function(value, index, elem){ */
			    		$.ajax({
		    		    	type: "post",
		    		    	url: "${pageContext.request.contextPath}/cilentCustomer/getPayPassword.do",
		    		    	data: {
		    		    	"payPassword":$("#contentId").val()
		    		    	},
		    		    	
		    		    	success : function(data){
		    		    		if("success"==data.result){
		    		    			layer.close(index);
		    			    		$.ajax({
		    							 type: "post",
		    							 url: "${pageContext.request.contextPath}/cilentCustomer/deleteOrder.do",
		    							 data: {
		    							 "orderId": orderId,
		    							 "orderState":orderState,
		    							 "money":money
		    							 },
		    							 success : function(data){
		    								 //alert(data.result);
		    							  if(data.result=='success'){
		    								  layer.msg("<spring:message code='取消订单成功！'/>",{icon: 1},function (){
		    									  
		    									  window.location.href="/cilentCustomer/myOrdersUI.do";
		    								  }); 
		    								  //刷新订单展示页面
		    								  
		    							  }else{
		    								  layer.msg("<spring:message code='取消订单失败！'/>");  
		    								 }
		    							 }
		    							 });
		    			    	}else{
		    			    		layer.msg("<spring:message code='密码错误！'/>");  
		    			    	}
		    			    	
		    		    	 },
		    		    
		    		    }); 
			    	/* }) */
			    	
			  }
			  ,btn2: function(index, layero){
			    //按钮【按钮二】的回调
			    layer.close(index)
			    
			    //return false 开启该代码可禁止点击该按钮关闭
			  }
			  ,cancel: function(){ 
			    //右上角关闭回调
			    layer.close(index);
			    //return false 开启该代码可禁止点击该按钮关闭
			  }
			});
		
		},'json');//post结束
		
		/*  layer.confirm('', {
			 btn: ['',''] //按钮
			 btn1： function(){
			 layer.closeAll('dialog');
			 $.ajax({
			 type: "post",
			 url: "${pageContext.request.contextPath}/cuishou/delete",
			 data: {
			 "id": id
			 },
			 success : function(data){
			  
			 }
			 });
			 }},function(){
				 layer.closeAll('dialog');  点击确定关闭提示框
			 };

			  */
	}
	
	//获取支付密码
	function getPayPassword(){
		var payPassword;
		layer.prompt({
	    	 formType: 2,
	    	 title:'请输入密码',
	    	 btn: ["<spring:message code='确定'/>", "<spring:message code='取消'/>"],
	    	 btn1: function(index,value){
	    		 layer.close(index);
	    		 $.ajax({
	    		    	type: "post",
	    		    	url: "${pageContext.request.contextPath}/cilentCustomer/getPayPassword.do",
	    		    	data: {
	    		    	"payPassword":value
	    		    	},
	    		    	async: true,
	    		    	success : function(data){
	    		    		payPassword=date.result;
	    			    	
	    		    	 }
	    		    }); 
	    	    } 
	    	})/* , 
	    	function(value, index, elem){
	    	
	    	//layer.alert(value);
	    	
	    	
	    	
	    }); */
		
		return payPassword;
	}
	
</script>

  </head>
  <body style="background: #f5f5f5;">
    <!--      顶部导航      -->
  <c:if test="${clientid.id!=null || transid.id!=null }">
	<div class="publickNav">
		<div class="public_nav">
			<nav class="container" style="padding:0 20px;">
				<div class="navbar-left">
					<a href="?lang=zh_CN" class="navbar-link" onclick="in18(this)">中文</a> | <a href="?lang=en_US" class="navbar-link" onclick="in18(this)">English</a>
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
             <a href="?lang=zh_CN" class="navbar-link" onclick="in18(this);">中文</a> | <a href="?lang=en_US" class="navbar-link" onclick="in18(this);">English</a>
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
          <h2><spring:message code='用户中心'/></h2>
        </div>

        <!--    用户中心 我是客户   -->
        <div class="my_customer">
          <div class="row">

            <!--    用户中心 我是客户 左侧导航   -->
            <div class="my_customer_left col-sm-2">
			  <ul class="my_customer_ul">
			   <li class="cus_iter_navlists"> <a href="/forwardAction/forward_toCustomerShow.do"> <spring:message code='个人信息'/> </a> </li>  
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

            <!--    用户中心 我是客户 我的订单 右侧内容   -->
            <div class="my_customer_right col-sm-10">
              <div  class="myTabContent" class="tab-content" style="margin-top:0;">
                <h3 style="padding-bottom:20px;margin-bottom:30px;border-bottom:2px solid #ddd;font-size:20px;font-weight:700;"><spring:message code='我的订单'/></h3>
                <div class="myneeds_top row" style="margin-bottom:30px;">
                  <div class="col-sm-2"><button type="button" class="btn btn-info" style="padding:5px 30px;" name="button" id="allButton" value=""><spring:message code='全部订单'/></button></div>
                  <div class="col-sm-offset-1 col-sm-2"><button type="button" class="btn btn-info" style="padding:5px 30px;" name="button" id="comButtom" value="已完成"><spring:message code='已完成'/></button></div>
                  <div class="col-sm-2"><button type="button" class="btn btn-info" style="padding:5px 30px;" name="button" id="noComplete" value="未完成"><spring:message code='未完成'/></button></div>
                  <span class="col-sm-2" style="padding-left:70px;height:34px;display:inline-block;line-height:34px;"><spring:message code='订单管理'/></span>
                  <div class="col-sm-3">
                    <select class="form-control" id="selectTime">
                      <option value=""><spring:message code='请选择时间'/></option>
                      <option value="3m"><spring:message code='近3个月订单'/></option>
                      <option value="1m"><spring:message code='近1个月订单'/></option>
                      <option value="1w"><spring:message code='近1个星期'/></option>
                    </select>
                  </div>
                </div>
                <div class="myOrders" id="myOrders">
                 <!--  <table class="table myOrdersTable">
                    <tr>
                      <th>2017-2-24<br>11:47</th>
                      <th>订单详情</th>
                      <th>译员名</th>
                      <th>用户名</th>
                      <th>金额</th>
                      <th>状态</th>
                      <th>操作</th>
                    </tr>
                    <tr>
                      <td>订单号<br>1234567</td>
                      <td>英文论文翻译</td>
                      <td>张三</td>
                      <td>pzw</td>
                      <td>￥700<br><span>已支付</span></td>
                      <td><span style="color:red;">已完成</span><br><a href="user.customer.order.details.html">订单详情</a></td>
                      <td class="caozuo">
                        <a href="">评价</a>
                        <a href="user.customer.order.details.html">查看订单</a><br>
                        <a href="">取消订单</a>
                        <a href="">联系客户</a>
                      </td>
                    </tr>
                  </table>
                  <table class="table myOrdersTable">
                    <tr>
                      <th>2017-2-24<br>11:47</th>
                      <th>订单详情</th>
                      <th>译员名</th>
                      <th>用户名</th>
                      <th>金额</th>
                      <th>状态</th>
                      <th>操作</th>
                    </tr>
                    <tr>
                      <td>订单号<br>1234567</td>
                      <td>英文论文翻译</td>
                      <td>张三</td>
                      <td>pzw</td>
                      <td>￥700<br><span>未支付</span></td>
                      <td><span style="color:red;">未完成</span><br><a href="user.customer.order.details.html">订单详情</a></td>
                      <td class="caozuo">
                        <a href="user.customer.order.details.html">查看订单</a><br>
                        <a href="">取消订单</a>
                        <a href="">联系客户</a>
                      </td>
                    </tr>
                  </table> -->
                </div>
                <!--currentpage="1" numbercount="100"-->
                <div class="common_problem_page"><ul class="page pull-right" maxshowpageitem="5" pagelistcount="4"  id="page"></ul></div>
              </div>

            </div>
            <!--    用户中心 我是客户 我的订单 右侧内容 结束   -->

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
    $(".cus_iter_navlists:nth-child(4)").addClass('useractive');
	
    /*   var tables = $(".myOrders").html();
      for(var i=0;i<1;i++){
        $(".myOrders").append(tables);
      };  */    
    </script>
  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
