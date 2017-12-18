<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
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
    //判断密码
    var password_ = /^[a-zA-Z_0-9]{3,20}$/;
    //判断邮箱
    var email_ = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/; 
    
    //获得input对象
    var username = document.getElementById("username");
    var password = document.getElementById("userpwd");
    var rePassword = document.getElementById("repassword");
    var email = document.getElementById("useremail");
    
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
		var userName = document.getElementById("username").value;
		var url = "check.action?username="+userName;
		createXMLHttpRequest();
		XMLHttpReq.open("GET",url,true);
		XMLHttpReq.onreadystatechange = processResponse;
		XMLHttpReq.send(null);
	}
</script>
</head>
<body>
<%@include file="header.jsp" %>
	<!--account-->
	<div class="account">
		<div class="container">
			<div class="register">
				<form action="register.action"  method="post" onsubmit="return checkForm();"> 
					<div class="register-top-grid">
						<h3>Personal information</h3>
						<div class="input">
							<span>Name<label>*</label></span>
							<input type="text" name="username" id="username"  onblur="sendRequest()"> 
						</div>
						<div class="input">
							<span>Email<label>*</label></span>
							<input type="text" name="useremail" id="useremail"> 
						</div>
						<div class="input">
							<span>Password<label>*</label></span>
							<input type="password" name="userpwd" id="userpwd">
						</div>
						<div class="input">
							<span>Confirm Password<label>*</label></span>
							<input type="password" name="repassword" id="repassword">
						</div>
					 	<input type="submit" value="submit">
					 </div>
				</form>
				<p align="center" style="font-size: 18px;color: red;">${registerMsg}</p>
			</div>
	    </div>
	</div>
	<!--//account-->
<%@include file="footer.jsp" %>
	<div class="footer-bottom">
		<div class="container">
			<p>Copyright &copy; 2015.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
		</div>
	</div>

</body>
</html>