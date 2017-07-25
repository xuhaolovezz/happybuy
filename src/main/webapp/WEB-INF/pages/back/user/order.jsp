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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/userCommon.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/initShopCart.css" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/bootstrap.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/back/user/order.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/back/user/initShopCart.js"></script>
		<meta name="Keywords" content="乐购全球购" >
		<script type="text/javascript">
			$(function () {
                var currPage =${requestScope.orderPageBean.currPage};
                if( currPage == '1'){
                    $("#prevPage").attr("href","javascript:;");
                    $("#prevPage").parent().addClass("disabled");
                    $("#firstPage").attr("href","javascript:;");
                    $("#firstPage").parent().addClass("disabled");
                }
                if(currPage == "${requestScope.orderPageBean.totalPage}"){
                    $("#nextPage").attr("href","javascript:;");
                    $("#nextPage").parent().addClass("disabled");
                    $("#lastPage").attr("href","javascript:;");
                    $("#lastPage").parent().addClass("disabled");
                }
                //循环输出页码
                for(var i = 1; i <= ${orderPageBean.totalPage}; i ++){
                    if(i <= 8){
                        $(".page-next").before("<li class='li-page'>" +
                            "<a href='${pageContext.request.contextPath}/user/order/"+i+"<c:if test="${state != null}">?state=${state}</c:if>'>"
                            + i + "</a>" +
                            "</li>");
                    }
                }
                $.each($(".li-page"),function (i,e) {
                    if($(this).text() == currPage){
                        $(this).addClass("active");
                    }
                })
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
					<a href="${pageContext.request.contextPath}/user/cart" target="_blank"  class="btn btn-danger btn-shopping-cart"
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
					<p><a href="${pageContext.request.contextPath}/user/order/1" id="l1">我的订单</a></p>
					<div class="title">
						我的收藏
					</div>
					<p><a href="${pageContext.request.contextPath}/user/myCollecting/1">我收藏的商品</a></p>
					
					<div class="title">
						我的账户
					</div>
					<p><a href="${pageContext.request.contextPath}/user/modify">账户信息</a></p>
					<p><a href="${pageContext.request.contextPath}/user/editPass">修改密码</a></p>
					<p><a href="${pageContext.request.contextPath}/user/myAddress">地址管理</a></p>
				</div>
				
				<div class="c-right">
					<div class="order-menu">
						<li class="order-menu-li">
						<a href="${pageContext.request.contextPath}/user/order/1" <c:if test="${state==null}">class="o1"</c:if> >全部订单</a>
						</li>
						<li class="order-menu-li">
						<a href="${pageContext.request.contextPath}/user/order/1?state=未付款" <c:if test="${state.equals('未付款')}">class="o1"</c:if>>待付款
							<span>${orderStateCount.waitPay}</span>
						</a>
						</li>
						<li class="order-menu-li">
							<a href="${pageContext.request.contextPath}/user/order/1?state=已支付" <c:if test="${state.equals('已支付')}">class="o1"</c:if>>待发货
								<span>${orderStateCount.waitSliverGoods}</span>
							</a>

						</li>
						<li class="order-menu-li">
						<a href="${pageContext.request.contextPath}/user/order/1?state=已发货" <c:if test="${state.equals('已发货')}">class="o1"</c:if>>待收货
							<span>${orderStateCount.waitTakeGoods}</span>
						</a>
						</li>
						<li class="order-menu-li">
						<a href="${pageContext.request.contextPath}/user/order/1?state=已收货" <c:if test="${state.equals('已收货')}">class="o1"</c:if>>待评价
							<span>${orderStateCount.waitComment}</span>
						</a>
						</li>
					</div>
					<div class="right-order-title">
						<table class="table ">
							<tr style="text-align: center;background-color: #f1f1f1">
								<td width="560px">订单详情</td>
								<td width="90px">收货人</td>
								<td width="110px">金额</td>
								<td width="100px">交易状态</td>
								<td width="100px">操作</td>
							</tr>
						</table>
					</div>
					<c:forEach items="${orderPageBean.list}" var="item">
						<div>
							<table class="table table-bordered">
								<tr>
									<td colspan="5" class="td-order">
										<span class="order-span">${item.orderDetail.createTime}</span>
										<span class="order-id">订单号：</span><span class="order-id1">${item.id}</span>
										<div class="order-total-price">
											<span class="">总金额：¥ <fmt:formatNumber pattern="0.00" maxFractionDigits="2" value="${item.totalAmount}" /></span>
										</div>
									</td>
								</tr>
								<c:forEach items="${item.orderCommodityList}" var="comm" varStatus="i">
									<tr style="text-align: center">
										<td  style="text-align: left">
											<div class="p-number">
												X ${comm.commodityNumber}
											</div>
											<div class="p-goods">
												<div class="p-img">
													<a href="${pageContext.request.contextPath}/item/details/${comm.commodityId}" target="_blank">
													<img class="commodity-img" src="${pageContext.request.contextPath}/upload/${comm.commPicture}">
													</a>
												</div>
												<div class="p-desc">
													<a href="${pageContext.request.contextPath}/item/details/${comm.commodityId}" target="_blank">
														${comm.description}
													</a>
												</div>
											</div>
										</td>
										<c:if test="${i.index == 0}">
											<td width="90px" rowspan="${item.orderCommodityList.size()}">
												<div class="p-detail">${item.orderDetail.name}
													<span class="glyphicon glyphicon-user p-user" ></span>
												</div>
											</td>
										</c:if>
										<td width="110px">
											<div class="p-detail">
												¥ <fmt:formatNumber pattern="0.00" maxFractionDigits="2" value="${comm.totalPrice}" />
											</div>
										</td>
										<c:if test="${i.index == 0}">
											<td width="100px" rowspan="${item.orderCommodityList.size()}">
												<div class="p-order">
													<br>
													<span class="<c:if test="${item.state.equals('未付款') || item.state.equals('已取消')}">span-wait-pay</c:if>">${item.state}</span><br>
														<a class="p-order-a" href="${pageContext.request.contextPath}/user/order/detail/${item.id}">订单详情</a>
												</div>
											</td>
										</c:if>
										<c:if test="${i.index == 0}">
											<td width="100px" rowspan="${item.orderCommodityList.size()}">
												<div class="p-order">
													<br>
													<c:if test="${item.state.equals('已取消')}">
														<a class="a-buy-again" href="javascript:;">再次购买</a>
													</c:if>
													<c:if test="${item.state.equals('未付款')}">
														<div class="p-pay">
															<a class="a-pay" data-orderId="${item.id}" href="javascript:;">立即付款</a>
														</div>
														<a class="p-order-a" data-orderId="${item.id}" href="javascript:;">取消订单</a>
													</c:if>
													<c:if test="${item.state.equals('已发货')}">
														<a class="a-take-goods" data-orderId="${item.id}" href="javascript:;">立即收货</a><br>
													</c:if>
													<c:if test="${item.state.equals('已收货')}">
														<a class="a-comment" data-orderId="${item.id}" href="javascript:;">立即评价</a><br>
													</c:if>
													<c:if test="${item.state.equals('已完成')}">
														<a class="a-buy-again" href="javascript:;">再次购买</a>
													</c:if>
												</div>
											</td>
										</c:if>
									</tr>
								</c:forEach>
							</table>
						</div>
					</c:forEach>
				<div class="p-page">
					<ul class="pagination">
						<li class="li-page">
							<a id="firstPage" href="${pageContext.request.contextPath}/user/order/1<c:if test="${state != null}">?state=${state}</c:if>">首页</a>
						</li>
						<li class="li-page">
							<a href="${pageContext.request.contextPath}/user/order/${orderPageBean.currPage-1}<c:if test="${state != null}">?state=${state}</c:if>"
							   id="prevPage">&laquo; 上一页</a>
						</li>
						<li class="li-page page-next">
							<a href="${pageContext.request.contextPath}/user/order/${orderPageBean.currPage+1}<c:if test="${state != null}">?state=${state}</c:if>"
							   id="nextPage">下一页 &raquo;</a>
						</li>
						<li class="li-page">
							<a id="lastPage"  href="${pageContext.request.contextPath}/user/order/${orderPageBean.totalPage}<c:if test="${state != null}">?state=${state}</c:if>">尾页</a>
						</li>
						<li style="cursor: default">
                        <span>当前第 <span>${orderPageBean.currPage} / ${orderPageBean.totalPage} 页</span>&nbsp;
                        共 ${orderPageBean.totalSize} 条记录
                            </span>
						</li>
					</ul>
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
					<button type="button" class="btn btn-default" id="btn-dismiss" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="btn-operate">添加</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	</body>
</html>
