<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<TITLE> 后台管理界面</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="icon" href="${pageContext.request.contextPath}/resources/css/img/icon.ico" />
	<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/demo.css" type="text/css">--%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/fileinput.css" media="all" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/admin/commodityList.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/admin/adminCommon.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/admin/commodityDetail.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/fileinput.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/zh.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/back/admin/commodityDetail.js"></script>
	<script type="text/javascript">
		function initKind() {
			$("#kind").val("${commodity.kind.id}");
        }
        function initSmallKind() {
			$("#smallkind").val("${commodity.smallKind.id}");
        }
	</script>
</head>

<body>
<input type="hidden" id="basePath" value="${pageContext.request.contextPath}">
<div class="navbar header navbar-fixed-top" role="navigation">
	<div class="logo">
		<span class="span-title">
			<a target="_blank" class="title-home" href="${pageContext.request.contextPath}/index.jsp">
				<span class="glyphicon glyphicon-home"></span></a>  后台管理</span>
	</div>
	<div class="logout">
		<span class="span-username"><span class="glyphicon glyphicon-user"></span>  ${username}</span>
		<input type="button" class="btn btn-default" value="注销" id="btn-logout">
	</div>
</div>
<div class="container-fluid">
	<div class="nav-left">
		<div class="col-md-2 sidebar">
			<li class="nav-li nav-active">
				<a class="" href="${pageContext.request.contextPath}/admin/commodityList/1" target="_top">商 品 管 理</a>
			</li>
			<li class="nav-li">
				<a class="" href="#" target="_top">品 类 管 理</a>
			</li>
			<li class="nav-li">
				<a class="" href="${pageContext.request.contextPath}/admin/orderList/1" target="_top">订 单 管 理</a>
			</li>
			<li class="nav-li">
				<a class="" href="${pageContext.request.contextPath}/admin/logList/1" target="_top">日 志 管 理</a>
			</li>
			<li class="nav-li">
				<a class="" href="${pageContext.request.contextPath}/admin/editPass" target="_top">修 改 密 码</a>
			</li>
		</div>
	</div>
	<div class="col-md-9 col-xs-offset-2 nav-right">
		<div class="page-header">
			<div class="title">
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/admin/commodityList/1">商品管理</a></li>
					<li class="active">商品详情</li>
				</ol>
			</div>
		</div>
		<form class="form-group form-inline" action="${pageContext.request.contextPath}/commodity/update"
			  method="post" id="form-addCommodity" enctype="multipart/form-data">
			<%--设置提交的方法是PUT--%>
			<input type="hidden" name="_method" value="PUT">
				<input type="hidden" name="id" value="${commodity.id}">
			<table class="table table-bordered table-responsive">
				<tr>
					<td>商品名称：<input type="text" class="form-control" value="${commodity.name}" name="name"></td>
					<td>
						<div class="input-group">
							<span class="input-group-addon">库存:</span>
							<input type="text" class="form-control" value="${commodity.stock}" name="stock">
							<span class="input-group-addon">件</span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						商品介绍：<textarea class="form-control"  rows="4" cols="50" name="description">${commodity.description}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						<div class="input-group">
							<span class="input-group-addon">原价:</span>
							<input type="text" class="form-control" value="${commodity.originalPrice}" name="originalPrice">
							<span class="input-group-addon">元</span>
						</div>
					</td>
					<td>
						<div class="input-group">
							<span class="input-group-addon">现价:</span>
							<input type="text" class="form-control" value="${commodity.currentPrice}" name="currentPrice">
							<span class="input-group-addon">元</span>
						</div>
					</td>
				</tr>
				<tr>
					<td>分类：
						<select name="kind.id" class="form-control select-kind"  id="kind">

						</select>
						<select name="smallKind.id" class="form-control select-kind" id="smallkind"></select>
					</td>
					<td>
						状态：<span class="h3" id="commodity-state" style="margin: 0px 15px">${commodity.state}</span>
						<input type="button" data="${commodity.id}" id="btn-change-state" class="btn btn-danger btn-sm" value="下架">
					</td>
				</tr>
				<tr>
					<td colspan="2"><h4>选择四张缩略图：</h4><h4>(修改图片请四张图片都上传，不然会出现部分图片丢失，图片按照名称排序)</h4>
						<input type="file" name="pictures" id="pictures" multiple>
					</td>
				</tr>
				<tr>
					<td colspan="2"><h4>选择四张商品描述图：</h4><h4>(修改图片请四张图片都上传，不然会出现部分图片丢失, 图片按照名称排序)</h4>
						<input type="file" name="descPictures" id="descPictures" multiple></td>
				</tr>
			</table>
			<input type="submit" class="btn btn-primary btn-lg btn-save-commodity" value="保存">
		</form>
		<br>
	</div>
</div>
</body>
</html>