<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code='用户中心-我是用户-积分兑换'/></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.center.css"/>
    <link href="${pageContext.request.contextPath}/css/page.css" type="text/css" rel="stylesheet"/>


    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/public.nav.footer.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.center.js"></script> --%>
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script> --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>

    <style>
      .integralName{
        font-size: 16px;
      }
      .integralName span{
        padding-left:10px;
      }
      .myIntegral{
        width:200px;
        height:150px;
        border-radius: 60%;
        background:#f1f1f1;
        margin:10px 0 0 20px;
      }
      .myIntegral p{
        text-align: center;
        padding-top:25px;
      }
      .integral_rule .integral_rule_ul1{
        width:260px;
        height:350px;
        margin-top:10px;
        border:1.5px solid #ccc;
        padding:30px 20px;
      }
      .integral_rule .integral_rule_ul1 li{
        padding-bottom:5px;
      }
      .integral_rule .integral_rule_ul2{
        width:165px;
        min-height:350px;
        margin-top:10px;
        background:#7fcef5;
        border-radius: 5px;
        border:1.5px solid #ccc;
        padding:20px 8px;
        position: relative;
        left:-45px;
        top:20px;
      }
      .changeclick{
        text-align: right;
        margin-right:50px;
      }
      .changeclick span{
        cursor: pointer;
        border-bottom: 1px solid #222;
      }
      .changemore{
        height:200px;
        overflow: hidden;
      }
      .changemore li{
        margin-right:55px !important;
      }

      /* 积分商城 */
      
      .integralthings li{
        width:115px;
        min-height:170px;
        margin-top:25px;
        text-align: center;
        margin-right:50px;
      }
      .integralthings li img{
        width:95px;
        height:95px;
        margin-bottom:20px;
      }
      .integralthings li p{
        font-size:12px;
      }
      .integralthings li button{
        width:60px;
        height:25px;
        border-radius: 10px;
        line-height:25px;
        padding:0;
        margin-top:8px;
      }
      .integral_rule_ul2 li{
        padding-bottom:8px;
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
		
		var language="";
		var field="";
		var length="";
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
				$.post("/cilentCustomer/findExchange.do?mm="+mm,function(data) {
					//移除原来换一批的li
					var lis = document.getElementsByName("liname1");
					var ul1 = document.getElementById("integralthings1");
					for (var i = 0; i < lis.length;) {
						ul1.removeChild(lis[i]);
					} 
					//添加新的换一批
					for(var i=0;i<data.length;i++){
						//alert(data[i].URL);
						if(i<3){
							$("#integralthings1").append(
						            "<li name=liname1>"+
						              "<img src='"+data[i].URL+"' />"+
						              "<p>"+data[i].markMin+"<spring:message code='积分'/></p>"+
						              "<button class='btn btn-info' onclick='exchange("+data[i].markMin+","+data[i].id+")'><spring:message code='兑换'/></button>"+  
						            "</li>"
						          );
						}
				      };
					
					
				    //移除旧的
				    var lis2 = document.getElementsByName("liname2");
					var ul2 = document.getElementById("integralthings2");
					for (var i = 0; i < lis2.length;) {
						ul2.removeChild(lis2[i]);
					} 
					
					//添加新的				
					for(var i=0;i<data.length;i++){
				          $("#integralthings2").append(
				            "<li name=liname2>"+
				              "<img src='"+data[i].URL+"' />"+
				              "<p>"+data[i].markMin+"<spring:message code='积分'/></p>"+
				              "<button class='btn btn-info' onclick='exchange("+data[i].markMin+","+data[i].id+")'><spring:message code='兑换'/></button>"+  
				            "</li>"
				          );
				        };
									
							}, "json");
				}
				o=1;//给予搜索后赋予另一个值来进行收索后的翻页执行
			}
		}
		if(totalCount>0){
			$("#page").initPage(totalCount, pageNum, GG.kk);
		}else{
			$("#page").initPage(1, 1, 0);
			layer.alert("<spring:message code='没有找到可兑换的商品'/>", {
				icon: 5,
				title: "<spring:message code='提示'/>"
				});
		}
		
		
		
		//“换一组”按钮添加点击事件
		  $("#changeclick").click(function(){
				$.post("/cilentCustomer/changeclick.do",function(data){
				  // o=2;
				   var lis = document.getElementsByName("liname1");
				   var ul1 = document.getElementById("integralthings1");
				   if(data.length<=0){
					for (var i = 0; i < lis.length;) {
						ul1.removeChild(lis[i]);
					} 
					//添加新的换一批
					for(var i=0;i<data.length;i++){
						if(i<3){
							$("#integralthings1").append(
						            "<li name=liname1>"+
						              "<img src='"+data[i].URL+"' />"+
						              "<p>"+data[i].markMin+"<spring:message code='积分'/></p>"+
						              "<button class='btn btn-info' onclick='exchange("+data[i].markMin+","+data[i].id+")'><spring:message code='兑换'/></button>"+  
						            "</li>"
						          );
						}
				      }
			  	 }
				
				 if(data.length<=0){
					   layer.alert("<spring:message code='没有找到更多兑换的商品'/>", {
							icon: 5,
							title: "<spring:message code='提示'/>"
							});
				   }

		   },"json");
		}); 
	})

	
	function exchange(goodsMark,goodId){
	  var cusMark=document.getElementById("cusIntegral").value;
	  if(goodsMark>cusMark){
		  //积分不够，不能兑换
		  layer.alert('<spring:message code="积分太少了，找找其他商品吧！"/>', {
				icon: 5,
				title: "<spring:message code='提示'/>"
				});
	  }else{
		  //可以兑换
		  $.post("/cilentCustomer/exchange.do","goodsMark="+goodsMark+"&goodId="+goodId+"&cusMark="+cusMark,function(data){
	  			if(data.msg=='success'){
	  			 layer.msg('<spring:message code="兑换成功，稍后会由工作人员给您发货！"/>',{icon:1});
	  			 //刷新页面
	  			window.location.href="/cilentCustomer/exchangeUI.do"
	  			}
	  		},"json");
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
                  <li class="active"><a href="#basicdata" data-toggle="tab"><spring:message code='我的积分'/></a></li>
                  <li><a href="#realname" data-toggle="tab"><spring:message code='积分商城'/></a></li>
                </ul>
              </div>

                <!--  tab面板对应内容 积分兑换  -->
                <div class="myTabContent tab-content">
                  <div class="tab-pane fade in active" id="basicdata" style="padding:20px 20px 30px 30px;">
                    <div class="row">
                      <div class="col-sm-8">
                        <p class="integralName"><spring:message code='姓名：'/><span>${ clientUser.realName}</span></p>
                        <div class="myIntegral">
                          <p><spring:message code='我的积分'/></p>
                          <input type="hidden" id="cusIntegral" value="${ clientUser.integral}">
                          <p>${ clientUser.integral}</p>
                        </div>
                        <div class="">
                          <div class="changeclick"><span><a href="javascript:#" id="changeclick"><spring:message code='换一组'/></a></span></div>
                          <ul class="list-inline integralthings changemore" id="integralthings1"></ul>
                        </div>
                      </div>
                      <div class="col-sm-4">
                        <div>
                          <p class="text-center" style="font-size:16px;"><spring:message code='积分规则'/></p>
                          <div class="integral_rule">
                            <ul class="list-group integral_rule_ul1">
                              <li>1、<spring:message code='客户确认订单后平台会自动增加相应的积分值。'/><br><br></li>
                             <!--  <li>2、使用软件可以提高部分积分的加成。</li> -->
                              <li>2、<spring:message code='凡兑换商品务必谨慎，商品每月只允许兑换一次，且兑换过后积分将减少兑换商品相应的积分。'/><br><br></li>
                              <li>3、<spring:message code='兑换积分时平台会以快递形式发送至个人信息中填写的地址务必核对修改。'/><br><br></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="tab-pane fade" id="realname">
                    <div class="row">
                        <div class="col-sm-10">
                          <p class="integralName"><spring:message code='当前所拥有积分：'/><span style="color:#8db5e3;padding-right:10px;">${clientUser.integral}</span><spring:message code='分'/></p>
                          <div class="">
                            <ul class="list-inline integralthings" id="integralthings2"></ul>
                          </div>
                          <!--currentpage="1" numbercount="100"-->
                          <div class="common_problem_page"><ul class="page" style="padding-top:38px;" maxshowpageitem="10" pagelistcount="8"  id="page"></ul></div>
                        </div>
                        <div class="col-sm-2">
                          <div>
                            <div class="integral_rule">
                              <ul class="list-group integral_rule_ul2">
                                <li><p class="text-center"><spring:message code='兑换规则'/></p></li>
                                <li>（1）、<spring:message code='兑换商品每月只能兑换一次。'/></li>
                                <li>（2）、<spring:message code='兑换后商品将由平台在7天内进行派送，收货地址默认为个人信息地址请务必填写仔细。'/></li>
                               
                                <li style="margin-top:40px;"><spring:message code='环宇爱译'/> —</li>
                                <li style="text-align:right;"><spring:message code='全球专利翻译平台'/></li>
                                <li style="text-align:right;padding-right:12px;">2017-08-15</li>
                              </ul>
                            </div>
                          </div>
                        </div>
                      </div>
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
      $(function(){
        var a = $(".changemore li").length
        var j = 0;
        $(".changemore").click(function(){
          if(j>=a)j=0;  
          $(".changeclick li").eq(j).css("display","none");  
          j++;
          
          // $(".changemore li").eq(j).css("display","block");
        });
     
        $(".cus_iter_navlists:nth-child(5)").addClass('useractive');
        var tnickname = "${transid.nickname}";
 		var unickname = "${clientid.userName}"
 		if(tnickname!=""){
 			$("#nickname").text(tnickname+"<spring:message  code='，欢迎您！'/>");
 			
 		}else if (unickname!="") {
 			$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>!");
 			}


      });

    </script>
  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
