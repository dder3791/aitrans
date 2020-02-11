<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="tq-header">
			<div class="tianqi-wrap clearfix">
				<div class="tianqi-logo">
					<img src="image/index/log.png"/>
				</div>
				<div class="tianqi-nav">
					<ul class="clearfix">
						<li  class="" id="top_menu"><a href="index.jsp?menu_index=menu_0">${language.tq001}</a></li>
						<li><a href="hotelList.jsp?flag=ticket&menu_index=menu_1">${language.tq040}</a></li>
						<li><a href="community.jsp?menu_index=menu_2">${language.tq065}</a></li>
						<li><a href="hotelList.jsp?flag=hotel&menu_index=menu_3">${language.tq066}</a></li>
						<li><a href="myHome.jsp?menu_index=menu_4">${language.tq067}</a></li>	
						<li><a href="survey.jsp?menu_index=menu_5">${language.tq068}</a></li>
						<li>
							<div class="">
								<a href="javascript:void(0)" onclick="controlLanguageDiv('language',this)">${language.tq094}</a>
								<span class="iconn-caret-up"></span>
							</div>
							<div class="tinqi-language" id="language" style="display:none">
								<div class="tianqi-myMessages" onclick="getLanguage('en')"><a src="javascript:void(0)">English</a></div>									
								<div class="tianqi-myMessages" onclick="getLanguage('ch')"><a src="javascript:void(0)">中文</a></div>
								<div class="tianqi-myMessages" onclick="getLanguage('ko')"><a src="javascript:void(0)">한국어</a></div>
								<div class="tianqi-myMessages" onclick="getLanguage('ja')"><a src="javascript:void(0)">日本语</a></div>
							</div>
						</li>					
					</ul>
				</div>
				<div class="tianqi-login">
					<ul class="clearfix">
						<li><a class="weibo-login" href="javascript:;" title="微博登录" rel="nofollow" onclick="loginWeibo()"></a></li>
						<li><a class="qq-login" href="javascript:;" title="QQ登录" rel="nofollow" onclick="loginQQ()"></a></li>
						<!-- <li><a class="weixin-login" href="javascript:;" title="微信登录" rel="nofollow" onclick=""></a></li> -->
				     	<li>
				     	
							<c:choose>
		   		            <c:when test="${user!=null}">${user.nickname}</c:when>
		   		             <c:otherwise>
		   		                <a href="login.jsp">${language.tq069}</a></c:otherwise>                
		                    </c:choose>
						   
					 </li>
				<li>|</li>
				
			   <c:choose>
 		             <c:when test="${user.name!=null}"><li><a onclick="exiting()">退出</a></li></c:when>
 		             <c:otherwise><li><a href="register.jsp">${language.tq070}</a></li></c:otherwise>                
               </c:choose>						
				<li>
				<c:choose>	
				       <c:when test="${user.name!=null}">
					      <div class="account">
							<a class="infoItem" href="javascript:void(0)" onclick="controlLanguageDiv('II',this)">
							   <img src="${(user.headimgurllocal == '' || user.headimgurllocal == null)?'./image/444.jpg':user.headimgurllocal}" width="32" height="32" align="absmiddle">
							   <i class="imageUp"></i>
							</a>
						</div>
				      </c:when>				      
 		              <c:otherwise></c:otherwise> 					
				 </c:choose>
				</li>
				<div class="tinqi-myself" id="II" style="display:none">
					<%-- <div class="tianqi-myMessage"><a src="myHome.html">${language.tq072}</a></div>									
					<div class="tianqi-myMessage"><a src="javascript:void(0)">${language.tq089}</a></div>
					<div class="tianqi-myMessage"><a src="javascript:void(0)">${language.tq090}</a></div>
					<div class="tianqi-myMessage"><a src="javascript:void(0)">${language.tq091}</a></div>
					<div class="tianqi-myMessage"><a src="javascript:void(0)">${language.tq092}</a></div>
					<div class="tianqi-myMessage"><a src="javascript:void(0)">${language.tq093}</a></div> --%>
					<div class="tianqi-myMessage"><a href="myHome.jsp" title="我的小窝"><i class="iconn-wo"></i>我的小窝</a></div>
					<div class="tianqi-myMessage"><a href="writeTravel.jsp" title="写游记"><i class="iconn-writenotes"></i>写游记</a></div>
					<div class="tianqi-myMessage"><a href="myHome.jsp?mytype=wdyj" title="我的游记"><i class="iconn-mynotes"></i>我的游记</a></a></div>
					<div class="tianqi-myMessage"><a href="myHome.jsp?mytype=wdhy" title="我的好友"><i class="iconn-friend"></i>我的好友</a></a></div>
					<div class="tianqi-myMessage"><a href="myHome.jsp?mytype=wdsc" title="我的收藏"><i class="iconn-collect"></i>我的收藏</a></a></div>
					<div class="tianqi-myMessage"><a href="myHome.jsp?menu_index=menu_4" title="我的订单"><i class="iconn-order"></i>我的订单</a></a></div>
					<div class="tianqi-myMessage"><a href="../userinfor/selectUserInfo?flag=info" title="设置"><i class="iconn-settings"></i>设置</a></a></div>
					<div class="tianqi-myMessage"><a href="javascript:void(0)" onclick="exiting();" title="退出"><i class="iconn-logout"></i>退出</a></a></div>
				</div>
			</ul>
		</div>
	</div>
	
</div>