<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name=" Keywords" content="......">
<!--content中，网页关键字-->
<meta name=" description" content="......">
<!--content中，网页描述文字-->
<meta name="author" content="......">
<!--标注作者-->
<title>案例展示</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/case.demonstration.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/page.css" type="text/css"/>

<script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.nav.footer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script>

<style type="text/css">
      .case_uls{
        margin-top: 50px;
      }
      .case_lists{
        border-left: none;
        border-right: none;
        background:#f2f2f2;
        margin: 5px auto;
        width: 80%;
      }
      .case_lists a{
        color:#8db5e3;
        padding-left: 20px;
        display: inline-block;
        width: 80%;
        overflow: hidden;
      }
      .case_lists span{
        padding-right:20px;
      }
       
    </style> 
<script type="text/javascript">
	$(function() {
		//总记录数
		var totalCount = '${page.totalCount }';
		//当前页
		var pageNum = '${page.pageNum}';
		//分类类型
		var type = "";
		//区分是否是第一次进行分类跳转
		var o = 0;
		// 初始化加载分页下标
		// currentPage 当前页码
		
		//翻页的点击事件
		var GG = {
			"kk" : function(mm) {
				//给予初始化赋值
				if (isNaN(mm)) {
					mm = 1;
				}
				;

				// 判断是否是按类型分类的第一次，然后发起请求
				if (o != 2) {
					//异步请求调取查询后的数据
					$.ajax({
						type : "POST",
						url : "/article/articleAction_queryByAll.do",
						data : "pageNum=" + mm + "&type=" + type,
						cache : false,
						dataType : "json",
						success : function(data) {
							//获取当前表格的tr对象
							var trs = $(".infor_tr")
							//删除所有tr对象
								trs.remove();
						
							// 生成 tr  td  标签
							var tr = '<tr class="infor_tr"></tr>'
							var td = '<td class="infor_td">' + '</td>' 

							// 循环 生成表格
							for (var i = 0; i < data.articles.length; i++) {

								$(".information_table").append(tr);
								for (var j = 0; j < 2; j++) {

									$(".infor_tr").eq(i).append(td);
								}
							}
							// 往表格td 中添加元素  
							var button_span = '<a href="" target="_blank">'
									+ '<span class="btn_01 btn_Style">'
									+ '</span>'
									+ '<span class="btn_02 btn_Style">'
									+ '</span>' + '<span class="info_text">'
									+ '</span>' + '</a>'
							var span = '<span class="info_time">' + '</span>'

							$(".infor_td:first-child").html(button_span);
							$(".infor_td:last-child").html(span);

							// 往表格td中遍历内容
							$.each(data.articles, function(idx, obj) {


								$(".info_text").eq(idx).html(obj.title);
								$(".info_time").eq(idx).html(obj.issueDate);
								$('.info_text')[idx].parentNode.setAttribute(
										"href",
										"/article/articleAction_queryById.do?id="
												+ obj.id);
								if ($(".btn_01").eq(idx).text() == "") {
									$(".btn_01").eq(idx).removeClass(
											"btn_Style")
								}
								if ($(".btn_02").eq(idx).text() == "") {
									$(".btn_02").eq(idx).removeClass(
											"btn_Style")
								}
							});

							$(".infor_tr").hover(
									function() {
										$(this).find(
												".info_text,.btn_01,.btn_02")
												.css("color", "#8db5e3");
									},
									function() {
										$(this).find(
												".info_text,.btn_01,.btn_02")
												.css("color", "#222");
									});

						}

					});

				}
				o = 1;//给以第一次分类后进行特殊赋值处理
			}
		}
		
		//初始化分页栏设置
		$("#page").initPage(totalCount, pageNum, GG.kk);
		//给予分类添加事件
		
		$(".form-control").change(
				function() {
					//获取当前分类名称
					type = $(this).val();
					o = 2;
					$.ajax({
						type : "POST",
						url : "/article/articleAction_queryByAll.do",
 
						data : "type=" + type + "&pageNum" + 1,
 
						data : "type="+type+"&pageNum=" + 1,
 
						cache : false,
						dataType : "json",
						success : function(data) {
							var trs = $(".infor_tr")

							for (var ii = 0; ii < trs.length; ii++) {
								trs[ii].remove();
							}

							//  tr  td
							var tr = '<tr class="infor_tr"></tr>'
							var td = '<td class="infor_td">' + '</td>'

							// 循环 生成表格
							for (var i = 0; i < data.articles.length; i++) {

								$(".information_table").append(tr);
								for (var j = 0; j < 2; j++) {

									$(".infor_tr").eq(i).append(td);
								}
							}

							// 往表格td 中添加元素
							var button_span = '<a href="" target="_blank">'
									+ '<span class="btn_01 btn_Style">'
									+ '</span>'
									+ '<span class="btn_02 btn_Style">'
									+ '</span>' + '<span class="info_text">'
									+ '</span>' + '</a>'
							var span = '<span class="info_time">' + '</span>'

							$(".infor_td:first-child").html(button_span);
							$(".infor_td:last-child").html(span);

							// 往表格td中遍历内容
							$.each(data.articles, function(idx, obj) {

								if (obj.hot == 0) {
									$(".btn_01").eq(idx).html("");
								} else {
									$(".btn_01").eq(idx).html("热");
								}

								if (obj.elite == 0) {
									$(".btn_02").eq(idx).html("");
								} else {
									$(".btn_02").eq(idx).html("精");
								}

								$(".info_text").eq(idx).html(obj.title);
								$(".info_time").eq(idx).html(obj.issueDate);
								$('.info_text')[idx].parentNode.setAttribute(
										"href",
										"/article/articleAction_queryById.do?id="
												+ obj.id);
								if ($(".btn_01").eq(idx).text() == "") {
									$(".btn_01").eq(idx).removeClass(
											"btn_Style")
								}
								if ($(".btn_02").eq(idx).text() == "") {
									$(".btn_02").eq(idx).removeClass(
											"btn_Style")
								}
							});

							$(".infor_tr").hover(
									function() {
										$(this).find(
												".info_text,.btn_01,.btn_02")
												.css("color", "#8db5e3");
									},
									function() {
										$(this).find(
												".info_text,.btn_01,.btn_02")
												.css("color", "#222");
									});
							//重新初始化分页配置信息
							$("#page").initPage(data.page.totalCount,
									data.page.pageNum, GG.kk);
						}

					});
					
				});
		$(".news_information").click(function(){
			window.location.href="/article/articleAction_getTotalCount.do";
	   });
	  $(".top_information").click(function(){
			//获取当前分类名称
			type = $(this).text();
			o = 2;

			// 发起请求
			$.ajax({
				type : "POST",
				url : "/article/articleAction_queryByAll.do",
				data : "type="+type+"&pageNum=" + 1,
				cache : false,
				dataType : "json",
				success : function(data) {
					var trs = $(".infor_tr")

					for (var ii = 0; ii < trs.length; ii++) {
						trs[ii].remove();
					}

					//  tr  td
					var tr = '<tr class="infor_tr"></tr>'
					var td = '<td class="infor_td">' + '</td>'

					// 循环 生成表格
					for (var i = 0; i < data.articles.length; i++) {

						$(".information_table").append(tr);
						for (var j = 0; j < 2; j++) {

							$(".infor_tr").eq(i).append(td);
						}
					}

					// 往表格td 中添加元素
					var button_span = '<a href="" target="_blank">'
							+ '<span class="btn_01 btn_Style">'
							+ '</span>'
							+ '<span class="btn_02 btn_Style">'
							+ '</span>' + '<span class="info_text">'
							+ '</span>' + '</a>'
					var span = '<span class="info_time">' + '</span>'

					$(".infor_td:first-child").html(button_span);
					$(".infor_td:last-child").html(span);

					// 往表格td中遍历内容
					$.each(data.articles, function(idx, obj) {

						if (obj.hot == 0) {
							$(".btn_01").eq(idx).html("");
						} else {
							$(".btn_01").eq(idx).html("热");
						}

						if (obj.elite == 0) {
							$(".btn_02").eq(idx).html("");
						} else {
							$(".btn_02").eq(idx).html("精");
						}

						$(".info_text").eq(idx).html(obj.title);
						$(".info_time").eq(idx).html(obj.issueDate);
						$('.info_text')[idx].parentNode.setAttribute(
								"href",
								"/article/articleAction_queryById.do?id="
										+ obj.id);
						if ($(".btn_01").eq(idx).text() == "") {
							$(".btn_01").eq(idx).removeClass(
									"btn_Style")
						}
						if ($(".btn_02").eq(idx).text() == "") {
							$(".btn_02").eq(idx).removeClass(
									"btn_Style")
						}
					});

					$(".infor_tr").hover(
							function() {
								$(this).find(
										".info_text,.btn_01,.btn_02")
										.css("color", "#8db5e3");
							},
							function() {
								$(this).find(
										".info_text,.btn_01,.btn_02")
										.css("color", "#222");
							});
					//重新初始化分页配置信息
					$("#page").initPage(data.page.totalCount,
							data.page.pageNum, GG.kk);
				}

			});
		
			
			
			
		});
		
	});

</script>

</head>
<body style="background:#f5f5f5;">
	<!--      顶部导航      -->
  	<c:if test="${clientid.id!=null || transid.id!=null }"><div class="publickNav"></div></c:if>
    
    <c:if test="${clientid.id==null && transid.id==null }"><div class="publickNavs"></div></c:if>

	<!--   正文内容   -->
	<div class="container">

		<!--  logo 搜索栏  -->
		<nav class="publickSearch"></nav>

		<!--  内容头部导航  -->
		<div class="contentNav"></div>
			<div class="input-group" style="width:500px;margin:0 auto;margin-top:30px;">
            <input type="text" class="form-control" placeholder="请输入所查询的领域">
            <span class="input-group-btn">
              <button class="btn btn-info" type="button">搜索领域</button>
            </span>
          </div>

		<!-- 咨讯信息  内容 开始  -->
	    <h3>案例展示</h3>
		<div class="case_demo">
			<div class="case_demo_content">
			<div class="information_content">
				<!-- <input type="hidden" name="id" value="10"> -->
				<div class="inf_table_content">
					<table class="table table-striped information_table ">
						<tr class="table_th">
							<th>案例名称</th>
							<th>所属领域</th>
						</tr>
					</table>
				</div>
				<!--currentpage="1" numbercount="100"-->
				<div class="common_problem_page pull-right" style="padding-top:30px;padding-right:120px;">
					<ul class="page" maxshowpageitem="5" pagelistcount="10" id="page"></ul>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<!--  咨讯信息  内容  结束  -->

		<!-- 用户指南  -->
		<div class="messages"></div>

		<!--  login footer  -->
		<footer class="container register_footer cl"></footer>
      </div>
	</div>

<div style="display: none;"><script src="http://s22.cnzz.com/z_stat.php?id=1272898906&web_id=1272898906" language="JavaScript"></script></div></body>
</html>
