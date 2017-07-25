<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>个人中心-我的订单-乐购</title>
		<link rel="icon" href="${pageContext.request.contextPath}/resources/css/img/icon.ico"  />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/order.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/userCommon.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/initShopCart.css" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/bootstrap.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/back/user/order.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/back/user/initShopCart.js"></script>
		<meta name="Keywords" content="乐购全球购" >
		<script type="text/javascript">
			$(function () {

            })
		</script>
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
					<img src="${pageContext.request.contextPath}/resources/css/img/logo.png" width="100px" height="100px">
					</a>
				</div>
				<div class="header-middle-ca">
					<button type="button" class="btn btn-danger btn-shopping-cart"
					><span value="" style="margin-right: 10px" class="glyphicon glyphicon-shopping-cart"></span>购物车</button>
				</div>
				<div class="header-middle-se">
					<input type="text" name="condition" class="search" placeholder="商品/种类" />
					<button class="btn btn-info btn-search"><span class="glyphicon glyphicon-search"></span>搜索</button>
				</div>
				<div class="header-middle-hot">
				<p><a href="">尤妮佳丨</a><a href="">牙胶丨</a><a href="">收纳柜丨</a><a href="">隔尿垫丨</a><a href="">加州宝宝</a></p>
				</div>
			</div>
			<div class="header-foot">
				<div class="header-foot-r" >
					<a target="_blank" href="${pageContext.request.contextPath}/index.jsp" class="header-foot-r1">首页</a>
					<a target="_blank" href="${pageContext.request.contextPath}/item/search/1?condition=运动" class="header-foot-r1">运动户外</a>
					<a target="_blank" href="${pageContext.request.contextPath}/item/search/1?condition=饮料" class="header-foot-r1">饮料冲调</a>
					<a target="_blank" href="${pageContext.request.contextPath}/item/search/1?condition=食品" class="header-foot-r1">食品小吃</a>
					<a target="_blank" href="${pageContext.request.contextPath}/item/search/1?condition=家电" class="header-foot-r1">家电大全</a>
					<a target="_blank" href="${pageContext.request.contextPath}/item/search/1?condition=数码" class="header-foot-r1">数码产品</a>
					<a target="_blank" href="${pageContext.request.contextPath}/item/search/1?condition=珠宝" class="header-foot-r1">珠宝首饰</a>
					<a target="_blank" href="${pageContext.request.contextPath}/help.jsp" class="header-foot-r1">帮助中心</a>
				</div>
			</div>
		</div>
		
		<div class="container">
			<div class="ic">
				<div class="c-left">
					<div class="title">
						我的交易
					</div>
					<p><a href="${pageContext.request.contextPath}/user/order/1" id="l1">我的订单</a></p>
					<div class="title">
						我的收藏
					</div>
					<p><a href="#">我收藏的商品</a></p>
					
					<div class="title">
						我的账户
					</div>
					<p><a href="#">账户信息</a></p>
					<p><a href="#">修改密码</a></p>
					<p><a href="#">地址管理</a></p>
				</div>
				
				<div class="c-right">
					<div class="p-breadcrumb">
						<ol class="breadcrumb">
							<li><a href="${pageContext.request.contextPath}/user/order/1">我的订单</a></li>
							<li class="active">订单详情</li>
						</ol>
					</div>
					<div class="p-order-title">
						<table class="table-order-detail">
							<tr>
								<td style="text-align: right" class="order-title">订单号：</td><td class="order-detail">${order.id}</td>
								<td style="text-align: right" class="order-title">创建时间：</td><td class="order-detail">${order.orderDetail.createTime}</td>
							</tr>

							<tr>
								<td style="text-align: right" class="order-title">收件人：</td><td class="order-detail">${order.orderDetail.name}</td>
								<td style="text-align: right" class="order-title">地址：</td><td class="order-detail">${order.orderDetail.address}</td>
							</tr>
							<tr>

							</tr>
							<tr>
								<td style="text-align: right" class="order-title">手机号：</td><td class="order-detail">${order.orderDetail.phone}</td>
							</tr>
							<tr>
								<td style="text-align: right" class="order-title">订单状态：</td>
								<td class="order-detail">${order.state}
									<c:if test="${order.state.equals('未付款')}">
										<a href="javascript:;" data-orderId="${order.id}"  class="a-pay-now">立即付款</a>
									</c:if>
									<c:if test="${order.state.equals('已发货')}">
										<a href="javascript:;" data-orderId="${order.id}"  class="a-take-goods">立即收货</a>
									</c:if>
									<c:if test="${order.state.equals('已收货')}">
										<a href="javascript:;" data-orderId="${order.id}"  class="a-comment">立即评价</a>
									</c:if>
								</td>
							</tr>
						</table>
					</div>
					<div class="p-order-detail">
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
									<td><img width="60px" height="60px" src="${pageContext.request.contextPath}/upload/${item.commPicture}"></td>
									<td>${item.description}</td>
									<td>¥ <fmt:formatNumber pattern="0.00" value="${item.currentPrice}" maxFractionDigits="2"/></td>
									<td>X ${item.commodityNumber}</td>
									<td>¥ <fmt:formatNumber pattern="0.00" value="${item.totalPrice}" maxFractionDigits="2"/></td>
								</tr>
							</c:forEach>
						</table>
						<div class="p-order-price">
							<table class="order-total-detail">
								<tr>
									<td style="text-align: center">商品总额：</td>
									<td style="text-align: right">¥ <fmt:formatNumber pattern="0.00" value="${order.totalOriginalAmount}" maxFractionDigits="2"/></td>
								</tr>
								<tr>
									<td style="text-align: center">折扣：</td>
									<td style="text-align: right">
										- ¥ <fmt:formatNumber pattern="0.00" value="${order.totalAmount - order.totalOriginalAmount}" maxFractionDigits="2"/>
									</td>
								</tr>
								<tr class="tr-total-price">
									<td style="text-align: center">总金额：</td>
									<td style="text-align: right">¥ <fmt:formatNumber pattern="0.00" value="${order.totalAmount}" maxFractionDigits="2"/></td>
								</tr>
							</table>
						</div>
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
	</body>
</html>
