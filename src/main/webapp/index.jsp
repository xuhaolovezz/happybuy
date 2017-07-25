<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>乐购-全球购</title>
		<link rel="icon" href="${pageContext.request.contextPath}/resources/css/img/icon.ico" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/front/index.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/userCommon.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/initShopCart.css" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/bootstrap.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/front/index.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/back/user/initShopCart.js"></script>
		<meta name="Keywords" content="乐购全球购">
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
							<a href="${pageContext.request.contextPath}/login.jsp?returnURL=/index.jsp">登录</a>
							<a href="${pageContext.request.contextPath}/register.jsp">免费注册</a>
						</c:if>
						<c:if test="${sessionScope.get('id') !=null}">
							<a href="javascript:;">${username}</a>
							<a href="javascript:;" class="logout">退出</a>
							<a href="${pageContext.request.contextPath}/user/order/1" target="_blank">我的订单</a>
						</c:if>
						<a href="${pageContext.request.contextPath}/help.jsp" target="_blank">帮助中心</a>
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
					<a href="${pageContext.request.contextPath}/user/cart" target="_blank" class="btn btn-danger btn-shopping-cart"
					><span value="${id}" style="margin-right: 10px" class="glyphicon glyphicon-shopping-cart"></span>购物车</a>

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
				<div class="header-foot-r">
					<a target="_blank" href="${pageContext.request.contextPath}/index.jsp" class="header-foot-r1">首页</a>
					<a target="_blank" href="${pageContext.request.contextPath}/item/search/1?condition=运动" class="header-foot-r1">运动户外</a>
					<a target="_blank" href="${pageContext.request.contextPath}/item/search/1?condition=饮料" class="header-foot-r1">饮料冲调</a>
					<a target="_blank" href="${pageContext.request.contextPath}/item/search/1?condition=食品" class="header-foot-r1">食品小吃</a>
					<a target="_blank" href="${pageContext.request.contextPath}/item/search/1?condition=家电" class="header-foot-r1">家电大全</a>
					<a target="_blank" href="${pageContext.request.contextPath}/item/search/1?condition=数码" class="header-foot-r1">数码产品</a>
					<a target="_blank" href="${pageContext.request.contextPath}/item/search/1?condition=珠宝" class="header-foot-r1">珠宝首饰</a>
					<a target="_blank" href="${pageContext.request.contextPath}/help.jsp" class="header-foot-r1">帮助中心</a>
					<div class="head" id="head">
						<div class="head-l">
							<div class="inner">
								<div class="i">
									<a href="${pageContext.request.contextPath}/item/search/1?condition=家电">家用电器</a>
								</div>
								<p>
									<a href="${pageContext.request.contextPath}/item/search/1?condition=电视" target="_blank">电视</a>
									<a href="${pageContext.request.contextPath}/item/search/1?condition=空调" target="_blank">空调</a>
									<a href="${pageContext.request.contextPath}/item/search/1?condition=洗衣机" target="_blank">洗衣机</a>
									<a href="${pageContext.request.contextPath}/item/search/1?condition=冰箱" target="_blank">冰箱</a>
								</p>
								<p>
									<a href="javascript:;" target="_blank">厨卫大电</a>
									<a href="javascript:;" target="_blank" >厨房小电</a>
								</p>
								<div class="colums">
									<div class="colum">
										<h3>数码专区</h3>
										<p>
											<a href="javascript:;" target="_blank" class="ho1t">鼠标</a>
											<a href="javascript:;" target="_blank">手机</a>
											<a href="javascript:;" target="_blank" class="hot1">电脑</a>
											<a href="javascript:;" target="_blank" class="hot1">键盘</a>
											<a href="javascript:;" target="_blank">耳机</a>
											<a href="javascript:;" target="_blank">成人奶粉</a>
										</p>
									</div>
									<div class="colum">
										<h3>屁屁护理</h3>
										<p>
											<a href="javascript:;" target="_blank">纸尿裤</a>
											<a href="javascript:;" target="_blank" class="hot1">拉拉裤</a>
											<a href="javascript:;" target="_blank">隔尿垫/布尿裤</a>
											<a href="javascript:;" target="_blank" class="hot1">宝宝湿巾</a>
										</p>
									</div>
									<div class="colum">
										<h3>全球奶粉大牌</h3>
										<p>
											<a href="javascript:;" target="_blank" class="hot1">德国爱他美</a>
											<a href="javascript:;" target="_blank" class="hot1">德国Hipp</a>
											<a href="javascript:;" target="_blank">德国Topfer</a>
											<a href="javascript:;" target="_blank" class="hot1">荷兰Nutrilon</a>
											<a href="javascript:;" target="_blank" class="hot1">荷兰Herobaby</a>
											<a href="javascript:;" target="_blank">英国Cow&Gate</a>
											<a href="javascript:;" target="_blank">澳洲Aptamil</a>
											<a href="javascript:;" target="_blank">德国holle</a>
											<a href="javascript:;" target="_blank">英国Aptamil</a>
										</p>
									</div>
									<div class="colum">
										<h3>全球纸尿裤大牌</h3>
										<p>
											<a href="javascript:;" target="_blank" class="hot1">尤妮佳</a>
											<a href="javascript:;" target="_blank" class="hot1">花王</a>
											<a href="javascript:;" target="_blank" class="hot1">GOON大王天使</a>
											<a href="javascript:;" target="_blank">GOON大王维E</a>
											<a href="javascript:;" target="_blank" class="hot1">Pampers帮宝适</a>
											<a href="javascript:;" target="_blank">Pampers care帮宝适棉柔</a>
											<a href="javascript:;" target="_blank">Huggies Gold好奇金装</a>
										</p>
									</div>
								</div>
							</div>

							<div class="inner">
								<div class="i">
									<a href="javascript:void(0)">女装/内衣</a>
								</div>
								<p>
									<a href="javascript:void(0)" target="_blank">当季修行</a>
									<a href="javascript:void(0)" target="_blank">精选上装</a>
									<a href="javascript:void(0)" target="_blank">浪漫裙装</a>
								</p>
								<p>
									<a href="javascript:void(0)" target="_blank">特色女装</a>
									<a href="javascript:void(0)" target="_blank">文胸塑身</a>
									<a href="javascript:void(0)" target="_blank">家居服</a>
								</p>
								<div class="colums">
									<div class="colum">
										<h3>当季流行</h3>
										<p>
											<a href="javascript:;" target="_blank" class="hot2">夏季新品</a>
											<a href="javascript:;" target="_blank">商场同款</a>
											<a href="javascript:;" target="_blank" class="hot2">气质连衣裙</a>
											<a href="javascript:;" target="_blank" class="hot2">印花衬衫</a>
											<a href="javascript:;" target="_blank">牛仔单品</a>
											<a href="javascript:;" target="_blank">百搭休闲裤</a>
											<a href="javascript:;" target="_blank" class="hot2">无痕文胸</a>
											<a href="javascript:;" target="_blank">运动文胸</a>
											<a href="javascript:;" target="_blank">超柔内裤</a>

										</p>
									</div>
									<div class="colum">
										<h3>精选上装</h3>
										<p>
											<a href="javascript:;" target="_blank">T恤</a>
											<a href="javascript:;" target="_blank" class="hot2">衬衫</a>
											<a href="javascript:;" target="_blank">针织衫</a>
											<a href="javascript:;" target="_blank" class="hot2">短外套</a>
											<a href="javascript:;" target="_blank" class="hot2">小西装</a>
											<a href="javascript:;" target="_blank">风衣</a>
											<a href="javascript:;" target="_blank" class="hot2">卫衣</a>

										</p>
									</div>
									<div class="colum">
										<h3>浪漫裙装</h3>
										<p>
											<a href="javascript:;" target="_blank" class="hot2">连衣裙</a>
											<a href="javascript:;" target="_blank" class="hot2">蕾丝连衣裙</a>
											<a href="javascript:;" target="_blank">真丝连衣裙</a>
											<a href="javascript:;" target="_blank" class="hot2">印花连衣裙</a>
											<a href="javascript:;" target="_blank" class="hot2">半身裙</a>
											<a href="javascript:;" target="_blank">百褶裙</a>
											<a href="javascript:;" target="_blank">牛仔裙</a>
											<a href="javascript:;" target="_blank">背心裙</a>
											<a href="javascript:;" target="_blank">a字裙</a>
										</p>
									</div>
									<div class="colum">
										<h3>特色女装</h3>
										<p>
											<a href="javascript:;" target="_blank" class="hot2">时尚套装</a>
											<a href="javascript:;" target="_blank" class="hot2">休闲套装</a>
											<a href="javascript:;" target="_blank" class="hot2">精选妈妈装</a>
											<a href="javascript:;" target="_blank">大码女装</a>
											<a href="javascript:;" target="_blank" class="hot2">职业套装</a>
											<a href="javascript:;" target="_blank">优雅旗袍</a>
											<a href="javascript:;" target="_blank">精致礼服</a>
										</p>
									</div>
									<div class="colum">
										<h3>文胸塑身</h3>
										<p>
											<a href="javascript:;" target="_blank" class="hot2">光面文胸</a>
											<a href="javascript:;" target="_blank" class="hot2">运动文胸</a>
											<a href="javascript:;" target="_blank" class="hot2">美背文胸</a>
											<a href="javascript:;" target="_blank">聚拢文胸</a>
											<a href="javascript:;" target="_blank" class="hot2">大杯文胸</a>
											<a href="javascript:;" target="_blank">轻薄塑身</a>
										</p>
									</div>
									<div class="colum">
										<h3>家居服</h3>
										<p>
											<a href="javascript:;" target="_blank" class="hot2">春夏家居服</a>
											<a href="javascript:;" target="_blank" class="hot2">纯棉家居服</a>
											<a href="javascript:;" target="_blank" class="hot2">莫代尔家居服</a>
											<a href="javascript:;" target="_blank">真丝家居服</a>
											<a href="javascript:;" target="_blank" class="hot2">春夏睡裙</a>
											<a href="javascript:;" target="_blank">情侣家居服</a>
											<a href="javascript:;" target="_blank">性感睡裙</a>
										</p>
									</div>
								</div>
							</div>

							<div class="inner">
								<div class="i">
									<a href="javascript:void(0)">孕妇用品</a>
								</div>
								<p>
									<a href="javascript:void(0)" target="_blank">孕妇装/孕妇裙</a>
									<a href="javascript:void(0)" target="_blank">待产/月子用品</a>
								</p>
								<p>
									<a href="javascript:void(0)" target="_blank">防辐射服</a>
									<a href="javascript:void(0)" target="_blank">孕期营养</a>
								</p>
								<div class="colums">
									<div class="colum">
										<h3>当季流行</h3>
										<p>
											<a href="javascript:;" target="_blank" class="hot3">耳钉</a>
											<a href="javascript:;" target="_blank">黄金项链</a>
											<a href="javascript:;" target="_blank" class="hot3">投资黄金</a>
											<a href="javascript:;" target="_blank" class="hot3">婚嫁套饰</a>
											<a href="javascript:;" target="_blank">转运珠品</a>
											<a href="javascript:;" target="_blank">黄金对戒</a>
										</p>
									</div>
									<div class="colum">
										<h3>屁屁护理</h3>
										<p>
											<a href="javascript:;" target="_blank">纸尿裤</a>
											<a href="javascript:;" target="_blank" class="hot3">拉拉裤</a>
											<a href="javascript:;" target="_blank">隔尿垫/布尿裤</a>
											<a href="javascript:;" target="_blank" class="hot3">宝宝湿巾</a>
										</p>
									</div>
									<div class="colum">
										<h3>全球奶粉大牌</h3>
										<p>
											<a href="javascript:;" target="_blank" class="hot3">德国爱他美</a>
											<a href="javascript:;" target="_blank" class="hot3">德国Hipp</a>
											<a href="javascript:;" target="_blank">德国Topfer</a>
											<a href="javascript:;" target="_blank" class="hot3">荷兰Nutrilon</a>
											<a href="javascript:;" target="_blank" class="hot3">荷兰Herobaby</a>
											<a href="javascript:;" target="_blank">英国Cow&Gate</a>
											<a href="javascript:;" target="_blank">澳洲Aptamil</a>
											<a href="javascript:;" target="_blank">德国holle</a>
											<a href="javascript:;" target="_blank">英国Aptamil</a>
										</p>
									</div>
									<div class="colum">
										<h3>全球纸尿裤大牌</h3>
										<p>
											<a href="javascript:;" target="_blank" class="hot3">尤妮佳</a>
											<a href="javascript:;" target="_blank" class="hot3">花王</a>
											<a href="javascript:;" target="_blank" class="hot3">GOON大王天使</a>
											<a href="javascript:;" target="_blank">GOON大王维E</a>
											<a href="javascript:;" target="_blank" class="hot3">Pampers帮宝适</a>
											<a href="javascript:;" target="_blank">Pampers care帮宝适棉柔</a>
											<a href="javascript:;" target="_blank">Huggies Gold好奇金装</a>
										</p>
									</div>
								</div>
							</div>

							<div class="inner">
								<div class="i">
									<a href="javascript:void(0)">童装/童鞋</a>
								</div>
								<p>
									<a href="javascript:void(0)" target="_blank">新生儿礼盒</a>
									<a href="javascript:void(0)" target="_blank">连身衣/爬服</a>
								</p>
								<p>
									<a href="javascript:void(0)" target="_blank">T恤/POLO衫</a>
									<a href="javascript:void(0)" target="_blank">童子装</a>
									<a href="javascript:void(0)" target="_blank">太阳镜</a>
								</p>
								<div class="colums">
									<div class="colum">
										<h3>当季流行</h3>
										<p>
											<a href="javascript:;" target="_blank" class="hot4">强化复合地板</a>
											<a href="javascript:;" target="_blank">瓷砖</a>
											<a href="javascript:;" target="_blank" class="hot4">墙纸</a>
											<a href="javascript:;" target="_blank" class="hot4">涂料</a>
											<a href="javascript:;" target="_blank">瓷砖</a>
											<a href="javascript:;" target="_blank">背景墙</a>
										</p>
									</div>
									<div class="colum">
										<h3>屁屁护理</h3>
										<p>
											<a href="javascript:;" target="_blank">纸尿裤</a>
											<a href="javascript:;" target="_blank" class="hot4">拉拉裤</a>
											<a href="javascript:;" target="_blank">隔尿垫/布尿裤</a>
											<a href="javascript:;" target="_blank" class="hot4">宝宝湿巾</a>
										</p>
									</div>
									<div class="colum">
										<h3>全球奶粉大牌</h3>
										<p>
											<a href="javascript:;" target="_blank" class="hot4">德国爱他美</a>
											<a href="javascript:;" target="_blank" class="hot4">德国Hipp</a>
											<a href="javascript:;" target="_blank">德国Topfer</a>
											<a href="javascript:;" target="_blank" class="hot4">荷兰Nutrilon</a>
											<a href="javascript:;" target="_blank" class="hot4">荷兰Herobaby</a>
											<a href="javascript:;" target="_blank">英国Cow&Gate</a>
											<a href="javascript:;" target="_blank">澳洲Aptamil</a>
											<a href="javascript:;" target="_blank">德国holle</a>
											<a href="javascript:;" target="_blank">英国Aptamil</a>
										</p>
									</div>
									<div class="colum">
										<h3>全球纸尿裤大牌</h3>
										<p>
											<a href="javascript:;" target="_blank" class="hot4">尤妮佳</a>
											<a href="javascript:;" target="_blank" class="hot4">花王</a>
											<a href="javascript:;" target="_blank" class="hot4">GOON大王天使</a>
											<a href="javascript:;" target="_blank">GOON大王维E</a>
											<a href="javascript:;" target="_blank" class="hot4">Pampers帮宝适</a>
											<a href="javascript:;" target="_blank">Pampers care帮宝适棉柔</a>
											<a href="javascript:;" target="_blank">Huggies Gold好奇金装</a>
										</p>
									</div>
								</div>
							</div>

							<div class="inner">
								<div class="i">
									<a href="javascript:void(0)">玩具/书籍</a>
								</div>
								<p>
									<a href="javascript:void(0)" target="_blank">益智</a>
									<a href="javascript:void(0)" target="_blank">毛绒/安抚</a>
									<a href="javascript:void(0)" target="_blank">牙胶/咬咬胶</a>
								</p>
								<p>
									<a href="javascript:void(0)" target="_blank">戏水/游泳装备</a>
									<a href="javascript:void(0)" target="_blank">中文绘本</a>
								</p>
								<div class="colums">
									<div class="colum">
										<h3>5</h3>
										<p>
											<a href="javascript:;" target="_blank" class="hot5">123</a>
											<a href="javascript:;" target="_blank">商场同款</a>
											<a href="javascript:;" target="_blank" class="hot5">气质连衣裙</a>
											<a href="javascript:;" target="_blank" class="hot5">印花衬衫</a>
											<a href="javascript:;" target="_blank">牛仔单品</a>
											<a href="javascript:;" target="_blank">百搭休闲裤</a>
										</p>
									</div>
									<div class="colum">
										<h3>屁屁护理</h3>
										<p>
											<a href="javascript:;" target="_blank">纸尿裤</a>
											<a href="javascript:;" target="_blank" class="hot5">拉拉裤</a>
											<a href="javascript:;" target="_blank">隔尿垫/布尿裤</a>
											<a href="javascript:;" target="_blank" class="hot5">宝宝湿巾</a>
										</p>
									</div>
									<div class="colum">
										<h3>全球奶粉大牌</h3>
										<p>
											<a href="javascript:;" target="_blank" class="hot5">德国爱他美</a>
											<a href="javascript:;" target="_blank" class="hot5">德国Hipp</a>
											<a href="javascript:;" target="_blank">德国Topfer</a>
											<a href="javascript:;" target="_blank" class="hot5">荷兰Nutrilon</a>
											<a href="javascript:;" target="_blank" class="hot5">荷兰Herobaby</a>
											<a href="javascript:;" target="_blank">英国Cow&Gate</a>
											<a href="javascript:;" target="_blank">澳洲Aptamil</a>
											<a href="javascript:;" target="_blank">德国holle</a>
											<a href="javascript:;" target="_blank">英国Aptamil</a>
										</p>
									</div>
									<div class="colum">
										<h3>全球纸尿裤大牌</h3>
										<p>
											<a href="javascript:;" target="_blank" class="hot5">尤妮佳</a>
											<a href="javascript:;" target="_blank" class="hot5">花王</a>
											<a href="javascript:;" target="_blank" class="hot5">GOON大王天使</a>
											<a href="javascript:;" target="_blank">GOON大王维E</a>
											<a href="javascript:;" target="_blank" class="hot5">Pampers帮宝适</a>
											<a href="javascript:;" target="_blank">Pampers care帮宝适棉柔</a>
											<a href="javascript:;" target="_blank">Huggies Gold好奇金装</a>
										</p>
									</div>
								</div>
							</div>

							<div class="inner">
								<div class="i">
									<a href="javascript:void(0)">美食</a>
								</div>
								<p>
									<a href="javascript:void(0)" target="_blank">干果/果干</a>
									<a href="javascript:void(0)" target="_blank">休闲零食</a>
									<a href="javascript:void(0)" target="_blank">地方特产</a>
								</p>
								<p>
									<a href="javascript:void(0)" target="_blank">胶原蛋白</a>
									<a href="javascript:void(0)" target="_blank">酵素</a>
									<a href="javascript:void(0)" target="_blank">蔓越莓/葡萄籽</a>
								</p>
								<div class="colums">
									<div class="colum">
										<h3>6</h3>
										<p>
											<a href="javascript:;" target="_blank" class="hot6">321</a>
											<a href="javascript:;" target="_blank">商场同款</a>
											<a href="javascript:;" target="_blank" class="hot6">气质连衣裙</a>
											<a href="javascript:;" target="_blank" class="hot6">印花衬衫</a>
											<a href="javascript:;" target="_blank">牛仔单品</a>
											<a href="javascript:;" target="_blank">百搭休闲裤</a>
										</p>
									</div>
									<div class="colum">
										<h3>屁屁护理</h3>
										<p>
											<a href="javascript:;" target="_blank">纸尿裤</a>
											<a href="javascript:;" target="_blank" class="hot6">拉拉裤</a>
											<a href="javascript:;" target="_blank">隔尿垫/布尿裤</a>
											<a href="javascript:;" target="_blank" class="hot6">宝宝湿巾</a>
										</p>
									</div>
									<div class="colum">
										<h3>全球奶粉大牌</h3>
										<p>
											<a href="javascript:;" target="_blank" class="hot6">德国爱他美</a>
											<a href="javascript:;" target="_blank" class="hot6">德国Hipp</a>
											<a href="javascript:;" target="_blank">德国Topfer</a>
											<a href="javascript:;" target="_blank" class="hot6">荷兰Nutrilon</a>
											<a href="javascript:;" target="_blank" class="hot6">荷兰Herobaby</a>
											<a href="javascript:;" target="_blank">英国Cow&Gate</a>
											<a href="javascript:;" target="_blank">澳洲Aptamil</a>
											<a href="javascript:;" target="_blank">德国holle</a>
											<a href="javascript:;" target="_blank">英国Aptamil</a>
										</p>
									</div>
									<div class="colum">
										<h3>全球纸尿裤大牌</h3>
										<p>
											<a href="javascript:;" target="_blank" class="hot6">尤妮佳</a>
											<a href="javascript:;" target="_blank" class="hot6">花王</a>
											<a href="javascript:;" target="_blank" class="hot6">GOON大王天使</a>
											<a href="javascript:;" target="_blank">GOON大王维E</a>
											<a href="javascript:;" target="_blank" class="hot6">Pampers帮宝适</a>
											<a href="javascript:;" target="_blank">Pampers care帮宝适棉柔</a>
											<a href="javascript:;" target="_blank">Huggies Gold好奇金装</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="header-footer">
				<a href="javascript:;"><img class="h1" src="${pageContext.request.contextPath}/resources/css/img/index/c1.jpg" width="100%" height="492px" style="display: block;" /></a>
				<a href="javascript:;"><img class="h1" src="${pageContext.request.contextPath}/resources/css/img/index/c2.jpg" width="100%" height="492px" /></a>
				<a href="javascript:;"><img class="h1" src="${pageContext.request.contextPath}/resources/css/img/index/c3.jpg" width="100%" height="492px" /></a>
				<a href="javascript:;"><img class="h1" src="${pageContext.request.contextPath}/resources/css/img/index/c4.jpg" width="100%" height="492px" /></a>
				<a href="javascript:;"><img class="h1" src="${pageContext.request.contextPath}/resources/css/img/index/c5.jpg" width="100%" height="492px" /></a>
				<div class="numbox">
					<span>
						<a href="javascript:void(0)" style="background-color: javascript:;FF0036;"></a>
						<a href="javascript:void(0)"></a>
						<a href="javascript:void(0)"></a>
						<a href="javascript:void(0)"></a>
						<a href="javascript:void(0)"></a>
					</span>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="g1">
				<a href="javascript:;"><img src="${pageContext.request.contextPath}/resources/css/img/index/g1.jpg"></a>
			</div>
			<div class="recommend">
				<div class="recommend-t">
					<a class="recommend-1">为你推荐</a>
					<a>千万妈妈&nbsp;精明之选</a>
				</div>
			</div>
			<div class="layout-1">
				<a target="_blank" title="" class="groupblock" href="javascript:;">
					<div class="layout-picture">
						<img src="${pageContext.request.contextPath}/resources/css/img/index/l1.jpg" height="218px" width="218px">
					</div>
					<div class="layout-text">
						<div class="tit">儿童孕妇驱蚊扣8个颜色随机</div>
						<div class="price">
							<div class="new">
								<span>拼团价:￥<em>29</em></span>
							</div>
							<div class="btn">
								<span>去拼团</span>
							</div>
						</div>
						<div class="price">
							<div class="old">
								<span>市场价:<em>￥49.00</em></span>
							</div>
							<div class="buy">
								<span>5799人已团</span>
							</div>
						</div>
					</div>
				</a>
				<a target="_blank" title="" class="groupblock" href="javascript:;">
					<div class="layout-picture">
						<img src="${pageContext.request.contextPath}/resources/css/img/index/l2.jpg" height="218px" width="218px">
					</div>
					<div class="layout-text">
						<div class="tit">蒙牛纯甄常温酸牛奶200g*12盒</div>
						<div class="price">
							<div class="new">
								<span>拼团价:￥<em>38.90</em></span>
							</div>
							<div class="btn">
								<span>去拼团</span>
							</div>
						</div>
						<div class="price">
							<div class="old">
								<span>市场价:<em>￥68.00</em></span>
							</div>
							<div class="buy">
								<span>519人已团</span>
							</div>
						</div>
					</div>
				</a>
				<a target="_blank" title="" class="groupblock" href="javascript:;">
					<div class="layout-picture">
						<img src="${pageContext.request.contextPath}/resources/css/img/index/l3.jpg" height="218px" width="218px">
					</div>
					<div class="layout-text">
						<div class="tit">子初蚊香液超值6瓶组合装</div>
						<div class="price">
							<div class="new">
								<span>拼团价:￥<em>39.90</em></span>
							</div>
							<div class="btn">
								<span>去拼团</span>
							</div>
						</div>
						<div class="price">
							<div class="old">
								<span>市场价:<em>￥198.00</em></span>
							</div>
							<div class="buy">
								<span>3.6万人已团</span>
							</div>
						</div>
					</div>
				</a>
				<a target="_blank" title="" class="groupblock" href="javascript:;">
					<div class="layout-picture">
						<img src="${pageContext.request.contextPath}/resources/css/img/index/l4.jpg" height="218px" width="218px">
					</div>
					<div class="layout-text">
						<div class="tit">车用可伸缩卡通防晒遮阳帘</div>
						<div class="price">
							<div class="new">
								<span>拼团价:￥<em>26.90</em></span>
							</div>
							<div class="btn">
								<span>去拼团</span>
							</div>
						</div>
						<div class="price">
							<div class="old">
								<span>市场价:<em>￥119.00</em></span>
							</div>
							<div class="buy">
								<span>2.3万人已团</span>
							</div>
						</div>
					</div>
				</a>
				<a target="_blank" title="" class="groupblock" href="javascript:;">
					<div class="layout-picture">
						<img src="${pageContext.request.contextPath}/resources/css/img/index/l5.jpg" height="218px" width="218px">
					</div>
					<div class="layout-text">
						<div class="tit">原木抽纸110抽*24包整箱装</div>
						<div class="price">
							<div class="new">
								<span>拼团价:￥<em>29.90</em></span>
							</div>
							<div class="btn">
								<span>去拼团</span>
							</div>
						</div>
						<div class="price">
							<div class="old">
								<span>市场价:<em>￥198.00</em></span>
							</div>
							<div class="buy">
								<span>1.4万人已团</span>
							</div>
						</div>
					</div>
				</a>
				<a target="_blank" title="" class="groupblock" href="javascript:;">
					<div class="layout-picture">
						<img src="${pageContext.request.contextPath}/resources/css/img/index/l6.jpg" height="218px" width="218px">
					</div>
					<div class="layout-text">
						<div class="tit">贝亲 Pigeon 奶瓶清洁剂</div>
						<div class="price">
							<div class="new">
								<span>拼团价:￥<em>36.00</em></span>
							</div>
							<div class="btn">
								<span>去拼团</span>
							</div>
						</div>
						<div class="price">
							<div class="old">
								<span>市场价:<em>￥45.00</em></span>
							</div>
							<div class="buy">
								<span>3.2万人已团</span>
							</div>
						</div>
					</div>
				</a>
				<a target="_blank" title="" class="groupblock" href="javascript:;">
					<div class="layout-picture">
						<img src="${pageContext.request.contextPath}/resources/css/img/index/l7.jpg" height="218px" width="218px">
					</div>
					<div class="layout-text">
						<div class="tit">蜜拉贝儿 mirabelle 婴儿湿巾</div>
						<div class="price">
							<div class="new">
								<span>拼团价:￥<em>28.00</em></span>
							</div>
							<div class="btn">
								<span>去拼团</span>
							</div>
						</div>
						<div class="price">
							<div class="old">
								<span>市场价:<em>￥118.00</em></span>
							</div>
							<div class="buy">
								<span>4.8万人已团</span>
							</div>
						</div>
					</div>
				</a>
				<a target="_blank" title="" class="groupblock" href="javascript:;">
					<div class="layout-picture">
						<img src="${pageContext.request.contextPath}/resources/css/img/index/l8.jpg" height="218px" width="218px">
					</div>
					<div class="layout-text">
						<div class="tit">NUK 超厚特柔婴儿湿巾 </div>
						<div class="price">
							<div class="new">
								<span>拼团价:￥<em>39.90</em></span>
							</div>
							<div class="btn">
								<span>去拼团</span>
							</div>
						</div>
						<div class="price">
							<div class="old">
								<span>市场价:<em>￥59.00</em></span>
							</div>
							<div class="buy">
								<span>3万人已团</span>
							</div>
						</div>
					</div>
				</a>

				<a target="_blank" title="" class="groupblock" href="javascript:;">
					<div class="layout-picture">
						<img src="${pageContext.request.contextPath}/resources/css/img/index/l9.jpg" height="218px" width="218px">
					</div>
					<div class="layout-text">
						<div class="tit">加州宝宝 金盏花面霜 </div>
						<div class="price">
							<div class="new">
								<span>拼团价:￥<em>89.90</em></span>
							</div>
							<div class="btn">
								<span>去拼团</span>
							</div>
						</div>
						<div class="price">
							<div class="old">
								<span>市场价:<em>￥198.00</em></span>
							</div>
							<div class="buy">
								<span>4万人已团</span>
							</div>
						</div>
					</div>
				</a>
				<a target="_blank" title="" class="groupblock" href="javascript:;">
					<div class="layout-picture">
						<img src="${pageContext.request.contextPath}/resources/css/img/index/l10.jpg" height="218px" width="218px">
					</div>
					<div class="layout-text">
						<div class="tit">贝医生 巴氏牙刷 旅行装4支 </div>
						<div class="price">
							<div class="new">
								<span>拼团价:￥<em>59.00</em></span>
							</div>
							<div class="btn">
								<span>去拼团</span>
							</div>
						</div>
						<div class="price">
							<div class="old">
								<span>市场价:<em>￥99.00</em></span>
							</div>
							<div class="buy">
								<span>8万人已团</span>
							</div>
						</div>
					</div>
				</a>
			</div>
			<div class="sale">
				<div class="sale-tit">
					<a class="recommend-1">今日特卖</a>
					<a>每天10点上新</a>
				</div>
			</div>
			<div class="block">
				<div class="layout-2">
					<div class="layout-2-l">
						<a href="javascript:;" target="_blank"><img src="${pageContext.request.contextPath}/resources/css/img/index/layout2-1.jpg" width="720px" height="350px"></a>
					</div>
					<div class="layout-2-r">
							<div class="layout2-picture">
								<img src="${pageContext.request.contextPath}/resources/css/img/index/layout2-2.jpg" height="78px" width="72px" class="r2" />
							</div>
							<div class="layout2-text">
								<div class="tit2">
									<span>托马斯&朋友（玩具） THOMAS & FRIENDS 儿童水写布绘画带印章</span>
								</div>
								<div class="new2">
									<span>￥<em>59.00</em></span>
								</div>
								<div class="old2">
									<span>139.00</span>
								</div>
							</div>
							<div class="layout2-picture">
								<img src="${pageContext.request.contextPath}/resources/css/img/index/layout2-3.jpg" height="78px" width="72px" class="r2" />
							</div>
							<div class="layout2-text">
								<div class="tit2">
									<span>澳贝 auby 乖乖小鸭宝宝益智学爬会下蛋鸭子婴儿学爬行玩具</span>
								</div>
								<div class="new2">
									<span>￥<em>69.00</em></span>
								</div>
								<div class="old2">
									<span>159.00</span>
								</div>
							</div>
							<div class="layout2-picture">
								<img src="${pageContext.request.contextPath}/resources/css/img/index/layout2-4.jpg" height="78px" width="72px" class="r2" />
							</div>
							<div class="layout2-text">
								<div class="tit2">
									<span>火火兔 ALILO I6英语视频早教机触摸屏护眼可充电下载 16G</span>
								</div>
								<div class="new2">
									<span>￥<em>409.00</em></span>
								</div>
								<div class="old2">
									<span>798.00</span>
								</div>
							</div>
					</div>
				</div>

				<div class="layout-2">
					<div class="layout-2-l">
						<a href="javascript:;" target="_blank"><img src="${pageContext.request.contextPath}/resources/css/img/index/layout2-5.jpg" width="720px" height="350px"></a>
					</div>
					<div class="layout-2-r">
							<div class="layout2-picture">
								<img src="${pageContext.request.contextPath}/resources/css/img/index/layout2-6.jpg" height="78px" width="72px" class="r2" />
							</div>
							<div class="layout2-text">
								<div class="tit2">
									<span>Augelute 夏季男宝宝绅士风短袖连体衣马甲2件套 棕色+咖啡色</span>
								</div>
								<div class="new2">
									<span>￥<em>94.00</em></span>
								</div>
								<div class="old2">
									<span>419.00</span>
								</div>
							</div>
							<div class="layout2-picture">
								<img src="${pageContext.request.contextPath}/resources/css/img/index/layout2-7.jpg" height="78px" width="72px" class="r2" />
							</div>
							<div class="layout2-text">
								<div class="tit2">
									<span>Augelute 夏季女宝宝荷叶无袖背心连身短裤爬服 蓝色</span>
								</div>
								<div class="new2">
									<span>￥<em>83.00</em></span>
								</div>
								<div class="old2">
									<span>369.00</span>
								</div>
							</div>
							<div class="layout2-picture">
								<img src="${pageContext.request.contextPath}/resources/css/img/index/layout2-8.jpg" height="78px" width="72px" class="r2" />
							</div>
							<div class="layout2-text">
								<div class="tit2">
									<span>Augelute 夏款女宝宝三角领子造型连身衣哈衣爬服 蓝色</span>
								</div>
								<div class="new2">
									<span>￥<em>89.00</em></span>
								</div>
								<div class="old2">
									<span>409.00</span>
								</div>
							</div>
						</a>
					</div>
				</div>

				<div class="layout-2">
					<div class="layout-2-l">
						<a href="javascript:;" target="_blank"><img src="${pageContext.request.contextPath}/resources/css/img/index/layout2-9.jpg" width="720px" height="350px"></a>
					</div>
					<div class="layout-2-r">
							<div class="layout2-picture">
								<img src="${pageContext.request.contextPath}/resources/css/img/index/layout2-10.jpg" height="78px" width="72px" class="r2" />
							</div>
							<div class="layout2-text">
								<div class="tit2">
									<span>A知了熊 Cicada bear 婴儿开裆爬服</span>
								</div>
								<div class="new2">
									<span>￥<em>49.00</em></span>
								</div>
								<div class="old2">
									<span>78.00</span>
								</div>
							</div>
							<div class="layout2-picture">
								<img src="${pageContext.request.contextPath}/resources/css/img/index/layout2-11.jpg" height="78px" width="72px" class="r2" />
							</div>
							<div class="layout2-text">
								<div class="tit2">
									<span>知了熊 Cicada bear 婴儿纯棉爬服米白</span>
								</div>
								<div class="new2">
									<span>￥<em>48.00</em></span>
								</div>
								<div class="old2">
									<span>78.00</span>
								</div>
							</div>
							<div class="layout2-picture">
								<img src="${pageContext.request.contextPath}/resources/css/img/index/layout2-12.jpg" height="78px" width="72px" class="r2" />
							</div>
							<div class="layout2-text">
								<div class="tit2">
									<span>舍予良仓 MLGB 进口纯棉宝宝信封领长袖三角连体衣 红</span>
								</div>
								<div class="new2">
									<span>￥<em>79.00</em></span>
								</div>
								<div class="old2">
									<span>114.00</span>
								</div>
							</div>
						</a>
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
					<li>
						<a href="javascript:;" rel="nofollow">新手帮助</a>
					</li>
					<li>
						<a href="javascript:;" rel="nofollow">乐豆体系</a>
					</li>
					<li>
						<a href="javascript:;" rel="nofollow">正品承诺</a>
					</li>
				</ul>
				<ul class="help">
					<li class="strong">支付方式</li>
					<li>
						<a href="javascript:;" rel="nofollow">支付方式</a>
					</li>
					<li>
						<a href="javascript:;" rel="nofollow">支付流程</a>
					</li>
					<li>
						<a href="javascript:;" rel="nofollow">跨境进口税</a>
					</li>
				</ul>
				<ul class="help">
					<li class="strong">配送方式</li>
					<li>
						<a href="javascript:;" rel="nofollow">包邮政策</a>
					</li>
					<li>
						<a href="javascript:;" rel="nofollow">发货时间</a>
					</li>
					<li>
						<a href="javascript:;" rel="nofollow">配送区域</a>
					</li>
					<li>
						<a href="javascript:;" rel="nofollow">送货验收</a>
					</li>
				</ul>
				<ul class="help">
					<li class="strong">售后服务</li>
					<li>
						<a href="javascript:;" rel="nofollow">退货政策</a>
					</li>
					<li>
						<a href="javascript:;" rel="nofollow">退货流程</a>
					</li>
					<li>
						<a href="javascript:;" rel="nofollow">退款方式</a>
					</li>
				</ul>
				<ul class="help">
					<li class="strong">联系方式</li>
					<li>
						<a href="javascript:;" rel="nofollow">总裁邮箱：ceo@lego.com</a>
					</li>
					<li>
						<a href="javascript:;" rel="nofollow">商务合作：bd@lego.com</a>
					</li>
					<li>
						<a href="javascript:;" rel="nofollow">媒体合作：pr@lego.com</a>
					</li>
					<li>
						<a href="javascript:;" rel="nofollow">招商中心：zhaoshang@lego.com</a>
					</li>
				</ul>
			</div>
			<div class="footer-link">
				<a href="javascript:;">关于乐购</a>丨
				<a href="javascript:;">加入乐购</a>丨
				<a href="javascript:;">商务合作</a>丨
				<a href="javascript:;">帮助中心</a>丨
				<a href="javascript:;">联系我们</a>丨
				<a href="javascript:;">友情链接</a>丨
				<a href="javascript:;">触屏版</a>丨
				<a href="javascript:;">媒体报道</a><br/>
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