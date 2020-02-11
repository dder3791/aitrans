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
    <title><spring:message  code='环宇爱译协议'/></title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
   <%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.center.css"/> --%>

    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
   <%--  <script type="text/javascript" src="${pageContext.request.contextPath}/js/public.nav.footer.js"></script> --%>
   <%--  <script type="text/javascript" src="${pageContext.request.contextPath}/js/user.center.js"></script> --%>
   <script type="text/javascript">
   $(function(){
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
	  /*  $.post("/agreetment/queryByAllagreetment.do?agreetment=注册协议",function(data){
  		 $("#deal").after("<p style='text-indent:0;'>"+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data[0].items+"</p>");	
  	     
  	 },"json"); */
   /* 	var tnickname = "${transid.nickname}";
		var unickname = "${clientid.userName}"
		if(tnickname!=""){
			$("#nickname").text(tnickname+",欢迎您!");
			
		}else if (unickname!="") {
			$("#nickname").text(unickname+",欢迎您!");
			} */
			
   })
   
   
   </script>
  
    <style type="text/css">
      #agreement{padding: 0 40px;}
      #agreement h3{padding: 50px 0;}
      .text_indent{text-indent: 2em;}
      .agrees_content{text-align: center;padding:60px 0;}
      .agrees_content button{height: 40px;padding: 0 20px;}
    </style>
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
    <div class="publickNav"></div>
     <!-- logo 搜索栏  -->
    <div class="container">
      <nav class="publickSearch"></nav>
    </div> 

    <!--  用户中心内容  -->
    <div class="user_center"> 

              <!--  用户中心右侧 tab切换栏   -->
                <!-- <ul id="suerTab" class="nav nav-tabs">
                	<li class="active"><a href="javascript:;" data-toggle="tab">协议内容</a></li>
                </ul> -->

                <!--  tab面板对应内容   -->
                <div class="myTabContent tab-content">
                	<div class="tab-pane fade in active text_indent" id="agreement">
                    <h3 class="text-center" id="deal">环宇爱译协议</h3>
  &nbsp;&nbsp;&nbsp;&nbsp;“环宇爱译”在此特别提醒您（用户）在注册成为用户之前，请认真阅读本《用户协议》（以下简称“本协议”），确保您充分理解本协议中各条款。请您审慎阅读并选择接受或不接受本协议。除非您接受本协议所有条款，否则您无权注册、登录或使用本协议所涉服务。
  您的注册、登录、使用等行为将视为对本协议的接受，并同意接受本协议各项条款的约束。
  本协议约定“环宇爱译”与用户之间关于“语言服务”的权利义务。“用户”是指注册、登录、使用“环宇爱译”提供的语言服务的公司或个人。本协议可由“环宇爱译”随时更新，更新后的协议条款一旦公布即代替原来的协议条款，用户可在本网站查阅最新版协议条款。在“环宇爱译”修改协议条款后，如果用户不接受修改后的条款，请立即停止使用“环宇爱译”提供的服务，若用户继续使用“环宇爱译”提供的服务将被视为接受修改后的协议。

 &nbsp;&nbsp;<br>一．账号注册
   &nbsp;&nbsp;<br>1-1．用户在使用平台提供的服务前需要注册一个“环宇爱译”账号。“环宇爱译”账号应当使用电子邮箱或手机号码绑定注册。
   &nbsp;&nbsp;<br>1-2．在用户注册及使用平台提供的服务时，“环宇爱译”需要搜集能识别用户身份的个人信息以便“环宇爱译”可以在必要时联系用户，或为用户提供更好的使用体验。“环宇爱译”搜集的信息包括但不限于用户的公司名或个人姓名、公司情况、所属行业、公司或个人通讯信息、账户信息；“环宇爱译”同意对这些信息的使用将受限于第三条用户个人隐私信息保护的约束。

 &nbsp;&nbsp;<br>二．服务内容
   &nbsp;&nbsp;<br>2-1．“环宇爱译”可提供的服务根据实际情况可能随时变更。“环宇爱译”对其提供的服务予以变更时，用户将会收到“环宇爱译”关于服务变更的通知。

 &nbsp;&nbsp;<br>三．用户个人隐私信息保护
   &nbsp;&nbsp;<br>3-1．用户在注册账号或使用平台服务的过程中，可能需要填写或提交一些必要的信息，如用户的公司名或个人姓名、公司情况、所属行业、公司或个人通讯信息、账户信息等。若用户提交的信息不完整或不符合法律法规的规定，则用户可能无法使用服务或在使用服务的过程中受到限制。
   &nbsp;&nbsp;<br>3-2．个人隐私信息是指涉及用户身份或个人隐私的信息，比如，用户真实姓名、身份证号、手机号码、手机设备识别码、IP地址等。非个人隐私信息是指用户使用平台服务的操作状态以及使用习惯等明确且客观反映在“环宇爱译”服务器端的基本记录信息、个人隐私信息范围外的其它普通信息，以及用户同意公开的上述隐私信息。
   &nbsp;&nbsp;<br>3-3．尊重用户个人隐私信息的私有性是“环宇爱译”的一贯制度，“环宇爱译”将采取技术措施和其他必要措施，确保用户个人隐私信息安全，防止在服务中收集的用户个人隐私信息泄露、毁损或丢失。在发生前述情形或者“环宇爱译”发现存在发生前述情形的可能时，将及时采取补救措施。
   &nbsp;&nbsp;<br>3-4．“环宇爱译”未经用户同意不向任何第三方公开、透露用户个人隐私信息。但以下特定情形除外：
    &nbsp;&nbsp; <br>(1) “环宇爱译”根据法律法规规定或公安机关的指示提供用户的个人隐私信息；
    &nbsp;&nbsp;<br>(2) 由于用户将其用户密码告知他人或与他人共享注册帐户与密码，由此导致的任何个人信息的泄漏，或其他非因“环宇爱译”原因导致的个人隐私信息的泄露；
     &nbsp;&nbsp;<br>(3) 用户与“环宇爱译”及合作单位之间就用户个人隐私信息的使用公开达成约定，“环宇爱译”因此向合作单位公开用户个人隐私信息；
     &nbsp;&nbsp;<br>(4) 任何由于黑客攻击、电脑病毒侵入及其他不可抗力事件导致用户个人隐私信息的泄露。
   &nbsp;&nbsp;<br>3-5．用户同意“环宇爱译”可在以下事项中使用用户的个人隐私信息：
     &nbsp;&nbsp;<br>(1) “环宇爱译”向用户及时发送重要通知，如软件更新、本协议条款的变更；
     &nbsp;&nbsp;<br>(2)“环宇爱译”内部进行审计、数据分析和研究等，以改进环宇爱译的产品、服务和与用户之间的沟通；
     &nbsp;&nbsp;<br>(3) 依本协议约定，“环宇爱译”管理、审查用户信息及进行处理措施；
     &nbsp;&nbsp;<br>(4) 适用法律法规规定的其他事项。
  &nbsp;&nbsp;<br>除上述事项外，如未取得用户事先同意，“环宇爱译”不会将用户个人隐私信息使用于任何其他用途。
   &nbsp;&nbsp;<br>3-6．“环宇爱译”重视对未成年人个人隐私信息的保护。“环宇爱译”将依赖用户提供的个人信息判断用户是否为未成年人。任何18岁以下的未成年人注册账号或使用平台服务应事先取得家长或其法定监护人（以下简称"监护人"）的书面同意。除根据法律法规的规定及有权机关的指示披露外，“环宇爱译”不会使用或向任何第三方透露未成年人的个人隐私信息。除本协议约定的例外情形外，未经监护人事先同意，“环宇爱译”不会使用或向任何第三方透露未成年人的个人隐私信息。
   &nbsp;&nbsp;<br>3-7．为了改善“环宇爱译”的技术和服务，向用户提供更好的服务体验，“环宇爱译”或可会自行收集使用或向第三方提供用户的非个人隐私信息。

 &nbsp;&nbsp;<br>四．内容规范
   &nbsp;&nbsp;<br>4-1．本条所述内容是指用户使用服务过程中所制作、上载、复制、发布、传播的任何内容，包括但不限于账号头像、名称、用户说明等注册信息及认证资料或文字，以及其他使用账号或服务所产生的内容。
   &nbsp;&nbsp;<br>4-2．用户不得利用“环宇爱译”账号或服务制作、上载、复制、发布、传播如下法律、法规和政策禁止的内容：
    &nbsp;&nbsp; <br>(1) 反对宪法所确定的基本原则的；
     &nbsp;&nbsp;<br>(2) 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；
     &nbsp;&nbsp;<br>(3) 损害国家荣誉和利益的；
     &nbsp;&nbsp;<br>(4) 煽动民族仇恨、民族歧视，破坏民族团结的；
     &nbsp;&nbsp;<br>(5) 破坏国家宗教政策，宣扬邪教和封建迷信的；
     &nbsp;&nbsp;<br>(6) 散布谣言，扰乱社会秩序，破坏社会稳定的；
     &nbsp;&nbsp;<br>(7) 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；
     &nbsp;&nbsp;<br>(8) 侮辱或者诽谤他人，侵害他人合法权益的；
     &nbsp;&nbsp;<br>(9) 含有法律、行政法规禁止的其他内容的信息。

 &nbsp;&nbsp;<br>五．使用规则
  &nbsp;&nbsp; <br>5-1．用户在服务中或通过服务所产生的任何内容并不反映或代表，也不得被视为反映或代表“环宇爱译”的观点、立场或政策，“环宇爱译”对此不承担任何责任。
   &nbsp;&nbsp;<br>5-2．用户不得利用“环宇爱译”账号或服务进行如下行为：
     &nbsp;&nbsp;<br>(1) 利用技术手段批量建立虚假账号的；
     &nbsp;&nbsp;<br>(2) 利用“环宇爱译”账号或服务从事任何违法犯罪活动的；
     &nbsp;&nbsp;<br>(3) 制作、发布与以上行为相关的方法、工具，或对此类方法、工具进行运营或传播，无论这些行为是否为商业目的；
     &nbsp;&nbsp;<br>(4) 其他违反法律法规规定、侵犯其他用户合法权益、干扰“环宇爱译”正常运营或“环宇爱译”未明示授权的行为。
   &nbsp;&nbsp;<br>5-3．用户须对利用“环宇爱译”账号或服务传送信息的真实性、合法性、无害性、准确性、有效性等全权负责，与用户所传播的信息相关的任何法律责任由用户自行承担，与“环宇爱译”无关。如因此给环宇爱译或第三方造成损害的，用户应当依法予以赔偿。
   &nbsp;&nbsp;<br>5-4．“环宇爱译”提供的服务中可能包括广告，用户同意在使用过程中显示“环宇爱译”和第三方服务商、合作伙伴提供的广告。除法律法规明确规定外，用户应自行对依该广告信息进行的交易负责，对用户因依该广告信息进行的交易或前述广告商提供的内容而遭受的损失或损害，“环宇爱译”不承担任何责任。

 &nbsp;&nbsp;<br>六．帐户管理
   &nbsp;&nbsp;<br>6-1．“环宇爱译”账号的所有权归“环宇爱译”所有，用户完成申请注册手续后，获得“环宇爱译”账号的使用权，该使用权仅属于初始申请注册人，禁止赠与、借用、租用、转让或售卖。“环宇爱译”因经营需要，有权回收用户的“环宇爱译”账号。
   &nbsp;&nbsp;<br>6-2．用户有责任妥善保管注册账号信息及账号密码的安全，因用户保管不善可能导致遭受盗号或密码失窃，责任由用户自行承担。用户需要对注册账号以及密码下的行为承担法律责任。用户同意在任何情况下不使用其他用户的账号或密码。在用户怀疑他人使用其账号或密码时，用户同意立即通知“环宇爱译”。
   &nbsp;&nbsp;<br>6-3．用户应遵守本协议的各项条款，正确、适当地使用服务，如因用户违反本协议中的任何条款，“环宇爱译”在通知用户后有权依据协议中断或终止对违约用户 “环宇爱译”账号提供服务。同时，“环宇爱译”保留在任何时候收回“环宇爱译”账号、用户名的权利。

 &nbsp;&nbsp;<br>七．数据储存
   &nbsp;&nbsp;<br>7-1．“环宇爱译”不对用户在服务中相关数据的删除或储存失败负责。
   &nbsp;&nbsp;<br>7-2．“环宇爱译”可以根据实际情况自行决定用户在服务中数据的最长储存期限，并在服务器上为其分配数据最大存储空间等。
   &nbsp;&nbsp;<br>7-3．如用户停止使用服务或服务终止，“环宇爱译”可以从服务器上永久地删除用户的数据。服务停止、终止后，“环宇爱译”没有义务向用户返还任何数据。

 &nbsp;&nbsp;<br>八．风险承担
   &nbsp;&nbsp;<br>8-1．用户理解并同意，因业务发展需要，“环宇爱译”保留单方面对服务的全部或部分服务内容变更、暂停、终止或撤销的权利，用户需承担此风险。
   &nbsp;&nbsp;<br>8-2．如果用户发现任何人违反本协议约定或以其他不当的方式使用服务，请立即向“环宇爱译”举报或投诉，“环宇爱译”将依本协议约定进行处理。

 &nbsp;&nbsp;<br>九．知识产权声明
   &nbsp;&nbsp;<br>9-1．除另有特别声明外，“环宇爱译”提供服务时所依托软件的著作权、专利权及其他知识产权均归“环宇爱译”所有。
   &nbsp;&nbsp;<br>9-2．“环宇爱译”在服务中所涉及的图形、文字或其组成，以及其他“环宇爱译”标志及产品、服务名称（以下统称““环宇爱译”标识”），其著作权或商标权归“环宇爱译”所有。未经“环宇爱译”事先书面同意，用户不得将“环宇爱译”标识以任何方式展示或使用或作其他处理，也不得向他人表明用户有权展示、使用、或其他有权处理“环宇爱译”标识的行为。
   &nbsp;&nbsp;<br>9-3．上述及其他任何“环宇爱译”或相关广告商依法拥有的知识产权均受到法律保护，未经“环宇爱译”或相关广告商书面许可，用户不得以任何形式进行使用或创造相关衍生作品。

 &nbsp;&nbsp;<br>十．法律责任
   &nbsp;&nbsp;<br>10-1．如果“环宇爱译”发现或收到他人举报或投诉用户违反本协议约定的，“环宇爱译”有权不经通知随时对相关内容，包括但不限于用户资料进行审查、删除，并视情节轻重对违规账号处以包括但不限于警告、账号封禁、设备封禁、功能封禁的处罚，且通知用户处理结果。
   &nbsp;&nbsp;<br>10-2．用户理解并同意，“环宇爱译”有权依合理判断对违反有关法律法规或本协议规定的行为进行处罚，对违法违规的任何用户采取适当的法律行动，并依据法律法规保存有关信息向有关部门报告等，用户应承担由此而产生的一切法律责任。
   &nbsp;&nbsp;<br>10-3．用户理解并同意，因用户违反本协议约定，导致或产生的任何第三方主张的任何索赔、要求或损失，包括合理的律师费，用户应当赔偿“环宇爱译”与合作公司、关联公司，并使之免受损害。

 &nbsp;&nbsp;<br>十一．不可抗力及其他免责事由
  &nbsp;&nbsp;<br>11-1．用户理解并确认，在使用服务的过程中，可能会遇到不可抗力等风险因素，使服务发生中断。不可抗力是指不能预见、不能克服并不能避免且对一方或双方造成重大影响的客观事件，包括但不限于自然灾害如洪水、地震、瘟疫流行和风暴等以及社会事件如战争、动乱、政府行为等。出现上述情况时，“环宇爱译” 团队将努力在第一时间与相关单位配合，及时进行修复，但是由此给用户或第三方造成的损失，“环宇爱译”及合作单位在法律允许的范围内免责。
   &nbsp;&nbsp;<br>11-2．语言服务同大多数互联网服务一样，受包括但不限于用户原因、网络服务质量、社会环境等因素的差异影响，可能受到各种安全问题的侵扰，如他人利用用户的资料，造成现实生活中的骚扰；用户下载安装的其它软件或访问的其他网站中含有“特洛伊木马”等病毒，威胁到用户的计算机信息和数据的安全，继而影响服务的正常使用等等。用户应加强信息安全及使用者资料的保护意识，要注意加强密码保护，以免遭致损失和骚扰。
   &nbsp;&nbsp;<br>11-3．用户理解并确认，服务存在因不可抗力、计算机病毒或黑客攻击、系统不稳定、用户所在位置、用户关机以及其他任何技术、互联网络、通信线路原因等造成的服务中断或不能满足用户要求的风险，因此导致的用户或第三方任何损失，“环宇爱译”不承担任何责任。
   &nbsp;&nbsp;<br>11-4．用户理解并确认，在使用服务过程中存在来自任何他人的包括误导性的、欺骗性的、威胁性的、诽谤性的、令人反感的或非法的信息，或侵犯他人权利的匿名或冒名的信息，以及伴随该等信息的行为，因此导致的用户或第三方的任何损失，“环宇爱译”不承担任何责任。
   &nbsp;&nbsp;<br>11-5．用户理解并确认，“环宇爱译”需要定期或不定期地对“环宇爱译”平台或相关的设备进行检修或者维护，如因此类情况而造成服务在合理时间内的中断，“环宇爱译”无需为此承担任何责任，但“环宇爱译”应事先进行通告。
   &nbsp;&nbsp;<br>11-6．“环宇爱译”依据法律法规、本协议约定获得处理违法违规或违约内容的权利，该权利不构成“环宇爱译”的义务或承诺，“环宇爱译”不能保证及时发现违法违规或违约行为或进行相应处理。
   &nbsp;&nbsp;<br>11-7．用户理解并确认，对于“环宇爱译”向用户提供的下列产品或者服务的质量缺陷及其引发的任何损失，“环宇爱译”无需承担任何责任：
    &nbsp;&nbsp; <br>(1) “环宇爱译”向用户免费提供的服务；
     &nbsp;&nbsp;<br>(2) “环宇爱译”向用户赠送的任何产品或者服务。
   &nbsp;&nbsp;<br>11-8．在任何情况下，“环宇爱译”均不对任何间接性、后果性、惩罚性、偶然性、特殊性或刑罚性的损害，包括因用户使用“环宇爱译”或服务而遭受的利润损失，承担责任（即使“环宇爱译”已被告知该等损失的可能性亦然）。尽管本协议中可能含有相悖的规定，“环宇爱译”对用户承担的全部责任，无论因何原因或何种行为方式，始终不超过用户因使用“环宇爱译”提供的服务而支付给“环宇爱译”的费用(如有)。

 &nbsp;&nbsp;<br>十二．服务的变更、中断、终止
   &nbsp;&nbsp;<br>12-1．鉴于网络服务的特殊性，用户同意“环宇爱译”有权随时变更、中断或终止部分或全部的服务（包括收费服务）。“环宇爱译”变更、中断或终止的服务，“环宇爱译”应当在变更、中断或终止之前通知用户，并应向受影响的用户提供等值的替代性的服务；如用户不愿意接受替代性的服务，如果该用户已经向“环宇爱译”支付的“环宇爱译”服务费，“环宇爱译”应当按照该用户实际使用服务的情况扣除相应服务费之后将剩余的服务费以译豆的方式退还用户的“环宇爱译”“我的账户”中。
   &nbsp;&nbsp;<br>12-2．如发生下列任何一种情形，“环宇爱译”有权变更、中断或终止向用户提供的免费服务或收费服务，而无需对用户或任何第三方承担任何责任：
     &nbsp;&nbsp;<br>(1) 根据法律规定用户应提交真实信息，而用户提供的个人资料不真实、或与注册时信息不一致又未能提供合理证明；
     &nbsp;&nbsp;<br>(2) 用户违反相关法律法规或本协议的约定；
     &nbsp;&nbsp;<br>(3) 按照法律规定或有权机关的要求；
     &nbsp;&nbsp;<br>(4) 出于安全的原因或其他必要的情形。

 &nbsp;&nbsp;<br>十三．其他
  &nbsp;&nbsp; <br>13-1．“环宇爱译”郑重提醒用户注意本协议中免除“环宇爱译”责任和限制用户权利的条款，请用户仔细阅读，自主考虑风险。未成年人应在法定监护人的陪同下阅读本协议。
   &nbsp;&nbsp;<br>13-2．本协议的效力、解释及纠纷的解决，适用于中华人民共和国法律。若用户和“环宇爱译”之间发生任何纠纷或争议，首先应友好协商解决，协商不成的，用户同意将纠纷或争议提交“环宇爱译”注册地有管辖权的人民法院管辖。
   &nbsp;&nbsp;<br>13-3．本协议的任何条款无论因何种原因无效或不具可执行性，其余条款仍有效，对双方具有约束力。
                    <div class="agrees_content">
                      <button type="button" class="btn btn-primary" onclick="javaSprict=history.go(-1)">同意以上协议,返回上一步</button>
                      <!--  <a href="javascript:history.go(-1)"></a> -->
                     <!--  <button type="button" class="btn btn-default" name="button">同意并申请协议</button> -->
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
        $(".cus_iter_navlists:last-child").addClass('useractive');

      })
    </script>
  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
