<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户列表</title>
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
function clickTip()
{
    window.alert("删除该用户成功");
}
</script>
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
<section id="main-content">
<section class="wrapper">
<form action="searchUser.action" onsubmit="return checkForm();">
	<input style="font-size:25;" type="text" name="searchuser" value="请输入查询用户的ID" id="search"/>
	<input style="font-size:25;" type="submit" value="搜索"/>
</form>
<!--main_top-->
<table  border="1" cellspacing="0" cellpadding="0" id="main" style="font-size:25;">
					<tr>
						<th>用户ID</th>
						<th>名称</th>
						<th>密码</th>
						<th>邮箱</th>
						<th>地址</th>
						<th>注册日期</th>
						<th colspan="2">操作</th>
					</tr>
				<c:choose>
                  <c:when test="${searchuser == null }">
                    <c:forEach items="${userList}" var="u">
					<tr align="center" height="50px">
						<td width="150">${u.userid}</td>
						<td width="150">${u.username}</td>
						<td width="150">${u.userpwd}</td>
						<td width="150">${u.useremail}</td>
						<td width="150">${u.userAddress}</td>
						<td width="150">${u.userTime}</td>
						<td width="150">
							<a href="deleteUser.action?userid=${u.userid}"><input type="button" style="font-size:25;" value="删除用户" onclick="clickTip()"/></a>
						</td>
						<td width="150">
							<a href="showUserOrders.action?userid=${u.userid}"><input type="button" style="font-size:25;" value="查看订单"/></a>
						</td>
					</tr>
					</c:forEach>
                  </c:when>
                  <c:otherwise>
                    <c:forEach items="${userList}" var="u">
                    <c:if test="${u.userid eq searchuser}">
					<tr align="center" height="25px">
						<td width="150">${u.userid}</td>
						<td width="150">${u.username}</td>
						<td width="150">${u.userpwd}</td>
						<td width="150">${u.useremail}</td>
						<td width="150">${u.userAddress}</td>
						<td width="150">${u.userTime}</td>
						<td width="150">
							<a href="deleteUser.action?userid=${u.userid}"><input style="font-size:25;" type="button" value="删除用户" onclick="clickTip()"/></a>
						</td>
						<td width="150">
							<a href="showUserOrders.action?userid=${u.userid}"><input style="font-size:25;" type="button" value="查看订单"/></a>
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