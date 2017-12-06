<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>register</title>
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
<script type="text/javascript">
function checkForm(){
    //判断登陆名
    var userName_ = /^[a-zA-Z_0-9]{3,10}$/;
    //判断邮箱
    var email_ = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/; 
    //判断密码
    var password_ = /^[a-zA-Z_0-9]{3,20}$/;
    
    //获得input对象
    var username = document.getElementById("userName");
    var password = document.getElementById("userPassword");
    var rePassword = document.getElementById("reUserPassword");
    var email = document.getElementById("userEmail");
    var telephone = document.getElementById("userTel");
    
     if(username == null || username.value == ""){
        alert("用户名不能为空");
         return false;
     }else if(username.value.match(userName_)==null){
        alert("您输入的用户名与规定类型不匹配");
        return false;
     } else if(email == null || email.value == ""){
        alert("email不能为空");
         return false; 
     } else if(email.value.match(email_) == null){
        alert("您输入的邮箱格式不正确");
        return false;
     }else if(password == null || password.value == ""){
        alert("密码不能为空");
        return false;
     }else if(password.value.match(password_) == null){
       alert("您输入的密码与规定类型不匹配");
       return false;
     }else if(password.value != rePassword.value){
       alert("两次密码不一致");
        return false;
     }
     return true;
}
</script>
<script type="text/javascript">  
	var XMLHttpReq;
	//创建请求
	function createXMLHttpRequest(){
		if(window.XMLHttpRequest){
			XMLHttpReq = new XMLHttpRequest();
		}else if(window.ActiveXObject){
			XMLHttpReq = new ActiveXObiect("Msxml12.XMLHTTP");
			XMLHttpReq = new ActiveXObiect("Microsoft.XMLHTTP");
		}
	}
	//进程响应
	function processResponse(){
		if(XMLHttpReq.readyState == 4){
			if(XMLHttpReq.status == 200){
				var tip = XMLHttpReq.responseText;
				document.getElementById("tip").innerHTML="<font color='red'>"+tip+"</font>";
			}else{
				alert("您所请求的页面有异常！");
			}
		}
	}
	//发出请求
	function sendRequest(){
		var userName = document.getElementById("userName").value;
		var url = "check.action?userName="+userName;
		createXMLHttpRequest();
		XMLHttpReq.open("GET",url,true);
		XMLHttpReq.onreadystatechange = processResponse;
		XMLHttpReq.send(null);
	}
</script>
</head>
<body>
<!--header-->
	<div class="header">
		<div class="container">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<h1 class="navbar-brand"><a  href="index.html">Yummy</a></h1>
				</div>
				<!--navbar-header-->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="index.html" class="active">Home</a></li>
						<li><a href="products.html" class="list">Product</a></li>			
						<li><a href="order.jsp" class="list">Order</a></li>
						<li><a href="order.jsp" class="list">About Us</a></li>							
					</ul> 
					<!--/.navbar-collapse-->
				</div>
				<!--//navbar-header-->
			</nav>
			<div class="header-info">
				<div class="header-right search-box">
					<a href="#"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>				
					<div class="search">
						<form class="navbar-form">
							<input type="text" class="form-control">
							<button type="submit" class="btn btn-default" aria-label="Left Align">
								Search
							</button>
						</form>
					</div>	
				</div>
				<div class="header-right login">
					<a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
					<div id="loginBox">                
						<form id="loginForm">
							<fieldset id="body">
								<fieldset>
									<label for="email">Email Address</label>
									<input type="text" name="email" id="email">
								</fieldset>
								<fieldset>
									<label for="password">Password</label>
									<input type="password" name="password" id="password">
								</fieldset>
								<input type="submit" id="login" value="Sign in">
								<label for="checkbox"><input type="checkbox" id="checkbox"> <i>Remember me</i></label>
							</fieldset>
							<p>New User ? <a class="sign" href="register.jsp">Sign Up</a> <span><a href="#">Forgot your password?</a></span></p>
						</form>
					</div>
				</div>
				<div class="header-right cart">
					<a href="#"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></a>
					<div class="cart-box">
						<h4><a href="checkout.html">
							<span class="simpleCart_total"> $0.00 </span> (<span id="simpleCart_quantity" class="simpleCart_quantity"> 0 </span>) 
						</a></h4>
						<p><a href="javascript:;" class="simpleCart_empty">Empty cart</a></p>
						<div class="clearfix"> </div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<!--//header-->
	<!--account-->
	<div class="account">
		<div class="container">
			<div class="register">
				<form> 
					<div class="register-top-grid">
						<h3>Personal information</h3>
						<div class="input">
							<span>UserName<label>*</label></span>
							<input type="text"> 
						</div>
						<div class="input">
							<span>Email Address<label>*</label></span>
							<input type="text"> 
						</div>
						<a class="news-letter" href="#">
							<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>Sign Up for Newsletter</label>
						</a>
						<div class="clearfix"> </div>
					</div>
				    <div class="register-bottom-grid">
						<h3>Login information</h3>
						<div class="input">
							<span>Password<label>*</label></span>
							<input type="password">
						</div>
						<div class="input">
							<span>Confirm Password<label>*</label></span>
							<input type="password">
						 </div>
					</div>
				</form>
				<div class="clearfix"> </div>
				<div class="register-but">
				   <form>
					   <input type="submit" value="submit">
					   <div class="clearfix"> </div>
				   </form>
				</div>
			</div>
	    </div>
	</div>
	<!--//account-->
	<!--footer-->
	<div class="footer">
		<div class="container">
			<div class="footer-grids">
				<div class="col-md-2 footer-grid">
					<h4>company</h4>
					<ul>
						<li><a href="products.html">products</a></li>
						<li><a href="#">Work Here</a></li>
						<li><a href="#">Team</a></li>
						<li><a href="#">Happenings</a></li>
						<li><a href="#">Dealer Locator</a></li>
					</ul>
				</div>
				<div class="col-md-2 footer-grid">
					<h4>service</h4>
					<ul>
						<li><a href="#">Support</a></li>
						<li><a href="#">FAQ</a></li>
						<li><a href="#">Warranty</a></li>
						<li><a href="contact.html">Contact Us</a></li>
					</ul>
				</div>
				<div class="col-md-3 footer-grid">
					<h4>order & returns</h4>
					<ul>
						<li><a href="#">Order Status</a></li>
						<li><a href="#">Shipping Policy</a></li>
						<li><a href="#">Return Policy</a></li>
						<li><a href="#">Digital Gift Card</a></li>
					</ul>
				</div>
				<div class="col-md-2 footer-grid">
					<h4>legal</h4>
					<ul>
						<li><a href="#">Privacy</a></li>
						<li><a href="#">Terms and Conditions</a></li>
						<li><a href="#">Social Responsibility</a></li>
					</ul>
				</div>
				<div class="col-md-3 footer-grid icons">
					<h4>Connect with Us</h4>
					<ul>
						<li><a href="#"><img src="images/i1.png" alt=""/>Follow us on Facebook</a></li>
						<li><a href="#"><img src="images/i2.png" alt=""/>Follow us on Twitter</a></li>
						<li><a href="#"><img src="images/i3.png" alt=""/>Follow us on Google-plus</a></li>
						<li><a href="#"><img src="images/i4.png" alt=""/>Follow us on Pinterest</a></li>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--footer-->
	<div class="footer-bottom">
		<div class="container">
			<p>Copyright &copy; 2015.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
		</div>
	</div>

</body>
</html>