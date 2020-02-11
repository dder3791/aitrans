<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>    
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
    <title><spring:message  code='用户中心-我是译员--我的评价'/></title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.center.css"/>
    <link href="${pageContext.request.contextPath}/css/page.css" type="text/css" rel="stylesheet"/>


    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
   <%--  <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.center.js"></script> --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.customer.myneeds.js"></script>
   <%--  <script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script> --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
    <script src="${pageContext.request.contextPath}/js/i18n.js"></script> 
    <style>
      .myneeds_body{
        padding:40px 60px 60px 20px;
        border:1px solid #ccc;
      }
      .myneeds_lists{
        height:auto;
      }
      .lists_block{
        height:120px;
        margin-bottom:25px;
        border-bottom:1px solid #f1f1f1;
      }
      .data_time{
        text-align: right;
        padding-right:0;
      }
    </style>

    <script type="text/javascript">
    $(function(){
    	$(".cus_iter_navlists a").removeClass("useractive")
        $(".cus_iter_navlists").eq(6).find("a").addClass("useractive")
    	var totalCount = '${page.totalCount }';
     	var pageNum = '${page.pageNum}';
     	if("${transid.nickname}"!=null && "${transid.nickname}"!=''){
      	  $("#nickname").text("${transid.nickname}"+"<spring:message  code='，欢迎您！'/>");
        }else if("${transid.tel}"!=null && "${transid.tel}"!=''){
      	  $("#nickname").text("${transid.tel}"+"<spring:message  code='，欢迎您！'/>");
        }else if("${transid.email}"!=null && "${transid.email}"!=''){
      	  $("#nickname").text("${transid.email}"+"<spring:message  code='，欢迎您！'/>");
        }
 		/* var tnickname = "${transid.nickname}";
		var unickname = "${clientid.userName}"
		if(tnickname!=""){
			$("#nickname").text(tnickname+"<spring:message  code='，欢迎您！'/>");
			
		}else if (unickname!="") {
			$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>!");
			} */
 		
 		
      var GG = {
          "kk":function(mm){
        	  if(isNaN(mm)){
  	    		mm=1;
  	    	};
  	    	$.post("/translator/translatorAction_queryByAllEvaluate.do","pageNum="+mm,function(data){
  	    	      var evaluates=data.evaluateList;
  	    	      var myneeds_lists=$(".myneeds_lists");
  	    	    $(".myneeds_lists li").remove();
  	    	  for(var i=0;i<evaluates.length;i++){
  	    		 if(evaluates[i].headPortrait==null || evaluates[i].headPortrait==''){
  	    			urlHead="/img/tuxiang.jpg";
  	    		 }else{
  	    			urlHead=evaluates[i].headPortrait;
  	    		 } 
  	    	    var tr_one="<li class='lists_block'>"+
                "<div class='row'>"+
                  "<strong class='col-sm-3'>"+"<a href='/translator/translatorAction_getEvaluatedetails.do?id="+evaluates[i].id+"'>"+"<spring:message  code='用户名: '/>"+ "<span>"+evaluates[i].nickname+"</span>"+"</strong>"+
                  "<p class='col-sm-7' style='height:20px;line-height:20px;'>"+"<spring:message  code='订单号：'/>"+"<span>"+evaluates[i].orderReference+"</span>"+"</p>"+
                "</div>"+
                "<div class='row' style='margin-top:10px;'>"+
                  "<div class='customer_head col-sm-1'>"+
                    "<img src=''"+urlHead+"'' alt='' id='clientUrl'>"+
                  "</div>"+
                  "<span class='col-sm-11'>"+
                   /*  "<a href='/translator/translatorAction_getEvaluatedetails.do?id="+evaluates[i].id+"'>"+ */
                    evaluates[i].evaluateDetails
                    /* +"</a>"+ */
                  "</span>"+
                "</div>"+
                "<p class='col-sm-12 data_time'>"+evaluates[i].generatedTime+"</p>"+
              "</li>" 
                myneeds_lists.append(tr_one);
  	    	  }
  	    	
  	    	
  	    	},"json");
          }
      }
    //判断总记录数是否为0 
      if(totalCount==0){
    //弹出框提示没有信息
      layer.msg('<spring:message  code="尚未查询到该评价信息！"/>', {icon: 5});
      $("#page").initPage(1, 1, 0);
    }else{
     $("#page").initPage(totalCount, pageNum, GG.kk);
    }
      
    })
   /*  //li添加链接
    $(document).on("click",".lists_block",function(){
  	       	 alert("进入方法");
  	       	 window.location.href="/translator/translatorAction_getEvaluatedetails.do?id="+evaluates[i].id;
  	        }); */
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
    <!-- <div class="publickNav"></div> -->
    <!--  logo 搜索栏  -->
    <div class="container">
      <nav class="publickSearch"></nav>
    </div>

    <!--  用户中心内容  -->
    <div class="user_center">

       <div class="container">
        <div class="title_public">
          <h2><spring:message  code='译员中心'/></h2>
        </div>


        <!--    用户中心 我是客户   -->
        <div class="my_customer">
          <div class="row">

            <!--    用户中心 我是议员 左侧导航   -->
            <div class="my_customer_left col-sm-2">
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

            <!--    用户中心 我是议员 我是议员 右侧内容   -->
            <div class="my_customer_right col-sm-10">
              <!--  用户中心右侧 tab切换栏   -->
              <ul id="suerTab" class="nav nav-tabs">
              	<li class="active"><a href="javascript:;" data-toggle="tab"><spring:message  code='我的评价'/></a></li>
              </ul>

              <div  class="myTabContent" class="tab-content">
                <div class="myneeds_body">
                  <h3 style="padding-bottom:30px;font-size:22px;"><spring:message  code='客户评价'/>:</h3>
                  <ul class="myneeds_lists">
                   <!--  <li class="lists_block">
                      <div class="row">
                        <strong class="col-sm-3">用户名 ： <span>张三</span></strong>
                        <p class="col-sm-7" style="height:20px;line-height:20px;">订单号：<span>2112345671</span></p>
                        <a class="col-sm-2" style="text-align:right;color:#337ab7;" href="">申诉此评价</a>
                      </div>
                      <div class="row" style="margin-top:10px;">
                        <div class="customer_head col-sm-1">
                          <img src="http://via.placeholder.com/45x50" alt="">
                        </div>
                        <span class="col-sm-11">
                          <a href="user.interpreter.myeValuate.details.html">
                              翻译水平很好，达到了我翻译的要求，专门来给我翻译的老师大大的好评！同时对比了几家，问了几家都有些含糊，后来来到这
                              让翻译老师看了后。回复说可以翻译的好，然后我就付款，并开始翻译的，翻译的也非常快！
                          </a>
                        </span>
                      </div>
                      <p class="col-sm-12 data_time">2017-03-02 10:15</p>
                    </li> -->

                  </ul>

                  <!--currentpage="1" numbercount="100"-->
                  <div class="common_problem_page"><ul class="page pull-right" maxshowpageitem="5" pagelistcount="4"  id="page"></ul></div>
                </div>
              </div>





            </div>
            <!--    用户中心 我是客户 我是议员 右侧内容 结束   -->

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

 
  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
