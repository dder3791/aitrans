<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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
    <title><spring:message  code='用户中心-我是译员信息编辑'/></title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.center.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/simple.switch.three.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/webuploader.css">
     <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/simple.switch.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-form.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/webuploader.min.js"></script>
    <script type="text/javascript" language="JavaScript" src="js/jquery.i18n.properties-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/webuploader.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
	<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script>  
   /*   if($("#tel").val()!=null){
    	 if($("#email").val()!=null){
    		 if($("#nameid").val()!=null){
    			  
    		 }
    	 }
     }  */
    
    layui.use(['form', 'layedit', 'laydate'], function(){  
  var form = layui.form()  
  ,layer = layui.layer  
  ,layedit = layui.layedit  
  ,laydate = layui.laydate;
 
  //自定义验证规则  
  form.verify({  
         nickname: function(value){  
          if(value.length < 2){  
            return '<spring:message  code="请输入至少2位的用户名"/>';  
          }  
        },
        address: function(value){  
            if(value.length < 4){  
              return '<spring:message  code="请输入至少4位的字符"/>';  
            }  
          }
        ,tel: [/^1[3|4|5|7|8]\d{9}$/, '<spring:message  code="手机必须11位，只能是数字！"/>']  
        ,email: [/^[a-z0-9._%-]+@([a-z0-9-]+\.)+[a-z]{2,4}$|^1[3|4|5|7|8]\d{9}$/, '<spring:message  code="邮箱格式不对"/>'] 
        ,workfile:[/^[a-zA-Z]:(\\.+)(.doc|.txt|)$/,'<spring:message  code="文件格式不支持"/>'] 
        ,proofile:[/^[a-zA-Z]:(\\.+)(.doc|.txt|)$/,'<spring:message  code="文件格式不支持"/>']
        ,auditfile:[/^[a-zA-Z]:(\\.+)(.doc|.txt|)$/,'<spring:message  code="文件格式不支持"/>']
        ,accountNumber:[/([\d]{4})([\d]{4})([\d]{4})([\d]{4})([\d]{0,})?/, '<spring:message  code="银行卡格式错误"/>'] 
  });   
    
  //创建一个编辑器  
  layedit.build('LAY_demo_editor');  
			//监听提交  
			  form.on('submit(demo1)', function(data){ 
				  params = data.field;
				  submit($,params);
				  });   
   
});  
    
</script> 
  
  </head>
  <body style="background:#f5f5f5;">
    <!--      顶部导航      -->
  	<c:if test="${clientid.id!=null || transid.id!=null }">
  	<div class="publickNav">
  		<div class="public_nav"> 
           <nav class="container" style="padding:0 20px;"> 
           <div class="navbar-left"><a href="${pageContext.request.contextPath}/translator/translatorAction_updateUI.do?lang=zh_CN&transId=${translators.id }" class="navbar-link" onclick="in18(this)">中文</a> | <a href="${pageContext.request.contextPath}/translator/translatorAction_updateUI.do?lang=en_US&transId=${translators.id }" class="navbar-link" onclick="in18(this)">English</a></div><a style="padding-left:50px;" href="/forwardAction/forward_toIndex.do"><spring:message  code='首页'/></a>
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
                      <li class="nav_lists_li"><a href="/login.jsp" class="navbar-link"><spring:message  code='登录'/></a></li>
                      <li class="nav_lists_li"><a href="/register.jsp" class="navbar-link"><spring:message  code='注册'/></a></li>
                      <li class="nav_lists_li"><a href="/help.center.jsp" class="navbar-link"><spring:message  code='帮助中心'/></a></li>
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
                  <li class="active"><a href="#basicInfo" data-toggle="tab"><spring:message  code='基本资料'></spring:message></a></li>
                 <li><a href="#transInfo" data-toggle="tab"><spring:message  code='翻译信息'/></a></li>
                  <li><a href="#bankInfo" data-toggle="tab"><spring:message  code='银行信息'/></a></li>
                </ul>
              </div>

                <!--  tab面板对应内容   -->
                <div class="myTabContent tab-content">
                  <div class="tab-pane fade in active" id="basicInfo" style="padding:50px 60px 80px 40px;">
                    <h4><spring:message  code='基本资料'/></h4>
                      <div class="layui-form">
                      <form id="defaultForm" class="form-inline"  action="${pageContext.request.contextPath}/translator/translatorAction_updataTranslator.do"  method="post" enctype="multipart/form-data">
                          <input type="hidden" value="${translators.id}" name="transId" id="transId">
                          <input type="hidden" id="tabNo" name="tabNo" value="1">
                          <div class="layui-form-item">
                           <label class="layui-form-label"><font color="red"><b>*&nbsp;</b></font><spring:message  code='昵称'/></label>
                           
                            <div class="layui-input-block">  
                               <input name="nickname" class="layui-input" type="text" placeholder="请输入姓名(必填)" autocomplete="off" lay-verify="nickname" value="${translators.nickname }"> 
                            </div>  
                          </div>  
                          <div class="layui-form-item">  
                            <label class="layui-form-label"><font color="red"><b>*&nbsp;</b></font><spring:message  code='身份证'/></label>  
                            <div class="layui-input-block">  
                              <input name="nameid" class="layui-input" id="nameid" type="text" placeholder="请输入身份证号码(必填)" autocomplete="off" lay-verify="identity|required" value="${translators.nameid }" onchange="checkNameid()">  
                              <input type="hidden" id="oldnameid" value="${translators.nameid}">
                            </div>  
                          </div> 
                          <div class="layui-form-item">  
                            <label class="layui-form-label"><font color="red"><b>*&nbsp;</b></font><spring:message  code='性别'/></label>  
                            <div class="layui-input-block" > 
                             <c:if test="${translators.gender ==0}"> 
                              <input name="gender" title="<spring:message  code='男'/>" type="radio" checked="checked" value="男">  
                              <input name="gender" title="<spring:message  code='女'/>" type="radio" value="女">  
                              </c:if>
                              <c:if test="${translators.gender !=0}">
                              <input name="gender" title="<spring:message  code='男'/>" type="radio"  value="男">  
                              <input name="gender" title="<spring:message  code='女'/>" type="radio" checked="checked" value="女">  
                              </c:if>
                            </div>  
                          </div>  
                          <div class="layui-form-item">  
                            <label class="layui-form-label"><font color="red"><b>*&nbsp;</b></font><spring:message  code='职业'/></label>  
                            <div class="layui-input-block">  
                              <input name="job" class="layui-input" type="text" placeholder="请输入职业(必填)" autocomplete="off" lay-verify="job|required" value="${translators.job}">  
                            </div>  
                          </div>
                          <div class="layui-form-item">
                          <label class="layui-form-label"><font color="red"><b>*&nbsp;</b></font><spring:message  code='学历'/></label>
                           <div class="layui-input-block">
                             <select name="degree" id="degree" >
                              <option value="大专" <c:if test="${translators.degree=='大专' }">selected = "selected"</c:if>><spring:message code='大专'/></option>
		                      <option value="本科" <c:if test="${translators.degree=='本科' }">selected = "selected"</c:if>><spring:message code='本科'/></option>
		                      <option value="硕士" <c:if test="${translators.degree=='硕士' }">selected = "selected"</c:if>><spring:message code='硕士'/></option>
		                      <option value="博士" <c:if test="${translators.degree=='博士' }">selected = "selected"</c:if>><spring:message code='博士'/></option>
		                      <option value="其它" <c:if test="${translators.degree=='其它' }">selected = "selected"</c:if>><spring:message code='其它'/></option>
                             </select>
                           </div>
                          </div>
                            <div class="layui-form-item"> 
                          <label class="layui-form-label"><font color="red"><b>*&nbsp;</b></font><spring:message  code='出生日期'/></label>
                           <div class="layui-input-block"> 
                              <%--  <input type="text" name="birth" id="date" lay-verify="date" placeholder="yyyy-mm-dd" autocomplete="off"  value="${translators.birthday }" class="layui-input"   onclick="layui.laydate({elem: this,max:laydate.now(-1)})">  --%>
                               <input type="text" name="birth" id="date" lay-verify="date" placeholder="yyyy-mm-dd" autocomplete="off"  value="${translators.birthday }" class="layui-input"   onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd',maxDate:new Date()})"> 
                            </div>
                         </div>
                           <div class="layui-form-item">  
                            <label class="layui-form-label"><spring:message  code='地址'/></label>  
                            <div class="layui-input-block">  
                             <input name="address" class="layui-input" type="text" autocomplete="off" placeholder="请输入地址信息" autocomplete="off"   value="${translators.address }"  >  
                            </div>  
                          </div>
                          
                          <div class="layui-form-item">  
                            <label class="layui-form-label"><font color="red"><b>*&nbsp;</b></font><spring:message  code='手机'/></label>  
                            <div class="layui-input-block">  
                              <input name="tel" class="layui-input" type="tel" autocomplete="off" placeholder="请输入手机(必填)" lay-verify="phone"  id="tel" value="${translators.tel }" onblur="checkPhone(this)">  
                              <input type="hidden" id="oldTel" value="${translators.tel}">
                            </div>  
                          </div>
                          <div class="layui-form-item">  
                            <label class="layui-form-label"><font color="red"><b>*&nbsp;</b></font><spring:message  code='邮箱'/></label>  
                            <div class="layui-input-block">  
                              <input name="email" class="layui-input" type="text" autocomplete="off" placeholder="请输入邮箱(必填)" lay-verify="email" id="email" value="${translators.email }" onblur="checkEmail(this)">  
                              <input type="hidden" id="oldemail" value="${translators.email}">
                            </div>  
                          </div>
                          <div class="layui-form-item">  
                            <label class="layui-form-label"><spring:message  code='公司地址'/></label>  
                            <div class="layui-input-block">  
                             <input name="companyAddress" class="layui-input" type="text" autocomplete="off" placeholder="请输入公司地址信息" autocomplete="off"   value="${translators.companyAddress }">  
                            </div>  
                          </div>
                           <label class="layui-form-label"><spring:message  code='是否使用软件'/></label>
                           <div class="layui-input-block">
                            <c:if test="${translators.isToolUse ==1}"> 
                           <input type="radio" name="isToolUse" value="1" title="<spring:message  code='使用'/>" checked="">
                           <input type="radio" name="isToolUse" value="0" title="<spring:message  code='未使用'/>">
                           </c:if>
                           <c:if test="${translators.isToolUse !=1}"> 
                           <input type="radio" name="isToolUse" value="1" title="<spring:message  code='使用'/>" >
                           <input type="radio" name="isToolUse" value="0" title="<spring:message  code='未使用'/>" checked="">
                           </c:if>
                          </div>
                           <div class="layui-form-item">  
                          <label for="worksfile"><spring:message  code='上传简历'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                          <div class="upload_file">
                            <input type="file"  name="workfile" value="上传" id="workfile" onchange="uploadImage(this)" >
                            <!-- <button type="button" class="btn btn-primary marR10" name="button">上传</button> -->
                          </div>
                        </div>
                           <div class="layui-form-item">  
                          <label for="worksfile"><spring:message  code='上传校对资料'/></label>
                          <div class="upload_file">
                            <input type="file"  name="proofile" value="上传" id="proofile" onchange="uploadImage(this)" >
                            <!-- <button type="button"  class="btn btn-primary marR10" name="button">上传</button> -->
                          </div>
                        </div>
                           <div class="layui-form-item">  
                          <label for="worksfile"><spring:message  code='上传审核资料'/></label>
                          <div class="upload_file" >
                            <input type="file"  name="auditfile" value="上传" id="auditfile" onchange="uploadImage(this)" >
                          <!--   <button type="button" class="btn btn-primary marR10" name="button">上传</button> -->
                          </div>
                        </div>
                          <div class="layui-form-item">  
                            <div class="layui-input-block">  
                              <button class="layui-btn" lay-filter="demo1" lay-submit="" id="saveButton"><spring:message  code='保存'/></button>  
                            </div>  
                          </div>  
                      </form>
                      </div>
                  </div>
                  
                <!--   个人资料修改结束 -->
                <!-- 翻译信息 开始 -->
                  <div class="tab-pane fade" id="transInfo" style="padding:50px 60px 80px 40px;">
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
                          <p class="col-sm-4"><spring:message  code='所属领域：'/><span><spring:message  code='${translatorQ.domain }'/></span></p>
                        </div>
                        </div>
                      </div>
                       <div class="basic_data_inp">
                        <div class="row">
                          <p class="col-sm-4"><spring:message  code='日翻译量：'/><span>${translatorQ.dayTrans }</span><font color="red"><spring:message  code='(万字)'/></font></p>
                          <p class="col-sm-4"><spring:message  code='翻译总字数：'/><span>${translatorQ.transTotal }</span><font color="red"><spring:message  code='(万字)'/></font></p>
                        </div>
                      </div>
                      <div class="basic_data_inp">
                        <div class="row">
                          <p class="col-sm-4"><spring:message  code='翻译价格：'/><span>${translatorQ.tranPrice }</span><font color="red"><spring:message  code='(元)'/></font></p>
                        </div>
                      </div>
                       <div class="basic_data_inp">
                       <c:if test="${translators.isProofread!=0 }">
                        <div class="row">
                        <p class="col-sm-4"><spring:message  code='校对价格：'/><span>${translatorQ.prooPrice }</span><font color="red"><spring:message  code='(元)'/></font></p>
                          <p class="col-sm-4"><spring:message  code='校对总字数：'/><span>${translatorQ.prooTotal }</span><font color="red"><spring:message  code='(万字)'/></font></p>
                        </div>
                         </c:if>
                      </div>
                      <div class="basic_data_inp">
                      <c:if test="${translators.isAudit!=0 }">
                        <div class="row">
                        <p class="col-sm-4"><spring:message  code='审核价格：'/><span>${translatorQ.auditPrice }</span><font color="red"><spring:message  code='(元)'/></font></p>
                          <p class="col-sm-4"><spring:message  code='审核总字数：'/><span>${translatorQ.auditTotal }</span><font color="red"><spring:message  code='(万字)'/></font></p>
                        </div>
                        </c:if>
                      </div>
                       <div class="basic_data_inps">
                        <div class="row">
                          <p class="col-sm-4"><spring:message  code='原文：'/><span id="worksOrigins">${translatorQ.worksOrigin }</span></p>
                          <p class="col-sm-4"><spring:message  code='译文：'/><span id="worksTargets">${translatorQ.worksTarget }</span></p>
                        </div>
                      </div>
                       <div align="right">
                        <a href="/translator/translatorAction_updateUU.do?id=${translatorQ.qid}" id="transQuotation"><button type="button" class="btn btn-info"   name="button"><spring:message  code='修改'/></button></a>
                       </div>
                    </div>
                    <hr style="height:2px;">
                   <!--  <hr> -->
                       </c:forEach>
                       <%-- <div class="basic_data_inp" style="text-align:center;padding-top:60px;">
                       <c:if test="${translators.isVerifty!=0 && translators.language==null }">
                        <a href="" id="addLanguage"><button type="button" class="btn btn-info"  name="button" onclick="addLanguage()">添加主语言</button></a>
                        </c:if>
                        <c:if test="${translators.isVerifty!=0 && translators.language!=null }">
                        <a href="" id="addLanguage"><button type="button" class="btn btn-info"  name="button" onclick="addLanguage()">添加副语言</button></a>
                        </c:if>
                        <c:if test="${translators.isVerifty ==0 }">
                        <a href="" id="addLanguage"><button type="button" class="btn btn-info"  name="button" disabled="disabled">请您验证后再添加语言</button></a>
                        </c:if>
                      </div> --%>
                  </div>
                  <!--  银行信息开始 -->
                  <div class="tab-pane fade" id="bankInfo">
                     <form class="layui-form" style="padding-top:30px;border:1px solid #ccc;" id="form" action="${pageContext.request.contextPath}/translator/translatorAction_editBankInfo.do" method="post" > 
                     	<input type="hidden" id="tabNo" name="tabNo" value="3">
                        <div class="form-group" style="margin-bottom:30px;">
                          <div class="row">
                              <label for="names" class="col-sm-2 control-label"><spring:message  code='真实姓名'/>&nbsp;&nbsp;</label>
                              <div class="col-sm-3">
                                <input type="text" class="form-control" id="realName" placeholder="<spring:message  code='请输入真实姓名'/>" name="realName" autocomplete="off"  lay-verify="namesVeri|required" value="${translators.realName }" >
                              </div>
                              <p class="col-sm-7"><spring:message  code='注：需与银行用户名一致，否则不能通过，无法申请提现'/></p>
                          </div>
                        </div>
                        <div class="form-group" style="margin-bottom:30px;">
                          <div class="row">
                            <label for="nums" class="col-sm-2 control-label"><spring:message  code='身份证号'/>&nbsp;&nbsp;</label>
                            <div class="col-sm-3">
                              <input type="text" class="form-control" id="IdCard" placeholder="<spring:message  code='请输入有效身份证号码'/>" name="IdCard"  autocomplete="off" lay-verify="identity|required" value="${translators.nameid }" readonly="readonly">
                            </div>
                          </div>
                        </div>
                        <div class="form-group" style="margin-bottom:30px;">
                          <div class="row">
                            <label for="nums" class="col-sm-2 control-label"><spring:message  code='银行账号'/>&nbsp;&nbsp;</label>
                            <div class="col-sm-3">
                              <input type="text" class="form-control" id="accountNumber" placeholder="<spring:message  code='请输入银行账号'/>" name="accountNumber"  autocomplete="off" lay-verify="identity|required" value="${translators.accountNumber }" onblur="getOpenBank(this)">
                              <input type="hidden" value="${translators.accountNumber }" id="oldAccountNumber">
                            </div>
                          </div>
                        </div>
                        <div class="form-group" style="margin-bottom:30px;">
                          <div class="row">
                            <label for="nums" class="col-sm-2 control-label"><spring:message  code='开户行'/></label>
                            <div class="col-sm-3">
                              <input type="text" class="form-control" id="openingBank"  name="openingBank"  autocomplete="off" lay-verify="identity|required" value="${translators.openingBank }" readonly="readonly">
                            </div>
                          </div>
                        </div>
                       <div class="basic_data_inp" style="text-align:center;padding-top:60px;">
                        <a href="" id="editBank"><button type="submit" class="btn btn-info"  name="button"><spring:message  code='修改'/></button></a>
                      </div>
                      </form>
                  </div>
                  
                </div>
                <!--  tab面板切换内容结束！  -->
              </div>

            <!--    用户中心 我是译员 右侧内容 结束   -->


        </div>
        <!--    用户中心 我是译员 结束   -->
      </div>
    </div>
    </div>
    
    <!--  <div id="gradient" class="footer_content">
      用户指南 
      <div class="messages container"></div>
      
      login footer 
      <footer class="container register_footer cl"></footer>
    </div> -->
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
        $(".checkbox").simpleSwitch({
         "theme": "FlatCircular"
         
       });
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
      })
      
		function checkPhone(obj){
    		var oldtel=$("#oldTel").val();
    	 	var tel=$("#tel").val();
    	 	if(!(/^1[34578]\d{9}$/.test(phone))){
    	 		layer.msg("<spring:message  code='手机号格式错误'/>",{icon:2});
    	 		$("#tel").val(oldtel);
			    return false; 
			} 
    	 	else if(tel!=null ||tel!='' ){
	    	  	if(tel!=oldtel){
		          	$.post("/translator/translatorAction_checkPapers.do","tel="+tel+"&type="+"checkphone",function(data){
		        	  	if(data.result=="success"){
		        		  	var message="<spring:message  code='手机号可以使用！'/>"
		        			layer.msg(message, {icon: 1});
		        		  	$("#saveButton").removeAttr("disabled");//启用按钮 
		        		  	return true;
		               }else{
		                 	var message="<spring:message  code='手机号已存在！'/>"
		                  	layer.msg(message, {icon: 5});
		                    $("#tel").val(oldtel);
		                    return false;
		               }
		        	    
		          },"json");
	    	  }
    	  	} 
     	}
      
       function checkEmail(obj){
    	   var email=$("#email").val();
    	   var oldEmail=$("#oldemail").val();
    	   if(email!=oldEmail){
     	 $.post("/translator/translatorAction_checkPapers.do","email="+email+"&type="+"checkemail",function(data){
     		if(data.result=="success"){
     			 var message="<spring:message  code='邮箱可以使用！'/>"
     				 layer.msg(message, {icon: 1});
               	 $("#saveButton").removeAttr("disabled");//启用按钮 
               }else{
               	var message="<spring:message  code='邮箱已存在！'/>"
        			   layer.msg(message, {icon: 5});
                     $("#saveButton").prop("disabled", "true");
                     $("#email").val("");
                }
     	 },"json");
    	   }
      } 
      
      function checkNameid(){
    	  var nameid=$("#nameid").val();
    	  var oldnameid=$("#oldnameid").val();
    	  var birthday="";
    	  if(nameid!=oldnameid){
    		  $.post("/translator/translatorAction_checkPapers.do","nameid="+nameid+"&type="+"checknameid",function(data){
    			  if(data.result=="success"){
    				  var message="<spring:message  code='身份证可以使用！'/>"
    					  layer.msg(message, {icon: 1});
    				  if(nameid.length == 15){  
  		                birthday = "19"+nameid.substr(6,6);  
  		            } else if(nameid.length == 18){  
  		                birthday = nameid.substr(6,8);  
  		            }  
  		            birthday = birthday.replace(/(.{4})(.{2})/,"$1-$2-");   
  				 $("#date").prop("value",birthday); 
    			  }else{
    				  var message="<spring:message  code='身份证已存在！'/>"
       	   			   layer.msg(message, {icon: 5});
       	                $("#saveButton").prop("disabled", "true");
       	                $("#email").val("");
    			  }
            },"json");
    	  }
      } 
      
      function getOpenBank(obj){
    	  var accountNumber=obj.value;
    	  var oldAccountNumber=$("#oldAccountNumber").val();
    	  if(accountNumber!=oldAccountNumber){
    		  $.post("/translator/translatorAction_checkPapers.do","accountNumber="+accountNumber+"&type="+"checkaccount",function(data){
    			      if(data.result=="success"){
    			    	  var message="<spring:message  code='银行账号可以使用！'/>"
        				  layer.msg(message, {icon: 1});
    			    	  var url="${pageContext.request.contextPath}/translator/translatorAction_getOpenBank.do";
    			      	  $.post(url,"bankNumber="+obj.value,function(data){
    			      		  if(data.msg==null || data.msg==''){
    			      			  layer.alert("<spring:message code='请输入正确的银行卡号'/>", {
    			    					icon: 1,
    			    					title: "<spring:message code='提示'/>",
    			    					})
    			      		  } else{
    			      			  document.getElementById("openingBank").value=data.msg;
    			      		  } 
    			      		  
    			      	  },'json')
    			      }else{
    			    	  var message="<spring:message  code='银行卡号已存在！'/>"
    	       	   			   layer.msg(message, {icon: 5});
    	       	                $("#saveButton").prop("disabled", "true");
    	       	                $("#accountNumber").val("");
    			      }
    		  },"json");
    	  }
      	 
        }
      
    </script>
  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
