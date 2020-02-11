<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name=" Keywords" content="......">      <!--content中，网页关键字-->
    <meta name=" description" content="......">   <!--content中，网页描述文字-->
    <meta name="author" content="......">        <!--标注作者-->
    <title><spring:message  code='环宇爱译全球翻译平台'/></title>   
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/interpreter.cards.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/next.pic.css"/>

	<script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.0.min.js"></script> --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script> --%>
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/all.needs.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/modules/layer.js"></script> --%>
    <script src="${pageContext.request.contextPath}/js/jquery.i18n.properties-min-1.0.9.js"></script>
	<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script type="text/javascript">
    var lang = "${language}"
		if(lang==""){
			lang="zh";
		}
    $(function(){
    	if("${transid}"!=null && "transid"!=''){
			if("${transid.nickname}"!=null && "${transid.nickname}"!=''){
	        	  $("#nickname").text("${transid.nickname}"+"<spring:message  code='，欢迎您！'/>");
	          }else if("${transid.tel}"!=null && "${transid.tel}"!=''){
	        	  $("#nickname").text("${transid.tel}"+"<spring:message  code='，欢迎您！'/>");
	          }else if("${transid.email}"!=null && "${transid.email}"!=''){
	        	  $("#nickname").text("${transid.email}"+"<spring:message  code='，欢迎您！'/>");
	          }
			
			var mess="";
			if("${transid.certificationStatus}"==3 || "${transid.certificationStatus}"=='3' || "${transid.certificationStatus}"=='0' || "${transid.certificationStatus}"==0){
				mess="<li class='nav_lists_li'><span style='color: white;'>您还没有实名认证</span><a href='/translator/newIdentity.do' style='color: red'>点击这里进行实名认证</a></li>";
			}else if("${transid.isVerifty}"==3 || "${transid.isVerifty}"=='3' || "${transid.isVerifty}"=='0' || "${transid.isVerifty}"==0 || "${transid.isProofread}"==3 || "${transid.isProofread}"=='3' || "${transid.isProofread}"=='0' || "${transid.isProofread}"==0 || "${transid.isAudit}"==3 || "${transid.isAudit}"=='3' ||  "${transid.isAudit}"=='0' ||  "${transid.isAudit}"==0){
				mess="<li class='nav_lists_li'><span style='color: white;'>您还没有资格认证</span><a href='/translator/newLanguage.do' style='color: red'>点击这里进行资格认证</a></li>"
			}
			$("#ulMess").append(mess);
			
		}else if("${clientid}"!=null && "clientid"!=''){
			 if("${clientid.userName}"!='' && "${clientid.userName}"!=null){
		   		 $("#nickname").text('${clientid.userName}'+"<spring:message code=',欢迎您!'/>");
		   	 }else if('${clientid.tel}'!=null && '${clientid.tel}'!=null){
		   		 $("#nickname").text('${clientid.tel}'+"<spring:message code=',欢迎您!'/>");
		   	 }else if('${clientid.emaile}'!=null && '${clientid.emaile}'!=null){
		   		 $("#nickname").text('${clientid.emaile}'+"<spring:message code=',欢迎您!'/>");
		   	 }
		}
      	/*  var tnickname = "${transid.nickname}";
    	var unickname = "${clientid.userName}"
    		if(tnickname!=""){
    			$("#nickname").text(tnickname+"<spring:message  code='，欢迎您！'/>");
    			
    		}else if (unickname!="") {
    			$("#nickname").text(unickname+"<spring:message  code='，欢迎您！'/>");
    		}  */
    	
    	//发布需求按钮
    	$("#publishNeedClick").click(function (){
    		if("${clientid}"==null || "clientid"==''){
    			//layer.msg('<spring:message code="您不是客户，不能进行发布项目操作"/>',{icon:1});
    			alert('<spring:message code="您不是客户，不能进行发布项目操作"/>');
    		}else{
    			$("#publishNeedClick").prop("href","/cilentCustomer/publishNeed.do")
    		}
    	})
    	
		//初始化页面数据，获取在线报价表格信息，以及在线报价条件信息
		$.ajax({
			type : "POST",
			url : "/onlineQuery/onlineQueryAction_queryByAll.do",
			cache : false,
			dataType : "json",
			success : function(data) {
				//接受译员等级系数集合
				var translatorLevels=data.translatorLevels;
				//接受基础价格集合
				var basicPrice = data.basicPrice.basicPrice;
				//接受领域系数集合
				var fields = data.fields;
				//接受当前所选的翻译语言类型
				var type = data.basicPrice.type
				//获取当前选择的基础价格类型
				var bps = data.bps;
				//获取周期系数集合
				var schedules = data.schedules;
				//国际化加载器
		jQuery.i18n.properties({
	        name:'Messages', 
	        path:'/i18n/', 
	        mode:'both',
	   		language:lang,
	        checkAvailableLanguages: true,
	        async: true,
	        callback: function() { 	        	
	        	
				for (var x = 0; x < fields.length; x++) {
					var pic='';
					if(fields[x].id==12){
	  					pic="<spring:message  code='日常'/>"
	  				}else if(fields[x].id==13){
	  					pic="<spring:message  code='机械'/>"
	  				}else if(fields[x].id==14){
	  					pic="<spring:message  code='电子'/>"
	  				}else if(fields[x].id==15){
	  					pic="<spring:message  code='电器'/>"
	  				}else if(fields[x].id==16){
	  					pic="<spring:message  code='机电'/>"
	  				}else if(fields[x].id==17){
	  					pic="<spring:message  code='自动化'/>"
	  				}else if(fields[x].id==18){
	  					pic="<spring:message  code='计算机'/>"
	  				}else if(fields[x].id==19){
	  					pic="<spring:message  code='通信'/>"
	  				}else if(fields[x].id==20){
	  					pic="<spring:message  code='网络'/>"
	  				}else if(fields[x].id==21){
	  					pic="<spring:message  code='物理'/>"
	  				}else if(fields[x].id==22){
	  					pic="<spring:message  code='化学'/>"
	  				}else if(fields[x].id==23){
	  					pic="<spring:message  code='化工'/>"
	  				}else if(fields[x].id==24){
	  					pic="<spring:message  code='医药'/>"
	  				}else if(fields[x].id==25){
	  					pic="<spring:message  code='生化'/>"
	  				}
					$("#field").append("<option value="+fields[x].factor+" title="+fields[x].field+">"+pic+"</option>")
				}
				//循环添加周期信息
				for (var x = 0; x < schedules.length; x++) {
					var cycle="";
					if(schedules[x].schedule == "一般"){
						cycle = "<spring:message  code='一般'/>"
			    	}
			    	else if(schedules[x].schedule == "加急"){
			    		cycle = "<spring:message  code='加急'/>"
			    	}
			    	else if(schedules[x].schedule == "特急"){
			    		cycle = "<spring:message  code='特急'/>"
					}
					
					$("#schedule").append("<option title="+schedules[x].schedule+" value="+schedules[x].factor+">"+cycle+"</option>")
				}
				//循环添加译员等级信息
				for (var i = 0; i < translatorLevels.length; i++) {
					//判断译员等级大于2时，添加
					if(translatorLevels[i].level>2){
						$("#translatorLevel").append("<option value="+translatorLevels[i].factor+" title="+translatorLevels[i].level+">"+"<spring:message  code='等级'/>"+translatorLevels[i].level+"</option>")
					}
					
				}
				//循环添加语言种类信息，分别像表格以及在线查询模块添加
				for (var i = 0; i < bps.length; i++) {
					var languageCard="";
				    if(bps[i].type=="英汉"){
				    	languageCard="<spring:message code='英汉'/>"
					}else if(bps[i].type=="汉英"){
						languageCard="<spring:message code='汉英'/>"
					}else if(bps[i].type=="日汉"){
						languageCard="<spring:message code='日汉'/>"
					}else if(bps[i].type=="汉日"){
						languageCard="<spring:message code='汉日'/>"
					}else if(bps[i].type=="韩汉"){
						languageCard="<spring:message code='韩汉'/>"
					}else if(bps[i].type=="汉韩"){
						languageCard="<spring:message code='汉韩'/>"
					}else if(bps[i].type=="德汉"){
						languageCard="<spring:message code='德汉'/>"
					}else if(bps[i].type=="汉德"){
						languageCard="<spring:message code='汉德'/>"
					}else if(bps[i].type=="法汉"){
						languageCard="<spring:message code='法汉'/>"
					}else if(bps[i].type=="汉法"){
						languageCard="<spring:message code='汉法'/>"
					}
					/*$("#language").append("<option value="+bps[i].type+">"+bps[i].type+"</option>")*/
					$("#language1").append("<option value="+bps[i].basicPrice+" title="+bps[i].type+">"+languageCard+"</option>")
					
				}
	        }
				    });
				/*//创建tr td对象
				var offer_tr = '<tr class="offer_tr">'+'</tr>'
				var offer_td = '<td class="offer_td">'+'</td>'
				  // 循环表格
				  for(var i=0;i<translatorLevels.length;i++){
				    $(".offer_table").append(offer_tr);
				    for(var j=0;j<4;j++){
				      $(".offer_tr").eq(i).append(offer_td);
				    }
				  }
				  //表格中遍历内容
				  $.each(translatorLevels, function(inx,obj){
					  if(inx==0){
				    $(".offer_tr").eq(inx).find(".offer_td:first-child").html(type)
				    }
				    $(".offer_tr").eq(inx).find(".offer_td:nth-child(2)").html(obj.level+"级")
				    $(".offer_tr").eq(inx).find(".offer_td:nth-child(3)").html((obj.level)*basicPrice)
				    $(".offer_tr").eq(inx).find(".offer_td:nth-child(4)").html((obj.level)*basicPrice*0.8)
				  })
	*/
				  // 在线询价  帮助内容显示 隐藏
				  //议员等级
				    $(".dengjihelp").hover(function(){
				      $(".help_text").show();
				    },function(){
				      var tdengji=setTimeout(function(){
				        $(".help_text").hide();
				      },1000)
				    })
				    //周期
				    $(".zhouqihelp").hover(function(){
				      $(".help_zhouqi_text").show();
				    },function(){
				      var tzhouqi=setTimeout(function(){
				        $(".help_zhouqi_text").hide();
				      },1000)
				    })

				    
				   
				}
		
			});
		
		
		
		//添加在线报价的点击事件
		$("#btn1").click(function (){
			//创建人员总数信息
			var count = 0
			//创建价格信息
			var money = 0
			//获取当前选择的领域系数
			var field = $("#field").val();

			//获取当前选择的周期系数
			var schedule = $("#schedule").val();

			//获取当前选择的译员等级系数
			
			var translatorLevel = $("#translatorLevel").val();

			//获取当前语言种类基础价格
			var basicPrice = $("#language1").val();
			//获取流程信息
			var flow = $("#flow").val();
			//未选择验证
			if(basicPrice==""){
				//layer.msg('<spring:message  code="翻译语言尚未选择！！！！"/>', {icon: 2});
				alert('<spring:message  code="翻译语言尚未选择！！！！"/>');
					
			}
			else if(field==""){
				//layer.msg('<spring:message  code="翻译领域尚未选择！！！！"/>', {icon: 2});
				alert('<spring:message  code="翻译领域尚未选择！！！！"/>');
			
			}else if (flow=="") {
				//layer.msg('<spring:message  code="翻译流程尚未选择！！！！"/>' ,{icon: 2});
				alert('<spring:message  code="翻译流程尚未选择！！！！"/>');
			
				
			}else if (translatorLevel=="") {
				//layer.msg('<spring:message  code="译员等级尚未选择！！！！"/>',{icon: 2});
				alert('<spring:message  code="译员等级尚未选择！！！！"/>');
				
			}else if (schedule=="") {
				//layer.msg( '<spring:message  code="翻译周期尚未选择！！！！"/>',{icon: 2});
				alert('<spring:message  code="翻译周期尚未选择！！！！"/>');
			
			}	
			
			//添加流程算法并展示价格信息
			else if(flow=="仅翻译"){
				money = basicPrice*field*translatorLevel*schedule;
				money = money + "";
				if(money.length>6){
					money = money.substr(0,money.indexOf(".")+3);
				}
				$("#money").text(money);
				$("#omoney").show();
			}
			else if(flow=="翻译校对"){
				money = (basicPrice*field*translatorLevel*schedule)+((basicPrice*field*schedule)*0.5)/translatorLevel;
				money = money + "";
				if(money.length>6){
					money = money.substr(0,money.indexOf(".")+3);
				}
				$("#money").text(money);
				$("#omoney").show();
			}else if(flow=="翻译校对审核"){
				money = (basicPrice*field*translatorLevel*schedule)+(((basicPrice*field*schedule)*0.5)/translatorLevel)+((basicPrice*field*schedule)*0.5);
				money = money + "";
				if(money.length>6){
					money = money.substr(0,money.indexOf(".")+3);
				}
				$("#money").text(money);
				$("#omoney").show();
			}
			
		});
		 $.ajax({
				type : "POST",
				url : "/index/indexAction_getAll.do",
				cache : false,
				dataType : "json",
				success : function(data) {
					var platformArticle=data.PlatformArticle;
				/* 	var software = data.software; */
					var activityArticle=data.ActivityArticle
					var noticeArticle= data.NoticeArticle
				/* 	$("#name").append(software.name);
					$("#size").append(software.size);
					$("#updateTime").append(software.updateTime);
					$("#url").prop("href",software.url); */
					var str2 =  "<tr><td class='td_title' rowspan='2'><spring:message  code='公告'/></td><td><i class='fa fa-circle' aria-hidden='true'></i><a href='/article/articleAction_queryById.do?id="+platformArticle[0].id+"' target='_blank'>"+platformArticle[0].title+"</a></td><td><span class='pull-right'>"+platformArticle[0].issueDate+"</span></td></tr><tr><td><i class='fa fa-circle' aria-hidden='true'></i><a href='/article/articleAction_queryById.do?id="+platformArticle[1].id+"' target='_blank'>"+platformArticle[1].title+"</a></td><td><span class='pull-right'>"+platformArticle[1].issueDate+"</span></td></tr>"
					var str3= "<tr><td class='td_title' rowspan='2'><spring:message  code='资讯'/></td><td><i class='fa fa-circle' aria-hidden='true'></i><a href='/article/articleAction_queryById.do?id="+activityArticle[0].id+"' target='_blank'>"+activityArticle[0].title+"</a></td><td><span class='pull-right'>"+activityArticle[0].issueDate+"</span></td></tr><tr><td><i class='fa fa-circle' aria-hidden='true'></i><a href='/article/articleAction_queryById.do?id="+activityArticle[1].id+"' target='_blank'>"+activityArticle[1].title+"</a></td><td><span class='pull-right'>"+activityArticle[1].issueDate+"</span></td></tr>"
					var str1= "<tr><td class='td_title' rowspan='2'><spring:message  code='活动'/></td><td><i class='fa fa-circle' aria-hidden='true'></i><a href='/article/articleAction_queryById.do?id="+noticeArticle[0].id+"' target='_blank'>"+noticeArticle[0].title+"</a></td><td><span class='pull-right'>"+noticeArticle[0].issueDate+"</span></td></tr><tr><td><i class='fa fa-circle' aria-hidden='true'></i><a href='/article/articleAction_queryById.do?id="+noticeArticle[1].id+"' target='_blank'>"+noticeArticle[1].title+"</a></td><td><span class='pull-right'>"+noticeArticle[1].issueDate+"</span></td></tr>"
					/* = "<li class='list-group-item' style='width: 299px'><i class='fa fa-circle' aria-hidden='true'></i><a href='/article/articleAction_queryById.do?id="+data.ActivityArticle.id+" ' target='_blank'>"+data.ActivityArticle.title+"</a><span class='pull-right'>"+data.ActivityArticle.issueDate+"</span></li>"*/
					/*"<li class='list-group-item' style='width: 299px'><i class='fa fa-circle' aria-hidden='true'></i><a href='/article/articleAction_queryById.do?id="+platformArticle[i].id+" ' target='_blank'>"+platformArticle[i].title+"</a><span class='pull-right'>"+platformArticle[i].issueDate+"</span></li>"*/
					
					/*var str1 = "<li class='list-group-item' style='width: 299px'><i class='fa fa-circle' aria-hidden='true'></i><a href='/article/articleAction_queryById.do?id="+data.NoticeArticle.id+" ' target='_blank'>"+data.NoticeArticle.title+"</a><span class='pull-right'>"+data.NoticeArticle.issueDate+"</span></li>"*/
					$("#article").append(str1+str2+str3);
					/* var newTranslators = data.NewTranslators;
					var oul = $(".index_costumer_lits");
					for (var i = 0; i < newTranslators.length; i++) {

						oul.append("<li><font color='#A9A9A9'><spring:message  code='欢迎'/>&nbsp"+newTranslators[i].nickname+"&nbsp<spring:message  code='成为平台第'/>&nbsp"+newTranslators[i].id+"&nbsp<spring:message  code='位译员！'/></font></li>");
					} */
					  // 新译员 走马灯效果
				     $(function(){
				      var liWidth = $(".index_costumer_lits li").width()+65
				      var liLength = $(".index_costumer_lits li").length+1

				      var widths = liWidth*liLength

				      $(".index_costumer_lits").css({'width':widths})

				      var timesRun = 0;
				      
				      function start(){
				        ints = setInterval(function(){
				        
				        timesRun += 5
				        if(widths-timesRun < 1200){
				          timesRun =0

				        }
				        $(".index_costumer_lits").css({'position':'relative','left':-timesRun})

				      },70)
				      }
				    start();

				      $(".index_costumer_lits").hover(function(){
				        clearInterval(ints)
				      },function(){
				        start();
				      })

				    }) 
					}
		 			
		 			
		 		
				});
	/*	//创建表格信息查询的改变事件
		$("#language").change(function() {
			//获取当前语言类型
			var language = $("#language").val();
			//请求访问获取价格信息
			$.ajax({
				type : "POST",
				url : "/onlineQuery/onlineQueryAction_queryByLanguage.do",
				data :"language="+language,
				cache : false,
				dataType : "json",
				success : function(data) {
					//接受语言类型
					var type = data.basicPrice.type;
					//接受语言基础价格
					var basicPrice = data.basicPrice.basicPrice;
					//接受译员等级集合
					var translatorLevels=data.translatorLevels;
					//获取tr的所有对象
					var trs = $(".offer_tr")
					//删除之前的tr对象
						trs.remove();
					//创建tr对象
					var offer_tr = '<tr class="offer_tr">'+'</tr>'
					var offer_td = '<td class="offer_td">'+'</td>'
					  // 循环表格
					  for(var i=0;i<translatorLevels.length;i++){
					    $(".offer_table").append(offer_tr);
					    for(var j=0;j<4;j++){
					      $(".offer_tr").eq(i).append(offer_td);
					    }
					  }
					  //表格中遍历内容
					  $.each(translatorLevels, function(inx,obj){
						  if(inx==0){
					    $(".offer_tr").eq(inx).find(".offer_td:first-child").html(type)
					    }
					    $(".offer_tr").eq(inx).find(".offer_td:nth-child(2)").html(obj.level+"级")
					    $(".offer_tr").eq(inx).find(".offer_td:nth-child(3)").html((obj.level)*basicPrice)
					    $(".offer_tr").eq(inx).find(".offer_td:nth-child(4)").html((obj.level)*basicPrice*0.8)
					  })

					  // 在线询价  帮助内容显示 隐藏
					  //议员等级
					    $(".dengjihelp").hover(function(){
					      $(".help_text").show();
					    },function(){
					      var tdengji=setTimeout(function(){
					        $(".help_text").hide();
					      },1000)
					    })
					    //周期
					    $(".zhouqihelp").hover(function(){
					      $(".help_zhouqi_text").show();
					    },function(){
					      var tzhouqi=setTimeout(function(){
					        $(".help_zhouqi_text").hide();
					      },1000)
					    })

				}
				});
			
			
		})*/
		

		 $('.dropdown-toggle').click(function(){
			    $('.dropdown-toggle').dropdown()
			  })

			  $(".drop_need").click(function(){
			    $('.drop_need').dropdown()
			  })

			  // 在线询价  帮助内容显示 隐藏
			  //议员等级
			    $(".dengjihelp").hover(function(){
			      $(".help_text").show();
			    },function(){
			      var tdengji=setTimeout(function(){
			        $(".help_text").hide();
			      },1000)
			    })
			    //周期
			    $(".zhouqihelp").hover(function(){
			      $(".help_zhouqi_text").show();
			    },function(){
			      var tzhouqi=setTimeout(function(){
			        $(".help_zhouqi_text").hide();
			      },1000)
			    })




			    // 公告咨询活动
			    $(".news_list_right li[class=list-group-item]").hover(function(){
			      $(this).find("a").css("color","#8db5e3")
			    },function(){
			      $(this).find("a").css("color","#222")
			    })


			    // 循环翻译人员卡片
			    var cards_one = $(".index_linguister_card").html();
			    for(var i=0;i<45;i++){
			      $(".index_linguister_card").append(cards_one);
			    }


			 /* // 专利翻译精英循环，点击上下切换
			   var intshow
			    function cardShow(){
			      n=0;
			      intshow = setInterval(function(){
			        cardsnext()   //调用卡片循环播放方法
			        getTrans();
			      },60000)
			      
			    };

			    // 向上切换十张
			    $(".prev_cards").click(function(){
			    	getTrans();
			    	  $(".prev_cards").
			     $(".prev_cards").attr("disabled","true");

			     	getTrans();
			      clearInterval(intshow)

			      cardsprev()
			      $(".prev_cards").attr("disabled","false");
			    });

			    // 向下切换十张
			    $(".next_cards").click(function(){
			    	
			      $(".next_cards").attr("disabled","true");
			    	 getTrans();
			      clearInterval(intshow)
			      cardsnext()
			      $(".next_cards").attr("disabled","false");
			    });

//			    cardShow()
			    // 鼠标离开时 继续轮播

			    $(".next_cards").mouseleave(function(){

			      cardShow()
			    })
			    $(".prev_cards").mouseleave(function(){
			      cardShow()
			    })

			    // 卡片循环播放效果的方法
			    // 向下
			    function cardsnext(){
			      n+=10
			      for(var l=0;l<n;l++){ 
			        $(".append_card").eq(l).fadeOut();
			      }
			      if(n>=$(".cards_one").length){
			        n=0
			        $(".append_card").fadeIn();
			      }
			    }
			    // 向上
			    function cardsprev(){
			      n-=10
			      $(".append_card").fadeIn();
			      for(var l=0;l<n;l++){ 
			        $(".append_card").eq(l).fadeOut();
			      }
			      if(n<0){
			        n=$(".cards_one").length;
			       
			      }
			    }
*/



			    //  选他 数字加1
			    $(".append_card_btn01").click(function(){
			      parseInt($(this).find(".list_badge").text(parseInt($(this).find(".list_badge").text())+1))
			    })
                 
			    
			   


			    /*// 新译员 走马灯效果
			      $(function(){
			        var liWidth = $(".index_costumer_lits li").width()+65
			        var liLength = $(".index_costumer_lits li").length+1

			        var widths = liWidth*liLength

			        $(".index_costumer_lits").css({'width':widths})

			        var timesRun = 0;
			        
			        function start(){
			          ints = setInterval(function(){
			          
			          timesRun += 5
			          if(widths-timesRun < 1200){
			            timesRun =0

			          }
			          $(".index_costumer_lits").css({'position':'relative','left':-timesRun})

			        },70)
			        }
			      start();

			        $(".index_costumer_lits").hover(function(){
			          clearInterval(ints)
			        },function(){
			          start();
			        })

			      })
*/

			     /*  // 图片循环轮播
			       /*   $(document).ready(function () {
			        new ZouMa().Start();
			        });
			        function ZouMa() {	
			        this.maxLength = 5; //最低显示数   
			        this.Timer =2000;//计时器间隔时间
			        this.Ul = $(".box ul");
			        var handId;//计时器id
			        var self = this;
			        this.Start = function () {
			          if (self.Ul.children().length < this.maxLength) {
			          self.Ul.append(self.Ul.children().clone());
			          }
			          handId = setInterval(self.Play, self.Timer);
			        }
			        this.Play = function () {
			          var img = self.Ul.children().eq(0);
			          var left = img.children().eq(0).width();
			          img.animate({ "marginLeft": (-1 * left) + "px" }, 500, function () {
			          $(this).appendTo(self.Ul).css({"margin":"0 10px"});
			          });
			        }
			        }  */


			    // 优秀案例展示
			      //点击下一张
			    // var _index5=0;
			    // $(".four_flash .but_right img").click(function(){
			    // 	_index5++;
			    // 	var len=$(".flashBg ul.mobile li").length;
			    // 	if(_index5+5>len){
			    // 		$(".four_flash .flashBg ul.mobile").stop().append($("ul.mobile").html());
			    // 	}
			    // 	$(".four_flash .flashBg ul.mobile").stop().animate({left:-_index5*206},1000);
			    // });

			      //点击上一张
			    // $(".four_flash .but_left img").click(function(){
			    // 	if(_index5==0){
			    // 		$("ul.mobile").prepend($("ul.mobile").html());
			    // 		$("ul.mobile").css("left","-1380px");
			    // 		_index5=6
			    // 	}
			    // 	_index5--;
			    // 	$(".four_flash .flashBg ul.mobile").stop().animate({left:-_index5*206},1000);
			    // });
			        
			        getNeeds();
			        getTrans();
			        getCustomer();
			        /* setInterval(); */
});
    //新注册译员前台显示
       setInterval(function(){
   		//tianwenli修改开始
   		/* $.post("/index/indexAction_findTransRandow.do",
		    function(data) {
   			  if(data!=null){
			  var tstr = dateFormatter(new Date(data[0].registerTime));
			  if(tstr!=null){
			  var htm='<span id="Htime0">'+tstr.substring(11, 12)+'</span>&nbsp;<span id="Htime1">'+tstr.substring(12, 13)+'</span>&nbsp;&nbsp;<font size="5px">:</font>&nbsp;&nbsp;<span id="Mtime0">'+tstr.substring(14, 15)+'</span>&nbsp;<span id="Mtime1">'+tstr.substring(15, 16)+'</span><label style="width: 20px"></label><spring:message  code="恭喜"/>&nbsp;<font color="#1afa29"><b id="user">'+data[0].nickname+'</b></font>&nbsp;<spring:message  code="注册成功"/>';
			  $("#ddMarquee").html(htm);
			}
   			  }
   		},"json");	 */ 
   		//tianwenli修改jieshu
   		
   },3000); 
    //日期转换
     function dateFormatter(date){
		if(date != null){
			var y = date.getFullYear();
			var m = date.getMonth()+1;
			var d = date.getDate();
			var hh = date.getHours();
			var mm = date.getMinutes();
			var ss = date.getSeconds();
			return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d)+' '+(hh<10?('0'+hh):hh)+':'+(mm<10?('0'+mm):mm)+':'+(ss<10?('0'+ss):ss) ;
		}
	};     

	//页面加载完毕，查找符合条件客户
	/* function getCustomer(){
		$.post("/index/fundIndexCus.do",function(data){
			//alert(data.en.length);
			var customerCard="<div class='col-sm-6'>"+
            "<div class='first_brand_details'><br>";
           
            for(var i=0;i<2;i++){
            	 if(data.ch.length>i){
            		 customerCard+="<a href='"+data.ch[i].topCardURL+"' target='_blank'><img style='width:550px;height:80px;' src='/"+data.ch[i].headPortrait+"'/></a>"+
                     "<div style='height: 5px'></div>"
                 }
            }
            
            for(var i=2;i<4;i++){
            	if(data.ch.length>i){
            		customerCard+= "<a href='"+data.ch[i].topCardURL+"' target='_blank'><img style='width:275px;height:90px;' src='/"+data.ch[i].headPortrait+"'/></a> "
            	}
            }
            customerCard+"<div style='height: 5px'></div>";
           
            for(var i=4;i<8;i++){
            	 if(data.ch.length>i){
            		customerCard+="<a href='"+data.ch[i].topCardURL+"' target='_blank'><img style='width:137.5px;height:90px;' src='/"+data.ch[i].headPortrait+"'/></a> "
            	}
            }
			  
			
           customerCard+="</div>"+
          "</div>"+
          "<div class='col-sm-6' style='margin-left:620px;margin-top:-400px'>"+
            "<div class='first_brand_details'><br>"
          
          
        for(var i=0;i<2;i++){
        	if(data.en.length>i){
         		 customerCard+="<a href='"+data.en[i].topCardURL+"' target='_blank'><img style='width:550px;height:80px;' src='/"+data.en[i].headPortrait+"'/></a>"+
                  "<div style='height: 5px'></div>"
              }
         }
        
        for(var i=4;i<8;i++){
        	 if(data.en.length>i){
         		customerCard+= "<a href='"+data.en[i].topCardURL+"' target='_blank'><img style='width:275px;height:90px;' src='/"+data.en[i].headPortrait+"'/></a> "
         	}
         }
           customerCard+="<div style='height: 5px'></div>";
         
        
         for(var i=5;i<9;i++){
        	 if(data.en.length>i){
         		customerCard+="<a href='"+data.en[i].topCardURL+"' target='_blank'><img style='width:137.5px;height:90px;' src='/"+data.en[i].headPortrait+"'/></a> "
         	}
         }
			  customerCard+="</div>"+"</div>"
            
            $("#customerCard").append(customerCard);
		},'json');
	} */





//获取需求
 function getNeeds(obj) {
	var pagenum="";
	var language ="";
	//判断是否是点击事件进入
		
	if(obj!=null){
		//判断是否是选择语种给予赋值
		if($(obj).text()==""){
			//不是从选择语种进入则是翻页选项给予翻页初始值。
			pagenum = obj.getAttribute("title");
			language = $("#language").attr("title"); 
		}else{
			//从语种选择进入给予语言值
			language = $(obj).text();
			$("#language").prop("title",language);
		};
    	
	}

	$.ajax({
		type : "POST",
		url : "/index/indexAction_getNeeds.do?pageNum="+pagenum+"&language="+language,
		cache : false,
		dataType : "json",
		success : function(data) {
			var pic = "";
		var needs = data.needs;
		var count = data.page.totalCount;
		if(count==0){
			//layer.msg( '<spring:message  code="暂未查询到该语种需求"/>',{icon: 5});
		}
	    $("#count1").text(count+"");
			var prev=data.page.pageNum-1;
			var next=data.page.pageNum+1;
			if(next<=data.page.totalPage){

					$("#prev").prop("title",prev);
					$("#next").prop("title",next);
	
			}else{
				$("#prev").prop("title",prev);
			}
			if( prev<=0){
				$("#prev").prop("title",1);
			}
			$(".needers_cards").remove();
			   jQuery.i18n.properties({
				   name:'Messages', 
				        path:'/i18n/', 
				        mode:'both',
				   		language:lang,
				        checkAvailableLanguages: true,
				        async: true,
				        callback: function() { 
	    // 循环找需求卡片
	    for(var j=0;j<needs.length;j++){
	    	if(needs[j].cycle == "一般"){
	    		needs[j].cycle = "<font color='green'><spring:message  code='一般'/></font>"
	    	}
	    	else if(needs[j].cycle == "加急"){
	    		needs[j].cycle = "<font color='orange'><spring:message  code='加急'/></font>"
	    	}
	    	else if(needs[j].cycle == "特急"){
				needs[j].cycle = "<font color='red'><spring:message  code='特急'/></font>"
			}
			if(needs[j].languagePair=="英汉"){
				/* needs[j].languagePair=jQuery.i18n.prop("language1"); */
				needs[j].languagePair = "<spring:message  code='英汉'/>"
			}else if(needs[j].languagePair=="汉英"){
				/* needs[j].languagePair=jQuery.i18n.prop("language2"); */
				needs[j].languagePair = "<spring:message  code='汉英'/>"
			}else if(needs[j].languagePair=="日汉"){
				/* needs[j].languagePair=jQuery.i18n.prop("language3"); */
				needs[j].languagePair = "<spring:message  code='日汉'/>"
			}else if(needs[j].languagePair=="汉日"){
				/* needs[j].languagePair=jQuery.i18n.prop("language4"); */
				needs[j].languagePair = "<spring:message  code='汉日'/>"
			}else if(needs[j].languagePair=="韩汉"){
				/* needs[j].languagePair=jQuery.i18n.prop("language5"); */
				needs[j].languagePair = "<spring:message  code='韩汉'/>"
			}else if(needs[j].languagePair=="汉韩"){
				/* needs[j].languagePair=jQuery.i18n.prop("language6"); */
				needs[j].languagePair = "<spring:message  code='汉韩'/>"
			}else if(needs[j].languagePair=="徳汉"){
				/* needs[j].languagePair=jQuery.i18n.prop("language7"); */
				needs[j].languagePair = "<spring:message  code='徳汉'/>"
			}else if(needs[j].languagePair=="汉德"){
				/* needs[j].languagePair=jQuery.i18n.prop("language8"); */
				needs[j].languagePair = "<spring:message  code='汉德'/>"
			}else if(needs[j].languagePair=="法汉"){
				/* needs[j].languagePair=jQuery.i18n.prop("language9"); */
				needs[j].languagePair = "<spring:message  code='法汉'/>"
			}else if(needs[j].languagePair=="汉法"){
				/* needs[j].languagePair=jQuery.i18n.prop("language10"); */
				needs[j].languagePair = "<spring:message  code='汉法'/>"
			}
			if(needs[j].domainId==12){
				pic="/img/日常.jpg";
			}else if(needs[j].domainId==13){
				pic="/img/机械.jpg";
			}else if(needs[j].domainId==14){
				pic="/img/电子.jpg";
			}else if(needs[j].domainId==15){
				pic="/img/电器.jpg";
			}else if(needs[j].domainId==16){
				pic="/img/机电.jpg";
			}else if(needs[j].domainId==17){
				pic="/img/自动化.jpg";
			}else if(needs[j].domainId==18){
				pic="/img/计算机.jpg";
			}else if(needs[j].domainId==19){
				pic="/img/通信.jpg";
			}else if(needs[j].domainId==20){
				pic="/img/网络.jpg";
			}else if(needs[j].domainId==21){
				pic="/img/物理.jpg";
			}else if(needs[j].domainId==22){
				pic="/img/化学.jpg";
			}else if(needs[j].domainId==23){
				pic="/img/化工.jpg";
			}else if(needs[j].domainId==24){
				pic="/img/医药.jpg";
			}else if(needs[j].domainId==25){
				pic="/img/生化.jpg";
			}
		    var needers_cards = "<div class='needers_cards' style='border-radius:10px;'>"+
		    "<div class='needers_cards_title'>"+
		    "<h5 align='center'>"+needs[j].title+"</h5>"+
		    "</div>"+
		    "<div class='needers_cards_content'>"+
		    "<div class='needers_cards_content_left pull-left'>"+
		    "<img src='"+pic+"' alt='' style='width:80px;height:115px;'>"+
		    "<a href='/cilentCustomer/lookPublishNeedById.do?id="+needs[j].id+"'><spring:message  code='查看详情'/></a>"+
		    "</div>"+
		    "<div class='needers_cards_content_right pull-right'>"+
		    "<p><span><font color='#E63F00'>￥</font><font color='#E63F00' size='4px'>"+needs[j].totalMoney+"</font></span></p>"+
		    "<p><span><spring:message code='"+needs[j].languagePair+"'/></span></p>"+
		    "<p><span><font color='blue'>"+needs[j].length+"</font><spring:message  code='字'/></span><span>"+needs[j].cycle+"</span></p>"+
		    "<p><span><spring:message  code='截止日：'/></span><span>"+needs[j].completeTime.substring(0,10);+"</span></p>"+
		    "</div></div></div>";
		    $(".index_needers_card").append(needers_cards);
	    	}


			
			}
		});
	    	}
	});
} 

	//获取译员总人数
		function getCount() {
		var language = $("#language1 option:selected").attr("title");
		var domain = $("#field option:selected").attr("title");
		var level = $("#translatorLevel option:selected").attr("title");
		//创建人员总数信息
		var count = 0
		//创建价格信息
		var money = 0
		//获取当前选择的领域系数
		var field = $("#field").val();

		//获取当前选择的周期系数
		var schedule = $("#schedule").val();

		//获取当前选择的译员等级系数
		
		var translatorLevel = $("#translatorLevel").val();

		//获取当前语言种类基础价格
		var basicPrice = $("#language1").val();
		//获取流程信息
		var flow = $("#flow").val();
		//未选择验证
		if(basicPrice!="" && field!="" && flow!="" && translatorLevel!="" &&  schedule!=""){	

		
			//添加流程算法并展示价格信息
		if(flow=="仅翻译"){
			money = basicPrice*field*translatorLevel*schedule;
			money = money + "";
			if(money.length>6){
				money = money.substr(0,money.indexOf(".")+3);
			}
			$("#money").text(money);
			$("#omoney").show();
		}
		else if(flow=="翻译校对"){
			money = (basicPrice*field*translatorLevel*schedule)+((basicPrice*field*schedule)*0.5)/translatorLevel;
			money = money + "";
			if(money.length>6){
				money = money.substr(0,money.indexOf(".")+3);
			}
			$("#money").text(money);
			$("#omoney").show();
		}else if(flow=="翻译校对审核"){
			money = (basicPrice*field*translatorLevel*schedule)+(((basicPrice*field*schedule)*0.5)/translatorLevel)+((basicPrice*field*schedule)*0.5);
			money = money + "";
			if(money.length>6){
				money = money.substr(0,money.indexOf(".")+3);
			}
			$("#money").text(money);
			$("#omoney").show();
		}
		}
		$.ajax({
			type : "POST",
			url : "/onlineQuery/onlineQueryAction_getCount.do",
			data :"language="+language+"&domain="+domain+"&level="+level,
			cache : false,
			dataType : "json",
			success : function(data) {
				var count = data.count;
				$("#count").html(count);
				$("#ocount").show();
			}
			});
			
		}
		//译员卡片展示
		function getTrans(obj){
			 var lang = "${language}"
			    	if(lang==""){
			    		lang="zh";
			    	}
			var pageNum="";
			var tranLanguage ="";
			//判断是否是点击事件进入
			if(obj!=null){
				//判断是否是选择语种给予赋值
				if($(obj).text()==""){
					//不是从选择语种进入则是翻页选项给予翻页初始值。
					pageNum = obj.getAttribute("title");
					tranLanguage = $("#tranLanguage").attr("title"); 
				}else{
					//从语种选择进入给予语言值
					tranLanguage = $(obj).text();
					$("#tranLanguage").prop("title",tranLanguage);
				}
			}
    		 jQuery.i18n.properties({
			        name:'Messages', 
			        path:'/i18n/', 
			        mode:'both',
			   		language:lang,
			        checkAvailableLanguages: true,
			        async: true,
			        callback: function() {	
			$.post("/index/indexAction_queryTrans.do","pageNum="+pageNum+"&language="+tranLanguage,function(data){
				var trans=data.translatorList;
				var transCount=data.page.totalCount;
				if(transCount==0){
					//layer.msg( '<spring:message  code="暂未查询到该语种的译员"/>',{icon: 5});
				}
				$("#transCount").text(transCount+"");
				var last=data.page.pageNum-1;
				var nexts=data.page.pageNum+1;
				if(nexts<=data.page.totalPage){
				    $("#last").prop("title",last);
					$("#nexts").prop("title",nexts);
				}else{
					$("#last").prop("title",last);
				}
				if(last<=0){
					$("#last").prop("title",1);
				}
				var languages="";
				var userUrl="";
				var clientid="${clientid}";
				$(".append_card").remove();
				
				for(var i=0;i<trans.length;i++){
					if(trans[i].language=='EN'){
				    	languages="<spring:message  code='英语'/>";
				    } 
				    if(trans[i].language=="JP"){
				    	languages="<spring:message  code='日语'/>";
				    }
				    if(trans[i].language=="KOR"){
				    	languages="<spring:message  code='韩语'/>";
				    }
				    if(trans[i].language=="FR"){
				    	languages="<spring:message  code='法语'/>";
				    }
				    if(trans[i].language=="GER"){
				    	languages="<spring:message  code='德语'/>";
				    }

				    //alert(trans[i].domain);
				   	//领域格式------》 机械,日常,电子,自动化
				   	var domainCard=trans[i].domain.split(",");
				   	//alert(domainCard[0])
				   	for(var z=0;z<domainCard.length;z++){
				   		if(domainCard[z]=='日常'){
				   			domainCard[z]="<spring:message  code='日常'/>"
		  				}else if(domainCard[z]=='机械'){
		  					domainCard[z]="<spring:message  code='机械'/>"
		  				}else if(domainCard[z]=='电子'){
		  					domainCard[z]="<spring:message  code='电子'/>"
		  				}else if(domainCard[z]=='电器'){
		  					domainCard[z]="<spring:message  code='电器'/>"
		  				}else if(domainCard[z]=='机电'){
		  					domainCard[z]="<spring:message  code='机电'/>"
		  				}else if(domainCard[z]=='自动化'){
		  					domainCard[z]="<spring:message  code='自动化'/>"
		  				}else if(domainCard[z]=='计算机'){
		  					domainCard[z]="<spring:message  code='计算机'/>"
		  				}else if(domainCard[z]=='通信'){
		  					domainCard[z]="<spring:message  code='通信'/>"
		  				}else if(domainCard[z]=='网络'){
		  					domainCard[z]="<spring:message  code='网络'/>"
		  				}else if(domainCard[z]=='物理'){
		  					domainCard[z]="<spring:message  code='物理'/>"
		  				}else if(domainCard[z]=='化学'){
		  					domainCard[z]="<spring:message  code='化学'/>"
		  				}else if(domainCard[z]=='化工'){
		  					domainCard[z]="<spring:message  code='化工'/>"
		  				}else if(domainCard[z]=='医药'){
		  					domainCard[z]="<spring:message  code='医药'/>"
		  				}else if(domainCard[z]=='生化'){
		  					domainCard[z]="<spring:message  code='生化'/>"
		  				}
				   	}
				   	
				   	var b = domainCard.join("，");
				   	/* alert(b); */
				    if(b!=null && b!=""){
				    	if(b.length >6){
					    	b= b.slice(0,5)+"...";
					    }
				    }
				    if(trans[i].level == 1){
				    	trans[i].level = "<font size='4px' color='#888888'><b>★</b></font>"
				    }else if(trans[i].level == 2){
				    	trans[i].level = "<font size='4px' color='#00AAAA'><b>★★</b></font>"
				    }else if(trans[i].level == 3){
				    	trans[i].level = "<font size='4px' color='#00AA00'><b>★★★</b></font>"
				    }else if(trans[i].level == 4){
				    	trans[i].level = "<font size='4px' color='	#FFBB00'><b>★★★★</b></font>"
				    }else if(trans[i].level == 5){
				    	trans[i].level = "<font size='4px' color='	#FF0000'><b>★★★★★</b></font>"
				    }
				    if(trans[i].userUrl=='' ||trans[i].userUrl==null){
				    	userUrl="/img/tuxiang.jpg";
				    }else{
				    	userUrl=trans[i].userUrl;
				    }
				    var str ="";
				    if(clientid!='' || clientid!="" ){ 
				    	str="<a href='/cilentCustomer/transInfo.do?id="+trans[i].id+"'  class='append_card_btn01'>"+"<spring:message  code='选TA'/>"+"</span>"+"</a>"
				    	/*str="<a href='/translator/translatorAction_findTransById.do?transId="+trans[i].id+"'  class='append_card_btn01'>"+"<spring:message  code='选TA'/>"+"</span>"+"</a>"
				    	 str="<a href='javaScript:void(0);' onclick='findTransQuotation("+trans[i].id+")方法不存在'   class='append_card_btn01'>"+"<spring:message  code='选'/>TA"+"</span>"+"</a>" */
				    }else{
				    	str="<a href='javaScript:void(0);' onclick='findClient()' class='append_card_btn01'>"+"<spring:message  code='选TA'/>"+"</span>"+"</a>"
				    }
				    if(trans[i].majorTotals!=null){
				    	 transMajor="<p>"+"<spring:message  code='翻译经验：'/>"+trans[i].majorTotals+"<span>"+"</span>"+"字"+"</p>"
				    }else{
				    	transMajor="<p>"+"<spring:message  code='翻译经验：'/>暂无"+"<span>"+"</span>"+"</p>"
				    }
				    if(trans[i].prooTotals!=null){
				       transProo="<p>"+"<spring:message  code='校对经验：'/>"+trans[i].prooTotals+"<span>"+"</span>"+"字"+"</p>"
				    }else{
				       transProo="<p>"+"<spring:message  code='校对经验：'/>暂无"+"<span>"+"</span>"+"</p>"
				    }
				    if(trans[i].degree=="大专"){
				    	degree="<spring:message  code='大专'/>";
				    }
				    if(trans[i].degree=="本科"){
				    	degree="<spring:message  code='本科'/>";
				    }
				    if(trans[i].degree=="研究生"){
				    	degree="<spring:message  code='本科'/>";
				    }
				    if(trans[i].degree=="硕士"){
				    	degree="<spring:message  code='硕士'/>";
				    }
				    if(trans[i].degree=="博士"){
				    	degree="<spring:message  code='博士'/>";
				    }
				   var checkTrans="/forwardAction/forward_toPublishNeed.do";
				   var transCard="<div class='append_card' >"+
				    "<div style='border-radius:10px;' class='cards_one text-right fl' id='gradients'>"+
				    /*"<span class='cards_title'>推荐译员</span>"+*/
				    "<p style='width:195px;margin-left:20px;text-align: left;'>"+"<span style='width:195px;' class='card_name' id='nickname'><font color='#000088'>"+trans[i].nickname+"</font></span>"+"</p>"+
				    "<img class='card_img' src='"+userUrl+"' alt='' width='80' height='90' >"+"<br>"+
				    "<p hidden=''>"+"<span id='transId'>"+"</span>"+"</p>"+"<p>"+
				    "<span id='level'>"+trans[i].level+"</span>"+"</p>"+"<p>"+
				    "<span id='languages'>"+languages+"</span>"+"</p>"+"<p>"+
				    "<span id='degree'>"+degree+"</span>"+"</p>"+
				    "<div class='texts_left'>"+
				    "<p style='padding-top:10px'>"+"<spring:message  code='专业领域：'/>"+"<span id='trandomain'>"+b+"</span>"+"</p>"+
				    transMajor+transProo+
				    "</div>"+"<div class='append_card_btn'>"+str+
				    "<a href='/translator/translatorAction_findTransById.do?transId="+trans[i].id+"' class='append_card_btn02' id='lookTrans' >"+"<spring:message  code='详情'/>"+"</a>"+"</div>"+
				    "</div>"+
				    "</div>"
				    $(".index_linguister_card").append(transCard);
		     }
		    
			},"json");	
			        }
    		 })	
			
		}	
       
       
  //页面加载完毕，查找符合条件客户
	function getCustomer(){
	  
		$.post("/index/getUserShow.do",function(data){
		  	var div1 = $("#first_brand_details1");
		  	var div2 = $("#first_brand_details2");
		  	for (var i = 0; i < 24; i++) {
		  		if(i < 12){
		  			if(data[i].url != null && data[i].url != ''){
		  				div1.append("<div class='icon'><a href='"+data[i].web+"'><img width='100%' height='100%' style='border-radius:5px;background-color:#fff' src='"+data[i].url+"'></a><div>");
		  			}else{
		  				div1.append("<div class='icon' style='background-color:#fff'><a href='"+data[i].web+"'><img width='70%' height='70%' style='border-radius:5px;margin-top:10%;' src='/img/champion.png'></a><div>");
		  			}
		  		}else{
		  			if(data[i].url != null && data[i].url != ''){
		  				div2.append("<div class='icon'><a href='"+data[i].web+"'><img width='100%' height='100%' style='border-radius:5px;background-color:#fff' src='"+data[i].url+"'></a><div>");
		  			}else{
		  				div2.append("<div class='icon' style='background-color:#fff'><a href='"+data[i].web+"'><img width='70%' height='70%' style='border-radius:5px;margin-top:10%;' src='/img/champion.png'></a><div>");
		  			}
		  		}
		  	}
	  	});
	  
		/* $.post("/index/fundIndexCus.do",function(data){
			var customerCard="<div class='col-sm-6'>"+
            "<div class='first_brand_details'><br>";
           
            for(var i=0;i<1;i++){
            	 if(data.ch.length>i){
            		 customerCard+="<a href='"+data.ch[i].topCardURL+"' target='_blank'><img style='width:550px;height:80px;' src='/"+data.ch[i].headPortrait+"'/></a>"+
                     "<div style='height: 5px'></div>"
                 }
            }
            
            for(var i=1;i<5;i++){
            	if(data.ch.length>i){
            		customerCard+= "<a href='"+data.ch[i].topCardURL+"' target='_blank'><img style='width:275px;height:90px;' src='/"+data.ch[i].headPortrait+"'/></a> "
            	}
            }
            customerCard+="<div style='height: 5px'></div>";
           
            for(var i=5;i<9;i++){
            	 if(data.ch.length>i){
            		customerCard+="<a href='"+data.ch[i].topCardURL+"' target='_blank'><img style='width:135.25px;height:90px;' src='/"+data.ch[i].headPortrait+"'/></a> "
            	}
            }
			  
			
           customerCard+="</div>"+
          "</div>"+
          "<div class='col-sm-6' style='margin-left:620px;margin-top:-400px'>"+
            "<div class='first_brand_details'><br>"
          
          
        for(var i=0;i<1;i++){
        	if(data.en.length>i){
         		 customerCard+="<a href='"+data.en[i].topCardURL+"' target='_blank'><img style='width:550px;height:80px;' src='/"+data.en[i].headPortrait+"'/></a>"+
                  "<div style='height: 5px'></div>"
              }
         }
        
         for(var i=1;i<5;i++){
        	 if(data.en.length>i){
         		customerCard+= "<a href='"+data.en[i].topCardURL+"' target='_blank'><img style='width:275px;height:90px;' src='/"+data.en[i].headPortrait+"'/></a> "
         	}
         }
           customerCard+="<div style='height: 5px'></div>";
         
        
         for(var i=5;i<9;i++){
        	 if(data.en.length>i){
         		customerCard+="<a href='"+data.en[i].topCardURL+"' target='_blank'><img style='width:135.25px;height:90px;' src='/"+data.en[i].headPortrait+"'/></a> "
         	}
         }
			  customerCard+="</div>"+"</div>"
            
            $("#customerCard").append(customerCard);
		},'json'); */
	}
	 
     function findrole(){
 		var countClient="${clientid}";
 		if(countClient!=null && countClient!=''){ 
 			$("#usercenter").prop("href","/cilentCustomer/findUI.do");
 		}else{
 			$("#usercenter").prop("href","/translator/translatorAction_findTrans.do");
 		}
 	}	
     jQuery.i18n.properties({
		   name:'Messages', 
		        path:'/i18n/', 
		        mode:'both',
		   		language:lang,
		        checkAvailableLanguages: true,
		        async: true,
		        callback: function() { 
     	var message = "${message }";
	    var successs="${successs}";
	    if(successs.trim().length != 0 ){
			
			//layer.msg(jQuery.i18n.prop(successs), {icon: 1});
		}
	if(message.trim().length != 0 ){
		
		//layer.msg(jQuery.i18n.prop(message), {icon: 5});
	}
        var success="${success}";
        if(success.trim().length != 0 ){
    		
    		//layer.msg(jQuery.i18n.prop(success), {icon: 1});
    	}
		        }
	   });
      //头标签效果显示  开始
        $(document).ready(function(){
            $(".navbg").capacityFixed();
            $("#navul > li").not(".navhome").hover(function(){
              $(this).addClass("navmoon");
            },function(){
              $(this).removeClass("navmoon");
            });
          })

          $.fn.capacityFixed = function(options) {
                var opts = $.extend({},$.fn.capacityFixed.deflunt,options);
                var FixedFun = function(element) {
                    var top = opts.top;
                    element.css({
                        "top":top
                    });
                    element.find(".close-ico").click(function(event){
                        element.remove();
                        event.preventDefault();
                    })
                };
                return $(this).each(function() {
                    FixedFun($(this));
                });
            };
            $.fn.capacityFixed.deflunt={
        		right : 0,//相对于页面宽度的右边定位
                top:95
        	};
          //头标签效果显示 结束
      //根据当前用户身份判断是否可以进行选择译员操作   
       function findClient(){
    	   //layer.msg( '<spring:message  code="您不是客户，不能进行选定译员操作！"/>',{icon: 5});
    	   alert('<spring:message  code="您不是客户，不能进行选定译员操作！"/>');
       }
     //快速发布需求的点击事件
		function publish(){

			var language = $("#language1 option:selected").attr("title");
			var domain = $("#field option:selected").attr("title");
			var level = $("#translatorLevel option:selected").attr("title");
			var procedure = $("#flow option:selected").val();
			var cycle = $("#schedule option:selected").attr("title");
			if(language!="" && domain !="" && level != "0" && procedure!="" && cycle!=""){
				var url = "/cilentCustomer/publishNeed.do?language="+language+"&domain="+domain+"&level="+level+"&procedure="+procedure+"&cycle="+cycle;
				window.open(url);
			}else{
				/* layer.open({
					  title: '<spring:message  code="提示"/> '
					  ,content: '<spring:message  code="需填写完善询价信息才能进行快速发布！"/>'
					}); */
				alert('<spring:message  code="需填写完善询价信息才能进行快速发布！"/>');
			} 
		}
     function queryByInterpreter() {
    	 
    	 var nickName=$("#nickName").val();
    	 if(nickName!="" && nickName!="null" && nickName!=undefined){
    		 url="/translator/translatorAction_getTotalCount.do?msg="+nickName;
 			window.open(url);
    	 }else{
    		 //layer.msg('<spring:message  code="译员名不能为空！"/>', {icon: 2});
    		 alert("<spring:message  code='译员名不能为空！'/>");
    	 }
		
	}
      function overShowLevel() {  
         var showDiv = document.getElementById('showDivLevel');  
         showDiv.style.display = 'block';  
         showDiv.innerHTML = "<spring:message  code='三级：三年相关技术领域翻译经验、通过爱译社考核'/><br />"+
             "<spring:message  code='四级：五年相关技术领域翻译经验、通过爱译社考核'/><br />"+
             "<spring:message  code='五级：十年相关技术领域翻译经验、通过爱译社考核'/>";  
     } 
 	function outHideLevel() {  
         var showDiv = document.getElementById('showDivLevel');  
         showDiv.style.display = 'none';  
         showDiv.innerHTML = '';  
     } 
 	
 	function overShowCircle() {  
         var showDiv = document.getElementById('showDivCircle');  
         showDiv.style.display = 'block';  
         showDiv.innerHTML = "<spring:message  code='一般情况：3000字/天(翻译)、6000字/天(校对)、8000字/天(审核)'/>"+"<br/>"+
             "<spring:message  code='加急情况：4000字/天(翻译)、8000字/天(校对)、10000字/天(审核)'/>"+"<br/>"+
             "<spring:message  code='特急情况：5000字/天(翻译)、10000字/天(校对)、15000字/天(审核)'/>";  
     } 
 	function outHideCircle() {  
         var showDiv = document.getElementById('showDivCircle');  
         showDiv.style.display = 'none';  
         showDiv.innerHTML = '';  
     }
 	
 	//软件费用说明
 	function overShowSoft() {  
        var showDiv = document.getElementById('showDivSoft');  
        showDiv.style.display = 'block';  
        showDiv.innerHTML = "<spring:message  code='免费试用30天，每年仅需人民币980元，更多优惠请咨询客服！'/>"; 
    } 
	function outHideSoft() {  
        var showDiv = document.getElementById('showDivSoft');  
        showDiv.style.display = 'none';  
        showDiv.innerHTML = '';  
    } 
	
	
    /*  function overShowLevel() {  
         var showDiv = document.getElementById('showDivLevel');  
         showDiv.style.display = 'block';  
         showDiv.innerHTML = "<spring:message  code='三级：三年相关技术领域翻译经验、通过爱译社考核'/><br />"+
             "<spring:message  code='四级：五年相关技术领域翻译经验、通过爱译社考核'/><br />"+
             "<spring:message  code='五级：十年相关技术领域翻译经验、通过爱译社考核'/>";  
     } 
 	function outHideLevel() {  
         var showDiv = document.getElementById('showDivLevel');  
         showDiv.style.display = 'none';  
         showDiv.innerHTML = '';  
     } 
 	
 	function overShowCircle() {  
         var showDiv = document.getElementById('showDivCircle');  
         showDiv.style.display = 'block';  
         showDiv.innerHTML = "<spring:message  code='一般情况：3000字/天(翻译)、6000字/天(校对)、8000字/天(审核)'/><br />"+
             "<spring:message  code='加急情况：4000字/天(翻译)、8000字/天(校对)、10000字/天(审核)'/><br />"+
             "<spring:message  code='特急情况：5000字/天(翻译)、10000字/天(校对)、15000字/天(审核)'/>";  
     } 
 	function outHideCircle() {  
         var showDiv = document.getElementById('showDivCircle');  
         showDiv.style.display = 'none';  
         showDiv.innerHTML = '';  
     }
     
     function overShowLevel() {  
         var showDiv = document.getElementById('showDivLevel');  
         showDiv.style.display = 'block';  
         showDiv.innerHTML = "<spring:message  code='三级：三年相关技术领域翻译经验、通过爱译社考核'/><br />"+
             "<spring:message  code='四级：五年相关技术领域翻译经验、通过爱译社考核'/><br />"+
             "<spring:message  code='五级：十年相关技术领域翻译经验、通过爱译社考核'/>";  
     } 
 	function outHideLevel() {  
         var showDiv = document.getElementById('showDivLevel');  
         showDiv.style.display = 'none';  
         showDiv.innerHTML = '';  
     } 
 	
 	function overShowCircle() {  
         var showDiv = document.getElementById('showDivCircle');  
         showDiv.style.display = 'block';  
         showDiv.innerHTML = "<spring:message  code='一般情况：3000字/天(翻译)、6000字/天(校对)、8000字/天(审核)'/><br />"+
             "<spring:message  code='加急情况：4000字/天(翻译)、8000字/天(校对)、10000字/天(审核)'/><br />"+
             "<spring:message  code='特急情况：5000字/天(翻译)、10000字/天(校对)、15000字/天(审核)'/>";  
     } 
 	function outHideCircle() {  
         var showDiv = document.getElementById('showDivCircle');  
         showDiv.style.display = 'none';  
         showDiv.innerHTML = '';  
     } */
     </script>
 	 
    <style>
      .box
      {
      width: 1200px;
      height: 200px;
      overflow: hidden;
      }
      .box img
      {
      width:175px;
      border-style: none;
      height: 210px;
      }
      .box ul
      {
      margin: 0px;
      padding: 0px;
      list-style-type: none;
      }
      .box ul li
      {
        margin:0 10px;
        float: left;
      }
      .btn11 {
      	height:34px;
      	width:50%;
      	border-radius: 4px;
	    background-color: white;
	    color: #1b6d85;
	    border: 2px solid #5bc0de; /* #5bc0de */
	  }
	  .btn11:hover {
      	border-radius: 4px;
	    background-color: #5bc0de;
	    color: white;
	    border: 2px solid #5bc0de; /* #5bc0de */
	  }
	  #gradient{
	    background: -moz-linear-gradient(top, #08A5E0 10%, #000099 100%);
	    background: -webkit-gradient(linear, left top, left bottom, color-stop(10%,#08A5E0), color-stop(100%,#000099));
	    background: -webkit-linear-gradient(top, #08A5E0 10%,#000099 100%);
	    background: -o-linear-gradient(top, #08A5E0 10%,#000099 100%);
	    background: -ms-linear-gradient(top, #08A5E0 10%,#000099 100%);
	    background: linear-gradient(to bottom, #08A5E0 10%,#000099 100%);
	  }
	/*   #gradients{
	    background: -moz-linear-gradient(top, #ffffff 70%, #87CEFA 30%);
	    background: -webkit-gradient(linear, left top, left bottom, color-stop(70%,#ffffff), color-stop(30%,#87CEFA));
	    background: -webkit-linear-gradient(top, #ffffff 70%,#87CEFA 30%);
	    background: -o-linear-gradient(top, #ffffff 70%,#87CEFA 30%);
	    background: -ms-linear-gradient(top, #ffffff 70%,#87CEFA 30%);
	    background: linear-gradient(to bottom, #ffffff 70%,#87CEFA 30%);
	  } */
    </style>
  </head>
  <body>
   <!--      头标签开始      -->
  	<c:if test="${clientid.id!=null || transid.id!=null }">
  	<div class="publickNav">
  		<div class="public_nav"> 
           <nav class="container" style="padding:0 20px;"> 
           <div class="navbar-left"><a href="?lang=zh_CN" class="navbar-link" onclick="in18(this)">中文</a> | <a href="?lang=en_US" class="navbar-link" onclick="in18(this)">English</a></div><a style="padding-left:50px;" href="/forwardAction/forward_toIndex.do"><spring:message  code='首页'/></a>
           <a style="padding-left:50px;"><spring:message  code='帮助热线：'/>010-82895385</a><a style="padding-left:50px;" target="_blank" href="http://www.aitrans.org:8081/"><spring:message  code='爱译社'/></a>
           <div class="navbar-right"> 
           <ul class="list-inline nav_lists" id="ulMess">
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
        			<li style="color:#FFF"><a href="/forwardAction/forward_toLoginFromClient.do"><spring:message  code='客户中心'/></a></li>
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
                   
      <!--  头标签结束 -->
      <!--     全部需求 开始      -->
      <!-- <div class="index_all_need dropdown"></div> -->

      <!--     轮播 开始      -->
      <div class="index_carousel row" style="margin-top:30px;">
        <div class="index_carousel_left col-sm-8">
          <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
          </ol>
         
          <!-- Wrapper for slides -->
          <div class="carousel-inner" role="listbox">
            <div class="item active">
              <a href="/forwardAction/forward_toTeam.do"><img src="/img/index1.jpg" alt="..."></a>
            </div>
            <div class="item">
              <a href="/forwardAction/forward_toCustomerInstructions.do"><img src="/img/index2.jpg" alt="..."></a>
            </div>
            <div class="item">
              <a href="/forwardAction/forward_toInterpreterTips.do"><img src="/img/index3.jpg"  alt="..."></a>
            </div>
            <div class="item">
              <a href="/forwardAction/forward_toFunction.do"><img src="/img/index4.jpg" alt="..."></a>
            </div>
          </div>
          <!-- Controls -->
          <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <i class="fa fa fa-angle-left glyphicon-chevron-left" aria-hidden="true"></i>
          </a>
          <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <i class="fa fa fa-angle-right glyphicon-chevron-right" aria-hidden="true"></i>
          </a>
        </div>
        </div>
        <div class="index_carousel_right col-sm-4" style="margin-top:0px;">
              <div class="form_inquiry">
                <form class="form-horizontal" action="" method="post">
                <div class="form-group" style="height:15px;text-align: center;color:#CC0000;"><b><spring:message  code='在线询价'/></b></div>
                  <div class="form-group" style="height:34px;">
                    <p class="col-sm-3 control-label" style="padding-top:0px;"><spring:message  code='语种'/></p>
                    <div class="col-sm-8">
                      <select style="height:34px;font-size:13px;" class="form-control" id="language1" onchange="getCount()" style="">
                  		<option title="" value="" >-- <spring:message  code='请选择语种'/> --</option>
                	  </select>
                    </div>
                  </div>
                  <div class="form-group" style="height:34px;">
                    <p class="col-sm-3 control-label" style="padding-top:0px;"><spring:message  code='翻译领域'/> </p>
                    <div class="col-sm-8">
                         <select style="height:34px;font-size:13px;" class="form-control" id="field" onchange="getCount()" style="">
                  			<option title=""  value="">-- <spring:message  code='请选择翻译领域'/> --</option>
                		</select>
                    </div>
                  </div>
                  <div class="form-group" style="height:34px;">
                    <p class="col-sm-3 control-label" style="padding-top:0px;"><spring:message  code='流程类型'/></p>
                    <div class="col-sm-8">
                        <select style="height:34px;font-size:13px;" class="form-control" name="" id="flow"  style="" onchange="getCount()">
                  <option value="">-- <spring:message  code='请选择翻译流程'/> --</option>
                  <option value="仅翻译"><spring:message  code='仅翻译'/></option>
                  <option value="翻译校对"><spring:message  code='翻译+校对'/></option>
                  <option value="翻译校对审核"><spring:message  code='翻译+校对+审核'/></option>
                </select>
                    </div>
                  </div>
                  <div class="form-group" style="height:34px;">
                    <p class="col-sm-3 control-label" style="padding-top:0px;"><spring:message  code='译员等级'/></p>
                    <div class="col-sm-8">
                      <select style="height:34px;font-size:13px;" class="form-control" name="" id="translatorLevel" onchange="getCount()" style="">
                		<option title="0" value="" >-- <spring:message  code='请选译员等级'/> --</option>
                	</select>
                    </div>
                    <label  class="col-sm-1" style="text-align: left;padding:5px 0 0 0;"><a href="javascript:;" onmouseover="overShowLevel()" onmouseout="outHideLevel()"><font color="red"><b>?</b></font></a></label>
                    <%-- <a class="questions" style="position:relative;padding-top:5px;"  href="javascript:;">
                      <i class="fa fa-question dengjihelp" aria-hidden="true"></i>
                      <span class="help_text" >
                        <spring:message  code='三级：三年相关技术领域翻译经验、通过爱译社考核'/><br />
                        <spring:message  code='四级：五年相关技术领域翻译经验、通过爱译社考核'/><br />
                        <spring:message  code='五级：十年相关技术领域翻译经验、通过爱译社考核'/>
                      </span>
                    </a> --%>
                  </div>
                  <div id="showDivLevel" style="font-size:15px;color:white;z-index: 999;display:none;position: absolute; background-color: #08A5E0; border: 1px solid #08A5E0;width:400px;;text-align: center;border-radius:5px;padding:10px;"></div>
                  <div class="form-group" style="height:34px;">
                    <p class="col-sm-3 control-label" style="padding-top:0px;"><spring:message  code='周期'/></p>
                    <div class="col-sm-8">
                      <select style="height:34px;font-size:13px;" class="form-control" name="" id="schedule"  style="" onchange="getCount()">
                		<option value="">-- <spring:message  code='请选择翻译周期'/> --</option>
                	</select>
                    </div>
                    <label  class="col-sm-1" style="text-align: left;padding:5px 0 0 0;"><a href="javascript:;" onmouseover="overShowCircle()" onmouseout="outHideCircle()"><font color="red"><b>?</b></font></a></label>
                    <%-- <a class="questions" href="javascript:;" style="position:relative;padding-top:5px;">
                      <i class="fa fa-question zhouqihelp" aria-hidden="true"></i>
                      <span class="help_zhouqi_text" >
                        <spring:message  code='一般情况：流程处理时间1天、3000字/天(翻译)、6000字/天(校对)、8000字/天(审核)'/><br />
                        <spring:message  code='加急情况：流程处理时间1天、4000字/天（翻译）、8000字/天（校对）、10000字/天（审核）'/><br />
                        <spring:message  code='特急情况：5000字/天（翻译）、10000字/天（校对）、15000字/天（审核）'/>
                      </span>
                    </a> --%>
                  </div>
                  <div id="showDivCircle" style="color:white;z-index: 999;display:none;position: absolute; background-color: #08A5E0; border: 1px solid #08A5E0;width:450px;;text-align: left;border-radius:5px;padding:10px;"></div>
                  <div class="online_inquiry_search" style="height: 34px;">
                    <div class="row">

                      <span class="online_inquiry_people" id="ocount" style="width: 200px;font-size:15px;display: none;margin-left: 60px;text-align: center;"><spring:message  code='可选译员'/>&nbsp;<span id="count" style="color: red"></span>&nbsp;<spring:message  code='人'/></span>
                      <span class="online_inquiry_money"  id="omoney" style="width: 200px;font-size:15px;display: none;margin-left: 30px;text-align: center;"><spring:message  code='约合'/>&nbsp;:<span ><font id="money" color="#FF0000"></font></span>&nbsp;<spring:message  code='(元/千字)'/></span>

                    </div>
                  </div>
                  <div class="form-group" style="height:34px;" >
                    <div class="col-sm-12" style="text-align: center;">
                     <!-- <a href="javascript:void(0)" class="btn btn-info text-red" onclick="publish();">快速发布</a> -->
                     <c:if test="${transid.id==null || transid.id=='' }">
                     	<input type="button" class="btn11" onclick="publish();"  value="<spring:message  code='快速发布'/>">
                     </c:if>

                    </div>
                  </div>
                </form>
              </div>
            </div>
        <%-- <div class="index_carousel_right col-sm-4">
          <div class="news_lists">
            <table class="table-bordered" id="article">
             <tr>
                <td colspan="3" style="text-align:right;"><a href="/article/articleAction_getNoticeTotalCount.do" style="color:#8db5e3;"><spring:message  code='更多'/> >></a></td>
              </tr>
            </table>
          </div>
                  
          <div class="advert_pic">
            <a href="/forwardAction/forward_toHelp.do"><img src="/img/index9.jpg" alt="" ></a>
          </div>
          </div>  --%>

      
      </div>
      <!--     轮播 结束      -->

      <!--  在线询价 在线咨询  开始  -->
        <!-- 在线询价 -->
        <%-- <div class="index_online_inquiry">
          <div class="index_linguister_header">
            <h2 class="index_linguister_h2"><spring:message  code='在线询价'/></h2>
          </div>
          <div class="row">
            <div class="col-sm-6">
              <div class="form_inquiry">
                <form class="form-horizontal" action="" method="post">
                  <div class="form-group">
                    <p class="col-sm-3 control-label"><spring:message  code='语种：'/></p>
                    <div class="col-sm-8">
                      <select class="form-control" id="language1" onchange="getCount()" style="">
                  <option title="" value="" >-- <spring:message  code='请选择语种'/> --</option>
                		</select>
                    </div>
                  </div>
                  <div class="form-group">
                    <p class="col-sm-3 control-label"><spring:message  code='翻译领域：'/> </p>
                    <div class="col-sm-8">
                         <select class="form-control" id="field" onchange="getCount()" style="">
                  			<option title=""  value="">-- <spring:message  code='请选择翻译领域'/> --</option>
                		</select>
                    </div>
                  </div>
                  <div class="form-group">
                    <p class="col-sm-3 control-label"><spring:message  code='流程类型：'/></p>
                    <div class="col-sm-8">
                        <select class="form-control" name="" id="flow"  style="" onchange="getCount()">
                  <option value="">-- <spring:message  code='请选择翻译流程'/> --</option>
                  <option value="仅翻译"><spring:message  code='仅翻译'/></option>
                  <option value="翻译校对"><spring:message  code='翻译+校对'/></option>
                  <option value="翻译校对审核"><spring:message  code='翻译+校对+审核'/></option>
                </select>
                    </div>
                  </div>
                  <div class="form-group">
                    <p class="col-sm-3 control-label"><spring:message  code='译员等级：'/></p>
                    <div class="col-sm-8">
                      <select class="form-control" name="" id="translatorLevel" onchange="getCount()" style="">
                		<option title="0" value="" >-- <spring:message  code='请选译员等级'/> --</option>
                	</select>
                    </div>
                    <a class="questions" style="position:relative;padding-top:15px;"  href="javascript:;">
                      <i class="fa fa-question dengjihelp" aria-hidden="true"></i>
                      <span class="help_text" >
                        <spring:message  code='三级：三年相关技术领域翻译经验、通过爱译社考核'/><br />
                        <spring:message  code='四级：五年相关技术领域翻译经验、通过爱译社考核'/><br />
                        <spring:message  code='五级：十年相关技术领域翻译经验、通过爱译社考核'/>
                      </span>
                    </a>
                  </div>
                  <div class="form-group">
                    <p class="col-sm-3 control-label"><spring:message  code='周期：'/></p>
                    <div class="col-sm-8">
                      <select class="form-control" name="" id="schedule"  style="" onchange="getCount()">
                		<option value="">-- <spring:message  code='请选择翻译周期'/> --</option>
                	</select>
                    </div>
                    <a class="questions" href="javascript:;" style="position:relative;padding-top:15px;">
                      <i class="fa fa-question zhouqihelp" aria-hidden="true"></i>
                      <span class="help_zhouqi_text" >
                        <spring:message  code='一般情况：流程处理时间1天、3000字/天(翻译)、6000字/天(校对)、8000字/天(审核)'/><br />
                        <spring:message  code='加急情况：流程处理时间1天、4000字/天（翻译）、8000字/天（校对）、10000字/天（审核）'/><br />
                        <spring:message  code='特急情况：5000字/天（翻译）、10000字/天（校对）、15000字/天（审核）'/>
                      </span>
                    </a>
                  </div>
                  <div class="online_inquiry_search" style="height: 50px;">
                    <div class="row">

                      <span class="online_inquiry_people" id="ocount" style="width: 200px;font-size:18px;display: none;margin-left: 150px;text-align: center;"><spring:message  code='可选译员'/>&nbsp;<span id="count" style="color: red"></span>&nbsp;<spring:message  code='人'/></span>
                      <span class="online_inquiry_money"  id="omoney" style="width: 200px;font-size:18px;display: none;margin-left: 50px;text-align: center;"><spring:message  code='约合'/>&nbsp;:￥ <span ><font id="money" color="#FF0000"></font></span><spring:message  code='元'/>&nbsp;<spring:message  code='(千字/原文)'/></span>

                    </div>
                  </div>
                  <div class="form-group"  >
                    <div class="col-sm-offset-4 col-sm-3" >

                     <!-- <a href="javascript:void(0)" class="btn btn-info" id="btn1">在线询价</a> -->
                     <input type="button" id="btn1" class="btn11" value="<spring:message  code='在线询价'/>">
                    </div>
                    <div class="col-sm-3">
                     <!-- <a href="javascript:void(0)" class="btn btn-info text-red" onclick="publish();">快速发布</a> -->
                     <input type="button" class="btn11" onclick="publish();"  value="<spring:message  code='快速发布'/>">

                    </div>
                  </div>
                </form>
              </div>
            </div>
            <div class="col-sm-5" style="margin-left:60px;">
              <div class="reproduction" style="background:#ffffff;">
               <a href="/forwardAction/forward_toPublishProcess.do"><img alt="..." src="/img/pulishNeed12.png"></a> 
              </div>
              <div class="row" style="margin-top:40px;text-align: center;"><font color="#08A5E0"><b>项目发布流程图</b></font></div>
            </div>
          </div>
        </div> --%>

        <!--  在线咨询  -->
        <!-- <div class="index_online_consult col-sm-6">
          <div class="index_linguister_header">
            <h2 class="index_linguister_h2">在线咨询</h2>
          </div>
          <div class="linguister_content">
            <div class="linguister_tel">
              <span>客服QQ：12345678</span>
              <span>客服电话：12345678</span>
            </div>
            <div class="">
              <textarea name="name" class="form-control" rows="8" placeholder="请输入你想咨询的问题，我们会有人为您解答"></textarea>
            </div>
            <div class="linguister_button">
              <button type="submit" class="btn btn-default">咨询留言</button>
            </div>
          </div>
        </div> -->
      <!--  在线询价 在线咨询  结束   -->
      <div class="clear"></div>

      <!--     icons    -->
     <!--  <div class="index_icons">
        <ul class="list-inline index_icons_list">
          <li>
            <i class="fa fa-clock-o fa-3x" aria-hidden="true"></i>
            <span>时效性</span>
          </li>
          <li>
            <i class="fa fa-crosshairs fa-3x" aria-hidden="true"></i>
            <span>准确性</span>
          </li>
          <li>
            <i class="fa fa-eye fa-3x" aria-hidden="true"></i>
            <span>公开性</span>
          </li>
          <li>
            <i class="fa fa-wifi fa-3x" aria-hidden="true"></i>
            <span>便捷性</span>
          </li>
        </ul>
      </div> -->

      <!--    价格      -->
      <!-- <div class="index_prices">
        <ul class="list-inline">
          <li class="index_prices_li"><h3>100000</h3><p>议员</p></li>
          <li class="index_prices_li"><h3>1000000</h3><p>翻译需求</p></li>
          <li class="index_prices_li"><h3>200000</h3><p>交易量</p></li>
        </ul>
      </div> -->


      <!--    专利翻译精英  开始   -->
      <div class="index_linguister">
        <div class="index_linguister_header" style="margin-bottom: 0px;">
          <h2 class="index_linguister_h2" style="width:334px;"><spring:message  code='译员展示'/></h2>
           <p class="index_linguister_p">
            <!-- 页面修改开始 -->
            <!-- <span class="index_linguister_p_block">
                <button class="btn btn-default" onclick="getTrans(this);"><spring:message  code='英汉'/></button>
                <button class="btn btn-default" onclick="getTrans(this);"><spring:message  code='汉英'/></button>
            </span>
            <span class="index_linguister_p_block">
              <button class="btn btn-default" onclick="getTrans(this);"><spring:message  code='日汉'/></button>
              <button class="btn btn-default" onclick="getTrans(this);"><spring:message  code='汉日'/></button>
            </span>
            <span class="index_linguister_p_block">
              <button class="btn btn-default" onclick="getTrans(this);"><spring:message  code='德汉'/></button>
              <button class="btn btn-default" onclick="getTrans(this);"><spring:message  code='汉德'/></button>
            </span>
            <span class="index_linguister_p_block">
              <button class="btn btn-default" onclick="getTrans(this);"><spring:message  code='韩汉'/></button>
              <button class="btn btn-default" onclick="getTrans(this);"><spring:message  code='汉韩'/></button>
            </span>
            <span class="index_linguister_p_block">
              <button class="btn btn-default" onclick="getTrans(this);"><spring:message  code='法汉'/></button>
              <button class="btn btn-default" onclick="getTrans(this);"><spring:message  code='汉法'/></button>
            </span> -->

               <%-- <a style="color:white;font-size:16px;" class="line_label" href="/translator/translatorAction_getTotalCount.do"><spring:message  code='更多'/>>>></a> --%>
				<a style="color:white;font-size:16px;" class="line_label" href="/translator/interShowUI.do"><spring:message  code='更多'/>>>></a>
    
          </p>         
      
        </div>
        
        <%-- <div class="newinterpreters">
        <div class="interpreter_content" id="ddMarquee">
          <span id="Htime0"></span>&nbsp; 
          <span id="Htime1"></span>&nbsp; 
          <font size="5px">:</font> 
          &nbsp;<span id="Mtime0"></span>&nbsp;
          <span id="Mtime1"></span>
          <label style="width: 20px"></label>   <spring:message  code='恭喜'/>&nbsp;
          <b id="user"></b>
          &nbsp;<spring:message  code='注册成功'/>
        </div>
      </div> --%>
        <!--    成为新译员    -->
       <!--  <div class="index_costumer" style="overflow:hidden;">
          <ul class="list-inline index_costumer_lits">
           <li><font color="red">欢迎***成为平台第***位译员！！！！！1</font></li>
            <li><font color="red">欢迎***成为平台第***位译员！！！！！2</font></li>
            <li><font color="red">欢迎***成为平台第***位译员！！！！！3</font></li>
            <li><font color="red">欢迎***成为平台第***位译员！！！！！4</font></li>
            <li><font color="red">欢迎***成为平台第***位译员！！！！！5</font></li>
            <li><font color="red">欢迎***成为平台第***位译员！！！！！6</font></li>
            <li><font color="red">欢迎***成为平台第***位译员！！！！！7</font></li>
            <li><font color="red">欢迎***成为平台第***位译员！！！！！8</font></li>
            <li><font color="red">欢迎***成为平台第***位译员！！！！！9</font></li>
            <li><font color="red">欢迎***成为平台第***位译员！！！！！10</font></li>
            <li><font color="red">欢迎***成为平台第***位译员！！！！！11</font></li>
          </ul>
        </div> -->
         <div class="index_linguister_card" style="height: 650px;" >
          <!-- <div class='append_card' >
          <div class='cards_one text-right fl'>
          <span class='cards_title'>推荐</span>
          <img class='card_img' src='http://via.placeholder.com/65x75' alt='' >
          <p><span class='card_name' id='nickname'></span></p>
          <p hidden=''><span id='transId'></span></p><p>
          等级：<span id='level' ></span></p><p>
          语种：<span id='languages'></span></p><p>
          学历：<span id='degree'></span></p>
          <div class='texts_left'>
          <p>所学专业：<span></span></p>
          <p>专业领域：<span id='trandomain'></span></p>
          <p>翻译经验：<span></span></p>
          <p>校对经验：<span></span></p>
          </div><div class='append_card_btn'>
          <a href='javascript:;' class='append_card_btn01'>选TA<span class='list_badge' style='right:-7px;top:-7px;'>1</span></a>
          <a href='' class='append_card_btn02' id='lookTrans' >详情</a></div>
          </div>
          </div> -->

        </div> 

<!--         <div class="index_linguister_card" style="width:1200px;">
          <div class="append_card">
            <div class="cards_one text-right fl">
              <span class="cards_title">推荐</span>
              <img class="card_img" src="http://via.placeholder.com/65x75 " alt="">
              <p><span class="card_name">张三</span>等级：<span>3级</span></p>
              <p>语种：<span>汉英</span></p>
              <p>学历：<span>本科</span></p>
              <div class="texts_left">
                <p>所学专业：<span>机械设计</span></p>
                <p>专业领域：<span>机械、机电、通信</span></p>
                <p>翻译经验：<span>4000字</span></p>
                <p>校对经验：<span>3000字</span></p>
              </div>
              <div class="append_card_btn">
                <a href="javascript:;" class="append_card_btn01">选TA<span class="list_badge" style="right:-7px;top:-7px;">1</span></a>
                <a href="interpreter.show.details.html" class="append_card_btn02">详情</a>
              </div>
            </div>
          </div>
        </div> -->
           
        <div class="index_linguister_chevron" style="display:inline-block;width:82%;text-align:right;">
          <a href="javascript:void(0);"  onclick="getTrans(this)" class="prev_cards" id="last"><i class="fa fa fa-angle-left fa-2x" aria-hidden="true" id="tranLanguage"></i></a>
          <a href="javascript:void(0);"  onclick="getTrans(this)" class="next_cards" id="nexts"><i class="fa fa fa-angle-right fa-2x" aria-hidden="true"></i></a>
        </div>

        
        <%-- <p class="cards_num" style="float:right;"><spring:message  code='共' /><span id="transCount"></span><spring:message  code='译员'/></p> --%>
        <p class="cards_num" style="float:right;"><spring:message  code='译员数量：' /><span id="transCount"></span></p>
      </div>
      <div class="clear"></div>
      <!--    专利翻译精英 结束    -->

      <!--  优秀案例展示  开始  -->
      <!-- <div class="index_linguister">
        <div class=" box">
    			<div class=""  id="boxdiv">
    				<ul class="mobile">
    					<li style="display:block;"><a href="/translator/translatorAction_getTransCount.do?language=JP"><img style="width:220px;height:165px;border-radius:10px;" src="/img/JAP3.jpg"/><br><label style="margin-top:10px;width:220px;text-align: center;color:#08A5E0;">日本|JAPAN</label></a></li>
    					<li><a href="/translator/translatorAction_getTransCount.do?language=EN"><img style="width:220px;height:165px;border-radius:10px;" src="/img/En2.jpg"/><br><label style="margin-top:10px;width:220px;text-align: center;color:#08A5E0;">英国|ENGLANG</label></a></li>
    					<li><a href="/translator/translatorAction_getTransCount.do?language=JP"><img style="width:220px;height:165px;border-radius:10px;" src="/img/FR2.jpg"/><br><label style="margin-top:10px;width:220px;text-align: center;color:#08A5E0;">法国|FRANCE</label></a></li>
    					<li><a href="/translator/translatorAction_getTransCount.do?language=GER"><img style="width:220px;height:165px;border-radius:10px;" src="/img/GER2.jpg"/><br><label style="margin-top:10px;width:220px;text-align: center;color:#08A5E0;">德国|GERMANY</label></a></li>
    					<li><a href="/translator/translatorAction_getTransCount.do?language=KOR"><img style="width:220px;height:165px;border-radius:10px;" src="/img/KOR2.jpg"/><br><label style="margin-top:10px;width:220px;text-align: center;color:#08A5E0;">韩国|KOREA</label></a></li>
    			    <li><a href="interpreter.show.works.details.html"><img style="width:175px;height:210px;" src="/img/RUS.jpg"/></a></li>
    				</ul>
    			</div>
  		  </div>
      </div> -->
      <!--  优秀案例展示  结束  -->

      <!-- 爱译智能-PAT软件  开始 -->
      <div class="intelligent_software">
        <div class="index_linguister_header">
          <h2 class="index_linguister_h2"><spring:message  code='爱译智能'/>-PAT&nbsp;&nbsp;<spring:message  code='软件'/></h2>
        </div>
        <div class="honor_map">
          <a href="/forwardAction/forward_toFunction.do"><img  src="/img/index5.jpg" alt=""></a>
        </div>
        <%-- <div style="text-align: right;">
        	<a href="/forwardAction/forward_toSoftwareTranslation.do" style="color: #08a5e0;padding-right: 50px;"><spring:message  code='更多'/>>>></a>
        </div> --%>
        <div class="sofe_down">
          <div class="row wraper_left">
           <!-- 2017.12.11修改 开始 -->
            <!-- 软件厂商：  软件授权：  应用平台： 添加了text-align:right; 另外添加了右边的一块软件下载  -->
            <div class="col-sm-6">
              <h3 style="margin-right: 205px;margin-left: 0px"><spring:message  code='爱译智能'/><spring:message  code='（英汉/汉英）'/>—PAT<spring:message  code='软件下载'/> <label  class="col-sm-1" style="left:380px;padding: 0px 0 0 0;top:-18px"><a href="javascript:;" onmouseover="overShowSoft()" onmouseout="outHideSoft()"><font color="red"><b>?</b></font></a></label></h3>
              <div id="showDivSoft" style="color:white;z-index: 999;display:none;position: absolute; background-color: #08A5E0; border: 1px solid #08A5E0;width:420px;text-align: left;border-radius:5px;padding:5px;left:410px;top:-20px"></div>
              <div class="msg-l">
                <ul class="msg-list">
                 	 <li id= "name"><span class="sub" ><spring:message  code='软件版本：'/></span>Aitrans-PAT 5.0</li>
                  <li  id="size"><span class="sub"><spring:message  code='软件大小：'/></span>107MB</li>
                  <li title="有道词典"><span class="sub"><spring:message  code='软件厂商：'/></span><a href="/forwardAction/forward_toTeam.do" rel="nofollow"  target="_blank" title="爱译社"><spring:message  code='环宇爱译'/></a>
                  </li>
                  <li><span class="sub"><spring:message  code='软件语言：'/></span><spring:message  code='简体中文'/></li>
                  <li><span class="sub"><spring:message  code='软件授权：'/></span><spring:message  code='免费'/></li>
                  <li><span class="sub"><spring:message  code='软件评级：'/></span><i class="stars"><span style="width:80%"></span></i></li>
                  <li><span class="sub"><spring:message  code='应用平台：'/></span>WinAll</li>
                  <li id="updateTime"><span class="sub" ><spring:message  code='更新时间：'/></span>2018-01-31</li>
                </ul>
                <div class="form-group lab_check">
                 <!--  <label class="checkbox-inline">
                    <input type="checkbox" id="inlineCheckbox1" value="option1"> 电脑端版本下载
                  </label>
                  <label class="checkbox-inline">
                    <input type="checkbox" id="inlineCheckbox2" value="option2"> 更新包下载
                  </label> -->
                </div>
                <div class="dl-area">
                 <!--  <a href="javascript:;" class="btn btn-info">太平洋告诉下载</a> -->
                  <a href="/download/Aitrans-PAT 5.0 安装盘.rar" class="btn btn-info" id="url" style="margin-right:120px"><spring:message  code='本地下载'/> </a>
                  <a href="/software/reChargeUI.do" class="btn btn-info"><spring:message  code='线上购买'/> </a>
                </div>
                
              </div>
            </div>
           <%--  <div class="col-sm-6">
              <h3><spring:message  code='爱译智能'/><spring:message  code='（日汉/汉日）'/>—PAT<spring:message  code='软件下载'/></h3>
              <div class="msg-l">
                <ul class="msg-list">
                 	 <li id= "name"><span class="sub" ><spring:message  code='软件版本：'/></span>Aitrans-PAT 5.0</li>
                  <li  id="size"><span class="sub"><spring:message  code='软件大小：'/></span>68.9M</li>
                  <li title="有道词典"><span class="sub"><spring:message  code='软件厂商：'/></span><a href="/forwardAction/forward_toTeam.do" rel="nofollow"  target="_blank" title="爱译社"><spring:message  code='环宇爱译'/> </a>
                  </li>
                  <li><span class="sub"><spring:message  code='软件语言：'/></span><spring:message  code='简体中文'/></li>
                  <li><span class="sub"><spring:message  code='软件授权：'/></span><spring:message  code='免费'/></li>
                  <li><span class="sub"><spring:message  code='软件评级：'/></span><i class="stars"><span style="width:80%"></span></i></li>
                  <li><span class="sub"><spring:message  code='应用平台：'/></span>WinAll</li>
                  <li id="updateTime"><span class="sub" ><spring:message  code='更新时间：'/></span>2017-09-13</li>
                </ul>
                <div class="form-group lab_check">
                 <!--  <label class="checkbox-inline">
                    <input type="checkbox" id="inlineCheckbox1" value="option1"> 电脑端版本下载
                  </label>
                  <label class="checkbox-inline">
                    <input type="checkbox" id="inlineCheckbox2" value="option2"> 更新包下载
                  </label> -->
                </div>
                   <div class="dl-area">
                 <!--  <a href="javascript:;" class="btn btn-info">太平洋告诉下载</a> -->
                  <a href="/download-PAT 5.0 安装盘.rar" class="btn btn-info" id="url"><spring:message  code='本地下载'/> </a>
                </div>
              </div>
            </div> --%>
            <!-- <div class="col-sm-5">
              <div class="sofe_down_details">
                <ul>
                  <li><h3>环宇爱译-智能PAT软件给译员带来的福音</h3></li>
                  <li>1、提高翻译速度。</li>
                  <li>2、提升翻译质量。</li>
                  <li>3、降低翻译难度。</li>
                  <li>4、完善客服机制</li>
                  <li>5、爱译平台还将提供完整的使用说明，以及更新补丁方便译员与我们共同进步。</li>
                  <li></li>
                </ul>
              </div>
            </div> -->
            <!-- 2017.12.11修改 结束 -->
     <%--        <div class="col-sm-6">
              <h3><spring:message  code='爱译智能'/>-PAT<spring:message  code='软件下载'/></h3>

              <div class="msg-l">
                <ul class="msg-list">
               	 <li id= "name"><span class="sub" ><spring:message  code='软件版本：'/></span>Aitrans-PAT 5.0 <spring:message  code='安装盘'/></li>
                  <li  id="size"><span class="sub"><spring:message  code='软件大小：'/></span>68.9M</li>
                  <li title="有道词典"><span class="sub"><spring:message  code='软件厂商：'/></span>
                    <a href="/forwardAction/forward_toTeam.do" rel="nofollow"  target="_blank" title="爱译社"><spring:message  code='环宇爱译'/> </a>
                  </li>
                  <li><span class="sub"><spring:message  code='软件语言：'/></span><spring:message  code='简体中文'/></li>
                  <li><span class="sub"><spring:message  code='软件授权：'/></span><spring:message  code='免费'/></li>
                  <li><span class="sub"><spring:message  code='软件评级：'/></span><i class="stars"><span style="width:80%"></span></i></li>
                  <li><span class="sub"><spring:message  code='应用平台：'/></span> WinAll</li>
                  <li id="updateTime"><span class="sub" ><spring:message  code='更新时间：'/></span>2017-09-13</li>
                </ul>
                <div class="form-group lab_check">
             <!--      <label class="checkbox-inline">
                    <input type="checkbox" id="inlineCheckbox1" value="option1">电脑端版本下载
                  </label>
                  <label class="checkbox-inline">
                    <input type="checkbox" id="inlineCheckbox2" value="option2">更新包下载
                  </label> -->
                </div>
                <div class="dl-area">
                 <!--  <a href="javascript:;" class="btn btn-info">太平洋告诉下载</a> -->
                  <a href="/download-PAT 3.5 安装盘.rar" class="btn btn-info" id="url"><spring:message  code='本地下载'/> </a>
                </div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="sofe_down_details">
                <ul>
                  <li><h3 style="text-align: center;"><spring:message  code='爱译智能'/>PAT 3.5 --- <spring:message  code='专业智能交互翻译系统'/></h3></li>
                  <li> 
                  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='爱译智能'/>PAT 3.5 （<spring:message  code='曾用名为'/>Bodiansoft-ITM 3.5）<spring:message  code='是新一代的专业翻译工具，它是一种在智能化知识库基础上结合先进的人机交互式翻译技术、翻译存储技术和人工智能翻译技术而构成的超级智能计算机翻译系统。它使计算机与人的优势互补，彻底改变了传统的翻译工作方式，将领引计算机翻译技术从人-机-人模式进入到机-人-机模式。'/>
                  </li>
                  <li></li>

                  <li>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='它具有“指点翻译”、“智能学习”、“智能翻译记忆”、“智能输入提示”、“智能标识”和“智能替换翻译”等功能。'/></li>
                  <li></li>
                  
                  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='适合人群：专业翻译工作者；专职译员、自由译者；需要翻译外文的广大学生、教师、科研工作者；情报工作人员；'/></li>
                  <li></li>
                  <li> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message  code='本软件特别适合经常翻译同一专业或同一领域外文资料，比如：书籍翻译、专业资料翻译、法律文书翻译、专利翻译、标书翻译等。其“术语提取加工”功能尤其适合于中大型项目的翻译。'/></li>
                </ul>
              </div>
            </div> --%>
          </div>
        </div>
      </div>
      <!-- 爱译智能-PAT软件  开始 -->


      <!--  找需求  开始 -->
      <div class="index_linguister">
        <div class="index_linguister_header">
          <h2 class="index_linguister_h2" style="width:334px;"><spring:message  code='项目展示'/></h2>
          <p class="index_linguister_p">
            <!-- 页面修改开始 -->
            <%-- <span class="index_linguister_p_block">
                <button class="btn btn-default" onclick="getNeeds(this);"><spring:message  code='英汉'/></button>
                <button class="btn btn-default" onclick="getNeeds(this);"><spring:message  code='汉英'/></button>
            </span>
            <span class="index_linguister_p_block">
              <button class="btn btn-default" onclick="getNeeds(this);"><spring:message  code='日汉'/></button>
              <button class="btn btn-default" onclick="getNeeds(this);"><spring:message  code='汉日'/></button>
            </span>
            <span class="index_linguister_p_block">
              <button class="btn btn-default" onclick="getNeeds(this);"><spring:message  code='德汉'/></button>
              <button class="btn btn-default" onclick="getNeeds(this);"><spring:message  code='汉德'/></button>
            </span>
            <span class="index_linguister_p_block">
              <button class="btn btn-default" onclick="getNeeds(this);"><spring:message  code='韩汉'/></button>
              <button class="btn btn-default" onclick="getNeeds(this);" ><spring:message  code='汉韩'/></button>
            </span>
            <span class="index_linguister_p_block">
              <button class="btn btn-default" onclick="getNeeds(this);"><spring:message  code='法汉'/></button>
              <button class="btn btn-default" onclick="getNeeds(this);"><spring:message  code='汉法'/></button>
            </span> --%>
              <a style="color:white;font-size:16px;" class="line_label" href="/cilentCustomer/findNeedListUI.do"><spring:message  code='更多'/>>>></a>
          </p> 
          
    
        </div>
        <div class="index_needers_card">
          <!-- <div class="needers_cards">
            <div class="needers_cards_title">
              <h5>百度.点心省电项目 俄语</h5>
            </div>
            <div class="needers_cards_content">
              <div class="needers_cards_content_left pull-left">
                <img src="http://via.placeholder.com/72x85" alt="" style="width:72px;height:85px;">
                <a href="demand.details.html">查看详情</a>
              </div>
              <div class="needers_cards_content_right pull-right">
                <p><span>￥5000</span><span>论文翻译</span></p>
                <p><span>2天完成</span><span>6名翻译参与</span></p>
              </div>
            </div>
          </div> -->
        </div>
     <div class="index_linguister_chevron" style="display:inline-block;width:82%;text-align:right;">
          <a href="javascript:void(0)" onclick="getNeeds(this);"  class="prev_cards" id="prev" ><i  aria-hidden="true" class="fa fa-angle-left fa-2x" id="language"></i></a>
          <a href="javascript:void(0)" onclick="getNeeds(this);"   class="next_cards" id="next"  ><i  class="fa fa-angle-right fa-2x" aria-hidden="true"></i></a>
        </div> 
     <!--      <div class="pull-right index_linguister_chevron">
            <a href="javascript:;" class="prev_cards"><i style="color:#fff;" class="fa fa fa-angle-left fa-2x" aria-hidden="true"></i></a>
            <a href="javascript:;" class="next_cards"><i style="color:#fff;" class="fa fa fa-angle-right fa-2x" aria-hidden="true"></i></a>
          </div> -->
        <%-- <p class="cards_num" style=float:right;><spring:message  code='共'/><span id="count1"></span><spring:message  code='项目'/></p> --%>
        <p class="cards_num" style=float:right;><spring:message  code='项目数量：'/><span id="count1"></span></p>
      </div>
      
      <div class="clear"></div>
      <!--  找需求  结束  -->

      <!--  环宇爱译 中国专利翻译第一品牌  开始  -->
      <div class="index_first_brand">
        <div class="index_linguister_header">
          <h2 class="index_linguister_h2" style="width:334px;"><spring:message  code='客户展示'/></h2>
          <p class="index_linguister_p">
            <!-- 页面修改开始 -->
           <!--  <span class="index_linguister_p_block">
               <a class="btn btn-default" target="_blank" href="/index/getCustomerByCountryUI.do?country=中国">中国</a>
            </span>
            <span class="index_linguister_p_block">
              <a class="btn btn-default" target="_blank" href="/index/getCustomerByCountryUI.do?country=日本">日本</a>
            </span>
            <span class="index_linguister_p_block">
              <a class="btn btn-default" target="_blank" href="/index/getCustomerByCountryUI.do?country=德国">德国</a>
            </span>
            <span class="index_linguister_p_block">
              <a class="btn btn-default" target="_blank" href="/index/getCustomerByCountryUI.do?country=韩国">韩国</a>
            </span>
            <span class="index_linguister_p_block">
              <a class="btn btn-default" target="_blank" href="/index/getCustomerByCountryUI.do?country=法国">法国</a>
            </span> -->
            <span class="index_linguister_p_block" style="text-align: right;margin-top:-3px">
              <a style="color:white;font-size:16px;" class="line_label" href="/index/getCustomerByCountryUI.do" target="_blank"><spring:message  code='更多'/>>>></a>
              
    		</span>
          </p>
        </div>
<!-- 
        <div class="row">
          <div class="col-sm-6" style="margin-left:20px;">
            <div class="first_brand_details"><br>
              <p><h4>环宇爱译-全球专利翻译平台</h4></p><br>
              <p style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;环宇爱译-全球专利翻译平台，致力于打造线上翻译体系，平台提供辅助翻译的人工智能翻译工具环宇爱译-智能CAT来帮助译员快速完成翻译任务，并提高翻译质量，满足所有的客户的翻译需求是我们最终的目的。</p><br>
              <p><h4>环宇爱译-智能CAT</h4></p><br>
           	  <p style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;人工智能翻译理论是在自然语言理解（NLU）、自然语言处理（NLP）、机器翻译（MT）、翻译记忆（TM）和基于统计学的机器翻译（SMT）等理论和技术基础上，为突破计算机翻译技术瓶颈、实现高质量机器翻译而提出的新思维、新理论，是一门新的学科。  </p><br>
              <p style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d具体地，人工智能翻译学科包括人工智能翻译理论、人工智能翻译技术、智能知识库、基于智能知识库的计算机智能翻译技术、多策略智能翻译技术、在线多策略智能翻译技术等内容。</p>
            
            </div>
          </div>
          <div class="col-sm-5" style="margin-left:60px;">
            <div class="first_brand_video">
              <p style="line-height:400px;text-align:center;">专利翻译的权威视频</p>
            <video controls="controls"  height="400px" width="480px">
   						<source style="line-height:400px;text-align:center;" src="/mp4/057ca14d2cb79e2a620ca4e65d9f15b0.mp4"  type="video/mp4"/>
   			</video>
            </div>
          </div>
-->
        <!-- <div class="row" id="customerCard">
			

        </div> -->
        
        <div class="row" id="newUserSHow">
        	<div id="first_brand_details1">
        		<!-- <div class="icon"></div>
        		<div class="icon"></div>
        		<div class="icon"></div>
        		<div class="icon"></div>
        		<div class="icon"></div>
        		<div class="icon"></div>
        		<div class="icon"></div>
        		<div class="icon"></div>
        		<div class="icon"></div>
        		<div class="icon"></div>
        		<div class="icon"></div>
        		<div class="icon"></div> -->
        	</div>
        	<div id="first_brand_details2">
        		<!-- <div class="icon"></div>
        		<div class="icon"></div>
        		<div class="icon"></div>
        		<div class="icon"></div>
        		<div class="icon"></div>
        		<div class="icon"></div>
        		<div class="icon"></div>
        		<div class="icon"></div>
        		<div class="icon"></div>
        		<div class="icon"></div>
        		<div class="icon"></div>
        		<div class="icon"></div> -->
        	</div>
        </div>
        
        
      </div>
      <!--  环宇爱译 中国专利翻译第一品牌  结束  -->

      <!--  在线翻译 开始  -->
   <!--    <div class="index_online_inquiry">
        <div class="index_linguister_header">
          <h2 class="index_linguister_h2">在线翻译</h2>
        </div>
        <div class="online_inquiry_content">
          <div class="form-inline online_inquiry_content_top">
            <div class="form-group">
              <select class="form-control" name="">
                <option value="">自动检测语言</option>
              </select>
            </div>
            <div class="form-group">
              <button class="form-control" type="button" name="button">自动翻译</button>
            </div>
            <div class="form-group">
              <button class="form-control" type="button" name="button">人工翻译</button>
            </div>
          </div>
          <div class="form-group row">
            <div class="col-sm-6">
              <textarea name="name" class="form-control" rows="6" placeholder="请输入要翻译的术语和句子"></textarea>
            </div>
            <div class="col-sm-6">
              <textarea name="name" class="form-control" rows="6"></textarea>
            </div>
          </div>
        </div>

      </div> -->
      <!--  在线翻译 结束  -->
         </div>


      <!-- 尾标签开始 -->
<div id="gradient" class="footer_content">
      <!-- 用户指南  -->
      <div class="messages container">
     	 	<div class="message_more">
      			<div class="row"></div>
      			</div>
      					<ul class="col-sm-2 message_more_li"><li><h2><spring:message  code='新手指南'/></h2></li><li><a href="/forwardAction/forward_toRegisterProcess.do"><spring:message  code='注册流程'/></a></li><li><a href="/forwardAction/forward_toRuleDescription.do"><spring:message  code='规则中心'/></a></li><li><a href="/forwardAction/forward_toIdentification.do"><spring:message  code='用户认证'/></a></li></ul>
      					<ul class="col-sm-2 col-sm-offset-1 message_more_li"><li><h2><spring:message  code='我是客户'/></h2></li><li><a href="/forwardAction/forward_toCustomerInstructions.do"><spring:message  code='客户须知'/></a></li><li><a href="/forwardAction/forward_toPublishProcess.do"><spring:message  code='项目发布'/></a></li><li><a href="/forwardAction/forward_toQuality.do"><spring:message  code='质量控制'/></a></li></ul>
      					<ul class="col-sm-2 col-sm-offset-1 message_more_li"><li><h2><spring:message  code='我是译员'/></h2></li><li><a href="/forwardAction/forward_toInterpreterTips.do"><spring:message  code='译员须知'/></a></li><li><a href="/forwardAction/forward_toTranslationProcess.do"><spring:message  code='任务接受'/></a></li><li><a href="/forwardAction/forward_toRemuneration.do"><spring:message  code='稿酬明细'/></a></li></ul>
      				<ul class="col-sm-2 col-sm-offset-1 message_more_li"><li><h2><spring:message  code='爱译智能-PAT'/></h2></li><li><a href="/forwardAction/forward_toFunction.do"><spring:message  code='软件功能介绍'/></a></li><li><a href="/forwardAction/forward_toSoftwareTranslation.do"><spring:message  code='在线视频教学'/></a></li><li><a href="/forwardAction/forward_toSoftwareTranslation.do"><spring:message  code='直接下载'/></a></li></ul>
      			
      </div>

      <!--------  login footer  -------->
      <footer class="container register_footer cl">
      		<ul class="list-inline">
      			<li>
      			<a href="/forwardAction/forward_toTeam.do"><font color="white"><spring:message  code='关于我们'/></font></a>&nbsp;&nbsp;<font color="white">|</font> </li>
      			<li><a href="/forwardAction/forward_toTeam.do"><font color="white"><spring:message  code='联系方式'/></font></a>&nbsp;&nbsp;<font color="white">|</font></li>
      			<li><a href="http://www.aitrans.net"><font color="white"><spring:message  code='爱译智能'/>-CAT</font></a>&nbsp;&nbsp;<font color="white">|</font></li>
      			<li><a href="javascript:;"><font color="white"><spring:message  code='支付方式'/></font></a>&nbsp;&nbsp;<font color="white">|</font></li>
      			<li><a href="http://www.aitrans.org"><font color="white"><spring:message  code='友情链接'/></font></a>&nbsp;&nbsp;<font color="white">|</font></li>
      			<li><a href="/forwardAction/forward_toSecurityCenter.do"><font color="white"><spring:message  code='安全中心'/></font></a></li>
      			</ul>
      			<p class="footer_adress"><font color="white">Copyright 2005-2017 123.com版权所有 渝ICP备1234567-4号 渝B2-12134567 渝公安网备 1234567890号 互联网违法和不良信息举报电话：1234567 邮箱：123456.com</font></p>
      </footer>


    </div>
  <!-- 尾标签结束 -->
 

    <!-- <script  type="text/javascript">

    $(document).ready(function(){
    	
// slider
      $('.slider4').bxSlider({

            slideWidth: 200,

            minSlides: 2,

            maxSlides: 3,

			moveSlides: 1,

			startSlide: 1,

            slideMargin: 10

          });

    });
    
    
    
    </script> -->
    <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
