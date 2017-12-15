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
<link href="${pageContext.request.contextPath}/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="${pageContext.request.contextPath}/css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->	
<!-- cart -->
<script src="${pageContext.request.contextPath}/js/simpleCart.min.js"> </script>
<!-- cart -->
<title>订单详情</title>
</head>
<body>
<%@include file="header.jsp" %>
	<div class="cart-items">
		<div class="container">
			<h2>Orders</h2>
			<table border="1" width="900" height="100%">
		        <tr>
					<th>产品编号</th>
					<th>产品名称</th>
					<th>产品价格</th>
					<th>产品展示</th>
					<th>产品数量</th>
		        </tr>
		        <c:set var="zongji" value="0"/>
		        <c:forEach items="${orderDetailSet}" var="uo">
		        <c:set var="zongji" value="${zongji+uo.productprice*uo.productitemcount}"/>
		        <tr align="center">
		       	 	<td>${uo.productid}</td>
		       	 	<td>${uo.productname}</td>
		       	 	<td>${uo.productprice}</td>
		       	 	<td><img src="${uo.productimgurl}" width="75px" height="75px"/></td>
		       	 	<td>${uo.productitemcount}</td>
		  		</tr>
		        </c:forEach>
    		  	<tr align="center">
		  			<td colspan="6">订单总金额￥：${zongji}</td>
		  		</tr>
    		</table>
		</div>
	</div>		
<%@include file="footer.jsp" %>
</body>
</html>