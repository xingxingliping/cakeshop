<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<link href="/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="/css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
<script src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->	
<!-- cart -->
<script src="/js/simpleCart.min.js"> </script>
<!-- cart -->
<title>登录</title>
</head>
<body>
<%@include file="header.jsp" %>
<div class="registerl">
		<h2>login</h2>
		<div class="res_box">
			<div class="res_form">
				<form action="login.action" method="post">
					<p class="res_list">
						<span>UserName<label>*</label></span><input type="text" name="username"/>
					</p>
					<p class="res_list">
						<span>Password<label>*</label></span><input type="password" name="userpwd"/>
					</p>
					<p>
						<input class="res_btn" type="submit" value="登录" />
						 <div class="clearfix"> </div>
					</p>

				</form>
				
				<!-- <p>没有账号？请去<a style="color: #AE191B;" href="register.jsp">注册</a></p> -->
				<p>New User ? <a class="sign" href="register.jsp">Sign Up</a> 
			</div>
					<p align="center" style="font-size: 18px;color: red;">
						${loginMsg}
					</p>
		</div>
	</div>

<%@include file="footer.jsp" %>
</body>
</html>