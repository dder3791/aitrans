<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name=" Keywords" content="......">      <!--content中，网页关键字-->
    <meta name=" description" content="......">   <!--content中，网页描述文字-->
    <meta name="author" content="......">        <!--标注作者-->
    <title><spring:message code='用户中心-我是客户-我的项目'/></title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.center.css"/>
    <link href="${pageContext.request.contextPath}/css/page.css" type="text/css" rel="stylesheet"/>


    <!-- <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script> -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.0.min.js"></script>
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
   <%--  <script type="text/javascript" src="${pageContext.request.contextPath}/js/public.nav.footer.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.center.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.customer.myneeds.js"></script> --%>
   <%--  <script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script> --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    
    <script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
	<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
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
    <style type="text/css">
    	.lefttd{
    		width:80%;
    	}
    	.needTr{
    		background-color: white;
    		height:35px;
    	}
    	#tda{
    		color:#008800;
    	}
    	#myneeds_lists_ul td{
    		text-align: center;
    		height:60px;
    	}
    	#myneeds_lists_ul th{
    		text-align: center;
    		height:50px;
    	}
    	#tda:hover{
    		color:red;
    	}
    	#needid:hover {
    		text-decoration: underline;
    		color:red;
    	}
    	.needNum {
    		color:gray;
    	}
    </style>
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
        <div style="height:30px;"></div>
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
            <!--    用户中心 我是客户 我的需求 右侧内容   -->
            <div class="my_customer_right col-sm-10">
              <!--  用户中心右侧 tab切换栏   -->
              <ul id="suerTab" class="nav nav-tabs">
              	<li class="active"><a href="javascript:;" data-toggle="tab"><spring:message code='我的项目'/></a></li>
              </ul>

              <div  class="myTabContent" class="tab-content">
                <div class="myneeds_top">
                  <button type="button" class="btn btn-info col-sm-2" name="button" id="allButton"><spring:message code='全部项目'/></button>
                  <div class="col-sm-3">
                  	<%--<input type="text" name="makeupCo" id="makeupCo" class="form-control" onfocus="setfocus(this)" oninput="setinput(this);" placeholder="请选择"/> 
                  	 <input type="hidden" name="makeupCoValue" id="makeupCoValue" class="form-control" />  --%>
                    <select class="form-control col-sm-2" id="typenum">
                      	<option value=""><spring:message code='请选择状态'/></option>
                      	<option value="未发布"><spring:message code='未发布'/></option>
                      	<option value="发布中"><spring:message code='发布中'/></option>
                      	<option value="失效"><spring:message code='失效'/></option>
                    </select>
                  </div>
                  <div class="col-sm-3">
                    <select class="form-control" id="selectModel">
                      <option value=""><spring:message code='请选择项目发布模式'/></option>
                      <option value="主动投标模式"><spring:message code='译员主动投标'/></option>
                      <option value="系统分配模式"><spring:message code='系统分配译员'/></option>
                      <option value="选定译员模式"><spring:message code='选定译员'/></option>
                    </select>
                  </div>
                  <div class="input-group col-sm-4">
                    <input type="text" class="form-control" placeholder="<spring:message code='输入关键字'/>" id="searchInput">
                    <div class="input-group-addon"><i class="fa fa-search" aria-hidden="true" id="searchButton"></i></div>
                  </div>
                </div>
                <div class="myneeds_body">
                  <!-- <ul class="myneeds_lists" id="myneeds_lists_ul"> -->
                  <table border="1px" bordercolor="white" id="myneeds_lists_ul" style="width:100%;">
                  	<tr>
                  		<th></th>
                  		<th><spring:message code='价格'/></th>
                  		<th><spring:message code='状态'/></th>
                  		<th><spring:message code='模式'/></th>
                  		<th><spring:message code='等级'/></th>
                  		<th><spring:message code='语种'/></th>
                  		<th><spring:message code='操作'/></th>
                  	</tr>
                  </table>
                   <!--  <li class="myneeds_lists_li"  name="myneeds_lists_li">
                      <div class="number_li">
                        <span>2017-02-10 11:30:10</span>
                        <span class="number_li_span">编号：1234567</span>
                        <a class="pull-right" href="javascript:;">修改需求</a>
                      </div>
                      <div class="myneeds_lists_content">
                        <div class="col-sm-6">
                          <p>资质要求：<span>3级译员，中译英，5天完成，600-800元</span></p>
                          <p>已有<span>6</span>名译员参与</p>
                        </div>
                        <span class="col-sm-2">译员主动投标</span>
                        <div class="col-sm-2 pull-right">
                          <button type="button" class="btn btn-info yiyuanmore" name="button">选择译员<span class="list_badge">1</span></button>
                          <button type="button" onclick="detailsNeed()" class="btn btn-info yiyuanmore" name="button" disabled>查看订单</button>
                        </div>
                      </div>
                    </li>
                    <li class="myneeds_lists_li">
                      <div class="number_li">
                        <span>2017-02-09 11:30:10</span>
                        <span class="number_li_span">编号：1234567</span>
                        <a class="pull-right" href="javascript:;">修改需求</a>
                      </div>
                      <div class="myneeds_lists_content">
                        <div class="col-sm-6">
                          <p>资质要求：<span>3级译员，中译英，5天完成，600-800元</span></p>
                          <p>已有<span>6</span>名译员参与</p>
                          <p>已选择<span class="name_color">张三</span>为您服务</p>
                        </div>
                        <span class="col-sm-2">分配译员</span>
                        <div class="col-sm-2 pull-right">
                          <button type="button" class="btn btn-info yiyuanmore" name="button" disabled>选择译员</button>
                          <button type="button" onclick="detailsNeed()" class="btn btn-info yiyuanmore" name="button">查看订单<span class="list_badge">2</span></button>
                        </div>
                      </div>
                    </li> -->
                  </ul>
					
                  <!--currentpage="1" numbercount="100"-->
                  <div class="common_problem_page">
							<ul class="page pull-right" style="margin-top: 20px;" maxshowpageitem="5" pagelistcount="3" id="page"></ul>
				  </div>
                </div>
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
    var lang = "${language}"
	if(lang==""){
		lang="zh";
	}
  
    $(function(){  
    	
      //总记录数
		var totalCount = '${page.totalCount }';
		//alert(totalCount);
		//当前页
		var pageNum = '${page.pageNum}';
		
		var stateModdel="";
		var selectModel="";
		var searchInput="";
		var o=0;
		
       	var GG = {
       			"kk" : function(mm) {
       				//给予初始化赋值
       				if (isNaN(mm)) {
       					mm = 1;
       				}
       				var yuyan = "";
       				if(o!=2){
       					/* jQuery.i18n.properties({
       				        name:'Messages', 
       				        path:'/i18n/', 
       				        mode:'both',
       				   		language:lang,
       				        checkAvailableLanguages: true,
       				        async: true,
       				        callback: function() {	 */
       				        	$.post("/cilentCustomer/myneeds.do?mm="+ mm + "&selectModel=" + selectModel + "&searchInput="+ searchInput+"&stateModdel="+stateModdel,function(data) {
	        						if(totalCount>0){
	        							//移除原来的li
	        							/* var lis = document.getElementsByName("myneeds_lists_li");
	        							var ul = document.getElementById("myneeds_lists_ul");
	        							for (var i = 0; i < lis.length;) {
	        								ul.removeChild(lis[i]);
	        							}  */
	        							/* $("#myneeds_lists_ul").empty(); */
	        							$("#myneeds_lists_ul  tr:not(:first)").empty("");
	        							
	        							 //拼接需求卡片
	        							for (var i = 0; i < data.cusNeedList.length; i++) {
	        								var date2 = new Date(data.cusNeedList[i].completeTime);
	        								var date1 = new Date(data.cusNeedList[i].publishTime);
	        								 
	        								var s1 = date1.getTime(),s2 = date2.getTime();
	        								var total = (s2 - s1)/1000;
	        								 
	        								 
	        								var day = parseInt(total / (24*60*60));//计算整数天数
	        								
	        								var modelp=data.cusNeedList[i].publishModel;
	        								if(modelp=='主动投标模式'){
	        									modelp="<spring:message code='招标模式'/>"
	        								}
	        								if(modelp=='系统分配模式'){
	        									modelp="<spring:message code='系统分配模式'/>"
	        								}
	        								if(modelp=='选定译员模式'){
	        									modelp="<spring:message code='选定译员模式'/>"
	        								}
	        								var acceptState=data.cusNeedList[i].acceptState;
	        								var butt;
	        								var ne;
	        								var de;
	        								var model;
	        								//alert(acceptState);
	        									
	        								
	        								/* if("未发布"==acceptState){
	        									butt="<div class='pull-right'><a href='/cilentCustomer/updateUI.do?id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='修改项目'/></a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href='/cilentCustomer/secondPublishNeed.do?id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='现在发布'/></a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:deleteNeed("+data.cusNeedList[i].id+")'><spring:message code='删除项目'/></a></div>" 	
	        								}else if("失效"==acceptState){
	        									butt="<div class='pull-right'><a href='/cilentCustomer/updateUI.do?state=失效&id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='修改项目'/></a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:deleteNeed("+data.cusNeedList[i].id+")'><spring:message code='删除项目'/></a></div>" 	
	        								}else if("发布中"==acceptState){
	        									butt="<div class='pull-right'><a href='javascript:deleteNeed("+data.cusNeedList[i].id+")'><spring:message code='删除项目'/></a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href='/cilentCustomer/copyPublishNeed.do?id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='复制项目'/></a></div>" 	
	        								}else{
	        									butt="";
	        								} */
	        								
	        								/* if(modelp=="选定译员模式"){
	        									model="<button type='submit' class='btn btn-info yiyuanmore' name='button'>查看译员</button>";
	        								}else{ */
	        									model="";
	        								/* } */
	        									
	        							
	        									ne="<button type='submit' class='btn btn-info yiyuanmore' name='button'><spring:message code='查看项目'/></button>";
	        									
	        									
	        								var brforeStr = data.cusNeedList[i].title;
	        								var lastIndex = brforeStr.lastIndexOf('，');
	        								if(lastIndex != -1){
	        									var afterStr = brforeStr.slice(0,lastIndex);
		        								data.cusNeedList[i].title = afterStr;
	        								}
	        								
	        								/* var need = "<li class='myneeds_lists_li' name='myneeds_lists_li'>"+
	        												"<div class='number_li'>"+
	        													"<span>"+data.cusNeedList[i].needReference+"</span>"+
	        													"<span class='number_li_span'><spring:message code='编号：'/>"+data.cusNeedList[i].id+"</span>"+
	        													butt+
	        												"</div>"+
	        												"<div class='myneeds_lists_content'>"+
	        													"<div class='col-sm-6'>"+
	        														"<p><spring:message code='资质要求：'/><span>"+data.cusNeedList[i].transLevel+"<spring:message code='级译员，'/>"+jQuery.i18n.prop(data.cusNeedList[i].languagePair)+"，"+day+"<spring:message code='天完成，'/>"+data.cusNeedList[i].totalMoney+"<spring:message code='元'/></span></p>"+
	        														"<p><spring:message code='状态：'/><span>"+jQuery.i18n.prop(acceptState)+"</span></p>"+
	        													"</div>"+
	        													"<span class='col-sm-2'>"+modelp+"</span>"+
	        													"<div class='col-sm-2 pull-right'>"+
	        														"<form action='/cilentCustomer/queryCusNeedTrans.do' method='post'>"+
	        															"<input type='hidden' name='needId' value='"+data.cusNeedList[i].id+"'>"+
	        															model+
	        														"</form>"+
	        														"<form target='_blank' action='/cilentCustomer/lookPublishNeedById.do?id="+data.cusNeedList[i].id+"&lookType=customerCenter' method='post'>"+
	        															ne+
	        														"</form>"+
	        													"</div>"+
	        													"<div class='pull-right' style='text-align:left'>"+
	        													"<spring:message code='截止日期：'/>"+data.cusNeedList[i].expirydate+
	        													"</div>"+
	        												"</div>"+
	        											"</li>" */
	        								/* var need = "";
	        								if("未发布"==acceptState){
	        									need =  "<tr class='needTr'><td class='lefttd' colspan='2'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size='5px'>"+data.cusNeedList[i].title+"</font>&nbsp;&nbsp;<font color='gray'>"+data.cusNeedList[i].needReference+"</font>&nbsp;&nbsp;<font color='#0000CD'>"+jQuery.i18n.prop(acceptState)+"</font><font style='float:right;'>截止日期："+data.cusNeedList[i].expirydate+"&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>"+
     											"<tr class='needTr' style='border-bottom-color: white;'><td rowspan='2' class='lefttd'><label style='width:10%'></label><label style='width:40%'><font color='#DD0000'>￥<font size='5px'>"+data.cusNeedList[i].totalMoney+"</font></font></label><label><form target='_blank' action='/cilentCustomer/lookPublishNeedById.do?id="+data.cusNeedList[i].id+"&lookType=customerCenter' method='post'>"+
												ne+
												"</form></label></td><td style='text-align:center;'><a id='tda' href='/cilentCustomer/updateUI.do?id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='修改项目'/></a></td></tr>"+
    											"<tr class='needTr'><td style='border-bottom-color: white;text-align:center;'><a id='tda' href='/cilentCustomer/secondPublishNeed.do?id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='现在发布'/></a></td></tr>"+
    											"<tr class='needTr'><td style='height:40px;' class='lefttd'><label style='width:7%'></label><label style='width:40%'><font size='4px' color='#003C9D '>"+modelp+"</font></label><label style='width:25%'><font>等级："+data.cusNeedList[i].transLevel+"<spring:message code='级'/></font></label><label style='width:25%'><font>语种："+data.cusNeedList[i].languagePair+"</font></label></td><td style='text-align:center;'><a id='tda' href='javascript:deleteNeed("+data.cusNeedList[i].id+")'><spring:message code='删除项目'/></a></td></tr>"+
    											"<tr style='height:20px;'></tr>";
	        								}else if("失效"==acceptState){
	        									need =  "<tr class='needTr'><td class='lefttd' colspan='2'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size='5px'>"+data.cusNeedList[i].title+"</font>&nbsp;&nbsp;<font color='gray'>"+data.cusNeedList[i].needReference+"</font>&nbsp;&nbsp;<font color='#0000CD'>"+jQuery.i18n.prop(acceptState)+"</font><font style='float:right;'>截止日期："+data.cusNeedList[i].expirydate+"&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>"+
     											"<tr class='needTr' style='border-bottom-color: white;'><td rowspan='2' class='lefttd'><label style='width:10%'></label><label style='width:40%'><font color='#DD0000'>￥<font size='5px'>"+data.cusNeedList[i].totalMoney+"</font></font></label><label><form target='_blank' action='/cilentCustomer/lookPublishNeedById.do?id="+data.cusNeedList[i].id+"&lookType=customerCenter' method='post'>"+
												ne+
												"</form></label></td><td style='text-align:center;'><a id='tda' href='/cilentCustomer/updateUI.do?state=失效&id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='修改项目'/></a></td></tr>"+
    											"<tr class='needTr'><td style='border-bottom-color: white;text-align:center;'><a href='javascript:deleteNeed("+data.cusNeedList[i].id+")'><spring:message code='删除项目'/></a></td></tr>"+
    											"<tr class='needTr'><td style='height:40px;' class='lefttd'><label style='width:7%'></label><label style='width:40%'><font size='4px' color='#003C9D '>"+modelp+"</font></label><label style='width:25%'><font>等级："+data.cusNeedList[i].transLevel+"<spring:message code='级'/></font></label><label style='width:25%'><font>语种："+data.cusNeedList[i].languagePair+"</font></label></td><td style='text-align:center;'></td></tr>"+
    											"<tr style='height:20px;'></tr>";
	        								}else if("发布中"==acceptState){
	        									var need =  "<tr class='needTr'><td class='lefttd' colspan='2'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size='5px'>"+data.cusNeedList[i].title+"</font>&nbsp;&nbsp;<font color='gray'>"+data.cusNeedList[i].needReference+"</font>&nbsp;&nbsp;<font color='#0000CD'>"+jQuery.i18n.prop(acceptState)+"</font><font style='float:right;'>截止日期："+data.cusNeedList[i].expirydate+"&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>"+
     											"<tr class='needTr' style='border-bottom-color: white;'><td rowspan='2' class='lefttd'><label style='width:10%'></label><label style='width:40%'><font color='#DD0000'>￥<font size='5px'>"+data.cusNeedList[i].totalMoney+"</font></font></label><label><form target='_blank' action='/cilentCustomer/lookPublishNeedById.do?id="+data.cusNeedList[i].id+"&lookType=customerCenter' method='post'>"+
												ne+
												"</form></label></td><td style='text-align:center;'><a id='tda' href='javascript:deleteNeed("+data.cusNeedList[i].id+")'><spring:message code='删除项目'/></a></td></tr>"+
    											"<tr class='needTr'><td style='border-bottom-color: white;text-align:center;'><a id='tda' href='/cilentCustomer/copyPublishNeed.do?id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='复制项目'/></a></td></tr>"+
    											"<tr class='needTr'><td style='height:40px;' class='lefttd'><label style='width:7%'></label><label style='width:40%'><font size='4px' color='#003C9D '>"+modelp+"</font></label><label style='width:25%'><font>等级："+data.cusNeedList[i].transLevel+"<spring:message code='级'/></font></label><label style='width:25%'><font>语种："+data.cusNeedList[i].languagePair+"</font></label></td><td style='text-align:center;'></td></tr>"+
    											"<tr style='height:20px;'></tr>";
	        								}else{
	        									need =  "<tr class='needTr'><td class='lefttd' colspan='2'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size='5px'>"+data.cusNeedList[i].title+"</font>&nbsp;&nbsp;<font color='gray'>"+data.cusNeedList[i].needReference+"</font>&nbsp;&nbsp;<font color='#0000CD'>"+jQuery.i18n.prop(acceptState)+"</font><font style='float:right;'>截止日期："+data.cusNeedList[i].expirydate+"&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>"+
     											"<tr class='needTr' style='border-bottom-color: white;'><td rowspan='2' class='lefttd'><label style='width:10%'></label><label style='width:40%'><font color='#DD0000'>￥<font size='5px'>"+data.cusNeedList[i].totalMoney+"</font></font></label><label><form target='_blank' action='/cilentCustomer/lookPublishNeedById.do?id="+data.cusNeedList[i].id+"&lookType=customerCenter' method='post'>"+
												ne+
												"</form></label></td><td style='text-align:center;'></td></tr>"+
    											"<tr class='needTr'><td style='border-bottom-color: white;text-align:center;'></td></tr>"+
    											"<tr class='needTr'><td style='height:40px;' class='lefttd'><label style='width:7%'></label><label style='width:40%'><font size='4px' color='#003C9D '>"+modelp+"</font></label><label style='width:25%'><font>等级："+data.cusNeedList[i].transLevel+"<spring:message code='级'/></font></label><label style='width:25%'><font>语种："+data.cusNeedList[i].languagePair+"</font></label></td><td style='text-align:center;'></td></tr>"+
    											"<tr style='height:20px;'></tr>";
	        								} */
	        								/* var need =  "<tr class='needTr'><td class='lefttd' colspan='2'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size='5px'>"+data.cusNeedList[i].title+"</font>&nbsp;&nbsp;<font color='gray'>"+data.cusNeedList[i].needReference+"</font>&nbsp;&nbsp;<font color='#0000CD'>"+jQuery.i18n.prop(acceptState)+"</font><font style='float:right;'>截止日期："+data.cusNeedList[i].expirydate+"&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>"+
 	        											"<tr class='needTr' style='border-bottom-color: white;'><td rowspan='2' class='lefttd'><label style='width:10%'></label><label style='width:40%'><font color='#DD0000'>￥<font size='5px'>"+data.cusNeedList[i].totalMoney+"</font></font></label><label style='width:25%'><font>等级："+data.cusNeedList[i].transLevel+"<spring:message code='级'/></font></label><label style='width:25%'><font>语种："+data.cusNeedList[i].languagePair+"</font></label></td><td style='text-align:center;'><a href='javascript:deleteNeed("+data.cusNeedList[i].id+")'><spring:message code='删除项目'/></a></td></tr>"+
	        											"<tr class='needTr'><td style='border-bottom-color: white;text-align:center;'><a href='/cilentCustomer/copyPublishNeed.do?id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='复制项目'/></a></td></tr>"+
	        											"<tr class='needTr'><td style='height:40px;' class='lefttd'><label style='width:7%'></label><font style='width:40%' size='4px' color='#003C9D '>"+modelp+"</font></td><td style='text-align:center;'></td></tr>"+
	        											"<tr style='height:20px;'></tr>"; */
	        								
	        								var lefta = "";
	        								if("未发布"==acceptState){
	        									//<br><br><a id='tda' href='/cilentCustomer/secondPublishNeed.do?id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='现在发布'/></a>
	        									lefta="<a id='tda' href='/cilentCustomer/updateUI.do?id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='修改项目'/></a><br><br><a id='tda' href='javascript:deleteNeed("+data.cusNeedList[i].id+")'><spring:message code='删除项目'/></a>" 	
	        								}else if("失效"==acceptState){
	        									lefta="<a id='tda' href='/cilentCustomer/updateUI.do?state=失效&id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='修改项目'/></a><br><br><a id='tda' href='javascript:deleteNeed("+data.cusNeedList[i].id+")'><spring:message code='删除项目'/></a>" 	
	        								}else if("发布中"==acceptState){
	        									lefta="<a id='tda' href='javascript:deleteNeed("+data.cusNeedList[i].id+")'><spring:message code='删除项目'/></a><br><br><a id='tda' href='/cilentCustomer/copyPublishNeed.do?id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='发布类似项目'/></a>" 	
	        								}else{
	        									lefta="";
	        								}
	        									
	        								
	        								//语言
	    								    var languageCard="";
	    								    if(data.cusNeedList[i].languagePair=="英汉"){
	    								    	languageCard="<spring:message code='英汉'/>"
	    									}else if(data.cusNeedList[i].languagePair=="汉英"){
	    										languageCard="<spring:message code='汉英'/>"
	    									}else if(data.cusNeedList[i].languagePair=="日汉"){
	    										languageCard="<spring:message code='日汉'/>"
	    									}else if(data.cusNeedList[i].languagePair=="汉日"){
	    										languageCard="<spring:message code='汉日'/>"
	    									}else if(data.cusNeedList[i].languagePair=="韩汉"){
	    										languageCard="<spring:message code='韩汉'/>"
	    									}else if(data.cusNeedList[i].languagePair=="汉韩"){
	    										languageCard="<spring:message code='汉韩'/>"
	    									}else if(data.cusNeedList[i].languagePair=="德汉"){
	    										languageCard="<spring:message code='德汉'/>"
	    									}else if(data.cusNeedList[i].languagePair=="汉德"){
	    										languageCard="<spring:message code='汉德'/>"
	    									}else if(data.cusNeedList[i].languagePair=="法汉"){
	    										languageCard="<spring:message code='法汉'/>"
	    									}else if(data.cusNeedList[i].languagePair=="汉法"){
	    										languageCard="<spring:message code='汉法'/>"
	    									}
	        								
	    								    
	    								  //状态
	    								    var projectStateCard="";
	    								    if(acceptState=="失效"){
	    								    	projectStateCard="<spring:message code='失效'/>"
	    									}else if(acceptState=="发布中"){
	    										projectStateCard="<spring:message code='发布中'/>"
	    									}else if(acceptState=="未发布"){
	    										projectStateCard="<spring:message code='未发布'/>"
	    									}else if(acceptState=="删除"){
	    										projectStateCard="<spring:message code='删除'/>"
	    									}else if(acceptState=="订单"){
	    										projectStateCard="<spring:message code='订单'/>"
	    									}
	    								    
	        								var need = "<tr><td style='height:30px;' colspan=7></td></tr>"+
	        											"<tr>"+
		        											"<td><a id='needid' target='_blank' href='/cilentCustomer/lookPublishNeedById.do?id="+data.cusNeedList[i].id+"&lookType=customerCenter'><font size='4.5px'>"+data.cusNeedList[i].title+"</font><br><font class='needNum'>"+data.cusNeedList[i].needReference+"</font></a></td>"+
		        											"<td><font color='#DD0000'>￥<font size='4px'>"+data.cusNeedList[i].totalMoney+"</font></font></td>"+
		        											"<td><font color='#0000CC'>"+projectStateCard+"</font></td>"+
		        											"<td><font color='#BB5500'>"+modelp+"</font></td>"+
		        											"<td>"+data.cusNeedList[i].transLevel+"<spring:message code='级'/></td>"+
		        											"<td>"+languageCard+"</td>"+
		        											"<td>"+lefta+"</td>"+
	        											"</tr>"+
	        											"<tr style='border-bottom-color: #AAAAAA;'>"+
	        											"<td style='text-align:right;' colspan=7 ><spring:message code='截止日期：'/>&nbsp;&nbsp;"+data.cusNeedList[i].completeTime+" 23:59:59 &nbsp;&nbsp;&nbsp;&nbsp;</td></tr>";
	        								$("#myneeds_lists_ul").append(need); 
	        							}
	        						 }else{
	        							layer.alert('<spring:message code="没有找到符合条件的项目"/>', {
	        								icon: 5,
	        								title: "<spring:message code='提示'/>"
	        								});
	        						} 
	        					}, "json");
       				        /* }
       					}) */
       				       
       				}
       				o=1;//给予搜索后赋予另一个值来进行收索后的翻页执行
       			}
       		}
	       
		
		//判断总记录数是否为0 
	      if(totalCount==0){
	    	//弹出框提示没有信息
		         layer.msg('<spring:message code="尚未查询到该需求信息！"/>', {icon: 5}); 
		         $("#page").initPage(1, 1, 0);
	      }else{
	    	  $("#page").initPage(totalCount, pageNum, GG.kk);
	       } 
		//给搜索按钮添加点击事件
		 $("#searchButton").click(function(){
			 $('#allButton').css('color','');
			//alert("---------");	
			stateModdel=document.getElementById("typenum").value;
	 		selectModel=document.getElementById("selectModel").value;
	 		searchInput=document.getElementById("searchInput").value;
		 	clieckFind();
		});
		
		 $("#allButton").click(function(){
			 $('#allButton').css('background','#1E90FF');
			 document.getElementById("typenum").value="";
	 		 document.getElementById("selectModel").value="";
	 		 document.getElementById("searchInput").value="";
			 stateModdel="";
			 selectModel="";
			 searchInput="";
			 clieckFind()
		});
	
	function clieckFind(){
		/* transName=document.getElementById("makeupCoValue").value;
		var trans=document.getElementById("makeupCo").value;//储存值 */
		
	/*  jQuery.i18n.properties({
        name:'Messages', 
        path:'/i18n/', 
        mode:'both',
   		language:lang,
        checkAvailableLanguages: true,
        async: true,
        callback: function() { */
        	$.post("/cilentCustomer/myneeds.do?mm="+1+ "&selectModel=" + selectModel + "&searchInput="+ searchInput+"&stateModdel="+stateModdel,function(data){
        		o=2;
    			// alert(data.cusNeedList);
    			   //移除原来的li
    				/* var lis = document.getElementsByClass("needTr");
    				//alert(lis.length);
    				var ul = document.getElementById("myneeds_lists_ul");
    				for (var i = 0; i < lis.length;) {
    					//alert(lis.length);
    					ul.removeChild(lis[i]);
    					//alert(lis.length);
    				} */
    				/* $("#myneeds_lists_ul").empty();  */
    				$("#myneeds_lists_ul  tr:not(:first)").empty("");
    				//alert(data.cusNeedList.length);
    				//拼接需求卡片
    				for (var i = 0; i < data.cusNeedList.length; i++) {
    					var date2 = new Date(data.cusNeedList[i].completeTime);
    					var date1 = new Date(data.cusNeedList[i].publishTime);
    					 
    					var s1 = date1.getTime(),s2 = date2.getTime();
    					var total = (s2 - s1)/1000;
    					 
    					 
    					var day = parseInt(total / (24*60*60));//计算整数天数
    					
    					var modelp=data.cusNeedList[i].publishModel;
    					if(modelp=='主动投标模式'){
    						modelp="<spring:message code='招标模式'/>"
    					}
    					if(modelp=='系统分配模式'){
							modelp="<spring:message code='系统分配模式'/>"
						}
						if(modelp=='选定译员模式'){
							modelp="<spring:message code='选定译员模式'/>"
						}
    					var acceptState=data.cusNeedList[i].acceptState;
    					var butt;
    					var ne;
    					var de;
    					var model;
    					//alert(acceptState);
    						
    					//if(modelp=="主动投标模式"){
    						/* if("未发布"==acceptState){
    							butt="<div class='pull-right'><a href='/cilentCustomer/updateUI.do?id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='修改项目'/></a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href='/cilentCustomer/secondPublishNeed.do?id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='现在发布'/></a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:deleteNeed("+data.cusNeedList[i].id+")'><spring:message code='删除项目'/></a></div>" 	
    						}else if("失效"==acceptState){
    							butt="<div class='pull-right'><a href='/cilentCustomer/updateUI.do?id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='修改项目'/></a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:deleteNeed("+data.cusNeedList[i].id+")'><spring:message code='删除项目'/></a></div>" 	
    						}else if("发布中"==acceptState){
    							butt="<div class='pull-right'><a href='javascript:deleteNeed("+data.cusNeedList[i].id+")'><spring:message code='删除项目'/></a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href='/cilentCustomer/copyPublishNeed.do?id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='复制项目'/></a></div>" 	
    						}else{
    							butt="";
    						} */
    					//}else{
    						/* if("失效"==acceptState){
    							butt="<div class='pull-right'><a href='/cilentCustomer/updateUI.do?id="+data.cusNeedList[i].id+"'>修改需求</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:deleteNeed("+data.cusNeedList[i].id+")'>取消需求</a></div>" 	
    						}else{
    							butt="";
    						} */
    						
    					//}
    						/* if(modelp=="选定译员模式"){
    							model="<button type='submit' class='btn btn-info yiyuanmore' name='button'>查看译员</button>";
    						}else{ */
    							model="";
    					/* 	} */
    					/* model="<button type='submit' class='btn btn-info yiyuanmore' name='button' disabled>查看译员</button>"; */
    					
    					ne="<button type='submit' class='btn btn-info yiyuanmore' name='button'><spring:message code='查看项目'/></button>";
    					
    					/* var need = "<li class='myneeds_lists_li' name='myneeds_lists_li'>"+
    									"<div class='number_li'>"+
    										"<span>"+data.cusNeedList[i].needReference+"</span>"+
    										"<span class='number_li_span'><spring:message code='编号：'/>"+data.cusNeedList[i].id+"</span>"+
    										butt+
    									"</div>"+
    									"<div class='myneeds_lists_content'>"+
    										"<div class='col-sm-6'>"+
    											"<p><spring:message code='资质要求：'/><span>"+data.cusNeedList[i].transLevel+"<spring:message code='级译员，'/>"+jQuery.i18n.prop(data.cusNeedList[i].languagePair)+"，"+day+"<spring:message code='天完成，'/>"+data.cusNeedList[i].totalMoney+"<spring:message code='元'/></span></p>"+
    											"<p><spring:message code='状态：'/><span>"+jQuery.i18n.prop(acceptState)+"</span></p>"+
    										"</div>"+
    										"<span class='col-sm-2'>"+modelp+"</span>"+
    										"<div class='col-sm-2 pull-right'>"+
    											"<form action='/cilentCustomer/queryCusNeedTrans.do' method='post'>"+
    												"<input type='hidden' name='needId' value='"+data.cusNeedList[i].id+"'>"+
    												model+
    											"</form>"+
    											"<form action='/cilentCustomer/lookPublishNeedById.do?id="+data.cusNeedList[i].id+"&lookType=customerCenter' method='post'>"+
    											ne+
    										"</form>"+
    										"</div>"+
    										"<div class='pull-right' style='text-align:left'>"+
											"<spring:message code='截止日期：'/>"+data.cusNeedList[i].expirydate+
											"</div>"+
    									"</div>"+
    								"</li>" */
    					/* var need = "";
						if("未发布"==acceptState){
							need =  "<tr class='needTr'><td class='lefttd' colspan='2'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size='5px'>"+data.cusNeedList[i].title+"</font>&nbsp;&nbsp;<font color='gray'>"+data.cusNeedList[i].needReference+"</font>&nbsp;&nbsp;<font color='#0000CD'>"+jQuery.i18n.prop(acceptState)+"</font><font style='float:right;'>截止日期："+data.cusNeedList[i].expirydate+"&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>"+
								"<tr class='needTr' style='border-bottom-color: white;'><td rowspan='2' class='lefttd'><label style='width:10%'></label><label style='width:40%'><font color='#DD0000'>￥<font size='5px'>"+data.cusNeedList[i].totalMoney+"</font></font></label><label><form target='_blank' action='/cilentCustomer/lookPublishNeedById.do?id="+data.cusNeedList[i].id+"&lookType=customerCenter' method='post'>"+
							ne+
							"</form></label></td><td style='text-align:center;'><a id='tda' href='/cilentCustomer/updateUI.do?id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='修改项目'/></a></td></tr>"+
							"<tr class='needTr'><td style='border-bottom-color: white;text-align:center;'><a id='tda' href='/cilentCustomer/secondPublishNeed.do?id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='现在发布'/></a></td></tr>"+
							"<tr class='needTr'><td style='height:40px;' class='lefttd'><label style='width:7%'></label><label style='width:40%'><font size='4px' color='#003C9D '>"+modelp+"</font></label><label style='width:25%'><font>等级："+data.cusNeedList[i].transLevel+"<spring:message code='级'/></font></label><label style='width:25%'><font>语种："+data.cusNeedList[i].languagePair+"</font></label></td><td style='text-align:center;'><a id='tda' href='javascript:deleteNeed("+data.cusNeedList[i].id+")'><spring:message code='删除项目'/></a></td></tr>"+
							"<tr style='height:20px;'></tr>";
						}else if("失效"==acceptState){
							need =  "<tr class='needTr'><td class='lefttd' colspan='2'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size='5px'>"+data.cusNeedList[i].title+"</font>&nbsp;&nbsp;<font color='gray'>"+data.cusNeedList[i].needReference+"</font>&nbsp;&nbsp;<font color='#0000CD'>"+jQuery.i18n.prop(acceptState)+"</font><font style='float:right;'>截止日期："+data.cusNeedList[i].expirydate+"&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>"+
								"<tr class='needTr' style='border-bottom-color: white;'><td rowspan='2' class='lefttd'><label style='width:10%'></label><label style='width:40%'><font color='#DD0000'>￥<font size='5px'>"+data.cusNeedList[i].totalMoney+"</font></font></label><label><form target='_blank' action='/cilentCustomer/lookPublishNeedById.do?id="+data.cusNeedList[i].id+"&lookType=customerCenter' method='post'>"+
							ne+
							"</form></label></td><td style='text-align:center;'><a id='tda' href='/cilentCustomer/updateUI.do?state=失效&id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='修改项目'/></a></td></tr>"+
							"<tr class='needTr'><td style='border-bottom-color: white;text-align:center;'><a id='tda' href='/cilentCustomer/secondPublishNeed.do?id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='现在发布'/></a></td></tr>"+
							"<tr class='needTr'><td style='height:40px;' class='lefttd'><label style='width:7%'></label><label style='width:40%'><font size='4px' color='#003C9D '>"+modelp+"</font></label><label style='width:25%'><font>等级："+data.cusNeedList[i].transLevel+"<spring:message code='级'/></font></label><label style='width:25%'><font>语种："+data.cusNeedList[i].languagePair+"</font></label></td><td style='text-align:center;'></td></tr>"+
							"<tr style='height:20px;'></tr>";
						}else if("发布中"==acceptState){
							var need =  "<tr class='needTr'><td class='lefttd' colspan='2'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size='5px'>"+data.cusNeedList[i].title+"</font>&nbsp;&nbsp;<font color='gray'>"+data.cusNeedList[i].needReference+"</font>&nbsp;&nbsp;<font color='#0000CD'>"+jQuery.i18n.prop(acceptState)+"</font><font style='float:right;'>截止日期："+data.cusNeedList[i].expirydate+"&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>"+
								"<tr class='needTr' style='border-bottom-color: white;'><td rowspan='2' class='lefttd'><label style='width:10%'></label><label style='width:40%'><font color='#DD0000'>￥<font size='5px'>"+data.cusNeedList[i].totalMoney+"</font></font></label><label><form target='_blank' action='/cilentCustomer/lookPublishNeedById.do?id="+data.cusNeedList[i].id+"&lookType=customerCenter' method='post'>"+
							ne+
							"</form></label></td><td style='text-align:center;'><a id='tda' href='javascript:deleteNeed("+data.cusNeedList[i].id+")'><spring:message code='删除项目'/></a></td></tr>"+
							"<tr class='needTr'><td style='border-bottom-color: white;text-align:center;'><a id='tda' href='/cilentCustomer/copyPublishNeed.do?id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='复制项目'/></a></td></tr>"+
							"<tr class='needTr'><td style='height:40px;' class='lefttd'><label style='width:7%'></label><label style='width:40%'><font size='4px' color='#003C9D '>"+modelp+"</font></label><label style='width:25%'><font>等级："+data.cusNeedList[i].transLevel+"<spring:message code='级'/></font></label><label style='width:25%'><font>语种："+data.cusNeedList[i].languagePair+"</font></label></td><td style='text-align:center;'></td></tr>"+
							"<tr style='height:20px;'></tr>";
						}else{
							need =  "<tr class='needTr'><td class='lefttd' colspan='2'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size='5px'>"+data.cusNeedList[i].title+"</font>&nbsp;&nbsp;<font color='gray'>"+data.cusNeedList[i].needReference+"</font>&nbsp;&nbsp;<font color='#0000CD'>"+jQuery.i18n.prop(acceptState)+"</font><font style='float:right;'>截止日期："+data.cusNeedList[i].expirydate+"&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>"+
								"<tr class='needTr' style='border-bottom-color: white;'><td rowspan='2' class='lefttd'><label style='width:10%'></label><label style='width:40%'><font color='#DD0000'>￥<font size='5px'>"+data.cusNeedList[i].totalMoney+"</font></font></label><label><form target='_blank' action='/cilentCustomer/lookPublishNeedById.do?id="+data.cusNeedList[i].id+"&lookType=customerCenter' method='post'>"+
							ne+
							"</form></label></td><td style='text-align:center;'></td></tr>"+
							"<tr class='needTr'><td style='border-bottom-color: white;text-align:center;'></td></tr>"+
							"<tr class='needTr'><td style='height:40px;' class='lefttd'><label style='width:7%'></label><label style='width:40%'><font size='4px' color='#003C9D '>"+modelp+"</font></label><label style='width:25%'><font>等级："+data.cusNeedList[i].transLevel+"<spring:message code='级'/></font></label><label style='width:25%'><font>语种："+data.cusNeedList[i].languagePair+"</font></label></td><td style='text-align:center;'></td></tr>"+
							"<tr style='height:20px;'></tr>";
						} */
						
    					var lefta = "";
						if("未发布"==acceptState){
							//<br><br><a id='tda' href='/cilentCustomer/secondPublishNeed.do?id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='现在发布'/></a>
							lefta="<a id='tda' href='/cilentCustomer/updateUI.do?id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='修改项目'/></a><br><br><a id='tda' href='javascript:deleteNeed("+data.cusNeedList[i].id+")'><spring:message code='删除项目'/></a>" 	
						}else if("失效"==acceptState){
							lefta="<a id='tda' href='/cilentCustomer/updateUI.do?state=失效&id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='修改项目'/></a><br><br><a id='tda' href='javascript:deleteNeed("+data.cusNeedList[i].id+")'><spring:message code='删除项目'/></a>" 	
						}else if("发布中"==acceptState){
							lefta="<a id='tda' href='javascript:deleteNeed("+data.cusNeedList[i].id+")'><spring:message code='删除项目'/></a><br><br><a id='tda' href='/cilentCustomer/copyPublishNeed.do?id="+data.cusNeedList[i].id+"' target='_blank'><spring:message code='发布类似项目'/></a>" 	
						}else{
							lefta="";
						}
						
						//语言
					    var languageCard="";
					    if(data.cusNeedList[i].languagePair=="英汉"){
					    	languageCard="<spring:message code='英汉'/>"
						}else if(data.cusNeedList[i].languagePair=="汉英"){
							languageCard="<spring:message code='汉英'/>"
						}else if(data.cusNeedList[i].languagePair=="日汉"){
							languageCard="<spring:message code='日汉'/>"
						}else if(data.cusNeedList[i].languagePair=="汉日"){
							languageCard="<spring:message code='汉日'/>"
						}else if(data.cusNeedList[i].languagePair=="韩汉"){
							languageCard="<spring:message code='韩汉'/>"
						}else if(data.cusNeedList[i].languagePair=="汉韩"){
							languageCard="<spring:message code='汉韩'/>"
						}else if(data.cusNeedList[i].languagePair=="徳汉"){
							languageCard="<spring:message code='徳汉'/>"
						}else if(data.cusNeedList[i].languagePair=="汉德"){
							languageCard="<spring:message code='汉德'/>"
						}else if(data.cusNeedList[i].languagePair=="法汉"){
							languageCard="<spring:message code='法汉'/>"
						}else if(data.cusNeedList[i].languagePair=="汉法"){
							languageCard="<spring:message code='汉法'/>"
						}
						
					    
					  //状态
					    var projectStateCard="";
					    if(acceptState=="失效"){
					    	projectStateCard="<spring:message code='失效'/>"
						}else if(acceptState=="发布中"){
							projectStateCard="<spring:message code='发布中'/>"
						}else if(acceptState=="未发布"){
							projectStateCard="<spring:message code='未发布'/>"
						}else if(acceptState=="删除"){
							projectStateCard="<spring:message code='删除'/>"
						}else if(acceptState=="订单"){
							projectStateCard="<spring:message code='订单'/>"
						}
					    
					    
						var need = "<tr><td style='height:30px;' colspan=7></td></tr>"+
						"<tr>"+
							"<td><a id='needid' target='_blank' href='/cilentCustomer/lookPublishNeedById.do?id="+data.cusNeedList[i].id+"&lookType=customerCenter'><font size='4.5px'>"+data.cusNeedList[i].title+"</font><br><font class='needNum'>"+data.cusNeedList[i].needReference+"</font></a></td>"+
							"<td><font color='#DD0000'>￥<font size='4px'>"+data.cusNeedList[i].totalMoney+"</font></font></td>"+
							"<td><font color='#0000CC'>"+projectStateCard+"</font></td>"+
							"<td><font color='#BB5500'>"+modelp+"</font></td>"+
							"<td>"+data.cusNeedList[i].transLevel+"<spring:message code='级'/></td>"+
							"<td>"+languageCard+"</td>"+
							"<td>"+lefta+"</td>"+
						"</tr>"+
						"<tr style='border-bottom-color: #AAAAAA;'>"+
						"<td style='text-align:right;' colspan=7 ><spring:message code='截止日期：'/>"+data.cusNeedList[i].completeTime+" 23:59:59 &nbsp;&nbsp;&nbsp;&nbsp;</td></tr>";
			$("#myneeds_lists_ul").append(need);  
    				}

    				var page=data.page;
    				//判断总记录数是否为0 
    				//alert(page.totalCount)
    				if(page.totalCount==0){
    					//初始化页面将总记录数为1
    					$("#page").initPage(1,page.pageNum, GG.kk); 
    					//弹出框提示没有信息
    					layer.msg('<spring:message code="尚未查询到相关项目信息！"/>', {icon: 5});
    				}else{
    					//如果不为0则初始化页面
    					$("#page").initPage(page.totalCount,page.pageNum, GG.kk); 
    				}
    						
    				
    		   },"json");
        /* }
	 }) */
    }
    
    $("#typenum").change(function(){
    	$('#allButton').css('background','');
    	stateModdel=document.getElementById("typenum").value;
	 	selectModel=document.getElementById("selectModel").value;
	 	searchInput=document.getElementById("searchInput").value;
        clieckFind();
      
    });
    
    $("#selectModel").change(function(){
    	$('#allButton').css('background','');
    	stateModdel=document.getElementById("typenum").value;
	 	selectModel=document.getElementById("selectModel").value;
	 	searchInput=document.getElementById("searchInput").value;
    	clieckFind();
    })
 })
   /* function changeF(this_) {  
         $(this_).prev("input").val($(this_).find("option:selected").text());  
        $("#makeupCo").val($(this_).find("option:selected").text());
        $("#makeupCoValue").val($(this_).find("option:selected").val());
        $("#typenum").css({"display":"none"});  
        clieckFind();
    }  */ 
   
    
    function deleteNeed(id){
		$.post("/cilentCustomer/deleteNeed.do?id="+id,function(data){
			//alert(data.msg);
			if(data.msg=='success')	{	    			
	    			layer.msg("<spring:message code='项目删除成功！'/>", {icon: 1});
				 window.location.href = '/cilentCustomer/myneedsUI.do';
			}else{
				 layer.msg('<spring:message code="项目删除失败！"/>',{icon: 2});
			} 
		},"json");
	}	
    
    
    /* function copyNeed(id){
		$.post("/cilentCustomer/copyPublishNeed.do?id="+id ,function(data){
			//alert(data.msg);
			if(data.msg=='success')	{	    			
	    			layer.msg("需求取消成功！", {icon: 5});
				 window.location.href = '/cilentCustomer/myneedsUI.do';
			}else{
				 layer.msg('需求取消失败！');
			} 
		},"json"); 
	}*/	
    

      $(function(){
    	 /*  $(".cus_iter_navlists:nth-child(2)").addClass('useractive'); */
    	  $(".cus_iter_navlists a").removeClass("useractive")
    	  $(".cus_iter_navlists").eq(1).find("a").addClass("useractive") ;
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
   			$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>!");
   			} */
      })
     
    </script>
  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
