<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>个人中心-我的收货地址-乐购</title>
		<link rel="icon" href="${pageContext.request.contextPath}/resources/css/img/icon.ico"  />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/myAddress.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/userCommon.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/initShopCart.css" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/bootstrap.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/back/user/myAddress.js"></script>
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
					<a href="${pageContext.request.contextPath}/user/cart" target="_blank" class="btn btn-danger btn-shopping-cart"
					><span value="${id}" style="margin-right: 10px" class="glyphicon glyphicon-shopping-cart"></span>购物车</a>
					<div class="p-shop-cart">
						<div class="p-shop-cart-goods">
							<h4 style="margin-left: 20px">我的购物车商品</h4>
							<div class="p-list-goods">

							</div>
							<div class="p-total-price">

							</div>
							<div class="p-go-shopcart">
								<a href="${pageContext.request.contextPath}/user/cart" target="_blank">去购物车查看</a>
							</div>
						</div>
					</div>
				</div>
				<div class="header-middle-se">
					<input type="text" name="condition" class="search" placeholder="商品/种类" />
					<button class="btn btn-info btn-search"><span class="glyphicon glyphicon-search"></span>  搜索</button>
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
					<p><a href="${pageContext.request.contextPath}/user/order/1" class="">我的订单</a></p>
					<div class="title">
						我的收藏
					</div>
					<p><a href="${pageContext.request.contextPath}/user/myCollecting/1">我收藏的商品</a></p>
					
					<div class="title">
						我的账户
					</div>
					<p><a href="${pageContext.request.contextPath}/user/modify" >账户信息</a></p>
					<p><a href="${pageContext.request.contextPath}/user/editPass">修改密码</a></p>
					<p><a href="${pageContext.request.contextPath}/user/myAddress" class="a-selected">地址管理</a></p>
				</div>

				<div class="c-right">
					<div class="address">
						<div class="address-title">
							<a>地址管理</a>
							<a href="javascript:;" class="newaddress"  data-toggle="modal" data-target="#modal-add-address">新增收货地址</a>
						</div>
						<div class="address-text">
							<c:forEach items="${addressList}" var="item">
								<div class="text-list">
									<div class="list-title <c:if test="${item.defaultAddress==1}">list-selected</c:if>">
										<div class="title-l">
											<span>地址：</span>
											<span style="margin-left: 20px">${item.name}<c:if test="${item.defaultAddress==1}">(默认地址)</c:if></span>
										</div>
										<div class="title-r" data-addressId="${item.id}">
											<c:if test="${item.defaultAddress==0}">
												<a href="javascript:;" class="set-default-address">设为默认地址</a>
											</c:if>
											<a href="javascript:;" class="edit-address" data-toggle="modal" data-target="#modal-edit-address">编辑</a>
											<c:if test="${item.defaultAddress==0}">
												<a href="javascript:;" class="delete-address">删除</a>
											</c:if>
										</div>
									</div>
									<div class="list-t">
										<div class="t-left">
											<p>收货人：</p>
											<p>详细地址：</p>
											<p>手机：</p>
										</div>
										<div class="t-right">
											<p>${item.name}</p>
											<p>${item.province.name}${item.city.name}${item.detailedAddress}	</p>
											<p>${item.phone}</p>
										</div>
									</div>
								</div>
							</c:forEach>
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
	<%--添加收货地址的弹窗--%>
	<div class="modal fade" id="modal-add-address" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
		<div class="modal-dialog" style="margin-top: 200px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></button>
					<h4 class="modal-title" id="myModalLabel2">添加收货地址</h4>
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
