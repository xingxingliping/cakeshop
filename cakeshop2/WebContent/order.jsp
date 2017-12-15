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
<title>订单</title>
</head>
<body>
<%@include file="header.jsp" %>
	<div class="cart-items">
		<div class="container">
			<h2>Orders</h2>
			<table border="1" height="100%">
		        <tr>
					<th>订单编号</th>
					<th>订单状态</th>
					<th>订单地址</th>
					<th>订单日期</th>
					<th>订单详情</th>
		        </tr>
		        <c:set var="zongji" value="0"/>
		        <c:forEach items="${loginUserOrder}" var="uo">
		        <c:set var="zongji" value="${uo.orderid}"/>
		        <tr align="center">
		       	 	<td>${uo.orderid}</td>
		       	 	<td>${uo.orderstate}</td>
		      		<td>${uo.orderaddress}</td>
		      		<td>${uo.ordertime}</td>
		      		<td>
		      		<a href="orderDetail.action?orderid=${uo.orderid}"><input type="button" value="查看订单细节"/></a>
		      		<a href="cancelOrder.action?orderid=${uo.orderid}"><input type="button" value="取消该订单"/></a>
		      		<a href="deleteOrder.action?orderid=${uo.orderid}"><input type="button" value="删除该订单"/></a>
		      		</td>
		  		</tr>
		        </c:forEach>
	        		<c:if test="${zongji eq 0 }">
	        			<tr align="center"><td colspan="5">
	        				无任何订单信息！
	        			</td></tr>
	        		</c:if>
    		</table>
		</div>
	</div>		
<%@include file="footer.jsp" %>
</body>
</html>