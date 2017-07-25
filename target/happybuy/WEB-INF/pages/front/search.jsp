<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>搜索结果页面-乐购</title>
		<link rel="icon" href="${pageContext.request.contextPath}/resources/css/img/icon.ico"  />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/front/search.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/userCommon.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/initShopCart.css" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/bootstrap.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/back/user/initShopCart.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/front/search.js"></script>
		<meta name="Keywords" content="乐购全球购" >
		<script type="text/javascript">
			$(function () {
                var currPage =${requestScope.commodityPageBean.currPage};
                if( currPage == '1'){
                    $("#prevPage").attr("href","javascript:;");
                    $("#prevPage").parent().addClass("disabled");
                    $("#firstPage").attr("href","javascript:;");
                    $("#firstPage").parent().addClass("disabled");
                }
                if(currPage == "${requestScope.commodityPageBean.totalPage}"){
                    $("#nextPage").attr("href","javascript:;");
                    $("#nextPage").parent().addClass("disabled");
                    $("#lastPage").attr("href","javascript:;");
                    $("#lastPage").parent().addClass("disabled");
                }
                //循环输出页码
                for(var i = 1; i <= ${commodityPageBean.totalPage}; i ++){
                    if(i <= 8){
                        $(".page-next").before("<li class='li-page'>" +
                            "<a href='${pageContext.request.contextPath}/item/search/"+i+
                            "?condition=${condition}" +
                            "<c:if test='${sort!=null}'>&sort=${sort}</c:if>'>"+i+"</a>" +
                            "    </li>" +
                            "");
                    }
                }
                $.each($(".li-page"),function (i,e) {
                    if($(this).text() == currPage){
                        $(this).addClass("active");
                    }
                })
                var basePath = $("#basePath").val();

                //将商品加入购物车
                $(".add-cart").on("click",function () {
                    if("${id}" == ""){
                        var uri = window.location.pathname;
                        var returnURL = uri.substring(uri.lastIndexOf("/"), uri.length);
                        window.location.href = basePath + "/login.jsp?returnURL=/item/details"+returnURL;
                    }
                    var commodityId = $(this).parent().parent().attr("data-commId");
                    var commodityNumber = $(".commodity-number").val();
                    $.ajax({
                        url:basePath + "/cart/addCommodity",
                        type:"put",
                        data:{"commodityId":commodityId},
                        success:function (data) {
                            if(data == "exist"){
                                $(".modal-body").text("商品已经在购物车了！");
                            } else if(data =="success"){
                                $(".modal-body").text("商品已成功加入购物车！");
                            }
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
                    var commodityId = $(this).parent().parent().attr("data-commId");
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
					<input type="text" name="condition" class="search" value="${condition}" placeholder="商品/种类" />
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
		<!--商品选择导航栏-->
		<div class="goodsChooseGPS">
			<div class="outFrame">
				<div class="insideFrame" >
					<span class="GPSfont">优惠活动：</span>
					<a href="#" >满199减15</a>
					<a href="#" >满199减20</a>
					<a href="#" >满299减20</a>
					<a href="#" >直降</a>
					<a href="#" >满299减50</a>
				</div>
			</div>
			<div class="outFrame">
				<div class="insideFrame" >
					<span class="GPSfont">品牌：</span>
					<a href="#" >NUK</a>
					<a href="#" >米拉贝尔mirabelle</a>
					<a href="#" >贝亲Pigeon</a>
					<a href="#" >啾啾CHUCHU</a>
					<a href="#" >五个小卡车Five Trucks</a>
				</div>
			</div>
			<div class="outFrame">
				<div class="insideFrame" >
					<span class="GPSfont">优惠活动：</span>
					<a href="#" >满199减15</a>
					<a href="#" >满199减20</a>
					<a href="#" >满299减20</a>
					<a href="#" >直降</a>
					<a href="#" >满299减50</a>
				</div>
			</div>
			<div class="outFrame">
				<div class="insideFrame" >
					<span class="GPSfont">优惠活动：</span>
					<a href="#" >满199减15</a>
					<a href="#" >满199减20</a>
					<a href="#" >满299减20</a>
					<a href="#" >直降</a>
					<a href="#" >满299减50</a>
				</div>
			</div>
		</div>

		<!--品牌、销量、新品、价格搜索导航栏-->
		<div class="titleSearch">
			<div class="titleSearch-l" data-condition="${condition}">
				<a href="${pageContext.request.contextPath}/item/search/1?condition=${condition}" class="a-sort
					<c:if test="${sort==null || sort.equals('')}">a-sort-selected</c:if>">
					综合 <span class="glyphicon glyphicon-sort"></span>
				</a>
				<a href="javascript:;" class="a-sort <c:if test="${sort.equals('totalBuy_asc') || sort.equals('totalBuy_desc')}">a-sort-selected</c:if>"
				   id="order-totalBuy" order="${sort}" >销量 <span class="glyphicon glyphicon-sort"></span></a>
				<a href="javascript:;" class="a-sort <c:if test="${sort.equals('price_asc') || sort.equals('price_desc')}">a-sort-selected</c:if>"
				   id="order-price" order="${sort}" >价格 <span class="glyphicon glyphicon-sort"></span></a>
			</div>
			<div class="titleSearch-r">
				<a>共计${commodityPageBean.totalSize}件商品</a>
			</div>
		</div>

		<!--物品展示模块-->
		<div id="goodsClassify">
			<div class="layout-1">
			<c:forEach items="${commodityPageBean.list}" var="item">
				<div class="groupblock">
					<div class="layout-picture">
						<a href="${pageContext.request.contextPath}/item/details/${item.id}" target="_blank">
							<img src="${pageContext.request.contextPath}/upload/${item.picture1}" height="218px" width="100%">
						</a>
					</div>
					<div class="layout-text">
						<div class="tit"><a class="commodity-desc" href="${pageContext.request.contextPath}/item/details/${item.id}" target="_blank">${item.description}</a></div>
						<div class="price">
							<div class="price-left">
								<div class="new">
									<span>现价:<em>¥ <fmt:formatNumber value="${item.currentPrice}" maxFractionDigits="2" pattern="0.00"/> </em></span>
								</div>
								<c:if test="${item.currentPrice<item.originalPrice}">
									<div class="old">
										<span>市场价:<em>¥ <fmt:formatNumber value="${item.originalPrice}" maxFractionDigits="2" pattern="0.00"/> </em></span>
									</div>
								</c:if>
							</div>
							<div class="buy">
								<span>${item.totalBuy}人已买</span>
							</div>
						</div>
						<div class="operate-right" data-commId="${item.id}">
							<div class="p-add-collecting">
								<a href="javascript:;" class="add-collecting"><span class="glyphicon glyphicon-heart"></span> 收藏</a>
							</div>
							<div class="p-add-cart">
								<a href="javascript:;" class="add-cart"><span class="glyphicon glyphicon-shopping-cart"> 加入购物车</span></a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
		<div class="p-page">
			<ul class="pagination">
				<li class="li-page">
					<a id="firstPage" href="${pageContext.request.contextPath}/item/search/1
					?condition=${condition}<c:if test="${sort!=null}">&sort=${sort}</c:if>">首页</a>
				</li>
				<li class="li-page">
					<a href="${pageContext.request.contextPath}/item/search/${commodityPageBean.currPage-1}?condition=
					${condition}<c:if test="${sort!=null}">&sort=${sort}</c:if>"
					   id="prevPage">&laquo; 上一页</a>
				</li>
				<li class="li-page page-next">
					<a href="${pageContext.request.contextPath}/item/search/${commodityPageBean.currPage+1}?condition=
					${condition}<c:if test="${sort!=null}">&sort=${sort}</c:if>"
					   id="nextPage">下一页 &raquo;</a>
				</li>
				<li class="li-page">
					<a id="lastPage"  href="${pageContext.request.contextPath}/item/search
					/${commodityPageBean.totalPage}?condition=${condition}<c:if test="${sort!=null}">&sort=${sort}</c:if>" >尾页</a>
				</li>
				<li style="cursor: default">
                        <span>当前第 <span>${commodityPageBean.currPage} / ${commodityPageBean.totalPage} 页</span>&nbsp;
                        共 ${commodityPageBean.totalSize} 条记录
                            </span>
				</li>
			</ul>
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
					<button type="button" class="btn btn-primary" id="btn-operate" data-dismiss="modal">确定</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	</body>
</html>
