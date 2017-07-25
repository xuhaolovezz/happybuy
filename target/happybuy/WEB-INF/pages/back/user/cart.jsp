<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>我的购物车-乐购</title>
		<link rel="icon" href="${pageContext.request.contextPath}/resources/css/img/icon.ico" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/cart.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/skins/flat/red.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/userCommon.css" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/bootstrap.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/icheck.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/back/user/cart.js"></script>
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
					<a href="${pageContext.request.contextPath}/index.jsp" target="_blank">
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
				<div class="header-middle-se">
					<input type="text" name="condition" class="search" placeholder="商品/种类" />
					<button class="btn btn-info btn-search"><span class="glyphicon glyphicon-search"></span>  搜索</button>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="c-title">
				<span>我的购物车</span>
			</div>
			<c:if test="${shopCart.shopCartCommodityList.size() == 0 || shopCart.shopCartCommodityList.get(0).id == null}">
				<div class="p-no-commodity">
					<span>购物车里没有商品，快去选购商品吧</span>
				</div>
			</c:if>
			<c:if test="${shopCart.shopCartCommodityList.size() > 0 && shopCart.shopCartCommodityList.get(0).id != null}">
			<div class="c-menu">
				<div class="title">
					<div id="title1">
						<input type="checkbox" id="checkAll" checked="checked">
						<label style="margin-left: 20px">全选</label>
					</div>
					<div id="title2">
						<span>商品</span>
					</div>
					<div id="title3">
						<span style="margin-left: 50px">单价</span>
						<span style="margin-left: 90px">数量</span>
						<span style="margin-left: 95px">小计</span>
						<span style="margin-left: 80px">操作</span>
					</div>
				</div>
				<input type="hidden" id="shopCartId" value="${shopCart.id}">
				<div class="c-list">
					<c:forEach items="${shopCart.shopCartCommodityList}" var="item">
					<div class="list">
						<div class="list-checkbox inline">
							<input type="checkbox" data-commId="${item.commodity.id}" class="checkCommodity" checked="checked">
						</div>
						<div class="list-goods inline">
							<div class="goods-img inline">
								<a href="${pageContext.request.contextPath}/item/details/${item.commodity.id}" target="_blank">
									<img src="${pageContext.request.contextPath}/upload/${item.commodity.picture1}" height="80px" width="80px">
								</a>
							</div>
							<div class="goods-text inline">
								<a href="${pageContext.request.contextPath}/item/details/${item.commodity.id}" target="_blank">${item.commodity.description}</a>
							</div>
						</div>
						<div class="list-price inline a-width">
							<span>¥ <fmt:formatNumber pattern="0.00" maxFractionDigits="2" value="${item.commodity.currentPrice}" /></span><br>
							<c:if test="${item.commodity.currentPrice < item.commodity.originalPrice}">
								<span style="font-size: 12px;text-decoration: line-through">
									¥ <fmt:formatNumber pattern="0.00" maxFractionDigits="2" value="${item.commodity.originalPrice}" />
								</span>
							</c:if>
						</div>
						<div class="list-quantity inline a-width" data-stock="${item.commodity.stock}" data-commId="${item.commodity.id}">
							<a class="left-a commodity-number-sub " href="javascript:;">  - </a>
							<input type="text" value="${item.commodityNumber}" class="commodity-number">
							<a class="right-a commodity-number-add" href="javascript:;" > + </a>
						</div>
						<div class="list-sum inline a-width">
							¥ <span class="commodity-price"><fmt:formatNumber pattern="0.00" maxFractionDigits="2" value="${item.totalPrice}" /></span>
						</div>
						<div class="list-ops inline a-width">
							<a href="javascript:;" class="delete-commodity" data-commId="${item.commodity.id}">删除</a>
							<a href="javascript:;" class="add-collecting">移到收藏</a>
						</div>
					</div>
					</c:forEach>
				</div>
				
				<div class="c-foot">
					<div class="foot-checkbox inline">
						<input type="checkbox" checked="checked">
					</div>
					<div class="foot-del inline">
						<a href="javascript:;" class="deleteAllCheck">删除选择商品</a>
					</div>
					<div class="foot-submit inline">
						<a href="javascript:;" class="a-go-order">去结算</a>
					</div>
					<div class="foot-sum inline">
						<div class="foot-economize">
							<span>合计：<label class="commodity-totalPrice">￥<fmt:formatNumber pattern="0.00" maxFractionDigits="2" value="${shopCart.totalAmount}" /></label></span>
							<br>
							<em>
								节省：&nbsp;-￥<fmt:formatNumber pattern="0.00" maxFractionDigits="2" value="${shopCart.totalOriginalAmount-shopCart.totalAmount}" />
							</em>
						</div>
						<div class="foot-chose">
							<span>已选择 <label class="commodity-totalNumber">${shopCart.totalSize}</label> 件商品</span>
						</div>

					</div>
				</div>
			</div>
			</c:if>
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
	<div class="modal fade" id="alertModal">
		<div class="modal-dialog" style="margin-top:350px;width: 400px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></button>
					<h4 class="modal-title" id="myModalLabel">提示消息</h4>
				</div>
				<div class="modal-body" style="text-align: center;font-size: 16px">

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="btn-dismiss" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="btn-operate">确定</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	</body>
</html>
