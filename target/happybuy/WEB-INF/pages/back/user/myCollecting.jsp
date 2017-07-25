<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>个人中心-我的收藏-乐购</title>
		<link rel="icon" href="${pageContext.request.contextPath}/resources/css/img/icon.ico"  />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/myCollecting.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/initShopCart.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/userCommon.css" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/bootstrap.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/back/user/myCollecting.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/back/user/initShopCart.js"></script>
		<meta name="Keywords" content="乐购全球购" >
		<script type="text/javascript">
			$(function () {
                var currPage =${requestScope.collectingPageBean.currPage};
                if( currPage == '1'){
                    $("#prevPage").attr("href","javascript:;");
                    $("#prevPage").parent().addClass("disabled");
                    $("#firstPage").attr("href","javascript:;");
                    $("#firstPage").parent().addClass("disabled");
                }
                if(currPage == "${requestScope.collectingPageBean.totalPage}"){
                    $("#nextPage").attr("href","javascript:;");
                    $("#nextPage").parent().addClass("disabled");
                    $("#lastPage").attr("href","javascript:;");
                    $("#lastPage").parent().addClass("disabled");
                }
                //循环输出页码
                for(var i = 1; i <= ${collectingPageBean.totalPage}; i ++){
                    if(i <= 8){
                        $(".page-next").before("<li class='li-page'>" +
                            "<a href='${pageContext.request.contextPath}/user/myCollecting/"+i+"'>"
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
					<p><a href="${pageContext.request.contextPath}/user/order/1" class="">我的订单</a></p>
					<div class="title">
						我的收藏
					</div>
					<p><a href="${pageContext.request.contextPath}/user/myCollecting/1" class="a-selected">我收藏的商品</a></p>
					
					<div class="title">
						我的账户
					</div>
					<p><a href="${pageContext.request.contextPath}/user/modify">账户信息</a></p>
					<p><a href="${pageContext.request.contextPath}/user/editPass">修改密码</a></p>
					<p><a href="${pageContext.request.contextPath}/user/myAddress">地址管理</a></p>
				</div>

				<div class="c-right">
					<div class="p-c-title">
						<span>我收藏的商品</span>
					</div>
					<div class="p-goods-list">
						<table class="table ">
							<tr style="background-color: #EEEEEE">
								<td width="60%">商品介绍</td>
								<td>商品单价</td>
								<td>操作</td>
							</tr>
						</table>
						<div class="p-goods-info">
							<c:forEach items="${collectingPageBean.list}" var="item">
								<div class="">
									<table class="table table-bordered">
										<tr>
											<td width="60%">
												<div class="p-img">
													<a href="javascript:;"><img class="commodity-img" src="${pageContext.request.contextPath}/upload/${item.commodity.picture1}"></a>
												</div>
												<div class="p-desc">
													<span><a href="javascript:;">${item.commodity.description}</a></span>
												</div>
											</td>
											<td width="23%">
												<span>¥ <fmt:formatNumber pattern="0.00" maxFractionDigits="2" value="${item.commodity.currentPrice}" /></span>
											</td>
											<td width="17%" style="text-align: center">
												<a href="javascript:;" data-commId="${item.commodity.id}" class="add-cart">加入购物车</a><br>
												<a href="javascript:;" data-collId="${item.id}" class="delete-commodity">删除</a>
											</td>
										</tr>
									</table>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="p-page">
						<ul class="pagination">
							<li class="li-page">
								<a id="firstPage" href="${pageContext.request.contextPath}/user/myCollecting/1<">首页</a>
							</li>
							<li class="li-page">
								<a href="${pageContext.request.contextPath}/user/myCollecting/${collectingPageBean.currPage-1}"
								   id="prevPage">&laquo; 上一页</a>
							</li>
							<li class="li-page page-next">
								<a href="${pageContext.request.contextPath}/user/myCollecting/${collectingPageBean.currPage+1}>"
								   id="nextPage">下一页 &raquo;</a>
							</li>
							<li class="li-page">
								<a id="lastPage"  href="${pageContext.request.contextPath}/user/myCollecting/${collectingPageBean.totalPage}">尾页</a>
							</li>
							<li style="cursor: default">
							<span>当前第 <span>${collectingPageBean.currPage} / ${collectingPageBean.totalPage} 页</span>&nbsp;
							共 ${collectingPageBean.totalSize} 条记录
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
