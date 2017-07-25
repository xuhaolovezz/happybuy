<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>商品详情页-乐购</title>
		<link rel="icon" href="${pageContext.request.contextPath}/resources/css/img/icon.ico"  />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/front/details.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/userCommon.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/initShopCart.css" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/bootstrap.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/front/details.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/back/user/initShopCart.js"></script>
		<meta name="Keywords" content="乐购全球购" >
		<script type="text/javascript">
			$(function () {
			    var basePath = $("#basePath").val();

                //将商品加入购物车
                $(".add-cart").on("click",function () {
                    if("${id}" == ""){
                        var uri = window.location.pathname;
                        var returnURL = uri.substring(uri.lastIndexOf("/"), uri.length);
                        window.location.href = basePath + "/login.jsp?returnURL=/item/details"+returnURL;
                    }
                    var commodityId = $(this).parent().attr("data-commId");
                    var commodityNumber = $(".commodity-number").val();
                    $.ajax({
                        url:basePath + "/cart/addCommodityAndNumber",
                        type:"put",
                        data:{"commodityId":commodityId,"commodityNumber":commodityNumber},
                        success:function (data) {
                            $(".modal-body").text("商品已成功加入购物车！");
                            $("#btn-operate").text("去购物车查看");
                            $("#btn-operate").off();
                            $("#btn-operate").on("click",function () {
                                window.open(basePath + "/user/cart");
                            });
                            $('#alertModal2').modal('show');
                        }
                    })
                });
                /**
                 * 添加商品到收藏
                 */
                $(".add-collecting").on("click",function () {
                    if("${id}" == ""){
                        var uri = window.location.pathname;
                        var returnURL = uri.substring(uri.lastIndexOf("/"), uri.length);
                        window.location.href = basePath + "/login.jsp?returnURL=/item/details"+returnURL;
                    }
                    var commodityId = $(this).parent().attr("data-commId");
                    $.ajax({
                        url:basePath + "/collecting/addCollecting",
                        type:"put",
                        data:{"commodityId":commodityId},
                        success:function (data) {
                            if(data == "exist"){
                                $(".modal-body").text("商品已经在收藏列表了！");
                            } else if(data =="success"){
                                $(".modal-body").text("商品已成功加入收藏！");
                            }
                            $("#btn-operate").hide();
                            $('#alertModal').modal('show');
                        }
                    })
                });
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
					<img src="${pageContext.request.contextPath}/resources/css/img/logo.png" width="100px" height="100px">
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
			<div class="title">
				<a target="_blank" href="${pageContext.request.contextPath}/index.jsp">乐购首页</a>
				<a>></a>
				<a target="_blank" href="${pageContext.request.contextPath}/item/search/1?condition=${commodity.kind.name}">${commodity.kind.name}</a>
				<a>></a>
				<a target="_blank" href="${pageContext.request.contextPath}/item/search/1?condition=${commodity.smallKind.name}">${commodity.smallKind.name}</a>
				<a>></a>
				<a target="_blank" href="javascript:;">${commodity.name}</a>
			</div>
			<div class="show">
				<div class="show-left">
					<div class="img-b">
						<img src="${pageContext.request.contextPath}/upload/${commodity.picture1}" width="300px" height="300px">
					</div>
					<div class="img-s">
						<img class="s1" src="${pageContext.request.contextPath}/upload/${commodity.picture1}" width="70px" height="70px">
						<img class="s1" src="${pageContext.request.contextPath}/upload/${commodity.picture2}" width="70px" height="70px">
						<img class="s1" src="${pageContext.request.contextPath}/upload/${commodity.picture3}" width="70px" height="70px">
						<img class="s1" src="${pageContext.request.contextPath}/upload/${commodity.picture4}" width="70px" height="70px">
					</div>
				</div>
				<div class="show-right">
					<div  class="r-title">
						<span>${commodity.name}</span>
					</div>
					<div class="r-introduce">
						<span>${commodity.description}</span>
					</div>
					<div class="r-price">
						<span id="r1">售价</span><span id="r2">¥ <fmt:formatNumber pattern="0.00" maxFractionDigits="2" value="${commodity.currentPrice}" /></span>
						<c:if test="${commodity.currentPrice < commodity.originalPrice}">
							<span style="margin-left: 10px;text-decoration: line-through">¥ <fmt:formatNumber pattern="0.00" maxFractionDigits="2" value="${commodity.originalPrice}" /></span>
						</c:if>
					</div>
					<div class="r-quantity">
						<div class="list-quantity " data-stock="${commodity.stock}" data-commId="${commodity.id}">
							<span style="margin-right: 30px">数量：</span>
							<a class="left-a commodity-number-sub " href="javascript:;">  - </a>
							<input type="text" value="1" class="commodity-number">
							<a class="right-a commodity-number-add" style="margin-left: -5px;" href="javascript:;" > + </a>
							<span style="margin-left: 20px; font-size: 12px">库存：${commodity.stock}</span>
						</div>
					</div>
					<div class="r-ops" data-commId="${commodity.id}">
						<a href="javascript:;" class="add-cart"><span class="glyphicon glyphicon-shopping-cart"></span> 加入购物车</a>
						<a href="javascript:;" class="add-collecting">收藏</a>
					</div>
				</div>
			</div>

			<div class="introduction">
				<div class="intro-tite">
					<a href="javascript:void(0)" class="i1">商品详情</a>
					<a href="javascript:void(0)"id="i2">商品评价</a>
				</div>
				<div class="left">
					<div class="intro-text">
						<div class="intro-details">
							<div class="intro-details-left">
							<span>商品名称：</span>${commodity.name}<br>
								<span>分类：</span>${commodity.kind.name}- ${commodity.smallKind.name}
							</div>
							<div class="intro-details-right">
								<span>品牌：</span><br>
								<span>产地：</span>中国
							</div>

						</div>
						<div class="intro-img">
							<img src="${pageContext.request.contextPath}/upload/${commodity.descPicture1}" width="100%" height="100%">
							<c:if test="${commodity.descPicture2 !=null}">
								<img src="${pageContext.request.contextPath}/upload/${commodity.descPicture2}" width="100%" height="100%">
							</c:if>
							<c:if test="${commodity.descPicture3 !=null}">
								<img src="${pageContext.request.contextPath}/upload/${commodity.descPicture3}" width="100%" height="100%">
							</c:if>
							<c:if test="${commodity.descPicture4 !=null}">
								<img src="${pageContext.request.contextPath}/upload/${commodity.descPicture4}" width="100%" height="100%">
							</c:if>
						</div>
					</div>
				</div>

				<div class="right">
					<div class="grade">
						<div class="g-xing">
							<span>好评度</span><span id="g1">${commodity.goodRatio}%</span>
							<span>好评(${commodity.totalGood})</span>
							<span>中评(${commodity.totalNormal})</span>
							<span>差评(${commodity.totalBad})</span>
						</div>
						<c:if test="${commodity.commentList.size() == 0 || commodity.commentList.get(0).id == null}">
							<div class="noComment">
								该商品暂无评价
							</div>
						</c:if>
						<c:forEach items="${commodity.commentList}" var="item">
							<div class="g-text">
								<p><span class="g2">${item.user.username}</span>
								<p>${item.content}</p>
								<p>
									<c:if test="${item.picture1 != null && !item.picture1.trim().equals('')}">
										<a href="javascript:void(0)">
											<img class="g4" src="${pageContext.request.contextPath}/upload/${item.picture1}" width="48px" height="48px">
										</a>
									</c:if>
									<c:if test="${item.picture2 != null && !item.picture2.trim().equals('')}">
										<a href="javascript:void(0)">
											<img class="g4" src="${pageContext.request.contextPath}/upload/${item.picture2}" width="48px" height="48px">
										</a>
									</c:if>
									<c:if test="${item.picture3 != null && !item.picture3.trim().equals('')}">
										<a href="javascript:void(0)">
											<img class="g4" src="${pageContext.request.contextPath}/upload/${item.picture3}" width="48px" height="48px">
										</a>
									</c:if>
									<c:if test="${item.picture4 != null && !item.picture4.trim().equals('')}">
										<a href="javascript:void(0)">
											<img class="g4" src="${pageContext.request.contextPath}/upload/${item.picture4}" width="48px" height="48px">
										</a>
									</c:if>
								</p>
								<p class="g5">
									<a href="javascript:void(0)"><img src="" width="360px" height="200px" ></a>
								</p>
								<p class="g6">${item.createTime}</p>
							</div>
						</c:forEach>
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
	<div class="modal fade" id="alertModal2">
		<div class="modal-dialog" style="margin-top:350px;width: 400px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></button>
					<h4 class="modal-title" id="myModalLabel2">提示</h4>
				</div>
				<div class="modal-body" style="text-align: center;font-size: 18px;">

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="btn-dismiss2" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="btn-operate" data-dismiss="modal"></button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	</body>
</html>
