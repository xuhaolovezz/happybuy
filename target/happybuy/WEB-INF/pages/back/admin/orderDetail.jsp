<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<TITLE> 后台管理界面</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="icon" href="${pageContext.request.contextPath}/resources/css/img/icon.ico" />
	<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/demo.css" type="text/css">--%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/admin/orderDetail.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/admin/orderList.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/admin/adminCommon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/bootstrap.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/back/admin/orderDetail.js"></script>
	<script type="text/javascript">

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
			<li class="nav-li ">
				<a class="" href="${pageContext.request.contextPath}/admin/commodityList/1" target="_top">商 品 管 理</a>
			</li>
			<li class="nav-li">
				<a class="" href="${pageContext.request.contextPath}/admin/kindList/1" target="_top">品 类 管 理</a>
			</li>
			<li class="nav-li nav-active">
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
					<li><a href="${pageContext.request.contextPath}/admin/orderList/1">订单管理</a></li>
					<li class="active">订单详情</li>
				</ol>
			</div>
		</div>
		<div class="col-xs-8 col-xs-offset-1 order-detail">
			<table class="table-order-detail">
				<tr>
					<td style="text-align: right" class="order-title">订单号：</td><td class="order-detail">${order.id}</td>
				</tr>
				<tr>
					<td style="text-align: right" class="order-title">创建时间：</td><td class="order-detail">${order.orderDetail.createTime}</td>
				</tr>
				<tr>
					<td style="text-align: right" class="order-title">收件人：</td><td class="order-detail">${order.orderDetail.name}</td>
				</tr>
				<tr>
					<td style="text-align: right" class="order-title">地址：</td><td class="order-detail">${order.orderDetail.address}</td>
				</tr>
				<tr>
					<td style="text-align: right" class="order-title">手机号：</td><td class="order-detail">${order.orderDetail.phone}</td>
				</tr>
				<tr>
					<td style="text-align: right" class="order-title">订单状态：</td>
					<td class="order-detail">${order.state}
						<c:if test="${order.state.equals('已支付')}">
							<input type="button" class="btn btn-info btn-deliver-goods" orderId="${order.id}" value="立即发货">
						</c:if>
					</td>
				</tr>
				<tr>
					<td style="text-align: right" class="order-title">总金额：</td>
					<td class="order-detail">¥ <fmt:formatNumber pattern="0.00" value="${order.totalAmount}" maxFractionDigits="2"/></td>
				</tr>
			</table>
		</div>
		<div class="col-xs-9 col-xs-offset-1">
			<table class="table table-bordered table-responsive">
				<tr style="text-align: center">
					<td>商品图片</td>
					<td width="50%">商品信息</td>
					<td>单价</td>
					<td>数量</td>
					<td>合计</td>
				</tr>
				<c:forEach items="${order.orderCommodityList}" var="item">
					<tr style="text-align: center">
						<td><img width="110px" height="110px" src="${pageContext.request.contextPath}/upload/${item.commPicture}"></td>
						<td>${item.description}</td>
						<td>¥ <fmt:formatNumber pattern="0.00" value="${item.currentPrice}" maxFractionDigits="2"/></td>
						<td>${item.commodityNumber}</td>
						<td>¥ <fmt:formatNumber pattern="0.00" value="${item.totalPrice}" maxFractionDigits="2"/></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br>
	</div>
</div>
</body>
</html>