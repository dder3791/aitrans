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
    <title><spring:message  code='用户中心-我是译员-译员协议'/></title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.center.css"/>


    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.center.js"></script> --%>
    <script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
	<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <style type="text/css">
      #agreement{padding: 0 40px;}
      #agreement h3{padding: 50px 0;}
      .text_indent{text-indent: 2em;}
      .agrees_content{text-align: center;padding:60px 0;}
      .agrees_content button{height: 40px;padding: 0 20px;}
    </style>
      <script type="text/javascript">
     $(function(){
    	/*  $.post("/agreetment/queryByAllagreetment.do?agreetment=译员",function(data){
      		 $("#deal").after("<p style='text-indent:0;'>"+data[0].items+"</p>");	
      	 },"json"); */
      	 
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
     })
    
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
                <ul id="suerTab" class="nav nav-tabs">
                	<li class="active"><a href="javascript:;" data-toggle="tab"><spring:message  code='签订协议'/></a></li>
                </ul>

                <!--  tab面板对应内容   -->
                <div class="myTabContent tab-content">
                	<div class="tab-pane fade in active text_indent" id="agreement">
                    <h3 class="text-center" id="deal"><spring:message  code='译员协议'/></h3>

   &nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='环宇爱译以下简称（爱译）”在此特别提醒您（用户）在注册成为用户之前，请认真阅读本《用户协议》（以下简称“本协议”），确保您充分理解本协议中各条款。请您审慎阅读并选择接受或不接受本协议。除非您接受本协议所有条款，否则您无权注册、登录或使用本协议所涉服务。  您的注册、登录、使用等行为将视为对本协议的接受，并同意接受本协议各项条款的约束。本协议约定“爱译”与用户之间关于“语言服务”的权利义务。“用户”是指注册、登录、使用“爱译”提供的语言服务的公司或个人。本协议可由“爱译”随时更新，更新后的协议条款一旦公布即代替原来的协议条款，用户可在本网站查阅最新版协议条款。在“爱译”修改协议条款后，如果用户不接受修改后的条款，请立即停止使用“爱译”提供的服务，若用户继续使用“爱译”提供的服务将被视为接受修改后的协议。'/>


<br>第1条 账号注册
  <br>1-1．用户在使用平台提供的服务前需要注册一个“环宇爱译”账号。“环宇爱译”账号应当使用电子邮箱或手机号码绑定注册。
  <br>1-2．在用户注册及使用平台提供的服务时，“环宇爱译”需要搜集能识别用户身份的个人信息以便“环宇爱译”可以在必要时联系用户，或为用户提供更好的使用体验。“环宇爱译”搜集的信息包括但不限于用户的公司名或个人姓名、公司情况、所属行业、公司或个人通讯信息、账户信息；“环宇爱译”同意对这些信息的使用将受限于第三条用户个人隐私信息保护的约束。

<br>第2条 协议内容
<br>本合同有关用语的含义如下：
<br>1.1 原文：指甲方委托乙方，按照本合同的约定提供给乙方的未翻译文本。
<br>1.2 译文：指乙方接受甲方的委托，按照本合同的约定向甲方提供的翻译文本。
<br>1.3字数统计标准和方法：中文翻译成外文,按照中文字数统计；外文翻译成中文；按照外文词数统计。统计方法：Word办公软件菜单栏“工具→字数统计”，按照弹出的“字数统计”框所显示，按照“字数统计”框中“字符数（不计空格）”项所显示的字符数为准。
<br>1.4长期客户：系指甲方与乙方签订一年或一年以上《委托翻译合同》中的甲方。

<br>第3条 期限
<br>2.1 本合同有效期为，即自2017年3月8日起至2018年3月7日止。

<br>第4条 业务内容及价格
<br>3.1 乙方接受甲方的委托，根据甲方提供的文字稿件,进行翻译工作。
<br>3.2 乙方应按时交稿。如乙方因故不能按时交稿的，应提前至少两个工作日或三天书面通知甲方，若时间允许，可由双方另行约定交稿日期；若因甲方稿件期限将至不能延期交稿，则甲方有权终止委托，不支付乙方任何费用。如因甲方原因而必须中途暂停翻译，则交稿期限按照暂停时间依次后延；若因甲方原因而必须终止翻译，则甲方需支付乙方已经完成的翻译部分的费用。
<br>3.3 甲方翻译稿件的收费标准遵照乙方的报价相关标准，在双方协商基础上，确定如下：
<br>中译英： 300 元/千字。

<br>3.4 付款方式：
<br>乙方每月初将上月翻译完成的稿件账单发送甲方，甲方收到账单和发票并确认无误后,应在当月月底之前付清稿费。（首次合作，甲方应预先支付50%的翻译费）
<br>3.5汇款信息：
<br>乙方账户：110501 883600 00000586
<br>开户名：环宇爱译（北京）信息技术有限责任公司
<br>开户行：中国建设银行北京上地支行

<br>第5条 翻译要求
<br>4.1 乙方按规定日期完成甲方委托翻译之任务（有特殊情况应提前通知对方）。
<br>4.2 乙方应保证其翻译稿件质量：忠实原文、译文准确；语句通顺、全文流畅。
<br>甲方对在稿件翻译过程中通常会出现以下情况：翻译中存在的可译与不可译、两种语言中没有意义绝对相同的两个词、同一语言中没有意义绝对相同的词以及各语言或同一语言中表达方式的无限多样性等问题应予以理解与接受，作为翻译公司，力求避免这些偏差。但是甲方不能因为对某些词的择取而拒稿或降低稿费，任何争议，双方应以商讨方式解决。
<br>为了使乙方的翻译工作更好地符合甲方的翻译要求，甲方可将每次翻译业务的审核意见和/或审定译文反馈给乙方，乙方进行相应总结。 
<br>4.3 如果甲方对乙方翻译质量有异议，甲方应在收稿之日起20日内提出，乙方有义务在甲方书面或电子邮件通知后对译文所出现的错误进行及时免费修改。如果经乙方两次修改后仍存在质量问题，甲方可根据错误率及错误严重程序扣除相应翻译费用3%-30%。如果甲方接到稿件后20日内没有提出任何异议，则认为甲方已经认可乙方之翻译质量。
<br>4.4 如甲方所提供的原稿修改或删减，而须乙方对译文作相应修改，如已翻译的文字被删减，甲方也应根据字数向乙方支付翻译费；如甲方增加翻译内容，则按增加翻译内容另行收费。
<br>4.5 时间要求：乙方单个译员每天（8小时）平均翻译量：2000-3000字（具体的：3000字内3天，3000-10000字6天，10000-20000字9天）。乙方对于特急案可以收取30％～50％加急费用。但乙方需要收取加急费，需事先征得甲方的书面同意，否则甲方不支付加急费用。

<br>第6条 陈述与保证
<br>5.1 双方保证其具有签订和履行本合同的能力。
<br>5.2 乙方保证其向甲方提供译文的合法性、及时性、完整性、真实性和准确性。 
<br>5.3 甲方保证所委托文件的著作权人（如甲方不是该文件的著作权人）同意其签订和履行本合同并不要求乙方支付任何费用，乙方可要求甲方就此提供所委托文件的著作权人签署的文件。
<br>5.4 甲方保证乙方使用其委托文件的信息不构成对第三方任何权利的侵犯，同时甲方保证其签订、履行本合同不构成对第三方的违约或对第三方任何权利的侵犯，亦不会使乙方因此对任何第三方承担相关责任。
<br>5.5 免责条款：乙方对下列事件所引起的一切损失不负任何法律责任；
<br>5.5.1 因甲方提供的文稿侵犯第三人著作权等其他权利而引起的一切损失；
<br>5.5.2 因甲方提供原文错误而导致的一切损失；
<br>5.5.3 因甲方提供原文字迹不清或文字缺陷而导致的一切损失。
<br>因5.3至5.5条款导致乙方被他方起诉或其他原因使乙方遭受损失的，由甲方承担赔偿责任。

<br>第7条 违约责任
<br>6.1 乙方应于交稿日当天晚上18时前提交译文，如逾期则视为乙方违约。如逾期不超过24小时，甲方有权扣除翻译费用的10%，逾期超过24小时但不超过48小时，甲方有权扣除翻译费用的50%，逾期超过48小时但不超过72小时，甲方有权拒付翻译费用，并要求乙方赔偿全额的翻译费用作为罚金。
<br>6.2 在合同期限内，任何一方未取得对方书面同意不得单方终止合同，否则视为违约。
<br>6.3 如甲方迟延支付翻译费除应承担本合同约定的违约责任外，还应支付相应的滞纳金。滞纳金的标准为延迟一天支付所迟延之翻译费总额的10%。
<br>6.4 任何一方不履行、不完全履行、不适当、不及时履行本合同则视为违约，另外一方有权要求其按约定履行本合同或解除本合同，并要求对方赔偿相应的损失。如因违约导致守约方经济损失的，违约方还须承担赔偿责任。
<br>6.5任何一方由于不可抗力导致不能履行、不能完全履行本合同，就受不可抗力影响之部分不承担违约责任，但法律另有规定的除外，受不可抗力影响的一方应及时通知对方，以减轻可能给对方造成的损失，并应当在合理期限内提供相关证明。

<br>第8条 保密
<br>7.1 未经甲方许可，乙方不得向第三方泄露本合同条款的任何内容以及本合同的签订和履行情况，以及通过签订和履行本合同而获知的对方及对方关联公司的任何信息。
<br>7.2 乙方按照甲方的要求提供保密措施。
<br>7.3 本合同有效期内及终止后，7.1款均具有法律效力。
<br>7.4 合同双方都负有保守商业秘密的义务，乙方应遵守翻译职业道德，未经甲方许可，对译文内容不得向第三人泄漏，根据双方约定还可另行签署《保密协议》，参照译员协议。

<br>第9条 不可抗力
<br>8.1 “不可抗力”是本合同双方不能预见、不能避免并不能克服的事件，该事件妨碍、影响或延误任何一方根据合同履行其全部或部分义务。该事件包括但不限于乙方破产清算或被注销、政府行为、自然灾害、战争或任何其它类似事件。
<br>8.2 出现不可抗力事件时，知情方应及时、充分地向对方以书面形式发通知，并告知该类事件对本合同可能产生的影响，并应当在合理期限内提供相关证明。
<br>8.3 由于以上所述不可抗力事件致使合同的不能履行或延迟履行，则双方于彼此间不承担任何违约责任。

<br>第10条 争议的解决及适用法律
<br>9.1 如双方就本合同内容或其执行发生任何争议，双方应进行友好协商；协商不成时，任何一方均可向乙方所在地基层人民法院提起诉讼，或约定向北京仲裁委员会提起仲裁。
<br>9.2 本协议的订立、执行、解释及争议的解决均应适用中华人民共和国相关法律、法规及规章的规定。

<br>第10条 其它
<br>10.1 其他未尽事宜，由双方协商确定。如果协商不成，依照《中华人民共和国合同法》的相关规定确定与执行。
<br>10.2 本合同一式二份，双方各执一份，具有同等法律效力。
<br>10.3 本合同未经双方协商一致不得单方面擅自更改内容。
<br>10.4 双方之间的任何交流与沟通方式，均按本协议落款处的联系方式进行，如一方联系方式发生变化，应立即通知对方，因此而导致对方损失的由变更方承担。
<br>10.5 本合同自双方签字盖章之日起生效。

                                                 <br>保密协议
  <br>一、甲方聘请乙方为其提供笔译服务。
　<br>二、乙方应为甲方提供的信息保密，并且不得披漏（或许可其雇员披漏）信息予其机构以外任何其他人。乙方及其工作人员只能在翻译工作进行时使用该信息，未经甲方先书面同意，不得为自身或第三方的利益使用或试图使用该信息。
<br>三、乙方于工作期间内因工作本身或因工作上的便利，或对于其它相关的工作所知悉的各种文件、资料、图稿及讯息等，不论系以口头、书面或电子网络等其它任何形式，乙方皆有保密的义务，工作完成、工作移转或因故终止工作后亦然。
<br>四、对于相关文稿、专利、版权、贸易秘密、商标及其它知识产权的翻译，甲方享有唯一所有权。乙方无权向任何第三方提供，复制或销售该译稿。
<br>五、乙方若违反以上条款应承担相关的法律责任。


                       
                    <div class="agrees_content">
                    </div>
                  </div>


                <!--  tab面板切换内容结束！  -->
              </div>

            <!--    用户中心 我是译员 右侧内容 结束   -->

          </div>
        </div>
        <!--    用户中心 我是译员 结束   -->
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
        $(".cus_iter_navlists:last-child").addClass('useractive');

      })
    </script>
  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
