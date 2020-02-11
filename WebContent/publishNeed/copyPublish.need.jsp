<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name=" Keywords" content="......">      <!--content中，网页关键字-->
    <meta name=" description" content="......">   <!--content中，网页描述文字-->
    <meta name="author" content="......">        <!--标注作者-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/publish.need.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/progress.bar.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/interpreter.show.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/interpreter.cards.css" type="text/css"/>

  	<script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.0.min.js" charset="utf-8"></script>
    <!-- <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script> -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/public.nav.footer.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/publish.need.js"></script> --%>
   <%--  <script type="text/javascript" src="${pageContext.request.contextPath}/js/all.needs.js"></script> --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/lay/dest/layui.all.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
     	<script type="text/javascript">
        $(function(){
        	
        	 if("${clientid.userName}"!='' && "${clientid.userName}"!=null){
    	   		 $("#nickname").text('${clientid.userName}'+"<spring:message code=',欢迎您!'/>");
    	   	 }else if('${clientid.tel}'!=null && '${clientid.tel}'!=null){
    	   		 $("#nickname").text('${clientid.tel}'+"<spring:message code=',欢迎您!'/>");
    	   	 }else if('${clientid.emaile}'!=null && '${clientid.emaile}'!=null){
    	   		 $("#nickname").text('${clientid.emaile}'+"<spring:message code=',欢迎您!'/>");
    	   	 }
        	/* var tnickname = "${transid.nickname}";
        	var unickname = "${clientid.userName}";
        	if(tnickname!=""){
        		$("#nickname").text(tnickname+"<spring:message  code=',欢迎您!'/>");
        		
        	}else if (unickname!="") {
        		$("#nickname").text(unickname+"<spring:message  code=',欢迎您!'/>");
        		} */
        	
        	//发布需求按钮
        	$("#publishNeedClick").click(function (){
        		if("${clientid}"==null || "clientid"==''){
        			layer.msg('hello');
        			//layer.msg('<spring:message code="兑换成功，稍后会由工作人员给您发货！"/>',{icon:1});
        			//alert("您不是客户，不能进行发布项目操作！")
        		}else{
        			$("#publishNeedClick").prop("href","/cilentCustomer/publishNeed.do")
        		}
        	})
        	
        	
        	$(".btn_more").click(function(){
    		    if($(".publish_contents_lists").hasClass('height_list')){
    		      $(".publish_contents_lists").removeClass('height_list');
    		    }else{
    		      $(".publish_contents_lists").addClass('height_list');
    		    }
    		  })

    		  $(".btn_more_job").click(function(){
    		    if($(".publish_jobs_lists").hasClass('height_list')){
    		      $(".publish_jobs_lists").removeClass('height_list');
    		    }else{
    		      $(".publish_jobs_lists").addClass('height_list');
    		    }
    		  })
    		  
    		  
    	  var hotcard = $(".hot_cards_text").text();
		  hotcard.substring(0,20)
		  $(".hot_cards_text").text(hotcard.substring(0,20)+'......')
		  
		  $("#btn_add1").click(function(){  
	  			var a="<div class='row' style='height:37px'>"+
	  					"<label  class='col-xs-2 rowlabel'></label>"+
	  					"<div class='col-xs-3'>"+
	  					"</div>"+
	  					"<div class='col-xs-5'>"+
	  					"<a href='javascript:;' class='a-upload' id='file' class='a-upload'>"+
	  					"<input type='file' id='' name='filename'  lay-verify='required'/><spring:message code='点击这里上传文件'/></a>"+
	  					"</div>"+
	  				"</div>";
	  			$("#newUploadDiv").append(a);  
	  	   	 document.getElementById("btn_del1").removeAttribute("disabled");
	  	   });
		  
        });
 
        
      function down(obj){
	  	  var inputElement=document.getElementById("fileurl_"+obj).value;
	  	  var spanEle=document.getElementById("fileNameSpan").innerHTML; 
	  	  var formEle=document.getElementById("downForm");
	  	  document.getElementById("url").value=inputElement
	  	  formEle.action="/cilentCustomer/downloadTransFile.do?filename="+spanEle;
	  	  formEle.submit();
  	}
      
    	function bsStep(i) {
      		$('.step').each(function() {
      			var a, $this = $(this);
      			if(i > $this.find('li').length) {
      				console.log('<spring:message code="您输入数值已超过步骤最大数量"/>' + $this.find('li').length + '！！！');
      				a=$this.find('li').length;
      			} else if(i == undefined && $this.data('step') == undefined) {
      				a = 1
      			} else if(i == undefined && $this.data('step') != undefined) {
      				a = $(this).data('step');
      			} else {
      				a = i
      			}
      			$(this).find('li').removeClass('active');
      			$(this).find('li:lt(' + a + ')').addClass('active'); 
      		})
    	}
      		
      	//删除file插件
      		function del_1(){  
  		    	var odel=document.getElementById("newUploadDiv");
  		    	   var ofile=odel.lastElementChild;
  		    	   var name="";
  		    	   name = ofile.getAttribute("id");
  		    	   if(name=='file1'){
  		    		   document.getElementById("btn_del1").setAttribute("disabled","true");
  		    	   }else{
  		    		   odel.removeChild(ofile);
  		    	   }
  		       }


      	//选定模式下根据条件查找译员
    		function selectedTransModel(){
    	  		$("#nextStepBtn").html("loading...");
    	  		loadDiv("加载中...");
    	  		Position();
    	  		LayerShow("加载中...");
    			var cycleValue=document.getElementById("cycle").value;
    			if("特急+"==cycleValue){
    				LayerHide();
    				cleanInter();
    				layer.alert('<spring:message code="由于项目翻译时间过短，平台提醒您项目只能以招标模式发布，您也可以联系客服，可能会更好的解决，客服电话：010-82893875"/>', {
    					icon: 5,
    					title: "<spring:message code='提示'/>"
    					});
    				//$(this).prop("id","");
    				//return false;
    			}else{
    			var selectedModel="<input type='hidden' name='selected' value='选定译员模式' id='selectedModel'>";	
    			
    			//周期
    			var cycle=document.getElementById("cycle").value;
    			//加急天数
    			var addTime=0;
    			if("加急"==cycle){
    				addTime=document.getElementById("addTime").value;
    			}
    			
    			//翻译字数
    			var length = document.getElementById("length").value;
    			
    			//根据流程查找译员
    			var procedureType = document.getElementById("procedureType").value;
    			
    			
    			//获取译员语言
    			var transLanguage = $("#languagePair").val();
    			/* var languagePair=document.getElementsByName("languagePair");
    			var transLanguage="";
    			for(var i=0;i<languagePair.length;i++){
    				if(languagePair[i].checked){
    					transLanguage=languagePair[i].value;
    				}
    			} */
    			
    			//获取译员翻译领域
    			var transDomain = $("#domian").val();
    			/* var domain=document.getElementsByName("domain");
    			var transDomain="";
    			for(var i=0;i<domain.length;i++){
    				if(domain[i].checked){
    					transDomain=domain[i].value;
    				}
    			} */
    			
    			//获取译员等级
    			var level=document.getElementById("level").value;
    			level = level.slice(0,1);
    			//跳转路径
    			var url="/translator/findByWhere.do";
    			
    			   /*  $.ajax({
    			    	url : url,
    			    	async : false,
    			    	type : "POST",
    			    	dataType : "json",
    			    	data : {
    			    		transLanguage : transLanguage,
    			    		transDomain : transDomain,
    			    		level : level,
    			    		procedureType : procedureType,
    			    		length : length,
    			    		cycle : cycle,
    			    		time : addTime
    			    	},
    			    	success : function(data){
    						
    						$("#moneyKilo").val(""+data[2]);
    						
    						$("#ddd").css('display','block');
    						$("#nextStep").css('display','none');
    						
    						//旧Div，类型list
    						var append_cardId=document.getElementsByName("append_cardId");
    						//外围Div
    						var parentDiv=document.getElementById("transDiv");
    						//被选中的Div 类型list
    						var checkTrans=document.getElementsByName("checkTrans");
    						var checkCount=0;
    						for(var i=0;i<checkTrans.length;){
    							if(!(checkTrans[i].checked)){
    								//alert("bu被选中");
    								parentDiv.removeChild(append_cardId[i]);
    							}else{
    								//alert("xuanzhong");
    								i++;
    								checkCount=checkCount+1;
    							}
    						}
    						if(data[1]>0){
    							var procedureType=document.getElementById("procedureType").value;
    							if((6-checkCount)>0){
    								for(var i=0;i<(6-checkCount);i++){
    									if(i<data[1]){
    										var title="";
    										if('1'==procedureType){
    											title=data[0][i].tranPrice;
    										}
    										if('2'==procedureType){
    											title=data[0][i].prooPrice;					
    																}
    										if('3'==procedureType){
    											title=data[0][i].auditPrice;
    										}
    										if(level == 3){
    									    	starlevel = "<font size='4px' color='green'><b>★★★</b></font>"
    									    }
    									    if(level == 4){
    									    	starlevel = "<font size='4px' color='	#FFBB00'><b>★★★★</b></font>"
    									    }
    									    if(level == 5){
    									    	starlevel = "<font size='4px' color='	#FF0000'><b>★★★★★</b></font>"
    									    }
    										var cards_one = "<div class='append_card' name='append_cardId'>"+
    									    "<div class='cards_one text-right fl' style='padding:0px;padding-left:10px;height:310px;'>"+
    									    "<input name='checkTrans' id='"+data[0][i].id+"' type='checkbox' title='"+title+"' onclick='transKilo("+data[0][i].tranPrice+","+data[0][i].prooPrice+","+data[0][i].auditPrice+","+data[2]+")' value='"+data[0][i].id+"' style='display: block;' >"+
    									    "<p style='width:165px;margin-left:20px;text-align: left;'>"+"<span style='width:165px;' class='card_name' id='nickname'><font color='#000088'>"+data[0][i].nickname+"</font></span>"+"</p>"+
    									    "<img class='card_img' src='userUrl' alt='' width='80px' height='100px' >"+"<br>"+
    									    "<p hidden=''>"+"<span id='transId'>"+"</span>"+data[0][i].id+"</p>"+"<p>"+
    									    "<span id='level'>"+starlevel+"</span>"+"</p>"+"<p>"+
    									    "<span id='languages'>"+transLanguage+"</span>"+"</p>"+"<p>"+
    									    "<span id='degree'>"+data[0][i].degree+"</span>"+"</p>"+
    									    "<div class='texts_left'>"+
    									    "<p>"+"<spring:message  code='专业领域：'/>"+"<span id='trandomain'>"+transDomain+"</span>"+"</p>"+
    									    "<p>"+"<spring:message  code='翻译经验：'/>"+"<span>"+data[0][i].tranExperience+"</span>"+"</p>"+
    									    "<p>"+"<spring:message  code='校对经验：'/>"+"<span>"+data[0].prooExperience+"</span>"+"</p>"+
    									    "</div>"+"<div class='append_card_btn'>"+
    									    "<a href='javascript:checked("+data[0][i].id+","+data[0][i].tranPrice+","+data[0][i].prooPrice+","+data[0][i].auditPrice+","+data[2]+")' class='append_card_btn01' id='selectIt'><span><spring:message code='选'/>TA</span></a>"+
    									    "<a href='/translator/translatorAction_findTransById.do?transId="+data[0][i].id+"' class='append_card_btn02' id='lookTrans' >"+"详情"+"</a>"+"</div>"+
    									    "</div>"+
    									    "</div>";
    									$("#transDiv").append(cards_one);
    									}
    									
    									}
    							}
    							
    							$("#transDiv").append(selectedModel);
    							$("#hiddenDiv").show();
    						}else{
    							selectedModel="<input type='hidden' name='selected' value='主动投标模式' id='selectedModel'>";
    							layer.open({
    								  content: '<spring:message code="暂时没找到符合条件的译员，建议改为译员主动投标模式？"/>'
    								  ,btn: ['<spring:message code="确定"/>', '<spring:message code="取消"/>']
    								  ,btn1: function(index, layero){
    								    //按钮【按钮一】的回调
    								    layer.close(index);
    								    $("#hiddenDiv").hide();
    								    $("#transDiv").append(selectedModel);
    								  }
    								  ,btn2: function(index, layero){
    								    //按钮【按钮二】的回调
    								    layer.close(index);
    								    $("#hiddenDiv").hide();
    								   // $("#transDiv").append(selectedModel);
    								    
    								    //return false 开启该代码可禁止点击该按钮关闭
    								  }
    								  ,cancel: function(){ 
    								    //右上角关闭回调
    								    layer.close(index);
    								    $("#hiddenDiv").hide();
    								   // $("#transDiv").append(selectedModel);
    								    //return false 开启该代码可禁止点击该按钮关闭
    								  }
    								});
    						}
    					  },
    					  error : function(){
    						  if($("#length").val() == null || isInteger($("#length").val()) == false || $("#length").val() == ''){
    							  layer.alert("请正确填写上述信息！");
    						  }else{
    							  layer.alert("数据请求失败！");
    						  }
    						  $("#nextStepBtn").html("下一步");
    					  }
    			    }); */
    			    $.post(url,"transLanguage="+transLanguage+"&transDomain="+transDomain+"&level="+level+"&procedureType="+procedureType+"&length="+length+"&cycle="+cycle+"&time"+addTime,function(data){
    			    
    			    	if($("#moneyKilo").length>0){
    			    		
    			    	}else{
    			    		var ddd = "<label  class='col-xs-2 rowlabel'><b><spring:message code='每千字'/></b></label>"+
    			            "<div class='col-xs-2'><input style='color:red;' class='form-control' type='text' name='moneyKilo' id='moneyKilo' lay-verify='required'></div>"+
    			            "<label  class='col-xs-1 rowlabel' style='text-align: left;''><b><spring:message code='元'/></b></label>"+
    			            "<label  class='col-xs-6 rowlabel'><b><spring:message code='您选择的译员有'/><span style='color:red;' id='transCount'>0</span><spring:message code='位'/></span></b></label>";
    						
    			            $("#ddd").append(ddd);
    			    	}
    	            
    				$("#moneyKilo").val(""+data[2]);
    				
    				$("#ddd").css('display','block');
    				$("#nextStep").css('display','none');
    				
    				//旧Div，类型list
    				var append_cardId=document.getElementsByName("append_cardId");
    				//外围Div
    				var parentDiv=document.getElementById("transDiv");
    				//被选中的Div 类型list
    				var checkTrans=document.getElementsByName("checkTrans");
    				var checkCount=0;
    				for(var i=0;i<checkTrans.length;){
    					if(!(checkTrans[i].checked)){
    						parentDiv.removeChild(append_cardId[i]);
    					}else{
    						i++;
    						checkCount=checkCount+1;
    					}
    				}
    				if(data[1]>0){
    					var procedureType=document.getElementById("procedureType").value;
    					if((6-checkCount)>0){
    						for(var i=0;i<(6-checkCount);i++){
    							if(i<data[1]){
    								var title="";
    								if('1'==procedureType){
    									title=data[0][i].tranPrice;
    								}
    								if('2'==procedureType){
    									title=data[0][i].prooPrice;					
    														}
    								if('3'==procedureType){
    									title=data[0][i].auditPrice;
    								}
    								if(level == 3){
    							    	starlevel = "<font size='4px' color='green'><b>★★★</b></font>"
    							    }
    							    if(level == 4){
    							    	starlevel = "<font size='4px' color='	#FFBB00'><b>★★★★</b></font>"
    							    }
    							    if(level == 5){
    							    	starlevel = "<font size='4px' color='	#FF0000'><b>★★★★★</b></font>"
    							    }
    								var cards_one = "<div  class='append_card' name='append_cardId'>"+
    							    "<div class='cards_one text-right fl' style='padding:0px;padding-left:10px;height:310px;border-radius:10px;'>"+
    							    "<input name='checkTrans' id='"+data[0][i].id+"' type='checkbox' title='"+title+"' onclick='transKilo("+data[0][i].tranPrice+","+data[0][i].prooPrice+","+data[0][i].auditPrice+","+data[2]+")' value='"+data[0][i].id+"' style='display: block;' >"+
    							    "<p style='width:165px;margin-left:20px;text-align: left;'>"+"<span style='width:165px;' class='card_name' id='nickname'><font color='#000088'>"+data[0][i].nickname+"</font></span>"+"</p>"+
    							    "<img class='card_img' src='userUrl' alt='' width='80px' height='100px' >"+"<br>"+
    							    "<p hidden=''>"+"<span id='transId'>"+"</span>"+data[0][i].id+"</p>"+"<p>"+
    							    "<span id='level'>"+starlevel+"</span>"+"</p>"+"<p>"+
    							    "<span id='languages'>"+transLanguage+"</span>"+"</p>"+"<p>"+
    							    "<span id='degree'>"+data[0][i].degree+"</span>"+"</p>"+
    							    "<div class='texts_left'>"+
    							    "<p>"+"<spring:message  code='专业领域：'/>"+"<span id='trandomain'>"+transDomain+"</span>"+"</p>"+
    							    "<p>"+"<spring:message  code='翻译经验：'/>"+"<span>"+data[0][i].tranExperience+"</span>"+"</p>"+
    							    "<p>"+"<spring:message  code='校对经验：'/>"+"<span>"+data[0].prooExperience+"</span>"+"</p>"+
    							    "</div>"+"<div class='append_card_btn'>"+
    							    "<a href='javascript:checked("+data[0][i].id+","+data[0][i].tranPrice+","+data[0][i].prooPrice+","+data[0][i].auditPrice+","+data[2]+")' class='append_card_btn01' id='selectIt'><span><spring:message code='选'/>TA</span></a>"+
    							    "<a href='/translator/translatorAction_findTransById.do?transId="+data[0][i].id+"' class='append_card_btn02' id='lookTrans' >"+"详情"+"</a>"+"</div>"+
    							    "</div>"+
    							    "</div>";
    							$("#transDiv").append(cards_one);
    							}
    							
    							}
    					}
    					
    					$("#transDiv").append(selectedModel);
    					$("#hiddenDiv").show();
    				}else{
    					selectedModel="<input type='hidden' name='selected' value='主动投标模式' id='selectedModel'>";
    					/* layer.open({
    						  content: '<spring:message code="暂时没找到符合条件的译员，建议改为译员主动投标模式？"/>'
    						  ,btn: ['<spring:message code="确定"/>', '<spring:message code="取消"/>']
    						  ,btn1: function(index, layero){
    						    //按钮【按钮一】的回调
    						    layer.close(index);
    						    $("#hiddenDiv").hide();
    						    $("#transDiv").append(selectedModel);
    						  }
    						  ,btn2: function(index, layero){
    						    //按钮【按钮二】的回调
    						    layer.close(index);
    						    $("#hiddenDiv").hide();
    						   // $("#transDiv").append(selectedModel);
    						    
    						    //return false 开启该代码可禁止点击该按钮关闭
    						  }
    						  ,cancel: function(){ 
    						    //右上角关闭回调
    						    layer.close(index);
    						    $("#hiddenDiv").hide();
    						   // $("#transDiv").append(selectedModel);
    						    //return false 开启该代码可禁止点击该按钮关闭
    						  }
    						}); */
    					layer.alert('<spring:message code="暂时没找到符合条件的译员，建议改为译员主动投标模式"/>', {
    		  				icon: 5,
    		  				title: "<spring:message code='提示'/>"
    		  				});
    					cleanInter();
    				}
    				LayerHide();
    			  })
    			  .error(function(){
    				  LayerHide();
    				  if($("#length").val() == null || isInteger($("#length").val()) == false || $("#length").val() == ''){
    					  layer.alert("请正确填写上述信息！");
    				  }else{
    					  layer.alert("数据请求失败！");
    				  }
    				  $("#nextStepBtn").html("下一步");
    			  });
    		   }
      }



      		/* //对比报价
      		function contrast(trandPrice,proofPrice,veriPrice,procedureType){
      			if("1"==procedureType){
      				
      			}else if("2"==procedureType){
      				
      			}else if("3"==procedureType){
      				
      			}
      		} */

      		function transKilo(trandPrice,proofPrice,veriPrice,obj){	
      			//最初需求报价每千字
      			var transKilo=document.getElementById("moneyKilo").value;
      			
      			//比较被选中的译员中报价最高者
      			var checkTrans=document.getElementsByName("checkTrans");
      			
      			var checkedTranArr;
      			var cValue=0;
      			var cValue1=0;
      			var cValue2=0;
      			var checkedTransString="";
      			for(var i=0;i<checkTrans.length;i++){
      				if(checkTrans[i].checked){
      					checkedTransString+=checkTrans[i].title+",";
      					}			
      			}
      			//被选中多选框数组
      			
      			checkedTransString=checkedTransString.substring(0,checkedTransString.length-1);
      			checkedTranArr=checkedTransString.split(",");
      			 
      			for(var i=0;i<checkedTranArr.length;i++){
      				if(i==0){
      					cValue=checkedTranArr[i]
      				}else{
      					if(cValue<parseFloat(checkedTranArr[i])){
      						cValue=parseFloat(checkedTranArr[i])
      					}
      				}

      			}
      			
      			if(cValue==0){
      				document.getElementById("moneyKilo").value=obj;
      			}else{
      				document.getElementById("moneyKilo").value=cValue;
      			}
      				
      			
      			

      			
      			
      			var checkTrans=document.getElementsByName("checkTrans");
      			var checkTransCount=0;
      			for(var i=0;i<checkTrans.length;i++){
      				if(checkTrans[i].checked){
      					checkTransCount=checkTransCount+1;
      				}
      			}
      			//alert(checkTransCount);
      			var transCount=document.getElementById("transCount");
      			transCount.innerHTML = checkTransCount;
      			
      			
      		}



      		function assignedModel(obj){
      			var cycleValue=document.getElementById("cycle").value;
      			if("<spring:message code='特急'/>+"==cycleValue){
      				layer.alert('<spring:message code="由于项目翻译时间过短，平台提醒您项目只能以招标模式发布，您也可以联系客服，可能会更好的解决，客服电话：010-82893875"/>', {
      					icon: 5,
      					title: "<spring:message code='提示'/>"
      					});
      				 $(obj).prop("type","button");
      				return false;
      			}else{
      				var parentDIV=document.getElementById("transDiv");
      				var chilDIV=document.getElementsByName("append_cardId");//译员卡片
      				
      				//var chillength=parentDIV.childNodes.length;
      				//alert(chillength);
      				//alert(chilDIV.length);
      				
      				var selectModel=document.getElementById("selectedModel");//模式
      				
      				if(parentDIV&&chilDIV&&selectModel){
      					for(var a=0;a<chilDIV.length;){
      						//alert(chilDIV[2]);
      						parentDIV.removeChild(chilDIV[a]);
      						//alert(chilDIV.length);
      					}
      					parentDIV.removeChild(selectModel);		
      					document.getElementById("hiddenDiv").style.visibility="hidden";//隐藏
      				}
      				
      				
      				//移除原来的每千字表框
      				if($("#moneyKilo").length>0)
      				{
      				//存在
      					$("#ddd").empty();
      				}
      			}
      		}


      		function unsolicitedBid(){
      			var parentDIV=document.getElementById("transDiv");
      			var chilDIV=document.getElementsByName("append_cardId");
      			//var chillength=parentDIV.childNodes.length;
      			//alert(chillength);
      			//alert(chilDIV.length);
      			
      			var selectModel=document.getElementById("selectedModel");
      			if(parentDIV&&chilDIV&&selectModel){
      				for(var a=0;a<chilDIV.length;){
      					//alert(chilDIV[2]);
      					parentDIV.removeChild(chilDIV[a]);
      					//alert(chilDIV.length);
      				}
      				parentDIV.removeChild(selectModel);
      				document.getElementById("hiddenDiv").style.visibility="hidden";//隐藏
      			}
      			
      			
      			var selectedModel="<input type='hidden' name='selected' value='主动投标模式' id='selectedModel'>";
      			$("#model").append(selectedModel);
      			
      			
      			//移除原来的每千字表框
      			if($("#moneyKilo").length>0)
      			{
      			//存在
      				$("#ddd").empty();
      				/*var msgDiv=document.getElementById("msgDiv");
      				msgDiv.removeChild(document.getElementById("moneyKilo"));*/
      			}
      			
      			
      			//$("#publish").submit();  
      		}

      		function iscycle(){
      			$("#submit_button").prop("type","submit");
      			//alert("-----");
      			//cycle
      			//计算周期
      			var procedureType=document.getElementById("procedureType").value;
      			var length=document.getElementById("length").value;
      			var completeTime=document.getElementById("completeTime").value;
      			var myDate=new Date();    //可以获取当前日期
      			//时间差
      			var date2 = new Date(completeTime);
      			//var date1 = new Date(data.cusNeedList[i].publishTime);
      			 
      			var s1 = myDate.getTime(),s2 = date2.getTime();
      			var total = (s2 - s1)/1000;
      			 
      			 
      			var day = parseInt(total / (24*60*60));//计算整数天数

      			var transTime=Math.ceil(length/3000);//翻译需要时间
      			var proofTime=Math.ceil(length/6000);//校对时间
      			var audiTime=Math.ceil(length/8000);//审核时间
      			
      			var time=1;//流程处理时间 1天
      			if(procedureType==1){
      				time=time+transTime;
      			}else if(procedureType==2){
      				time=time+transTime+proofTime;
      			}else if(procedureType==3){
      				time=time+transTime+proofTime+audiTime;
      			}
      			$("#spanDIV").hide();
      			if(day<time){
      				//加急情况 计算加急时间
      				time=1;
      		 		var transTime2=Math.ceil(length/4000);//翻译需要时间
      				var proofTime2=Math.ceil(length/8000);//校对时间
      				var audiTime2=Math.ceil(length/10000);//审核时间
      				if(procedureType==1){
      					time=time+transTime2;
      				}else if(procedureType==2){
      					time=time+transTime2+proofTime2;
      				}else if(procedureType==3){
      					time=time+transTime2+proofTime2+audiTime2;
      				}
      				$("#spanDIV").hide();
      				if(day<time){
      					//特急情况 计算特急时间
      					time=1;
      					var transTime3=Math.ceil(length/5000);//翻译需要时间
      					var proofTime3=Math.ceil(length/10000);//校对时间
      					var audiTime3=Math.ceil(length/15000);//审核时间
      					if(procedureType==1){
      						time=time+transTime3;
      					}else if(procedureType==2){
      						time=time+transTime3+proofTime3;
      					}else if(procedureType==3){
      						time=time+transTime3+proofTime3+audiTime3;
      					}
      					$("#spanDIV").hide();
      					if(day<time){
      						//加钱
      						//alert(time-day);
      						$("#cycle").val("<spring:message code='特急'/>+");
      						/*var hiddenInput="<input type='hidden' name='addTime' id='addTime' value='"+(time-day)+"'>"*/
      						/*var hiddenInput=""*/
      						$("#spanDIV").show();
      						
      					}else{
      						//特急
      						$("#cycle").val("<spring:message code='特急'/>");
      					}
      				}else{
      					//加急
      					$("#cycle").val("<spring:message code='加急'/>");
      				}
      				
      			}else{
      				//一般情况
      				$("#cycle").val("<spring:message code='一般'/>");
      			}
      			
      			
      		}
      		
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
      	  	      function queryByInterpreter() {
      	   	 
      	   	 var nickName=$("#nickName").val();
      	   	 if(nickName!="" && nickName!="null" && nickName!=undefined){
      	   		 url="/translator/translatorAction_getTotalCount.do?msg="+nickName;
      				window.open(url);
      	   	 }else{
      	   		 layer.msg('<spring:message  code="译员名不能为空！"/>', {icon: 2});
      	   	 }
      			
      		}
  	</script>
    <style type="text/css">
  /*   *{
    webkit-box-sizing:inherit;
    -moz-box-sizing:inherit;
    box-sizing:inherit;
    } */
    	.a-upload {
    padding: 4px 10px;
    height: 30px;
    line-height: 20px;
    position: relative;
    cursor: pointer;
    color: #888;
    background: #fafafa;
    border: 1px solid #ddd;
    border-radius: 4px;
    overflow: hidden;
    display: inline-block;
    *display: inline;
    *zoom: 1
}

/* .a-upload  input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
    filter: alpha(opacity=0);
    cursor: pointer
} */

.a-upload:hover {
    color: #444;
    background: #eee;
    border-color: #ccc;
    text-decoration: none
}

.layui-form-radio {
   width: 100px;
   height: 30px;
   margin-bottom: 20px;
   margin-left: 15px;
}
.rowlabel {
	text-align: right;
	padding: 6px;
}
.row {
    margin-top: 30px;
}
.modeBtn {
	width:25%;
	margin-left:20px;
	float:left;
}
.downloadSpan:hover {
	text-decoration: underline;
	color:blue;
}
</style>

<title><spring:message code='发布项目'/></title>
</head>
<body style="background:#f1f1f1;">
<!--      顶部导航      -->
   	<c:if test="${clientid.id!=null || transid.id!=null }">
  	<div class="publickNav">
  		<div class="public_nav"> 
           <nav class="container" style="padding:0 20px;"> 
           <div class="navbar-left"><a href="?lang=zh_CN" class="navbar-link" onclick="in18(this)">中文</a> | <a href="?lang=en_US" class="navbar-link" onclick="in18(this)">English</a></div><a style="padding-left:50px;" href="/forwardAction/forward_toIndex.do"><spring:message  code='首页'/></a>
           <a style="padding-left:50px;"><spring:message  code='帮助热线：'/>010-82895385</a><a style="padding-left:50px;" target="_blank" href="http://www.aitrans.org:8081/"><spring:message  code='爱译社'/></a>
           <div class="navbar-right"> 
           <ul class="list-inline nav_lists">
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
        			<li style="color:#FFF"><a href="/forwardAction/forward_toLogin.do"><spring:message  code='客户中心'/></a></li>
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
                   
                   
                   

      <!--  发布需求 开始  -->
	<div class="publish_need">
        <div class="publish_progress">
          <ul class="nav nav-pills nav-justified step step-round"
										data-step="3">
    				<li>
    					<a><spring:message code='填写需求'/></a>
    				</li>
    				<li>
    					<a><spring:message code='确认需求'/></a>
    				</li>
    				<li>
    					<a><spring:message code='发布完成'/></a>
    				</li>
    			</ul>
        </div>

        <div class="publish_contents">
          <div class="publish_contents_left col-sm-9" id="parentDiv">
            <form class="layui-form" id="form" action="/cilentCustomer/lookPublish.do" method="post" id="publish" enctype="multipart/form-data">
            
            
            
            
<!-- ***************************************************************************************************************************************************** -->            
            	<div class="form-group row" id="msgDiv">
            	
            		<div class="row">
	               		<label  class="col-xs-2 rowlabel"><b><spring:message code='项目标题'/></b></label>
	              		<div class="col-xs-9">
	              			<input type="text" class="form-control" readonly="readonly" placeholder="<spring:message code='请输入需求标题'/>" name="title" id="title" autocomplete="off" lay-verify="title|required" value="${clientCustomerNeed.title }">
	              		</div>
	              	</div>
	              	
	              	<div class="row">
	               		<label  class="col-xs-2 rowlabel"><b><spring:message code='项目案号' /></b></label>
	              		<div class="col-xs-9">
	              			<input type="text" class="form-control" name="needReference" id="needReference" autocomplete="off" lay-verify="required" value="${clientCustomerNeed.needReference }" readonly="readonly">
	              		</div>
	              	</div>
	              	
	              	<div class="row">
                		<label  class="col-xs-2 rowlabel"><b><spring:message code='项目语言'/></b></label>
                  		<div class="col-xs-3">
                    		<input type="text" class="form-control" value="<spring:message code='${clientCustomerNeed.languagePair }'/>" readonly="readonly" autocomplete="off" lay-verify="required">
                    		<input name="languagePair" id="languagePair" type="hidden" class="form-control" value="${clientCustomerNeed.languagePair }" readonly="readonly" autocomplete="off" lay-verify="required">
                  		</div>
                		<label  class="col-xs-2 rowlabel"><b><spring:message code='项目领域'/></b></label>
                  		<div class="col-xs-3">
	                  		<c:forEach items="${doaminList }" var="domains">
		                  		<c:if test="${clientCustomerNeed.domainId==domains.id }">
		                  			<input class="form-control" value="<spring:message code='${domains.field }'/>" readonly="readonly" autocomplete="off" lay-verify="required">
                   	    			<input name="domain" id="domian" value="${clientCustomerNeed.domainId }" type="hidden" autocomplete="off" lay-verify="required">
		                  		</c:if>
		                    </c:forEach>
                  		</div>
                	</div>
                	
                	<div class="row">
                		<label  class="col-xs-2 rowlabel"><b><spring:message code='译员等级'/></b></label>
                  		<div class="col-xs-3">
                    		<input class="form-control" value="${clientCustomerNeed.transLevel }<spring:message code='级'/>"id="level" readonly="readonly" autocomplete="off" lay-verify="required">
                    		<input type="hidden" class="form-control" name="level" value="${clientCustomerNeed.transLevel }" readonly="readonly" autocomplete="off" lay-verify="required">
                  		</div>
                		<label  class="col-xs-2 rowlabel"><b><spring:message code='流程类型'/></b></label>
                  		<div class="col-xs-3">
                  			<c:forEach items="${procedureList }" var="procedure">
                  				<c:if test="${clientCustomerNeed.procedureTypeId==procedure.id }">
                  					<input class="form-control" value="${procedure.procedureType }" readonly="readonly" autocomplete="off" lay-verify="required">
                  					<input type="hidden"  name="procedureType" value="${procedure.id }"id="procedureType" readonly="readonly" autocomplete="off" lay-verify="required">
                  				</c:if>
		                    </c:forEach>
                  		</div>
                	</div>
                	
                	<div class="row">
	               		<label  class="col-xs-2 rowlabel"><b><spring:message code='项目详情'/></b></label>
	               		<div class="col-xs-9">
	                    	<textarea readonly="readonly" class="form-control layui-textarea" placeholder="<spring:message code='请输入需求详情'/>" name="description" id="description" autocomplete="off">${clientCustomerNeed.description }</textarea>
	                  	</div>
	            	</div>
	            	
	            	<div class="row">
	                	<label  class="col-xs-2 rowlabel"><b><spring:message code='翻译总字数'/></b></label>
	                  	<div class="col-xs-3">
	                  		<input readonly="readonly" type="text" class="form-control" placeholder="<spring:message code='翻译总字数'/>" name="length" id="length" onblur="iscycle()" autocomplete="off" lay-verify="length|required|number" value="${clientCustomerNeed.length }">
	                  	</div>
	                  	<label class="col-xs-6 rowlabel" style="color:#CC6600;text-align: left;"><spring:message code='若原稿字数少于500字，平台将按500字计算支付金额' /></label>
	                </div>
	                
	                <div class="row">
	                	<label  class="col-xs-2 rowlabel"><b><spring:message code='交稿时间'/></b></label>
	                  	<div class="col-xs-3">
	                    	<input type="text" class="form-control" name="completeTime" id="completeTime" readonly="readonly" lay-verify="required" value="${clientCustomerNeed.completeTime }">
	                  	</div>
	                	<%-- <label  class="col-xs-2 rowlabel"><b><spring:message code='项目过期时间'/></b></label>
	                  	<div class="col-xs-3">
	                    	<input type="text" class="form-control" name="trueTime" id="trueTime" readonly="readonly" lay-verify="required" value="${clientCustomerNeed.EXPIRYDATE }">
	                  	</div> --%>
	                </div>
	                
	                <div class="row">
	                	<label  class="col-xs-2 rowlabel"><b><spring:message code='周期'/></b></label>
	                  	<div class="col-xs-3">
	                    	<input type="text" class="form-control" name="cycle" id="cycle" readonly="readonly" lay-verify="required" value="${clientCustomerNeed.cycle }">
	                  	</div>
	                	<label id='spanDIV' hidden=true class="col-xs-6 rowlabel" style='color:red;'><b><spring:message code='由于项目翻译时间过短，平台提醒您项目只能以招标模式发布，您也可以联系客服，可能会更好的解决，客服电话：010-82893875'/></b></label>
	                </div>
	                
	                <div class="row">
	                	<label  class="col-xs-2 rowlabel"><b><font color="red">*</font><spring:message code='现在发布'/></b></label>
	                  	<div class="col-xs-9">
	                    	<input type="radio" value="Y" title="YES" name="need" autocomplete="off" lay-verify="required" lay-filter="needpublish" checked="checked">
	                    	<input type="radio" value="N" title="NO" name="need" autocomplete="off" lay-verify="required"  lay-filter="needpublish">
	                  	</div>
	                </div>
	                
	                <div class="row" style="margin-top:10px;">
	                	<label  class="col-xs-2 rowlabel"><b><spring:message code='已上传文件'/></b></label>
	                	<label  class="col-xs-1 rowlabel"></label>
	                	<label id="fileNameSpan" class="col-xs-7 rowlabel" style="text-align: left;">
		                	<c:forEach items="${fileNameMap }" var="needUserNames" varStatus="files">
			                	${needUserNames.key }
			                	<input type="hidden" id="fileurl_${files.count }" value="${needUserNames.value }">
			                	&nbsp;&nbsp;&nbsp;&nbsp;<%-- <span class="downloadSpan" style="color: red" onclick="down(this)"><spring:message code='下载' /></span><br> --%>
			                	<a style="color: red" href="javascript:;" onclick="down(${files.count })" ><spring:message code='下载' /></a><br>
	                    	</c:forEach>
						</label>
	                </div>
	                
                    <div class="row">
	                	<label class="col-xs-2 rowlabel"><b><spring:message code='补充文件' /></b></label>
	                  	<div class="col-xs-3">
	                    	<a id="btn_add1" style="margin-left:20px;" class="btn btn-primary marR10"><spring:message code='添加' /></a>
	                    	<a id="btn_del1" style="margin-left:20px;" class="btn btn-primary" onclick="del_1();"><spring:message code='删除'/></a>
	                  	</div>
	                  	<div class="col-xs-5">
	                    	<a href="javascript:;" class="a-upload" id="file1" class="a-upload" >
	    						<input type="file" name="filename"/><spring:message code='点击这里上传文件'/>
							</a>
	                  	</div>
	                </div>
	                
	                <div style="width:100%" id="newUploadDiv"></div>
	                
	                <div class="row">
	                	<label  class="col-xs-2 rowlabel"><b><font color="red">*</font>选择发布模式</b></label>
	                  	<div class="col-xs-9">
	                  		<c:if test="${clientCustomerNeed.publishModel=='选定译员模式' }">
		                  		<input id="tender" type="radio" name="submitModel" lay-filter="submitModel" value="1" title="<spring:message code='主动投标'/>" checked="">
		                  		<input id="systemDis" type="radio" name="submitModel" lay-filter="submitModel" value="2" title="<spring:message code='系统分配'/>">
	                  		</c:if>
	                  		<c:if test="${clientCustomerNeed.publishModel=='主动投标模式' }">
		                  		<input id="systemDis" type="radio" name="submitModel" lay-filter="submitModel" value="2" title="<spring:message code='系统分配'/>" checked="">
		                  		<input id="selectInter" type="radio" name="submitModel" lay-filter="submitModel" value="3" onclick="selectedTransModel()" title="<spring:message code='选定译员'/>">
	                  		</c:if>
	                  		<c:if test="${clientCustomerNeed.publishModel=='系统分配模式' }">
		                  		<input id="tender" type="radio" name="submitModel" lay-filter="submitModel" value="1" title="<spring:message code='主动投标'/>" checked="">
		                  		<input id="selectInter" type="radio" name="submitModel" lay-filter="submitModel" value="3" onclick="selectedTransModel()" title="<spring:message code='选定译员'/>">
	                  		</c:if>
	                  	</div>
	                </div>
	                
	                <div class="row" id='ddd' style="display:none ;"></div>
	                
	                <div id="hiddenDiv" style="display: none;width: 100%;">
		                <div class="row">
		               	 	<div class="col-xs-1"></div>
		                	<div class="col-xs-11" style="text-align: center;" id="transDiv"></div>
		                </div>
		                
		                <div class="row">
		                	<label  class="col-xs-7 rowlabel"></label>
		                	<div class="col-xs-3" style="text-align: right;">
		                		<button type='button' class='btn btn-primary' name='button' onclick="selectedTransModel()"><spring:message code='换一批'/></button>
		                	</div>
		                	<div class="col-xs-1">
		                		<button type='submit' class='btn btn-primary' name='button' id="publish" lay-filter="demo1" lay-submit=""><spring:message code='确认'/></button>
		                	</div>
		                </div>
	                </div>
	                
	                <div class="row" id="nextStep">
	                	<label  class="col-xs-10 rowlabel"></label>
	                  	<div class="col-xs-2">
	                  		<button type="submit" id="nextStepBtn" style="width:100px;" class="btn btn-primary" name="button" onclick="" lay-filter="demo1" lay-submit=""><spring:message code='下一步'/></button>
	                  	</div>
	                </div>
                	
            	</div>
<!-- ****************************************************************************************************************************************************** -->      
            
            
            
            
            
            
             <%--  <c:if test="${transId==null || transId=='' }"> --%>
              <%-- <div class="publish_contents_div">
                <h5>
														<spring:message code='选择翻译语言' />
													</h5>
                <div class="row">
                  <div
															class="list-inline publish_contents_lists height_list col-sm-10">
                    <input type="radio" name="languagePair" value="汉英"
																title="<spring:message code='汉译英'/>"
																<c:if  test="${clientCustomerNeed.languagePair=='汉英' }">checked="checked"</c:if>
																checked=""> 
                    <input type="radio" name="languagePair" value="英汉"
																title="<spring:message code='英译汉'/>"
																<c:if  test="${clientCustomerNeed.languagePair=='英汉' }">checked="checked"</c:if>>  
                   	<input type="radio" name="languagePair" value="韩汉"
																title="<spring:message code='韩译汉'/>"
																<c:if  test="${clientCustomerNeed.languagePair=='韩汉'}">checked="checked"</c:if>>
                    <input type="radio" name="languagePair" value="汉韩"
																title="<spring:message code='汉译韩'/>"
																<c:if  test="${clientCustomerNeed.languagePair=='汉韩' }">checked="checked"</c:if>>  
                    <input type="radio" name="languagePair" value="日汉"
																title="<spring:message code='日译汉'/>"
																<c:if  test="${clientCustomerNeed.languagePair=='日汉' }">checked="checked"</c:if>>  
                    <input type="radio" name="languagePair" value="汉日"
																title="<spring:message code='汉译日'/>"
																<c:if  test="${clientCustomerNeed.languagePair=='汉日' }">checked="checked"</c:if>>  
                    <input type="radio" name="languagePair" value="德汉"
																title="<spring:message code='德译汉'/>"
																<c:if  test="${clientCustomerNeed.languagePair=='德汉' }">checked="checked"</c:if>>  
                    <input type="radio" name="languagePair" value="汉德"
																title="<spring:message code='汉译德'/>"
																<c:if  test="${clientCustomerNeed.languagePair=='汉德'}">checked="checked"</c:if>>  
                    <input type="radio" name="languagePair" value="俄汉"
																title="<spring:message code='俄译汉'/>"
																<c:if  test="${clientCustomerNeed.languagePair=='俄汉' }">checked="checked"</c:if>>  
                    <input type="radio" name="languagePair" value="汉俄"
																title="<spring:message code='汉译俄'/>"
																<c:if  test="${clientCustomerNeed.languagePair=='汉俄' }">checked="checked"</c:if>>  
                    <input type="radio" name="languagePair" value="法汉"
																title="<spring:message code='法译汉'/>"
																<c:if  test="${clientCustomerNeed.languagePair=='法汉' }">checked="checked"</c:if>>  
                    <input type="radio" name="languagePair" value="汉法"
																title="<spring:message code='汉译法'/>"
																<c:if  test="${clientCustomerNeed.languagePair=='汉法'}">checked="checked"</c:if>>  
                  </div> 
                  <span class="col-sm-2 btn_more"><spring:message
																code='展开更多' /></span>
                </div>
              </div> --%>

              <%-- <div class="publish_contents_div">
                <h5>
														<spring:message code='选择项目领域' />
													</h5>
                <div class="row">
                  <div class="list-inline publish_jobs_lists height_list col-sm-10">
                    <c:forEach items="${doaminList }" var="domains">
                    	
                    	<input type="radio" name="domain" value="${domains.id }" title="<spring:message code='${domains.field }'/>"
						<c:if test="${clientCustomerNeed.domainId==domains.id }">checked="checked"</c:if>>
                    	
                    </c:forEach>
                  </div>
                  <span class="col-sm-2 btn_more_job"><spring:message
																code='展开更多' /></span>
                </div>
              </div> --%>

             <%--  <div class="form-group publish_contents_div">
                <div class="row">
                  <h5 class="col-sm-1 control-label">
															<spring:message code='译员等级' />
														</h5>
                  <div class="col-sm-3">
                    <select class="form-control" name="level" id="level"
																lay-verify="required">
                      <option value="3"
																	<c:if test="${clientCustomerNeed.transLevel==3 }">selected = "selected"</c:if>>3<spring:message
																		code='级' /></option>
                      <option value="4"
																	<c:if test="${clientCustomerNeed.transLevel==4 }">selected = "selected"</c:if>>4<spring:message
																		code='级' /></option>
                      <option value="5"
																	<c:if test="${clientCustomerNeed.transLevel==5 }">selected = "selected"</c:if>>5<spring:message
																		code='级' /></option>
                    </select>
                  </div>
                </div>
              </div> --%>
              <%-- <div class="form-group publish_contents_div">
                <div class="row">
                  <h5 class="col-sm-1 control-label">
														<spring:message code='流程类型' />
													</h5>
                  <div class="col-sm-3">
                    <select class="form-control" name="procedureType"
															id="procedureType" lay-verify="required">
                      <c:forEach items="${procedureList }" var="procedure">
                      	<option value="${procedure.id }"
							<c:if test="${clientCustomerNeed.procedureTypeId==procedure.id }">selected = "selected"</c:if>><spring:message code='${procedure.procedureType }'/></option>
                      </c:forEach>
                    </select>
                  </div>
                </div>
              </div> --%>
              <!--  <div class="form-group row" id="msgDiv"> -->
               <%-- <c:if test="${transId!=null &&transId!='' }">
              	  <div class="col-sm-5">
              		     需求语言： <input type="text" class="form-control" value="${clientCustomerNeed.languagePair }" name="languagePair" id="title" readonly="readonly" autocomplete="off" lay-verify="required">
                  </div><br><br><br><br>
                  <div class="col-sm-5">
                   	    需求领域：<input class="form-control" value="${filed.field }" id="domian" readonly="readonly" autocomplete="off" lay-verify="required">
                   	    	   <input  name="domain" value="${filed.id }" type="hidden" autocomplete="off" lay-verify="required">
                  </div><br><br><br><br>
                  <div class="col-sm-5">
                   	   译员等级：<input class="form-control" name="level" value="${clientCustomerNeed.transLevel }"id="level" readonly="readonly" autocomplete="off" lay-verify="required">
              	  </div><br><br><br><br>
               </c:if> --%>
               		
                  <%-- <div class="col-sm-5">
              		     <spring:message code='项目案号：' /> <input type="text"
														class="form-control" name="needReference"
														id="needReference" autocomplete="off"
														lay-verify="required"
														value="${clientCustomerNeed.needReference }"
														readonly="readonly">
                  </div>
												<br><br><br><br> --%>
                   <%-- <div class="col-sm-5">
              		     <spring:message code='项目标题：' /> <input type="text"
														class="form-control"
														placeholder="<spring:message code='请输入需求标题'/>"
														name="title" id="title" autocomplete="off"
														lay-verify="title|required"
														value="${clientCustomerNeed.title }">
                  </div>
												<br><br><br><br> --%>
                  <%-- <div class="col-sm-5">
                   	    <spring:message code='项目详情：' />
													<textarea class="form-control layui-textarea"
														placeholder="<spring:message code='请输入需求详情'/>"
														name="description" id="description" autocomplete="off"
														lay-verify="description|required">${clientCustomerNeed.description }</textarea>
                  </div>
												<br><br><br><br><br><br><br><br> --%>
                  <%-- <div class="col-sm-5">
                	  <spring:message code='翻译总字数（单位：字）' />
													<input type="text" class="form-control"
														placeholder="<spring:message code='翻译总字数'/>" name="length"
														id="length" onblur="iscycle()" autocomplete="off"
														lay-verify="length|required|number"
														value="${clientCustomerNeed.length }">
                	   <span style="color:red"><spring:message
															code='若原稿字数少于500字，平台将按500字计算支付金额' /></span>
                  </div>
												<br><br><br><br><br><br> --%>
                  <%-- <div class="col-sm-5">
                   	 <spring:message code='交稿时间：' />
													<input type="text" class="form-control" name="completeTime"
														id="completeTime" readonly="readonly" onchange="iscycle()"
														onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
														lay-verify="required"
														value="${clientCustomerNeed.completeTime }">
                  </div>
												<br><br><br><br>
                  <div class="col-sm-5">
                   	 <spring:message code='项目过期时间：' />
													<input type="text" class="form-control" name="trueTime"
														id="trueTime" readonly="readonly"
														onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
														lay-verify="required"
														value="${clientCustomerNeed.EXPIRYDATE }">
                  </div> <br><br><br><br> --%>
                  <%-- <div class="col-sm-5" id="cycleDIV">
                    <spring:message code='周期：' />
													<input type="text" class="form-control" name="cycle"
														id="cycle" readonly="readonly" lay-verify="required"
														value="${clientCustomerNeed.cycle }">
                   	 <div id='spanDIV' hidden=true>
														<span style='color:red'><spring:message
																code='由于项目翻译时间过短，平台提醒您项目只能以招标模式发布，您也可以联系客服，可能会更好的解决，客服电话：010-82893875' /></span>
													</div>
                  </div>   <br><br><br><br> --%>
                  <!-- <div class='col-sm-5' id='ddd'></div>           
                </div> -->
              
                
              <!--  <div class="form-group publish_contents_div">
                <div class="row">
                  <h5 class="col-sm-1 control-label">是否加急</h5>
                  <div class="col-sm-3">
                    <select class="form-control" name="cycle" lay-verify="required">
                      	<option value="特急">特急</option>
                      	<option value="加急">加急</option>
                      	<option value="一般">一般</option>
                    </select>
                  </div>
                </div>
              </div> -->
              
              <div class="publish_contents_div">
               <!--  <h5 class="control-label" style="margin-bottom:15px;">留下您的手机号,以便更好的为您服务</h5>
                <div class="form-group row" style="margin-bottom:15px;">
                  <label for="needtel" class="col-sm-1 control-label text_label"><span style="color:red;height:34px;line-height:34px">*</span>手机号</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" id="needtel" name="tel" autocomplete="off" lay-verify="required|number|phone">
                  </div>
                  <span style="color:red;height:34px;line-height:34px">必填</span>
                </div>
                <div class="form-group row">
                  <label for="needqq" class="col-sm-1 control-label text_label">QQ</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" id="needqq" name="qq" autocomplete="off" lay-verify="required|number">
                  </div>
                </div> -->
                <%-- <div class="form-group row">
                  <label for="needqq"
														class="col-sm-1 control-label text_label"><spring:message
															code='现在发布：' /></label>
                  <div>
                    <input type="radio" value="Y" title="YES"
															name="need" autocomplete="off" lay-verify="required"
															lay-filter="needpublish" checked="checked">
                    <input type="radio" value="N" title="NO" name="need"
															autocomplete="off" lay-verify="required"
															lay-filter="needpublish">
                  </div>
                </div> --%>
              </div>
			   <div class="publish_contents_div">
			   
			   
			   	<%--  <h5 class="control-label" style="display:inline-block;margin-bottom:15px;"> <spring:message code='已上传文件' />
												</h5> --%>
			     <%-- <div class="form-group row">
                  <!-- <label for="needqq" class="col-sm-1 control-label text_label">附件1：</label> -->
                  <div style="width: 300px">
                  
    				<c:forEach items="${fileNameMap }" var="needUserNames">
                        <p>
                          <span style="margin-right: 30px" id="fileNameSpan">${needUserNames.key }</span>
                          <input type="hidden" id="fileurl" value="${needUserNames.value }">
                          <a style="color: red" onclick="down(this)"><spring:message code='下载' /></a>                         
					   </p>
                    </c:forEach>
                  </div>
                 </div> --%>
			     <%-- <h5 class="control-label"
													style="display:inline-block;margin-bottom:15px;">
													<spring:message code='补充文件' />
												</h5> --%>
			     <%-- <div class="form-group row">
                  <!-- <label for="needqq" class="col-sm-1 control-label text_label">附件1：</label> -->
                  <div id="newUpload1" style="width: 300px">
                  	<a id="btn_add1" class="btn btn-primary marR10"><spring:message
																code='添加' /></a>
			    	<a id="btn_del1" class="btn btn-primary marR10"
															onclick="del_1();"><spring:message code='删除' /></a><br>
                    <!-- <input type="file" name="filename" id="file1" lay-ext="doc|txt|docx|jpg" lay-type="file" lay-title="请上传文件" class="layui-upload-file">       -->
                    <a href="javascript:;" class="a-upload" id="file1"
															class="a-upload">
    					<input type="file" name="filename" onclick="checkFile(this)" />
														<spring:message code='点击这里上传文件' />
					</a><br><br>
                    
                    <!-- <input type="file" id="file1" name="filename" class="a-upload"/> -->
                  </div>
                 </div> --%>
			   </div>
			   <div class="publish_contents_div" id="model">
               <!--  <h5 class="control-label" style="display:inline-block;margin-bottom:15px;">明确需求标题和详情</h5> -->
               <!--  <span style="padding-left:30px;">参照发布实例</span> -->
                
               <%-- 
                <c:if test="${transId!=null && transId !='' }">
                	<input name="checkTrans" value="${transId }" type="hidden">
                	<div class="col-sm-2" style="width:18%;">
                   		 <span>模式已选定为：</span><button type="button" class="form-control btn-info" >选定译员模式</button>
                   		 <input name="selected" value="选定译员模式" type="hidden">
                  	</div>
                  	 <button type='submit' class='form-control btn-info' name='button' id="publish" lay-filter="demo1" lay-submit="" style="width: 30%">确认</button>
                	<!-- <input name="selected" value="译员选中模式" type="hidden"> -->
                </c:if> --%>
                <c:if test="${transId==null || transId=='' }">
                <div class="form-group row">
                 <!--  <div class="col-sm-5">
                    <input type="text" class="form-control" placeholder="请输入需求名称" name="description">
                  </div> -->
                  <%-- <div class="col-sm-2" style="width:18%;">
                    <button type="submit" class="form-control btn-info"
																name="button" lay-filter="demo1" lay-submit=""
																onclick="unsolicitedBid()">
																<spring:message code='招标模式' />
															</button>
                  </div>
                 
                  <div class="col-sm-2" style="width:18%;">
                    <button type="submit" class="form-control btn-info"
																id="submit_button" name="button" lay-filter="demo1"
																lay-submit="" onclick="assignedModel(this)">
																<spring:message code='系统分配模式' />
															</button>
                  </div>
                  <div class="col-sm-2" style="width:18%;">
                    <button type="button" class="form-control btn-info"
																name="button" onclick="selectedTransModel()">
																<spring:message code='选定译员模式' />
															</button>
                  </div> --%>
                </div>
                </c:if>
                
              </div>
              <div id="hiddenDiv" style="display: none;">
               <div id="transDiv">
                <h5 class="control-label"
														style="display:inline-block;margin-bottom:15px;">
														<spring:message code='您选择的译员有：' />
													</h5>
				<span style="padding-left:30px;" id="parentCount"><spring:message
															code='您共选择译员' /><span id="transCount">0</span>
													<spring:message code='位' /></span>
               </div>
 			   <div style="margin-left:50%;margin: ">
 			     <button type='button' class='form-control btn-info'
														name='button' onclick="selectedTransModel()"
														style="width: 30%">
														<spring:message code='换一批' />
													</button>
													<br><br>
   			   	 <button type='submit' class='form-control btn-info'
														name='button' id="publish" lay-filter="demo1"
														lay-submit="" style="width: 30%">
														<spring:message code='确认' />
													</button>
 			   </div>
    		</div>
            </form>
           <form action="/clientCustomer/downloadTransFile.do" method="post" id='downForm'>
				<input type="hidden" name="url" id="url">
		   </form>
          </div>
          <div class="publish_contents_right col-sm-3">
            <!-- 热门需求  开始 -->
            <div class="hot_needs">
              <h4><spring:message code='发布模式简介'/></h4>

              <div class="hot_needs_cards">
                <h5><a href="#"><spring:message code='主动投标模式'/></a></h5>
                <p><spring:message code='点击“主动投标”按钮，进行主动投标模式项目的发布，此模式的项目需要译员主动上平台招标项目展示模块查找并接受该任务 ,在有满足项目需求的译员主动接受该项目是客户该项目会形成对应的订单。'/></p>
                <%-- <p class="hot_cards_text"><spring:message code='需要翻译的原文：中国自行车联赛组委会与各举办地共同举行盛大赛事'/></p>
                <p class="hot_text_weight"><spring:message code='价格：'/><span>500</span></p> --%>
              </div>
              <div class="hot_needs_cards">
                <h5><a href="#"><spring:message code='系统分配模式'/></a></h5>
                <p><spring:message code='点击“系统分配”按钮，进行系统分配模式项目的发布。选择此模式会针对满足项目需求的所有译员以短信通知的方式进行分批推送，在任何一个译员接受了请求之后则订单形成，平台同时停止推送。'/></p>
                <%-- <p class="hot_cards_text"><spring:message code='需要翻译的原文：中国自行车联赛组委会与各举办地共同举行盛大赛事'/></p>
                <p class="hot_text_weight"><spring:message code='价格：'/><span>500</span></p> --%>
              </div>
              <div class="hot_needs_cards">
                <h5><a href="#"><spring:message code='选定译员模式'/></a></h5>
                <p><spring:message code='点击“选定译员”按钮，进行选定译员模式项目的发布。选择此模式客户必须在平台已注册译员中选择一位或多位译员，针对发布项目，平台同时以短信方式通知各位译员，若某一个译员接受该项目则形成相应的订单'/></p>
                <%-- <p class="hot_cards_text"><spring:message code='需要翻译的原文：中国自行车联赛组委会与各举办地共同举行盛大赛事'/></p>
                <p class="hot_text_weight"><spring:message code='价格：'/><span>500</span></p> --%>
              </div>
            </div>
            <!--  热门需求结束  -->
            <!-- <div class="hot_advert">
              <img src="http://via.placeholder.com/270x140" alt="">
            </div> -->

          </div>
          <div class="clear"></div>
        </div>
      </div>
      <div class="clear"></div>

      <!--  发布需求 结束  -->

	 </div>
   <!-- 用户指南  -->
     <div id="gradient" class="footer_content">
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
      		<li><a href="/forwardAction/forward_toTeam.do"><spring:message  code='关于我们'/></a>|</li>  
      		<li><a href="/forwardAction/forward_toTeam.do"><spring:message  code='联系方式'/></a>| </li> 
      		<li><a href="http://www.aitrans.net"><spring:message  code='爱译智能'/>-CAT</a>|</li>  
      		<li><a href="javascript:;"><spring:message  code='支付方式'/></a>|</li>  
      		<li><a href="http://www.aitrans.org"><spring:message  code='友情链接'/></a>| </li> 
      		<li><a href="/forwardAction/forward_toSecurityCenter.do"><spring:message  code='安全中心'/></a></li>
      	</ul>
        <p class="footer_adress">Copyright 2005-2017 123.com版权所有 渝ICP备1234567-4号 渝B2-12134567 渝公安网备 1234567890号 互联网违法和不良信息举报电话：1234567 邮箱：123456.com</p>
      </footer>
     </div>
    <script type="text/javascript">
    $(function(){
      bsStep(1);
				//bsStep(i) i 为number 可定位到第几步 如bsStep(2)/bsStep(3)
    })
    
   /*  function needpublish(){
    	var need=document.getElementsByName("need").value;
	  alert(need);
	  if("Y"==need){
		  document.getElementById("form").action="/clientCustomer/lookPublish.do";
	  }if("N"==need){
		 // document.getElementById("form").action="/clientCustomer/lookPublish.do";
	  }
    } */
    	 
	//表单验证
	layui.use(['form', 'layedit', 'laydate'], function(){  
	      var form = layui.form()  
	      ,layer = layui.layer  
	      ,layedit = layui.layedit  
	      ,laydate = layui.laydate;  
	     // form.render();
	      //自定义验证规则  
	      form.verify({  
	            title: function(value){  
	              if((value.length < 1) && (value.length>21)){  
	                return "<spring:message code='标题至少得1个字符最多20字符'/>";  
	              }  
	            } /* , description: function(value){  
	              if(value.length < 10){  
	                return "<spring:message code='详情不能少于10个字符'/>" ;  
	              }  
	            } */, length: function(value){  
	              if(value< 1){  
	                return "<spring:message code='翻译不能小于1'/>";  
	              }  
	            }  
	           /*  ,phone: [/^1[3|4|5|7|8]\d{9}$/, '手机必须11位，只能是数字！']  
	            ,email: [/^[a-z0-9._%-]+@([a-z0-9-]+\.)+[a-z]{2,4}$|^1[3|4|5|7|8]\d{9}$/, '邮箱格式不对']    */
	      });  
	      
	    //模式监听
	      form.on('radio(submitModel)', function(data){
				console.log(data.elem); //得到radio原始DOM对象
				console.log(data.value); //被点击的radio的value值
				$("#transCount").html(0);
				var parentDIV=document.getElementById("transDiv");
			  	var chilDIV=document.getElementsByName("append_cardId");
			  	//var chillength=parentDIV.childNodes.length;
			  	//alert(chillength);
			  	//alert(chilDIV.length);
			  	var selectModel=document.getElementById("selectedModel");
			  	if(parentDIV&&chilDIV&&selectModel){
			  		for(var a=0;a<chilDIV.length;){
			  			//alert(chilDIV[2]);
			  			parentDIV.removeChild(chilDIV[a]);
			  			//alert(chilDIV.length);
			  	}
			  		parentDIV.removeChild(selectModel);
			  		/* document.getElementById("hiddenDiv").style.visibility="hidden";//隐藏 */
			  	}
				if(data.value == '3'){
					selectedTransModel();
				}else{
					//移除原来的每千字表框
	  				if($("#moneyKilo").length>0)
	  				{
	  				//存在
	  					$("#ddd").empty();
	  				}
			  		$("#hiddenDiv").css('display','none');
			  		$("#ddd").css('display','none');
					$("#nextStep").css('display','block');
					$("#nextStepBtn").html("下一步");
				}
			}) ;
	        
	      //创建一个编辑器  
	      layedit.build('LAY_demo_editor');  
	       
	   	  //radio监听
	     /*  form.on('radio(needpublish)', function(data){
	    	  console.log(data.elem); //得到radio原始DOM对象
	    	  console.log(data.value); //被点击的radio的value值
	    	  //alert(data.value);
	    	  if(data.value=='Y'){
	    		  //对比余额
	    		  if("${clientid.balance}"<=0){
	    			  alert("余额不够，请充值,否则无法发布！");
	    		  }
	    	  }
	    	});   */
	      
	      //监听提交  
	      form.on('submit(demo1)', function(data){ 	    	 
	    	  params = data.field;
		      submit($,params);
		    	}); 
	        //return false;  
	    /*   });  
 */	        
	      form.render(); //更新全部
	    }); 
	    
	  //遮罩层获取相对位置
		function Position() {  
			 $("#_MaskLayer_").width($(document).width());   
			  var deHeight = $(window).height();     
			  var deWidth = $(window).width();     
			  var scrollTop = document.body.scrollTop;
			  $("#_wait_").css({ left: (deWidth - $("#_wait_").width()) / 2 + "px", top: (((deHeight - $("#_wait_").height()) / 2) + scrollTop) + "px" }); 
			}
		//加载遮罩层
		function loadDiv(text) {
			var deHeight = document.body.scrollHeight;
		    var div = "<div id='_layer_'> <div id='_MaskLayer_' style='filter: alpha(opacity=30); -moz-opacity: 0.3; opacity: 0.3;background-color: #000; width: 100%; height: " + deHeight + "px; z-index: 1000; position: absolute;left: 0; top: 0; overflow: hidden; display: none'></div><div id='_wait_' style='z-index: 1005; position: absolute; width:430px;height:218px; display: none'  ><center><h3>" +                 "" + text + "<img src='/img/loading3.gif' /></h3></center></div></div>"; 
		   return div; 
		}
		//触发遮罩层
		function LayerShow(text) {
			var addDiv= loadDiv(text);  
		  	var element = $($.parseHTML("#" + addDiv, document, true)).appendTo(document.body);
		  	$(window).resize(Position);  
		  	var deHeight = $(document).height();    
			var deWidth = $(document).width();    
		 	Position();     
			$("#_MaskLayer_").show();   
		  	$("#_wait_").show();
		}
		//隐藏遮罩层
		function LayerHide() { 
			$("#_MaskLayer_").hide(); 
			$("#_wait_").hide(); 
			del(); 
			}
		//清空div,避免产生重复
		function del() { 
			 var delDiv = document.getElementById("_layer_");     delDiv.parentNode.removeChild(delDiv);  
		}
	    
	  //清除译员模式
		function cleanInter(){
			$("#transCount").html(0);
			var parentDIV=document.getElementById("transDiv");
		  	var chilDIV=document.getElementsByName("append_cardId");
		  	//var chillength=parentDIV.childNodes.length;
		  	//alert(chillength);
		  	//alert(chilDIV.length);
		  	var selectModel=document.getElementById("selectedModel");
		  	if(parentDIV&&chilDIV&&selectModel){
		  		for(var a=0;a<chilDIV.length;){
		  			//alert(chilDIV[2]);
		  			parentDIV.removeChild(chilDIV[a]);
		  			//alert(chilDIV.length);
		  	}
		  		parentDIV.removeChild(selectModel);
		  		/* document.getElementById("hiddenDiv").style.visibility="hidden";//隐藏 */
		  	}
		  	//移除原来的每千字表框
			if($("#moneyKilo").length>0)
			{
			//存在
				$("#ddd").empty();
			}
		  	$("#hiddenDiv").css('display','none');
		  	$("#ddd").css('display','none');
			$("#nextStep").css('display','block');
			$("#nextStepBtn").html("下一步");
		}
	    
	    $("#form").submit(function(){
			var cycleValue=document.getElementById("cycle").value;
			var modelElms = document.getElementsByName("submitModel");
			var modelVal;
			for(var i = 0; i < modelElms.length; i++){
				if(modelElms[i].checked == true){
					modelVal = modelElms[i].value;
				}
			}
			if(modelVal == 3){
				if( "特急+"!=cycleValue && $("#selectedModel").val() == "选定译员模式"){
					return true;
				}else{
					layer.alert("请重新选择模式！");
					return false;
				}
			}else if(modelVal == 2){
				assignedModel();
			}else if(modelVal == 1){
				unsolicitedBid();
			}else{
				layer.alert("请选择发布模式！");
				return false;
			}
		});
	    
	    function isInteger(str){   
			if(/^-?\d+$/.test(str)){   
		    	return true;   
		    }   
		    return false;   
		} 
	    
	    function checked(id,trandPrice,proofPrice,veriPrice,obj){
			var checkBox = document.getElementById(id);
			if(checkBox.checked == false){
				checkBox.checked = true;
			}else if(checkBox.checked == true){
				checkBox.checked = false;
			}
			transKilo(trandPrice,proofPrice,veriPrice,obj);
		}
	    
	    function down_load(path){
	    	var inputElement=document.getElementById("url").value;
			var spanEle=document.getElementById("fileNameSpan").innerHTML; 
			var formEle=document.getElementById("form");
			formEle.action="/cilentCustomer/downloadTransFile.do?url="+inputElement+"&filename="+spanEle;
			formEle.submit();
	    }
    </script>
<div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>