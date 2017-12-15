<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>主要内容区</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link rel="stylesheet" href="css/bootstrap.min.css" >
<!-- //bootstrap-css -->
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/style-responsive.css" rel="stylesheet"/>
<!-- font-awesome icons -->
<link rel="stylesheet" href="css/font.css" type="text/css"/>
<link href="css/font-awesome.css" rel="stylesheet"> 
<link rel="stylesheet" href="css/morris.css" type="text/css"/>
<!-- calendar -->
<link rel="stylesheet" href="css/monthly.css">
<!-- //calendar -->
<!-- //font-awesome icons -->
<script src="js/jquery2.0.3.min.js"></script>
<script src="js/raphael-min.js"></script>
<script src="js/morris.js"></script>
<script type="text/javascript">
function checkForm(){
	var search_ = /^[0-9]*$/;
	var search = document.getElementById("search");
	if(search.value.match(search_)==null){
		alert("ID均为数字，请输入数字！");
		return false;
	}else{
		return true;
	}
	
}
</script>
<style>
body{overflow-x:hidden; background:#f2f0f5; padding:15px 0px 10px 5px;}
#main{ font-size:12px;}
#main span.time{ font-size:14px; color:#528dc5; width:100%; padding-bottom:10px; float:left}
#main div.top{ width:100%; background:url(images/main/main_r2_c2.jpg) no-repeat 0 10px; padding:0 0 0 15px; line-height:35px; float:left}
#main div.sec{ width:100%; background:url(images/main/main_r2_c2.jpg) no-repeat 0 15px; padding:0 0 0 15px; line-height:35px; float:left}
.left{ float:left}
#main div a{ float:left}
#main span.num{  font-size:30px; color:#538ec6; font-family:"Georgia","Tahoma","Arial";}
.left{ float:left}
div.main-tit{ font-size:14px; font-weight:bold; color:#4e4e4e; background:url(images/main/main_r4_c2.jpg) no-repeat 0 33px; width:100%; padding:30px 0 0 20px; float:left}
div.main-con{ width:100%; float:left; padding:10px 0 0 20px; line-height:36px;}
div.main-corpy{ font-size:14px; font-weight:bold; color:#4e4e4e; background:url(images/main/main_r6_c2.jpg) no-repeat 0 33px; width:100%; padding:30px 0 0 20px; float:left}
div.main-order{ line-height:30px; padding:10px 0 0 0;}
</style>
</head>
<body>
<section id="container">
<!--header start-->
<header class="header fixed-top clearfix">
<!--logo start-->
<div class="brand">
    <a href="index.html" class="logo">
        VISITORS
    </a>
    <div class="sidebar-toggle-box">
        <div class="fa fa-bars"></div>
    </div>
</div>
<!--logo end-->
<div class="nav notify-row" id="top_menu">
	<!--  notification start -->
    <ul class="nav top-menu">
        <!-- settings start -->
        <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <i class="fa fa-tasks"></i>
            </a>
        </li>
        <li id="header_inbox_bar" class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <i class="fa fa-envelope-o"></i>
            </a>
        </li>
        <li id="header_notification_bar" class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <i class="fa fa-bell-o"></i>
            </a>
        </li>
    </ul>
    <!--  notification end -->
</div>

<div class="top-nav clearfix">
    <!--search & user info start-->
    <ul class="nav pull-right top-menu">
        <li>
            <input type="text" class="form-control search" placeholder=" Search">
        </li>
        <!-- user login dropdown start-->
        <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <span>欢迎您</span>
                <span class="username">${loginAdmin.adminname}</span>
                <b class="caret"></b>
            </a>
        </li>
        <!-- user login dropdown end -->
    </ul>
    <!--search & user info end-->
</div>
</header>
<!--sidebar start-->
<aside>
    <div id="sidebar" class="nav-collapse">
        <!-- sidebar menu start-->
        <div class="leftside-navigation">
            <ul class="sidebar-menu" id="nav-accordion">
                <li>
                    <a class="active" href="index.jsp">
                        <i class="fa fa-dashboard"></i>
                        <span>系统首页</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>用户管理</span>
                    </a>
                    <ul class="sub">
						<li><a href="showAllUsers.action">用户列表</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-th"></i>
                        <span>订单管理</span>
                    </a>
                    <ul class="sub">
                        <li><a href="showAllOrders.action">订单列表</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-tasks"></i>
                        <span>商品管理</span>
                    </a>
                    <ul class="sub">
                        <li><a href="showAllProducts.action">商品列表</a></li>
                        <li><a href="addProduct.jsp">商品添加</a></li>
                    </ul>
                </li>
            </ul> 
        </div>
    </div>
</aside>
<section id="main-content">
<section class="wrapper">
<form action="searchProduct.action" onsubmit="return checkForm();">
	<input style="font-size:25;" type="text" name="searchProduct" value="请输入查询商品的ID" id="search"/>
	<input style="font-size:25;" type="submit" value="搜索"/>
</form>
<table  border="1" cellspacing="0" cellpadding="0" id="main" style="font-size:25;">
					<tr><th>产品ID</th>
					<th>产品名称</th>
					<th>产品价格</th>
					<th>产品展示</th>
					<th>被购买次数</th>
					<th colspan="2">操作</th></tr>
					
				<c:choose>
                  <c:when test="${searchProduct == null }">
                      <c:forEach items="${productList}" var="pro">
						<tr align="center">
							<td width="150">${pro.proid}</td>
							<td width="150">${pro.proname}</td>
							<td width="150">￥：${pro.price}</td>
							<td width="150"><img src="${pro.listimg}" height="75" width="75"/></td>
							<td width="250">${pro.boughtcount}</td>
							<td width="100">
							<a href="deleteProduct.action?proid=${pro.proid}"><input style="font-size:25;" type="button" value="删除该商品"/></a>
						</td>
						<td width="100">
							<a href="showRevisedProduct.action?proid=${pro.proid}"><input style="font-size:25;" type="button" value="修改该商品"/></a>
						</td>
						</tr>
					</c:forEach>
                  </c:when>
                  <c:otherwise>
                     <c:forEach items="${productList}" var="pro">
                     <c:if test="${pro.proid eq searchProduct}">
						<tr align="center">
						<td width="150">${pro.proid}</td>
						<td width="150">${pro.proname}</td>
						<td width="150">￥：${pro.price}</td>
						<td width="150"><img src="${pro.listimg}" height="75" width="75"/></td>
						<td width="250">${pro.boughtcount}</td>
						<td width="100">
							<a href="deleteProduct.action?proid=${pro.proid}"><input style="font-size:25;" type="button" value="删除该商品"/></a>
						</td>
						<td width="100">
							<a href="deleteProduct.action?proid=${pro.proid}"><input style="font-size:25;" type="button" value="删除该商品"/></a>
						</td>
					</tr>
					</c:if>
					</c:forEach>
                  </c:otherwise>
                </c:choose>
</table>
</section>
</section>

</body>
</html>