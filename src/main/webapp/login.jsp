<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>登录-乐购</title>
	<link rel="icon" href="${pageContext.request.contextPath}/resources/css/img/icon.ico"  />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/bootstrap.min.css" type="text/css" />
	<script src="${pageContext.request.contextPath}/resources/js/common/jquery-3.1.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common/jquery.validate.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common/jquery.validate.extend.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/front/login.js"></script>
	<meta name="Keywords" content="乐购全球购" >
</head>
<body>
	<input type="hidden" id="basePath" value="${pageContext.request.contextPath}">
	<div class="container">
		<div class="c-left">
			<img src="${pageContext.request.contextPath}/resources/css/img/login/p1.jpg" width="400px" height="320px" id="i1">
			<a href="${pageContext.request.contextPath}/index.jsp" target="_blank">
			<img src="${pageContext.request.contextPath}/resources/css/img/logo.png" width="120px" height="120px" id="i2">
			</a>
		</div>
		<div class="c-right">
			<div class="title">
				<span id="c1">登录乐购</span>
			</div>
			<div class="p-login">
				<form class="form-inline" action="/user/userLogin" id="form-login" role="form" method="post">
					<div class="input-group">
						<span class="input-group-addon"><span class="text-primary glyphicon glyphicon-user"></span></span>
						<input type="text" placeholder="用户名" autofocus  name="username" class="form-control">
					</div><br><br>
					<div class="input-group">
						<span class="input-group-addon"><span class="text-primary glyphicon glyphicon-user"></span></span>
						<input type="password" placeholder="密码" name="password" class="form-control">
					</div><br><br>
					<input type="submit" id="btn-login" class="c4" value="登录">
				</form>
			</div>
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
					<button type="button" class="btn btn-primary" id="btn-dismiss" data-dismiss="modal">确定</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	</body>
</html>
