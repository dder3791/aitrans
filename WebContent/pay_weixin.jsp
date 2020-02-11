<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>
		<meta charset="UTF-8" />
		<meta name="Description" content="<spring:message code='爱译充值网'/>">
	    <meta name="keywords" content="<spring:message code='爱译'/>">
	    <title><spring:message code='爱译扫描支付'/></title>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">	
		<link href="${pageContext.request.contextPath}/css/pay.css" rel="stylesheet">		
		<script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
		<script type="text/javascript" src="js/include.js"></script>
		<script type="text/javascript" src="js/tqutils.js"></script>
	</head>
	<body>		
		<%-- <include src="${pageContext.request.contextPath}/head.jsp"></include> --%>
		<div class="container" style="top:10px">
	        <div class="pw-hd" style="margin-bottom: 0px">
            	<img alt="" style="width:160px;height:40px;" src="${pageContext.request.contextPath}/img/wechatpay2.jpg" >
	        <div class="price" style="margin-top:12px;"><spring:message code='支付总金额：'/><span id="payMoneys">￥${total}</span></div></div>
            	<div class="pw-bd"  style="border-top-color: #00DD00;">
	       <!--  <div class="pw-bd"  style="border-top-color: #00DD00;"> -->
	            <!-- <h2><div  id="title"></div></h2> -->
	            <div class="sweep clearfix" style="">
	                <!-- <div class="img"></div> -->
	                <div class="qrcode" style="height:350px; width:350px;margin-left: 25%;margin-top: 15px" >
	                    <img id="id_wxtwoCode" src="/payReturn/toGetcodeUrl.do?payType=${payType}&total=${total}&userId=${userId}&out_trade_no=${out_trade_no}" height="350" width="350" > 
	                    <br><br>
	                  
	                     <spring:message code='请使用微信扫一扫'/><br><spring:message code='扫描二维码支付'/>
	                  
	                    
	                </div>
	                   
	               
	               </div>
	          </div>
	      <!--       <div class="other-payment"><a href="javascript:0" onclick="otherPay()"><i></i>选择其他支付方式</a></div>
	      </div>  --> 
	    </div>
		
		
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>		
<script type="text/javascript" src="js/tqutils.js"></script>		
<script type="text/javascript">
//定时检查订单状态 如果为已支付跳转页面
	var out_trade_no = "${out_trade_no}";
	var time=setInterval(function(){
		$.post("/payReturn/checkState.do",{"out_trade_no":out_trade_no},function(data){
			if(data.result=="success"){
				//跳转页面
				clearInterval(time);  
				window.location="/payReturn/success.do?type='weixin'"
			}else{
				
				/* clearInterval(time);   */
			}
		});
		
	},1000);
   // alert(window.location.search.substring(1));
    /*new Include39485748323().replaceIncludeElements();
	var id=getUrlParameter("type");	
	var money=getUrlParameter("money");
	 var typephone=getUrlParameter("typephone");
	var oid=getUrlParameter("oid");
	$("#payMoneys").html(money);
	 alert(1);
	if(id=="weixin"){
	    $("#title").html("微信支付");	
	    alert(1);
	    getImg();
	}else if(id=="alipay"){
	    $("#title").html("支付宝支付");
	}else{
	    $("#title").html("银行卡支付");
	}
	 */
	  
	//定时查询订单状态   
     /*  function checkOrder(oid) {  
           //  console.log("定时器方法"+orderId);  
            
        	var time = setInterval(function(){  
                 $.post("../order/checkOrder?oid="+oid,function(data){ 		        	 
			        var paystatus = data.state; 
			        var out_trade_no = oid;  
			          if(paystatus=="2"){   
			              clearInterval(time);  
			              window.location="index.jsp"
			          }else if(paystatus=="7"){  
			              //支付失败  
			              alert("支付失败！");  
			              clearInterval(time);  
			          }  
			         
			    }); 
                },1000); 
      }   */
      
	
  /* function getImg(){  
     alert(1);   
     $.ajax({
			type : "post",
			url : "../payReturn/toGetcodeUrl",
			async : false,
			data : {
				"out_trade_no" : oid
			},
			success : function(data) {
			
			    $(".weimg").show();
             var codeUrl = data.codeUrl;  
			    if(codeUrl!=null && codeUrl!=""){  
			    $("#id_wxtwoCode").attr('src',"../payCode/create?code_url="+codeUrl); 
			    
			    checkOrder(oid) ; 
			    }  
                 
			}
		});
  }   */
/*        $.ajax({
					type : "post",
					url : "../payReturn/toGetcodeUrl",
					async : false,
					data : {
						"out_trade_no" : oid
					},
					success : function(data) {
					
					    $(".weimg").show();
	                    var codeUrl = data.codeUrl;  
					    if(codeUrl!=null && codeUrl!=""){  
					    $("#id_wxtwoCode").attr('src',"../payCode/create?code_url="+codeUrl); 
					    
					    checkOrder(oid) ; 
					    }  
	                        
					}
		 });
     } */
/* 	function otherPay(){		
	    if(typephone=="Mobile"){
	    alert("dvd");
	    window.location="../TqzlTraveling/tqwhAPP/orderPay.html?allMoney="+money+"&oid="+oid;	   
	   }else{
	     window.location="../TqzlTraveling/pay.jsp?allMoney="+money+"&oid="+oid;
	   } 
	} */

</script>
	<div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>

</html>