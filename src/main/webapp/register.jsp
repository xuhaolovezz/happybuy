<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>注册 -乐购</title>
	<meta name="Keywords" content="乐购全球购" >
	<link rel="icon" href="${pageContext.request.contextPath}/resources/css/img/icon.ico"  />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/register.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/bootstrap.min.css" type="text/css" />
	<script src="${pageContext.request.contextPath}/resources/js/common/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common/jquery.validate.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common/jquery.validate.extend.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/front/register.js"></script>
</head>
<body>
<input type="hidden" id="basePath" value="${pageContext.request.contextPath}">
	<div class="container">
		<div class="c-left">
			<img src="${pageContext.request.contextPath}/resources/css/img/register/g1.jpg" width="500px" height="420px">
			<a href="${pageContext.request.contextPath}/index.jsp">
				<img src="${pageContext.request.contextPath}/resources/css/img/logo.png" width="120px" height="120px" id="i1">
			</a>
		</div>
	  	<div class="c-right">
	  		<span id="c1">注册乐购</span>
	  		<span id="s1">已有乐购账号<a href="${pageContext.request.contextPath}/login.jsp?returnURL=/index.jsp" id="toLogin">登录</a></span><br />
			<form action="${pageContext.request.contextPath}/user/regUser" method="post" id="form-saveUser">
				<input type="text" placeholder="用户名" id="username" name="username" class="form-control"><br />
				<input type="password" placeholder="密码" id="password" name="password" class="form-control"><br />
				<input type="password" placeholder="确认密码" name="rePass" class="form-control"><br />
				<input type="text" placeholder="邮箱" name="email" class="form-control"><br />
				<input type="checkbox" checked="checked" name="service"><span>我已阅读并接受<a href="#" id="service">乐购服务条款</a></span><br />
				<input type="submit" id="btn-register" class="c4" value="注册">
			</form>
	  	</div>
	</div>
	<div class="footer">
			Copyright &copy;2017 乐购商城有限公司Lego.com 保留一切权利。客服热线： 652-546-1027。京ICP证140430号 京ICP备14
	</div>
<div class="modal fade" id="alertModal">
	<div class="modal-dialog" style="margin-top:350px;width: 400px">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></button>
				<h4 class="modal-title" id="myModalLabel">提示</h4>
			</div>
			<div class="modal-body" style="text-align: center;font-size: 18px;">

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="btn-dismiss" data-dismiss="modal">关闭</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</body>
</html>