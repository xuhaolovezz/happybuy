<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>订单结算页-乐购</title>
		<link rel="icon" href="${pageContext.request.contextPath}/resources/css/img/icon.ico"  />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/orderPay.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/userCommon.css" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/bootstrap.js"></script>
		<meta name="Keywords" content="乐购全球购" >
		<script type="text/javascript">
			$(function () {
                $(".logout").on("click",function () {
                    $.ajax({
                        url:"${pageContext.request.contextPath}/user/logout",
                        type:"post",
                        success:function () {
                            window.location.href ="${pageContext.request.contextPath}/index.jsp";
                        }
                    })
                });

                //付款
				/*$("#btn-pay").on("click",function () {
				    var orderId = $("#orderId").val();
				    var totalAmount = $("#totalAmount").val();
					$.ajax({
					    url:"${pageContext.request.contextPath}/order/aliPay",
						type:"post",
						data:{"orderId":orderId,"totalAmount":totalAmount},
						success:function (data) {
							if(data == "success"){
							    alert("支付成功！");
                            }
                        }
					})
                })*/
            })
		</script>
	</head>
	<body>
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
			<div class="apply">
				<div class="apply-head">
					<p><span class="a1">订单号：${orderId}</span></p>
					<p><span class="a1">订单提交成功，仅差一步完成购物，请尽快支付！</span></p>
					<p>请在<span id="a2">23时59分59秒</span>内完成支付。
						<span id="a3">待支付：</span><span id="a4">¥ <fmt:formatNumber pattern="0.00" maxFractionDigits="2" value="${totalAmount}" /></span></p>
					<p>到期未付款订单将会被取消。</p>
				</div>
				<div class="hr"></div>
				<div class="apply-middle">
					<div class="middle-title">
						<p>支付宝支付</p>
						<p id="a5"><img src="${pageContext.request.contextPath}/resources/css/img/cart3/i1.png" width="15px" height="15px">使用支付宝付款成功后，将自动跳转到结果页。</p>
					</div>
					<div class="middle-img">
						<form action="${pageContext.request.contextPath}/order/aliPay" method="post">
							<input type="hidden" name="orderId" value="${orderId}">
							<input type="hidden" name="totalAmount" value="${totalAmount}">
							<input type="hidden" name="orderName" value="${orderName}">
							<input type="hidden" name="orderDesc" value="${orderDesc}">
							<input type="submit" class="btn btn-primary" id="btn-pay" value="立即付款">
						</form>
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
