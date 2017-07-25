<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>帮助中心-乐购</title>
		<link rel="icon" href="${pageContext.request.contextPath}/resources/css/img/icon.ico"  />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/modify.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/front/help.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/userCommon.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/initShopCart.css" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/bootstrap.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/back/user/initShopCart.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/front/help.js"></script>
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
			<div class="c-left">
				<div class="title">
					公告
				</div>
				<p>
					<a href="javascript:void(0)" class="focus">安全防诈骗</a>
				</p>
				<div class="title">
					帮助中心
				</div>
				<p>
					<a href="javascript:void(0)" class="">正品保障</a>
				</p>
				<p>
					<a href="javascript:void(0)">支付相关</a>
				</p>
				<p>
					<a href="javascript:void(0)">快递及配送区域</a>
				</p>
				<p>
					<a href="javascript:void(0)">发货时间</a>
				</p>
				<p>
					<a href="javascript:void(0)">商品验货与签收</a>
				</p>
				<p>
					<a href="javascript:void(0)">退换货政策</a>
				</p>
				<div class="title">
					服务条款
				</div>
				<p>
					<a href="javascript:void(0)">服务条款</a>
				</p>
			</div>

			<div class="c-right" style="display: block;">
				<div class="help1">
					<div class="help-title">
						<a>公告>>安全防诈骗</a>
					</div>
					<div class="help1-text">
						<div class="hint">
							<p>&nbsp;</p>
							<p>&nbsp;</p>
							<p class="text-title">关于防诈骗的声明</p>
							<p>&nbsp;</p>
							<p>尊敬的乐购用户：</p>
							<p class="em">您好！为了保护您的账户及财产安全，温馨提示您:</p>
							<p class="em">	乐购决不会以商品质量问题召回商品、订单异常、退货退款、会员服务等为由，索要您的银行卡密码、支付宝、
								QQ、微信等隐私信息或进行任何转账及相关操作，建议您一定要注意对自己个人、银行信息的保密，常用网购
								账户一定要定期更改登录密码，谨防钓鱼链接、个人手机号及带“+”号的诈骗电话！</p>
							<p>以下内容要牢记：</p>
							<p class="em">1、不点击可疑链接；</p>
							<p class="em">2、不轻信中奖信息，收到乐购中奖消息后请仔细辨认，中奖信息在官网会先行公布，乐购活动领奖
								或赠送不需要缴纳手续费、快递费；</p>
							<p class="em">3、不随意提供私人隐私信息；</p>
						</div>
					</div>
				</div>
			</div>

			<div class="c-right">
				<div class="help2">
					<div class="help-title">
						<a>帮助中心>>正品保障</a>
					</div>
					<div class="help2-text">
						<img src="${pageContext.request.contextPath}/resources/css/img/help/h2-1.jpg" width="620px" height="130px"/>
						<img src="${pageContext.request.contextPath}/resources/css/img/help/h2-2.png" width="620px" height="250px"/>
						<img src="${pageContext.request.contextPath}/resources/css/img/help/h2-3.jpg" width="620px" height="240px"/>
					</div>
				</div>
			</div>

			<div class="c-right">
				<div class="help3">
					<div class="help-title">
						<a>帮助中心>>支付相关</a>
					</div>
					<div class="help3-text">
						<div class="hint3">
							<p>&nbsp;</p>
							<p>您好，目前乐购只支持支付宝支付，为您带来的不便，敬请谅解。</p>
							<p>&nbsp;</p>
							<p>温馨提示：</p>
							<p class="em">请您在下单成功后的两小时内完成付款操作，如超过两个小时未付款的订单，系统将会自动取消订单。</p>
							<p>&nbsp;</p>
							<p>FAQ:</p>
							<p>1、为什么我订单下单成功后， 会显示“被取消”的状态？</p>
							<p class="em">订单请您在下单成功后的两小时内完成付款操作，如超过两个小时未付款的订单，系统将会自动取消订单。
								您只能选择重新订购。十分抱歉给您带来的不便。</p>
							<p>2、为什么我支付的时候会显示“超过限额”？</p>
							<p class="em">每家与支付宝绑定的银行卡都对每日支付最高金额及单笔最高金额有所限定，如您遇到了该提示，则表示支付金额
								可能会超限。建议您向发卡银行咨询当日支付最高限额及单笔支付最高限额。 </p>
						</div>
					</div>
				</div>
			</div>

			<div class="c-right">
				<div class="help4">
					<div class="help-title">
						<a>帮助中心>>快递及配送区域</a>
					</div>
					<div class="help4-text">
						<div class="hint4">
							<p>&nbsp;</p>
							<p>所有商品都不要邮费哦~</p>
							<p>您好，为保障商品运输途中的安全，乐购与多家快递公司合作为您配送商品哦~</p>
							<p class="em">普通快递暂时不提供自选，我们会根据订单中的收货地址和商品种类选择最合适的物流公司为您进行配送，以下信息供您参考：</p>
							<p>1、港、澳、台及海外暂不支持配送（具体配送范围以页面详情为准）；</p>
							<p>2、北京仓合作快递：EMS，中通，百世汇通；</p>
							<p>3、郑州仓合作快递：EMS，中通，韵达、申通；</p>
							<p>4、直邮商品由于发货地区不同，合作快递以实际发货信息为准。</p>
						</div>
					</div>
				</div>
			</div>

			<div class="c-right">
				<div class="help5">
					<div class="help-title">
						<a>帮助中心>>发货时间</a>
					</div>
					<div class="help5-text">
						<div class="hint5">
							<p>&nbsp;</p>
							<p>您好，您付款后北京仓12小时内发货；郑州仓1个工作日内发货； 直邮6小时内发货；</p>
							<p>FAQ:</p>
							<p class="em">如遇节假日、大型活动及其它不可抗力因素（如遇交通管制、大雨雪、洪涝、冰灾、地震等）导致的意外情况，将会影响订单发货速度，
								发货后系统会以短信的方式告知，请您耐心等待。</p>
						</div>
					</div>
				</div>
			</div>

			<div class="c-right">
				<div class="help6">
					<div class="help-title">
						<a>帮助中心>>商品验货与签收</a>
					</div>
					<div class="help6-text">
						<div class="hint6">
							<p>&nbsp;</p>
							<p>您好，快递员送货上门时，请您当面核对收到的所有商品，主要检查的内容有几点：</p>
							<p>1、外包装箱是否破损；</p>
							<p>2、外包装箱胶带是否有被拆开重新粘贴的痕迹；</p>
							<p>3、配送商品与您订购的商品是否一致，是否齐全。</p>
							<p>如果亲在检查的过程中出现问题，请您拒签商品及时联系在线客服，我们会第一时间为核实处理。</p>
						</div>
					</div>
				</div>
			</div>

			<div class="c-right">
				<div class="help7">
					<div class="help-title">
						<a>帮助中心>>退换货政策</a>
					</div>
					<div class="help7-text">
						<div class="hint7">
							<p>&nbsp;</p>
							<p>您好，为了保障您的权益，乐购采用7天无理由退货，商品出现以下情形时，您可以在签收7天内享受无理由退货：</p>
							<p>1、如商品本身有质量问题，以实际签收日期为准，7天内可退货；</p>
							<p>2、商品及商品本身包装保持出售时原装且配件赠品资料齐全，不影响二次销售的。</p>
							<p>&nbsp;</p>
							<p>亲，出现以下情形时，不支持7天无理由退货哦，还请您知晓~</p>
							<p>1、  任何非乐购出售的商品</p>
							<p>2、  任何以实际签收日期为准，超出7天，未办理退货申请且将包裹寄出的（包裹寄出以实际签发日期为准）；</p>
							<p>4、  任何已使用或已穿着的商品（三包认定的质量问题除外）；</p>
							<p>5、  任何因非三包认定的非质量问题商品（包括但不限于：非正常使用及保管；非正常清洁等情况而出现质量问题的商品）；</p>
							<p>6、  配件不齐全的商品（包括但不限于：吊牌丢失或已被从商品中剪下；商品附件说明书、商品标签、商品保修单丢失或破损等）；</p>
							<p>7、  购买时有赠品的商品，未将赠品退回；</p>
							<p>8、  已经标明为残次品或处理品的；</p>
							<p>9、  商品原包装箱已损坏或已缠裹胶带；</p>
							<p>10、已经标明不提供退货服务的其他商品。</p>
						</div>
					</div>
				</div>
			</div>

			<div class="c-right">
				<div class="help8">
					<div class="help-title">
						<a>服务条款>>服务条款</a>
					</div>
					<div class="help8-text">
						<div class="hint8">
							<p>&nbsp;</p>
							<p>1. 介绍</p>
							<p>欢迎来到乐购!</p>
							<p class="em">请在使用这个网站之前仔细阅读下面的网站使用规则和条款（以下简称“规则和条款”），通过访问、浏览或使用
								该网站，您确认您已经阅读过并完全理解规则和条款，也同意受这些规则和条款的约束，而且您同意遵守所有可
								适用的法律和法规。如果您不同意以这些规则和条款, 请不要使用本网站。 </p>
							<p>如您有意见、问题或对这些规则和条款有所关注,请通过以下电子邮件地址service@lego.com与我们取得联系。</p>
							<p>&nbsp;</p>
							<p>2. 您的会员资格</p>
							<p class="em">在注册过程中, 将为您创建一个设置密码保护的个人帐户，在拥有该个人帐户后，您将可以正式使用本网站并定购商品，并且仅供您个人使用的，不可转让或分配给任何其他人。</p>
							<p class="em">从您的个人帐户建立开始, 您要负责护保好您的帐户机密及所有密码。在乐购注册后，您将承担对发生在您的帐户注册或密码之下的所有责任，和承担所有可能造成损失的后果, 以及承担所有因此而造成商品损失的赔偿责任，除非这些的损失是由于乐购的重大过失或过错造成的。</p>
							<p>&nbsp;</p>
							<p>3. 通过乐购购物 </p>
							<p class="em">除非另有规定，所有网站上出售的商品均为正宗的、全新的商品，没有瑕疵，质量保证优良。 </p>
							<p class="em">乐购上显示的所有价格都是以中国货币元（人民币）为计价单位，包括所有的税费及运费。</p>
							<p class="em">本站按先付款后送货的形式，在任何情况下, 只有在您支付了所有款项以后, 您才会是货物的拥有人，我们将选用有信誉的快递公司送货到您的手中。</p>
							<p class="em">乐购上面陈列的货物完全符合中华人民共和国的相关法律法规的规定。乐购直接与品牌供应商或者他们授权的经销商合作，他们保证其商品是正宗的。您在乐购上找到的商品描述均由品牌供应商或者他们授权的经销商提供，仅由他们对其真实性负责。您应该系统性地参照货物描述找出他们的特征，对于任何种类的直接或间接的、实质或非实质的由于商品的使用造成的损失，乐购概不负责。</p>
							<p>4. 隐私条款  </p>
							<p class="em">乐购承诺尊重您的隐私和您的个人信息安全。乐购并且承诺尽可能地为您提供最佳的服务。比如，乐购会利用通过网站运作而收集到的这些信息，来制定您的个性化沟通方式和购物经历、也可以更好地对您的客户服务调查做出反应、对您的订单和帐户信息及客户服务需求与您进行沟通、就乐购网站中的商品和活动与您进行沟通以及为了其他推广宣传目的、优化管理、促销、调查等其他本网站的特别项目使用这些信息。乐购也可以用这样的信息来阻止可能的被禁止项目和非法活动，用以加强使用规则和条款的实施，并用以解决争议和保护其合法的私有财产权益及解决涉及乐购的交易活动而产生的问题。 </p>
							<p class="em">因此您在此明确同意乐购来收集、保存、使用和透露您的个人信息。</p>
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
