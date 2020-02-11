<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
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
    <title><spring:message  code='译员中心-我是译员信息内容'/></title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.center.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/webuploader.css">
     <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    
    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-form.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/webuploader.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
	<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script type="text/javascript">
    //查看帮助提示
    function overShowTime() {  
        var showDiv = document.getElementById('showDivTime');  
        showDiv.style.left = event.clientX;  
        showDiv.style.top = event.clientY;  
        showDiv.style.display = 'block';  
        showDiv.innerHTML = "<spring:message code='个人资料填写说明'/><br><spring:message code='为了使译员可以更方便的在平台上接受任务'/>，<spring:message code='需要在基本资料中填写详细信息'/>，<spring:message code='并根据自身情况上传翻译资料'/>，<spring:message code='校对资料以及审核资料进行后台人员审核'/>，<spring:message code='译员初步审核通过后就可以填写相关语言对'/>、<spring:message code='翻译价格信息以及原译文信息等必要的报价信息'/>。<spring:message code='如果译员同时兼有校对或审核的能力'/>，<spring:message code='可以上传相应的文件进行后台审核'/>，<spring:message code='审核通过可以对于之前添加的语言信息进行详细增加修改'/>。<spring:message code='(例如：只上传基本个人简历，后台通过评定给予等级，在添加语言只可添加关于翻译的基本相关信息。)'/>";  
    }  
    function outHideTime() {  
        var showDiv = document.getElementById('showDivTime');  
        showDiv.style.display = 'none';  
        showDiv.innerHTML = '';  
    }
    //上传个人头像信息
    function uploadPic(obj){
    		var maxsize =2*1024*1024*1024;//2M
            var size=obj.files[0].size;
    		fileExt=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
    		if(fileExt!='.jpg' && fileExt!=".png" && fileExt !=".gif" && fileExt !=".bmp"){
                 layer.open({
     				  title: '<spring:message  code="提示"/>',
     				  content: '<spring:message code="上传只支持格式为："/>jpg、JPG、gif、GIF、png、PNG、bmp、BMP',
       		 });
    		}else if(size>maxsize){
    			 layer.open({
    				  title: '<spring:message  code="提示"/>',
    				  content: '<spring:message code="图片大小不能大于3M"/>',
      		 });
            }else{
            // 上传设置  
            var options = {  
            		 // 请求方式  
            		type: "post", 
                    // 规定把请求发送到那个URL  
                    url: "/translator/uploadUtils.do",  
                    // 服务器响应的数据类型  
                    dataType: "json",  
                    // 请求成功时执行的回调函数  
                    success: function(data, status, xhr) {
                    	if(status =="success"){
                    		 layer.open({
                  				  title: '<spring:message  code="提示"/>',
                  				  content: '<spring:message  code="修改成功！"/>',
                    		 });
           		 
                    	}else{
                       	 layer.open({
                			   title: '<spring:message  code="提示"/>'
                			    ,content: '<spring:message  code="修改失败！"/>'
                		    }); 
                      }
                        // 图片显示地址  
                        $("#allUrl").attr("src", data.path); 
                        } 
            };  
            $("#uploadform").ajaxSubmit(options);  
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
        <!--    用户中心 我是译员   -->
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
        
            <!--    用户中心 我是译员 右侧内容   -->
            <div class="my_customer_right col-sm-10">

              <!--  用户中心右侧 tab切换栏   -->
              <div class="" >
                <ul id="suerTab" class="nav nav-tabs">
                  <li class="active"><a href="#basicdata" data-toggle="tab"><spring:message  code='基本资料'></spring:message></a></li>
                 <li><a href="#realname" data-toggle="tab" ><spring:message  code='翻译信息'/></a></li>
                  <li><a href="#bankInfo" data-toggle="tab" ><spring:message  code='银行信息'/></a></li>
                </ul>
              </div>
                <!--  tab面板对应内容   -->
                <div class="myTabContent tab-content">
                <a href="javascript:;" onmouseover="overShowTime()" onmouseout="outHideTime()" style="margin-left: 800px"><font color="red"><b><spring:message  code='查看帮助'/>?</b></font></a>
               <div id="showDivTime" style="color:#fff;z-index: 999;display:none;position: absolute; background-color:#3a3f51; border: 1px solid #ccc;margin-left:45%;width:45%;text-align: center;border-radius:10px;padding:10px;"></div>
                 <!-- 基本资料开始 -->
                  <div class="tab-pane fade in active" id="basicdata" style="padding:50px 60px 80px 40px;">
                    <h4><spring:message  code='基本资料'/></h4>
                      <input type="hidden" value="${translators.id}" name="transId" id="transId">
                    <div class="basic_data">
                      <div class="basic_data_inp">
                        <div class="row">
                          <p class="col-sm-4"><spring:message  code='昵称：'/><span>${translators.nickname }</span></p>
                          <p class="col-sm-4"><spring:message  code='身份证号：'/><span>${translators.nameid }</span></p>
                        </div>
                      </div>
                      <div class="basic_data_inp">
                        <div class=row>
                          <p class="col-sm-4"><spring:message  code='性别：'/>
                          <c:if test="${translators.gender ==0 }">
                          <span><spring:message  code='男'/></span>
                          </c:if>
                          <c:if test="${translators.gender ==1 }">
                          <span><spring:message  code='女'/></span>
                          </c:if>
                          </p>
                          <p class="col-sm-4"><spring:message  code='职业：'/><span>${translators.job }</span></p>
                        </div>
                      </div>
                      <div class="basic_data_inp">
                        <div class="row">
                        <p class="col-sm-4" ><spring:message  code='出生年月：'/><span>${translators.birthday } </span></p>
                          <p class="col-sm-4"><spring:message  code='现居地址：'/><span>${translators.address }</span></p>
                        </div>
                      </div>
                      <div class="basic_data_inp">
                        <div class="row">
                          <p class="col-sm-4"><spring:message  code='手机号：'/><span>${translators.tel }</span></p>
                          <p class="col-sm-4"><spring:message  code='电子邮箱：'/><span>${translators.email }</span></p>
                        </div>
                      </div>
                      <div class="basic_data_inp">
                        <div class="row">
                          <p class="col-sm-4"><spring:message  code='工作地址：'/><span>${translators.companyAddress }</span></p>
                          <p class="col-sm-4"><spring:message  code='银行账号：'/><span>${translators.accountNumber }</span></p>
                        </div>
                      </div>
                      <div class="basic_data_inp">
                        <div class="row">
                          <p class="col-sm-4"><spring:message  code='软件使用情况：'/>
                           <c:if test="${translators.isToolUse ==1 }">
                          <span><spring:message  code='使用'/></span>
                            </c:if>
                             <c:if test="${translators.isToolUse ==0 }">
                             <span><spring:message  code='未使用'/></span>
                             </c:if>
                          </p>
                          <p class="col-sm-4"><spring:message  code='是否通过翻译：'/>
                          <input type="hidden" value="${translators.isVerifty }" id="isVeriftys">
                          <span>
                          	<c:if test="${translators.isVerifty==0 }"><spring:message  code='未审核'/></c:if>
                           <c:if test="${translators.isVerifty==1 }"><spring:message  code='正在审核'/></c:if>
                          	<c:if test="${translators.isVerifty==2 }"><spring:message  code='审核通过'/></c:if>
                          	</span>
                          </p>
                        </div>
                      </div>
                      <div class="basic_data_inp">
                       <div class="row">
                      <p class="col-sm-4"><spring:message  code='是否通过校对：'/>
                          <input type="hidden" value="${translators.isProofread }" id="isProofread">
                          <span>
                          	<c:if test="${translators.isProofread==0 }"><spring:message  code='未审核'/></c:if>
                           <c:if test="${translators.isProofread==1 }"><spring:message  code='正在审核'/></c:if>
                          	<c:if test="${translators.isProofread==2 }"><spring:message  code='审核通过'/></c:if>
                          	</span>
                          </p>
                          <p class="col-sm-4"><spring:message  code='是否通过审核：'/>
                          <input type="hidden" value="${translators.isAudit }" id="isAudit">
                          <span>
                          	<c:if test="${translators.isAudit==0 }"><spring:message  code='未审核'/></c:if>
                           <c:if test="${translators.isAudit==1 }"><spring:message  code='正在审核'/></c:if>
                          	<c:if test="${translators.isAudit==2 }"><spring:message  code='审核通过'/></c:if>
                          	</span>
                          </p>
                      </div>
                      </div>
                      <div class="basic_data_inp" style="text-align:center;padding-top:60px;">
                        <a href="" id="interpreter"><button type="button" class="btn btn-info" onclick="interpreter()" name="button"><spring:message  code='修改'/></button></a>
                      </div>
                      <!-- 上传头像 -->
                      <div class="file_head" style="padding-top:30px;">
                        <h4><spring:message  code='用户头像'/></h4>
                        <c:if test="${translators.userUrl!=null && translators.userUrl!='' }">
                       	 	 <img src="${translators.userUrl}" alt="" width="100" height="100" id="allUrl" alt="">
                       	 </c:if>
                       	 <c:if test="${translators.userUrl ==null || translators.userUrl=='' }">
                       	 	 <img src="img/tuxiang.jpg" alt="" width="100" height="100" >
                       	 </c:if>
                        <form id="uploadform"  enctype="multipart/form-data"  method="post" action="/translator/uploadUtils.do" >
                        <div class="file_span">
                          <input type="file" id="headFile"  name="file"   onchange="uploadPic(this)">
                           <c:if test="${translators.userUrl!=null && translators.userUrl!='' }">
                          	 	 <span class=""><spring:message  code='修改照片'/></span>
                          	 </c:if>
                          	 <c:if test="${translators.userUrl ==null || translators.userUrl=='' }">
                          	 	 <span class=""><spring:message  code='上传照片'/></span>
                          	 </c:if>
                        </div> 
                        </form>
                      </div>
                    </div>
                  </div>
                  <!-- 基本资料结束 -->
                  <!-- 翻译信息 开始 -->
                  <div class="tab-pane fade" id="realname" style="padding:50px 60px 80px 40px;">
                       <c:forEach items="${translatorQ}" var="translatorQ" >  
                       <h4><spring:message  code='翻译资料'/></h4>
                    <div class="basic_data">
                      <input type="hidden" id="qid" name="qid" value="${translatorQ.qid}">
                      <div class="basic_data_inp">
                        <div class="row">
                          <p class="col-sm-4"><spring:message  code='翻译语言：'/>
                           <c:if test="${translatorQ.languages =='汉英' }">
                          <span><spring:message  code='汉英'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='英汉' }">
                          <span><spring:message  code='英汉'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='日汉' }">
                          <span><spring:message  code='日汉'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='汉日' }">
                          <span><spring:message  code='汉日'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='韩汉' }">
                          <span><spring:message  code='韩汉'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='汉韩' }">
                          <span><spring:message  code='汉韩'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='法汉' }">
                          <span><spring:message  code='法汉'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='汉法' }">
                          <span><spring:message  code='汉法'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='德汉' }">
                          <span><spring:message  code='德汉'/></span>
                          </c:if>
                           <c:if test="${translatorQ.languages =='汉德' }">
                          <span><spring:message  code='汉德'/></span>
                          </c:if>
                          </p>
                        <div class="row">
                          <p class="col-sm-4"><spring:message  code='所属领域：'/><span>${translatorQ.domain }</span></p>
                        </div>
                        </div>
                      </div>
                       <div class="basic_data_inp">
                        <div class="row">
                           <p class="col-sm-4"><spring:message  code='翻译价格：'/><span>${translatorQ.tranPrice }</span><font color="red"><spring:message  code='(元)'/></font></p>
                          <p class="col-sm-4"><spring:message  code='专业翻译字数：'/><span>${translatorQ.majorTotal }</span><font color="red"><spring:message  code='(字)'/></font></p>
                          <p class="col-sm-4"><spring:message  code='日翻译量：'/><span>${translatorQ.dayTrans }</span><font color="red"><spring:message  code='(字)'/></font></p>
                        </div>
                      </div>
                       <div class="basic_data_inp">
                       <c:if test="${translators.isProofread!=0 }">
                        <div class="row">
                        <p class="col-sm-4"><spring:message  code='校对价格：'/><span>${translatorQ.prooPrice }</span><font color="red"><spring:message  code='(元)'/></font></p>
                        <p class="col-sm-4"><spring:message  code='校对总字数：'/><span>${translatorQ.prooTotal }</span><font color="red"><spring:message  code='(万字)'/></font></p>
                        <p class="col-sm-4"><spring:message  code='日校对量：'/><span>${translatorQ.dayProo }</span><font color="red"><spring:message  code='(字)'/></font></p>
                        </div>
                         </c:if>
                      </div>
                      <div class="basic_data_inp">
                      <c:if test="${translators.isAudit!=0 }">
                        <div class="row">
                        <p class="col-sm-4"><spring:message  code='审核价格：'/><span>${translatorQ.auditPrice }</span><font color="red"><spring:message  code='(元)'/></font></p>
                        <p class="col-sm-4"><spring:message  code='审核总字数：'/><span>${translatorQ.auditTotal }</span><font color="red"><spring:message  code='(万字)'/></font></p>
                        <p class="col-sm-4"><spring:message  code='日审核量：'/><span>${translatorQ.dayAudit }</span><font color="red"><spring:message  code='(字)'/></font></p>
                        </div>
                        </c:if>
                      </div>
                       <div class="basic_data_inps">
                        <div class="row">
                          <p class="col-sm-4" ><spring:message  code='原文：'/><span id="worksOrigins">${translatorQ.worksOrigin }</span></p>
                        </div>
                      </div>
                       <div class="basic_data_inps">
                        <div class="row">
                          <p class="col-sm-4" ><spring:message  code='译文：'/><span id="worksTargets">${translatorQ.worksTarget }</span></p>
                        </div>
                      </div>
                       <div align="right">
                        <a href="/translator/translatorAction_updateUU.do?id=${translatorQ.qid}" id="transQuotation"><button type="button" class="btn btn-info"   name="button"><spring:message  code='修改'/></button></a>
                       </div>
                    </div>
                    <hr style="height:2px;">
                   <!--  <hr> -->
                       </c:forEach>
                       <div class="basic_data_inp" style="text-align:center;padding-top:60px;">
                       <%-- <c:if test="${translators.isVerifty!=0 && translators.language==null && quotationTransList[0].id ==null  && quotationProoList[0].id ==null &&  quotationAuditList[0].id == null }">
                        <a href="" id="addLanguage"><button type="button" class="btn btn-info"  name="button" onclick="addLanguage()"><spring:message  code='添加主语言'/></button></a>
                        </c:if> --%>
                        <c:if test="${quotationTransList[0].tranPrice == '0.0' ||  quotationProoList[0].prooPrice == '0.0'  ||  quotationAuditList[0].auditPrice == '0.0' }">
                         <c:if test="${translators.isVerifty!=0 && translators.language==null }">
                        <a href="" id="addLanguage"><button type="button" class="btn btn-info"  name="button" onclick="addLanguage()"><spring:message  code='添加主语言'/></button></a>
                         </c:if>
                         <c:if test="${translators.isVerifty!=0 && translators.language!=null }">
                        <a href="" id="addLanguage"><button type="button" class="btn btn-info"  name="button" onclick="addLanguage()"><spring:message  code='添加副语言'/></button></a>
                         </c:if>
                        </c:if>
                        <c:if test="${translators.isVerifty ==0 || translators.isVerifty==null }">
                        <button type="button" class="btn btn-disabled"  disabled="disabled" name="button" ><spring:message  code='请您验证后再添加语言'/></button></a>
                        </c:if>
                          <c:if test="${quotationTransList[0].id ==null && quotationProoList[0].id ==null  &&  quotationAuditList[0].id == null && translators.isVerifty !=0 }">
                            <button type="button" class="btn btn-disabled"  disabled="disabled" name="button" ><spring:message  code='未检测到您有需要添加的报价'/></button></a>
                          </c:if>
                      </div>
                  </div>
                  <!-- 翻译信息  结束 -->
                  <!-- 个人验证开始 -->
                <div class="tab-pane fade" id="personname">
                    <form class="layui-form" style="padding-top:30px;border:1px solid #ccc;" id="form" action="${pageContext.request.contextPath}/translator/translatorAction_addTransQuotationverify.do" method="post" enctype="multipart/form-data"> 
                        <div class="form-group" style="margin-bottom:30px;">
                          <div class="row">
                              <label for="names" class="col-sm-2 control-label"><spring:message  code='真实姓名'/></label>
                              <div class="col-sm-3">
                                <input type="text" class="form-control" id="names" placeholder="<spring:message  code='请输入姓名'/>" name="names" autocomplete="off"  lay-verify="namesVeri|required" value="${translators.realName }" >
                              </div>
                              <p class="col-sm-7"><spring:message  code='注：需与银行用户名一致，否则不能通过，无法申请提现'/></p>
                          </div>
                        </div>
                        <div class="form-group" style="margin-bottom:30px;">
                          <div class="row">
                            <label for="nums" class="col-sm-2 control-label"><spring:message  code='身份证号'/></label>
                            <div class="col-sm-3">
                              <input type="text" class="form-control" id="IdCard" placeholder="<spring:message  code='请输入有效身份证号码'/>" name="IdCard"  autocomplete="off" lay-verify="identity|required" value="${translators.nameid }" readonly="readonly">
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="row">
                            <label for="password03" class="col-sm-2 control-label"><spring:message  code='证件正面'/></label>
                            <div class="col-sm-3">
                              <div class="money_file">
                                <div class="money_img_block" id="imgPreviews">
                                   <img src="http://via.placeholder.com/260x260" alt=""  >  
                                  <span><spring:message  code='上传有效身份证件'/><br><spring:message  code='正面图片'/></span>
                                </div>
                                <div class="money_file_block">
                                  <input type="file" name="frontUrl" lay-verify="picture" onchange="frontUrls(this)">
                                  <button class="btn btn-info"><spring:message  code='上传正面图片'/></button>
                                </div>
                              </div>
                            </div>
                            <div class="col-sm-7" style="padding-top:20px;">
                              <p>1.<spring:message  code='请上传本人手持有效证件正面头部照片和上半身照片；'/></p>
                              <p>2.<spring:message  code='照片为免冠、未化妆的数码照片原始图片，'/><span style="color:red;"><spring:message  code='请勿编辑修改'/></span>；</p>
                              <p>3.<spring:message  code='必须看清证件信息，且证件信息不能被遮挡，持证人五官清晰可见；'/></p>
                              <p>4.<spring:message  code='仅支持.jpg.bmp.png.gif的图片格式。'/><span style="color:red;"><spring:message  code='建议图片大小不超过3M'/></span> ；</p>
                              <p>5.<spring:message  code='您提供的照片时间信息财富将予以保护，不会用其他用途；'/></p>
                              <p>6.<spring:message  code=''/> <a style="color:#68a373;font-weight:700;" href=""><spring:message  code='[示例：查看手持身份证正面照]'/></a></p>
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                              <label for="password03" class="col-sm-2 control-label"><spring:message  code='证件背面'/></label>
                              <div class="col-sm-3">
                                <div class="money_file">
                                  <div class="money_img_block" id="imgPreview">
                                    <img src="http://via.placeholder.com/260x260" alt="" >
                                    <span><spring:message  code='上传有效身份证件'/><br><spring:message  code='背面图片'/></span>
                                  </div>
                                  <div class="money_file_block">
                                    <input type="file" name="reverseUrl" lay-verify="picture" onchange="reverseUrls(this)">
                                    <button class="btn btn-info"><spring:message  code='上传背面图片'/></button>
                                  </div>
                                </div>
                              </div>
                              <div class="col-sm-7" style="padding-top:30px;">
                                <p>1.<spring:message  code='必须看到证件信息，且证件信息不能遮挡；'/></p>
                                <p>2.<spring:message  code='仅支持.jpg.bmp.png.gif的图片格式。'/><span style="color:red;"><spring:message  code='建议图片大小不超过3M'/></span> ；</p>
                                <p>3.<spring:message  code='您提供的照片时间信息财富将予以保护，不会用其他用途；'/></p>
                                <p>4.<spring:message  code=''/><a style="color:#68a373;font-weight:700;" href=""><spring:message  code='[示例：查看手持身份证背面照]'/></a></p>
                              </div>
                            </div>
                          </div>
                        <div class="form-group" style="margin-bottom:70px;">
                          <div class="row">
                            <div class="col-sm-offset-2 col-sm-10">
                              <button type="submit" class="btn btn-info" style="padding-left:35px;padding-right:35px;" lay-filter="demo1" lay-submit="" ><spring:message  code='提交审核'/></button>
                            </div>
                          </div>
                        </div>
                      </form>
                  </div>
                  
                 <!--  个人认证结束 -->
                <!--  银行信息开始 -->
                  <div class="tab-pane fade" id="bankInfo">
                         <input type="hidden" value="${translators.id}" name="transId" id="transId">
                        <div class="basic_data_inp">
                        <div class="row">
                          <p class="col-sm-4"><spring:message  code='真实姓名'/>：<span>${translators.realName }</span></p>
                          <p class="col-sm-4"><spring:message  code='身份证号'/>：<span>${translators.nameid }</span></p>
                        </div>
                      </div>
                        <div class="basic_data_inp">
                        <div class="row">
                          <p class="col-sm-4"><spring:message  code='银行账号'/>：<span>${translators.accountNumber }</span></p>
                          <p class="col-sm-4"><spring:message  code='开户行'/>：<span>${translators.openingBank }</span></p>
                        </div>
                      </div>
                     
                      <div class="basic_data_inp" style="text-align:center;padding-top:60px;">
                        <a href="" id="editBank"><button type="button" class="btn btn-info"  onclick="editBank()" name="button"><spring:message  code='修改'/></button></a>
                      </div>
                  
                  </div>
                </div>
                <!--  tab面板切换内容结束！  -->
              </div>

            <!--    用户中心 我是议员 右侧内容 结束   -->


        </div>
      </div>
      <!--    用户中心 我是议员 结束   -->
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
    	  $(".cus_iter_navlists").eq(0).find("a").addClass("useractive")
    	 //限制原译文字符个数
    	  $(".basic_data_inps").each(function(){
    	  var maxwidth=150;
    	  if($(this).text().length>maxwidth){
    	  $(this).text($(this).text().substring(0,maxwidth));
    	  $(this).html($(this).html()+"....");
    	  }
    	  });
    	  
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
				$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>");
				} */

        $(".checkbox").simpleSwitch({
         "theme": "FlatCircular"
       });
        
      })
       var success="${success}"; 
       if(success.length>0 ){
	   		layer.msg("<spring:message  code='操作成功'/>!", {icon: 1});
	   	}
      
      //上传正面照片进行回显
          function frontUrls(file){
                  var maxsize =3*1024*1024*1024;//3M
                  var prevDiv = document.getElementById('imgPreviews');
                  var size=file.files[0].size;
                  fileExt=file.value.substr(file.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
              	if(file.value==null || file.value==''){
              		layer.open({
         				  title: '<spring:message  code="提示"/>',
         				  content: '<spring:message code="请上传正面有效证件"/>',
           		    });
                 }else if(fileExt!='.jpg' && fileExt!=".png" && fileExt !=".gif" && fileExt !=".bmp"){
                       layer.open({
           				  title: '<spring:message  code="提示"/>',
           				  content: '<spring:message code="上传只支持格式为："/>jpg、JPG、gif、GIF、png、PNG、bmp、BMP',
             		});
              	}else if(size>maxsize){ 
              		layer.open({
         				  title: '<spring:message  code="提示"/>',
         				  content: '<spring:message code="图片大小不能大于3M"/>',
           		    });
                }else if (file.files && file.files[0]) {
             	      var reader = new FileReader();
             	      reader.onload = function(evt) {
             	        prevDiv.innerHTML = '<img src="' + evt.target.result + '" />';
             	      }
             	      reader.readAsDataURL(file.files[0]);
             	    } else {
             	      prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
             	    } 
                  return;  
              }  
    //上传背面照片进行回显
   	 function reverseUrls(file){
   		var maxsize =3*1024*1024*1024;//3M
        var prevDiv = document.getElementById('imgPreview');
        var size=file.files[0].size;
        fileExt=file.value.substr(file.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
    	if(file.value==null || file.value==''){
    		layer.open({
				  title: '<spring:message  code="提示"/>',
				  content: '<spring:message code="请上传背面面有效证件"/>',
 		 });
       }else if(fileExt!='.jpg' && fileExt!=".png" && fileExt !=".gif" && fileExt !=".bmp"){
             layer.open({
 				  title: '<spring:message  code="提示"/>',
 				  content: '<spring:message code="上传只支持格式为："/>jpg、JPG、gif、GIF、png、PNG、bmp、BMP',
   		 });
    	}else if(size>maxsize){ 
    		layer.open({
				  title: '<spring:message  code="提示"/>',
				  content: '<spring:message code="图片大小不能大于3M"/>',
 		 });
       }else if (file.files && file.files[0]) {
   	      var reader = new FileReader();
   	      reader.onload = function(evt) {
   	        prevDiv.innerHTML = '<img src="' + evt.target.result + '" />';
   	      }
   	      reader.readAsDataURL(file.files[0]);
   	    } else {
   	      prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
   	    } 
        return; 
   	 }
    //执行个人资料修改
      function interpreter() {
    	  var transId=$("#transId").val();
    	  $("#interpreter").prop("href","/translator/translatorAction_updateUI.do?transId="+transId);
    	  }
    //添加语言
      function addLanguage(){
    	  var transId=$("#transId").val();
    	  $("#addLanguage").prop("href","/translator/translatorAction_updateQuotations.do");
    	  }
    //银行信息修改
     function editBank(){
    	 var transId=$("#transId").val();
    	 $("#editBank").prop("href","/translator/translatorAction_updateUI.do?transId="+transId);
    	 /* $("#editBank").prop("href","/translator/translatorAction_editBank.do?transId="+transId); */
    }
  	 //表单验证
	layui.use(['form', 'layedit', 'laydate'], function(){  
	      var form = layui.form()  
	      ,layer = layui.layer  
	      ,layedit = layui.layedit  
	      ,laydate = layui.laydate;  
	      
	      //自定义验证规则  
	      form.verify({ 
	    	  namesVeri : function(value) {
                  if ((value.length < 2)||(value.length>4)) {
                      return '<spring:message  code="请输入真实姓名"/>';
                  }
              },
              //验证图片格式
			  picture:[/^[a-zA-Z]:(\\.+)(.JPG|.jpg|.GIF|.gif|.BMP|.png|.bmp|.GIF|.gif)$/,'<spring:message  code="图片格式不支持"/>']
	      })
	      //创建一个编辑器  
	      layedit.build('LAY_demo_editor');  

	     form.on('submit(demo1)', function(data){ 	  
	    	  params = data.field;
	    	  submit($,params);
	      }); 
	})
	  var massage="${message}";
	  if(message.trim().length != 0 ){
    		
    		layer.msg(<spring:message code="message"/>, {icon: 5});
    	}
    </script>
  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
