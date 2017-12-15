<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<title>主要内容区</title>
</head>
<body>
	<section id="container"> <!--header start--> <header
		class="header fixed-top clearfix"> <!--logo start-->
	<div class="brand">
		<a href="index.html" class="logo"> VISITORS </a>
		<div class="sidebar-toggle-box">
			<div class="fa fa-bars"></div>
		</div>
	</div>
	<!--logo end-->
	<div class="nav notify-row" id="top_menu">
		<!--  notification start -->
		<ul class="nav top-menu">
			<!-- settings start -->
			<li class="dropdown"><a data-toggle="dropdown"
				class="dropdown-toggle" href="#"> <i class="fa fa-tasks"></i>
			</a></li>
			<li id="header_inbox_bar" class="dropdown"><a
				data-toggle="dropdown" class="dropdown-toggle" href="#"> <i
					class="fa fa-envelope-o"></i>
			</a></li>
			<li id="header_notification_bar" class="dropdown"><a
				data-toggle="dropdown" class="dropdown-toggle" href="#"> <i
					class="fa fa-bell-o"></i>
			</a></li>
		</ul>
		<!--  notification end -->
	</div>

	<div class="top-nav clearfix">
		<!--search & user info start-->
		<ul class="nav pull-right top-menu">
			<li><input type="text" class="form-control search"
				placeholder=" Search"></li>
			<!-- user login dropdown start-->
			<li class="dropdown"><a data-toggle="dropdown"
				class="dropdown-toggle" href="#"> <span>欢迎您</span> <span
					class="username">${loginAdmin.adminname}</span> <b class="caret"></b>
			</a></li>
			<!-- user login dropdown end -->
		</ul>
		<!--search & user info end-->
	</div>
	</header> <!--sidebar start--> 
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
	<!--main_top-->
	<form action="searchOrder.action" onsubmit="return checkForm();">
		<input style="font-size: 25;" type="text" name="searchorder" value="请输入查询订单的ID" id="search" /> 
		<input style="font-size: 25;" type="submit" value="搜索" />
	</form>
	<table border="1" cellspacing="0" cellpadding="0" id="main" style="font-size: 25;">
		<tr>
			<th>订单ID</th>
			<th>订单状态</th>
			<th>订单地址</th>
			<th>下单时间</th>
			<th>下单用户ID</th>
			<th>操作</th>
		</tr>
		<c:choose>
			<c:when test="${searchorder == null }">
				<c:forEach items="${orderList}" var="ul">
					<tr align="center" height="25px">
						<td width="200">${ul.orderid}</td>
						<td width="200">${ul.orderstate}</td>
						<td width="200">${ul.orderaddress}</td>
						<td width="200">${ul.ordertime}</td>
						<td width="200">${ul.user.userid}</td>
						<td><a
							href="showUserOrderDetail2.action?orderid=${ul.orderid}"><input
								style="font-size: 25;" type="button" value="查看订单细节" /></a></td>
					</tr>
				</c:forEach>
				<c:if test="${empty orderList}">
					<tr align="center">
						<td colspan="6">暂无用户下单！</td>
					</tr>
				</c:if>
			</c:when>
			<c:otherwise>
				<c:forEach items="${orderList}" var="ul">
					<c:if test="${ul.orderid eq searchorder}">
						<tr align="center" height="25px">
							<td width="200">${ul.orderid}</td>
							<td width="200">${ul.orderstate}</td>
							<td width="200">${ul.orderaddress}</td>
							<td width="200">${ul.ordertime}</td>
							<td width="200">${ul.user.userid}</td>
							<td><a
								href="showUserOrderDetail2.action?orderid=${ul.orderid}"><input
									style="font-size: 25;" type="button" value="查看订单细节" /></a></td>
						</tr>
					</c:if>
					<c:if test="${empty orderList}">
						<tr align="center">
							<td colspan="6">暂无用户下单！</td>
						</tr>
					</c:if>
				</c:forEach>
			</c:otherwise>
		</c:choose>

	</table>
	</section> </section>
</body>
</html>