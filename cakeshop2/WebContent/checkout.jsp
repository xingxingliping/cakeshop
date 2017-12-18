<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js"> </script>
<!-- cart -->
<title>购物车</title>
</head>
<body>
<%@include file="header.jsp" %>
	<!--cart-items-->
		<div class="cart-items">
			<div class="container">
				<h2>My Shopping Cart</h2>
				<form action="piliangdelete.action">
				<table border="1" width="900" height="100%" >
			        <tr>
			        	<th>选项</th>
						<th>产品编号</th>
						<th>产品名称</th>
						<th>产品价格</th>
						<th>产品详情</th>
						<th>产品数量</th>
						<th>小计</th>
						<th>操作</th>
			        </tr>
			        <c:set var="zongji" value="0"/>
			        <c:forEach items="${cart}" var="c">
			        <tr align="center">
			        	<c:set var="zongji" value="${zongji+c.value.product.price*c.value.productItemCount}"/>
			       	 	<td><input type="checkbox" name="tempString" value="${c.value.product.proid}"/></td>
			       	 	<td>${c.value.product.proid}</td>
			       	 	<td>${c.value.product.proname}</td>
			     		<td>￥：${c.value.product.price}</td>
			      		<td><img src="${c.value.product.listimg}" width="75px" height="75px"/></td>
			      		<td>${c.value.productItemCount}</td>
			      		<td>￥：${c.value.product.price*c.value.productItemCount}<td>
			   			<a href="addProduct.action?proid=${c.value.product.proid}">增加</a>
			   			<a href="removeProduct.action?proid=${c.value.product.proid}">减少</a>
			  		</tr>
			        </c:forEach>
			        <tr height="40px" align="center">
			        	<td colspan="8">
			        		<c:choose>
			        			<c:when test="${zongji eq 0}">
			        				购物车竟然是空的！再忙也要吃东西噢！
									<a href="prolist.jsp">前去购物</a>
			        			</c:when>
			        			<c:otherwise>￥：${zongji}
			        				<a href="createOrder.action"><input type="button" value="生成订单"/></a>
			        				<input type="submit" value="删除所选商品"/>
			        				<a href="emptyCart.action"><input type="button" value="清空购物车"/></a>
			        			</c:otherwise>
			        		</c:choose>
			        	</td>
			        </tr>
   			 </table>
   			 </form>
   		 </div>
    </div>
	<!--//checkout-->	
<%@include file="footer.jsp" %>
</body>
</html>