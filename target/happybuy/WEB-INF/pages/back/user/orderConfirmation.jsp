<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>订单结算页-乐购</title>
		<link rel="icon" href="${pageContext.request.contextPath}/resources/css/img/icon.ico"  />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/orderConfirmation.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/userCommon.css" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/bootstrap.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/back/user/orderConfirmation.js"></script>
		<meta name="Keywords" content="乐购全球购" >
	</head>
	<body>
	<input type="hidden" id="basePath" value="${pageContext.request.contextPath}">
		<div class="header">
			<div class="header-top">
				<div class="header-nav">
					<div class="header-top-left">
						<a href="javascript:;">手机乐购</a>
					</div>
					<div class="header-top-right">
						<span style="margin-right: 40px">你好，欢迎来到乐购！</span>
						<c:if test="${sessionScope.get('id') == null}">
							<a href="${pageContext.request.contextPath}/login.jsp">登录</a>
							<a href="${pageContext.request.contextPath}/register.jsp">免费注册</a>
						</c:if>
						<c:if test="${sessionScope.get('id') !=null}">
							<a href="javascript:;">${username}</a>
							<a href="javascript:;" class="logout">退出</a>
							<a href="${pageContext.request.contextPath}/user/order/1" target="_blank">我的订单</a>
						</c:if>
						<a href="#">帮助中心</a>
					</div>
				</div>
			</div>
			<div class="header-middle">
				<div class="header-middle-logo">
					<a href="${pageContext.request.contextPath}/index.jsp">
					<img src="${pageContext.request.contextPath}/resources/css/img/logo.png" width="120px" height="120px">
					</a>
				</div>
				<div class="header-middle-right">
					<div class="step">
						<div class="current">1.我的购物车</div>
						<div class="current">2.填写核对订单信息</div>
						<div class="current">3.成功提交订单</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="c-title">
				<span>填写并核对订单信息</span>
			</div>
			<div class="c-message">
				<div class="title">
					<a class="bold">收货人信息</a>
					<a href="javascript:;" class="newaddress"  data-toggle="modal" data-target="#modal-add-address">新增收货地址</a>
				</div>
				<c:forEach items="${addressList}" var="address">
					<div class="c-address" data-addressId="${address.id}">
						<span class="name <c:if test="${address.defaultAddress == 1}">name-check</c:if>">${address.name}</span>
						<span class="province">${address.province.name}${address.city.name}</span>
						<span class="details">${address.detailedAddress}</span>
						<span class="phone">${address.phone}</span>
						<c:if test="${address.defaultAddress==1}"><span class="acquiesce">默认地址</span></c:if>
						<c:if test="${address.defaultAddress==0}"><a class="delete-address" href="javascript:;">删除</a></c:if>
						<a class="edit-address" href="javascript:;" data-toggle="modal" data-target="#modal-edit-address">编辑</a>
						<c:if test="${address.defaultAddress==0}"><a class="set-default-address" href="javascript:;">设为默认地址</a></c:if>
					</div>
				</c:forEach>
				<div class="hr"></div>
				<div class="c-list">
					<div class="list-title">
						<span class="bold">商品清单</span>
					</div>
					<div class="list-text">
						<div class="menu">
							<div id="title1">
								<span>商品</span>
							</div>
							<div id="title2">
								<span>单价</span>
								<span style="margin-left: 145px">数量</span>
								<span style="margin-left: 140px">小计</span>
							</div>
						</div>
						<input type="hidden" id="shopCartId" class="${shopCart.id}">
						<c:forEach items="${shopCart.shopCartCommodityList}" var="item">
						<div class="list" >
								<div class="list-goods inline" data-commodityId="${item.commodity.id}" data-commodityNumber="${item.commodityNumber}">
									<div class="goods-img inline">
										<img src="${pageContext.request.contextPath}/upload/${item.commodity.picture1}"  height="80px" width="80px" />
									</div>
									<div class="goods-text inline">
										<a href="#">${item.commodity.description}</a>
									</div>
								</div>
								<div class="list-price inline a-width">
									<span>¥ <fmt:formatNumber pattern="0.00" maxFractionDigits="2" value="${item.commodity.currentPrice}" /></span>
								</div>
								<div class="list-quantity inline a-width">
									<span>X ${item.commodityNumber}</span>
								</div>
								<div class="list-sum inline a-width">
									<span>¥ <fmt:formatNumber pattern="0.00" maxFractionDigits="2" value="${item.totalPrice}" /></span>
								</div>
						</div>
						</c:forEach>
					</div>
				</div>
				<div class="c-foot">
					<div class="foot-message">
						<div class="order-info">
							<span><label style="margin-right: 5px">${shopCart.totalSize}</label>件商品，应付总额：
								<label>¥ <fmt:formatNumber pattern="0.00" maxFractionDigits="2" value="${shopCart.totalAmount}" /></label>
							</span>
						</div>
						<c:forEach items="${addressList}" var="item">
							<c:if test="${item.defaultAddress == 1}">
								<span data-addressId="${item.id}" class="f2 address-detail">寄送至：
										${item.detailedAddress}
								</span>
								<span class="f2 address-name">收货人：
										${item.name}&nbsp;${item.phone}
								</span>
							</c:if>
						</c:forEach>
					</div>
					<div class="foot-submit">
						<span id="go-order">提交订单</span>
					</div>
				</div>
			</div>
		</div>
		
		<div class="footer">
			<div class="footer-service">
				<div class="service">
					<h5 class="service1"></h5>
					<span class="service-t">品类齐全，轻松购物</span>
				</div>
				<div class="service">
					<h5 class="service2"></h5>
					<span class="service-t">多仓直发，急速配送</span>
				</div>
				<div class="service">
					<h5 class="service3"></h5>
					<span class="service-t">正品行货，精致服务</span>
				</div>
				<div class="service">
					<h5 class="service4"></h5>
					<span class="service-t">天天低价，畅选无忧</span>
				</div>
			</div>
			<div class="footer-help">
				<ul class="help">
					<li class="strong">使用帮助</li>
					<li><a href="#" rel="nofollow">新手帮助</a></li>
					<li><a href="#" rel="nofollow">乐豆体系</a></li>
					<li><a href="#" rel="nofollow">正品承诺</a></li>
				</ul>
				<ul class="help">
					<li class="strong">支付方式</li>
					<li><a href="#" rel="nofollow">支付方式</a></li>
					<li><a href="#" rel="nofollow">支付流程</a></li>
					<li><a href="#" rel="nofollow">跨境进口税</a></li>
				</ul>
				<ul class="help">
					<li class="strong">配送方式</li>
					<li><a href="#" rel="nofollow">包邮政策</a></li>
					<li><a href="#" rel="nofollow">发货时间</a></li>
					<li><a href="#" rel="nofollow">配送区域</a></li>
					<li><a href="#" rel="nofollow">送货验收</a></li>
				</ul>
				<ul class="help">
					<li class="strong">售后服务</li>
					<li><a href="#" rel="nofollow">退货政策</a></li>
					<li><a href="#" rel="nofollow">退货流程</a></li>
					<li><a href="#" rel="nofollow">退款方式</a></li>
				</ul>
				<ul class="help">
					<li class="strong">联系方式</li>
					<li><a href="#" rel="nofollow">总裁邮箱：ceo@lego.com</a></li>
					<li><a href="#" rel="nofollow">商务合作：bd@lego.com</a></li>
					<li><a href="#" rel="nofollow">媒体合作：pr@lego.com</a></li>
					<li><a href="#" rel="nofollow">招商中心：zhaoshang@lego.com</a></li>
				</ul>
			</div>
			<div class="footer-link">
				<a href="javascript:;" >关于乐购</a>丨<a href="javascript:;" >加入乐购</a>丨<a href="javascript:;" >商务合作</a>丨
				<a href="javascript:;" >帮助中心</a>丨<a href="javascript:;" >联系我们</a>丨<a href="javascript:;" >友情链接</a>丨
				<a href="javascript:;" >触屏版</a>丨<a href="javascript:;" >媒体报道</a><br/>
				<span class="footer-w">京公网安备：11010502027270 </span>|<span class="footer-w">营业执照：91110105582599307U</span>|
				<span class="footer-w">食品经营许可证：SP1101051410296669 </span>|<span class="footer-w">出版物经营许可证：新出发京零字第朝160088号</span>|
				<span class="footer-w">京ICP证140430号 </span><br />
				<span class="footer-w">京ICP备14006215号</span>|<span class="footer-w">员工舞弊举报：jiancha@lego.com 电话：010-56733666</span><br />
				<span class="footer-w">通过本网站直接或者间接地推销商品或者服务的商业宣传活动均属“广告”</span><br />
				<span class="footer-w">Copyright &copy 2017 北京乐购在线商贸有限公司 Lego.com 保留一切权利</span>
			</div>
		</div>
	<%--添加收货地址的弹窗--%>
	<div class="modal fade" id="modal-add-address" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="margin-top: 200px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></button>
					<h4 class="modal-title" id="myModalLabel">添加收货地址</h4>
				</div>
				<div class="modal-body">
					<form class="form-group form-inline" method="post" id="form-addAddress">
						<table class="table table-bordered table-responsive">
							<tr>
								<td>选择省份以及城市：
									<select class="form-control" name="province.id" id="province"></select>&nbsp;&nbsp;
									<select class="form-control" name="city.id" id="city"></select>
								</td>
							</tr>
							<tr>
								<td>详细地址：<input type="text" class="form-control" style="width: 60%" name="detailedAddress"></td>
							</tr>
							<tr>
								<td>姓名：<input type="text" class="form-control" name="name"></td>
							</tr>
							<tr>
								<td>手机号：<input type="text" class="form-control" name="phone"></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="btn-addAddress">添加</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	<%--修改收货地址的弹窗--%>
	<div class="modal fade" id="modal-edit-address" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
		<div class="modal-dialog" style="margin-top: 200px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></button>
					<h4 class="modal-title" id="myModalLabel1">修改收货地址</h4>
				</div>
				<div class="modal-body">
					<form class="form-group form-inline" method="post" id="form-updateAddress">
						<input type="hidden" name="id" id="addressId" value="">
						<table class="table table-bordered table-responsive">
							<tr>
								<td>选择省份以及城市：
									<select class="form-control" name="province.id" id="province2"></select>&nbsp;&nbsp;
									<select class="form-control" name="city.id" id="city2"></select>
								</td>
							</tr>
							<tr>
								<td>详细地址：<input type="text" class="form-control" id="detailedAddress" style="width: 60%" name="detailedAddress"></td>
							</tr>
							<tr>
								<td>姓名：<input type="text" class="form-control" id="address-name" name="name"></td>
							</tr>
							<tr>
								<td>手机号：<input type="text" class="form-control" id="address-phone" name="phone"></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="btn-updateAddress">修改</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	</body>
</html>
