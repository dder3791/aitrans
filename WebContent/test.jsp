<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
	<style type="text/css">  
body{  
    margin:0px;    
    background-color: white;   
    font-family: 'PT Sans', Helvetica, Arial, sans-serif;    
    text-align: center;    
    color: #A6A6A6;    
}  
/*输入框样式，去掉背景阴影模仿原生应用的输入框*/  
input{  
width: 100%;    
height: 50px;    
border:none;    
padding-left:3px;    
font-size: 18px;    
}  
input:focus {    
    outline: none;    
}  
/*显示隐藏密码图片*/  
img{  
width: 40px;  
height: 25px;  
position: absolute;    
right: 0px;   
margin: 15px; 
margin-right:60px   
}  
/*登录按钮*/  
button{    
    width: 200px;    
    height: 50px;    
    margin-top: 25px;    
    background: #1E90FF;    
    border-radius: 10px;    
    border:none;  
    font-size: 18px;  
    font-weight: 700;    
    color: #fff;  
}  
button:hover {  
background: #79A84B;    
outline: 0;  
}  
/*输入框底部半透明横线*/  
.input_block {  
    border-bottom: 1px solid rgba(0,0,0,.1);  
}  
/*container*/  
#page_container{  
    margin: 50px;  
}  
</style> 
<script type="text/javascript">  
    // 这里使用最原始的js语法实现，可对应换成jquery语法进行逻辑控制  
    var demoImg = document.getElementById("demo_img");  
    var demoInput = document.getElementById("demo_input");  
    //隐藏text block，显示password block  
    function hideShowPsw(){
        if (isContains(demo_img.src,'eyeNo')) {  
        	$("#demo_input").attr("type","text")
            demo_img.src = "/img/eyeOFF.png";  
        }else {  
        	$("#demo_input").attr("type","password");
            demo_img.src = "/img/eyeNo.png";  
        }  
    }  
    
    function isContains(str, substr) {//str长字符串，substr短字符串
        return new RegExp(substr).test(str);
    }

    
</script> 

<script language="JavaScript" type="text/javascript">  
function GetDateStr(AddDayCount) {  
    var dd = new Date();  
    dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期  
    var y = dd.getFullYear();  
    var m = dd.getMonth()+1;//获取当前月份的日期  
    var d = dd.getDate();  
    return y+"-"+m+"-"+d;  
}  
document.write("前天："+GetDateStr(-2));  
document.write("<br />昨天："+GetDateStr(-1));  
document.write("<br />今天："+GetDateStr(0));  
document.write("<br />明天："+GetDateStr(1));  
document.write("<br />后天："+GetDateStr(2));  
document.write("<br />大后天："+GetDateStr(3)+" 00:00:00");  
</script>  
  
  </head>
  <body style="background:#f5f5f5;">
  	<div id="page_container">  
    <!--密码输入框-->  
    <div class="input_block">  
        <img id="demo_img" onclick="hideShowPsw()" src="/img/eyeNo.png">  
        <input type="password" id="demo_input" placeholder="Password"/>  
    </div>  
  
    <button onclick="">Login</button>  
</div>  

  <div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
