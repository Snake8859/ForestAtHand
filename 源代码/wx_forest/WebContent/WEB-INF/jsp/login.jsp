<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>林业信息工程课设</title>
<!-- CSS -->
<link rel="stylesheet" href="<%=basePath%>css/index.css" />
<!-- jQuery -->
<script src="<%=basePath%>js/jquery.min.js"></script>
</head>

<body>
<img src="<%=basePath%>img/bgImg.jpg" class="bgImg" />
<div class="content">
	<div class="bidTitle">林业信息资源管理平台登录</div>
	<div class="logCon">
	 <form id="userInfo">
		<div class="line"><span>账号:</span>
		<input class="bt_input" type="text" id="username" name="username" /></div>
		<div class="line"><span>密码:</span>
		<input class="bt_input" type="password" id="password" name="password" /></div>
	</form>
		<button class="logingBut" onclick="login()" value="登录">登录</button>
	</div>
</div>


<script type="text/javascript">
function login() {
	var username = $("#username").val();
	var password = $("#password").val();
	//alert(username+password);
	/* {"username": "xxx","password":"xxx"} */
	var params = '{"username": '+'"'+username+'"'+","+'"password":'+'"'+password+'"'+'}';
	//alert(params);
	if(username!="" && password!=""){
		$.ajax({
			type:"post",
			url:"<%=basePath%>user/login.action",
			data:params,
			contentType : "application/json;charset=UTF-8",
			dataType : "json",//回调
			success:function(data) {
				console.log(data.message);
				if(data.message=="fail"){
					alert("账号或者密码错误");
				}
				if(data.message=="success"){
					window.location.href = "forestIndex.action";
				}
			}
		});
	}
	else{
		alert("用户名或者密码不能为空");
	}
	
}
</script>

</body>

</html>