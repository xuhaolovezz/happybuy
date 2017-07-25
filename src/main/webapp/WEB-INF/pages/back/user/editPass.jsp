<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>个人中心-修改密码-乐购</title>
		<link rel="icon" href="${pageContext.request.contextPath}/resources/css/img/icon.ico"  />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/editPass.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/userCommon.css" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/user/initShopCart.css" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/bootstrap.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/back/user/modify.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/back/user/initShopCart.js"></script>
		<meta name="Keywords" content="乐购全球购" >
		<script type="text/javascript">
			$(function () {
                var wait=60;
                function time(btn) {
                    if(wait == 0){
                        btn.removeAttribute("disabled");
                        btn.style.backgroundColor = "rgba(32, 120, 254, 0.81)";
                        btn.value = "获得验证码";
                        wait = 60;
                    } else {
                        btn.setAttribute("disabled","true");
                        btn.style.backgroundColor="rgba(188,195,200,0.81)";
                        btn.value = wait+"秒后获得验证码";
                        wait --;
                        setTimeout(function () {
                            time(btn);
                        },1000)
                    }
                }
                $(function () {
                    var basePath = $("#basePath").val();
                    $("#next_pass").on('click',function () {
                        $.ajax({
                            url:basePath + "/user/userLogin",
                            type:"post",
                            data:{"username":"${sessionScope.username}","password":$("#pass").val()},
                            success:function (data) {
                                if(data == "login_user"){
                                    $("#div_1").hide();
                                    $("#div_2").show();
                                    $("#div_3").hide();
                                    $(".breadcrumb").find("li").eq(1).addClass("text-primary");
                                    $(".breadcrumb").find("span").eq(1).addClass("text-primary");
                                    $("#div_2").append("<div class=right_title2>"+
                                        "<span class=\"h3 strong\">您需要使用邮箱验证</span>"+
                                        "   </div>" +
                                        "<div class='form-group form-inline'>" +
                                        "   <input type=button class=\"btn btn-info btn-lg\" id=sendEmail_btn value=获得验证码>" +
                                        "   <input type=text class=\"form-control input-lg\" id=code placeholder=输入验证码><br>" +
                                        "    <input type=button class=\"btn btn-success btn-lg\" style='width: 200px;' id=next_code value=\"下 一 步\">" +
                                        "    </div>");
                                    $("#sendEmail_btn").on('click',function () {
                                        time(this);
                                        $.ajax({
                                            url:basePath + "/user/sendEmailCode?id=${sessionScope.id}",
                                            type:"post"
                                        })
                                    })
                                    $("#next_code").on('click',function () {
                                        var codes = $("#code").val();
                                        $.ajax({
                                            url:basePath + "/user/validateCode",
                                            data:{"codes":codes,"id":"${sessionScope.id}"},
                                            type:"post",
                                            success:function (data) {
                                                switch (data){
                                                    case 'success':
                                                        $(".breadcrumb").find("li").eq(2).addClass("text-primary");
                                                        $("#div_1").hide();
                                                        $("#div_2").hide();
                                                        $("#div_3").show();
                                                        $("#div_3").append(" <div class=\"right_3 form-group \">" +
                                                            "<form action="+basePath + "'/user/rePass' method=post id=repassForm>" +
                                                            "<input type=hidden name=id value=${sessionScope.id}>" +
                                                            "<span class=\"h3 \">请输入您的新密码</span><br>" +
                                                            "<input type=password name=password class=\"form-control input-lg \" id=password placeholder=新密码><br>" +
                                                            "<input type=password class=\"form-control input-lg \" id=repass placeholder=再次确认密码><br>" +
                                                            " " +
                                                            "<input type=button class=\"btn btn-lg btn-block btn-success\" id=finsh value=\" 完 成 \">" +
                                                            "</form>" +
                                                            "</div>");
                                                        $("#finsh").on('click',function () {
                                                            if($("#password").val()==""){
                                                                $(".modal-body").text("密码不能为空！");
                                                                $('#alertModal').modal('show');
															} else if($("#repass").val() == ""){
                                                                $(".modal-body").text("确认密码不能为空！");
                                                                $('#alertModal').modal('show');
															} else if($("#password").val() == $("#repass").val()){
                                                                $.ajax({
                                                                    url:basePath + "/user/rePass",
                                                                    data:$("#repassForm").serialize(),
                                                                    success:function () {
                                                                        $(".modal-body").text("修改成功！");
                                                                        $('#alertModal').modal('show');
                                                                        window.location.reload(true);
                                                                    }
                                                                });
                                                            } else {
                                                                $(".modal-body").text("两次输入密码不同！");
                                                                $('#alertModal').modal('show');
															}
                                                        });
                                                        break;
                                                    case 'failure':
                                                        $(".modal-body").text("验证码错误！");
                                                        $('#alertModal').modal('show');
                                                        break;
                                                    case 'timeout':
                                                        $(".modal-body").text("验证码失效，请重新发送验证码！");
                                                        $('#alertModal').modal('show');
                                                        break;
                                                }
                                            },
                                            error:function () {
                                                $(".modal-body").text("失败！");
                                                $('#alertModal').modal('show');
                                            }
                                        })
                                    })
                                } else {
                                    $(".modal-body").text("密码错误！");
                                    $('#alertModal').modal('show');
                                }
                            }
                        })
                    })
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
					<p><a href="${pageContext.request.contextPath}/user/editPass" class="a-selected">修改密码</a></p>
					<p><a href="${pageContext.request.contextPath}/user/myAddress">地址管理</a></p>
				</div>

				<div class="c-right">
					<div class="message">
						<div class="message-title">
							<ul class="breadcrumb">
								<li class="text-primary">输入密码</li>
								<span class="glyphicon glyphicon-chevron-right text-primary"></span>
								<li>邮箱验证</li>
								<span class="glyphicon glyphicon-chevron-right"></span>
								<li>修改密码</li>
							</ul>
						</div>
						<div class="message-text">
							<div id="div_1" class="p1">
								<div class="right_title form-group form-inline">
									<span class="h3 strong">请输入密码：</span>
									<input type="password" class="form-control input-lg" id="pass"><br><br>
								</div>
								<div class="form-group">
									<input type="button" class="btn-next" id="next_pass" value="下 一 步">
								</div>
							</div>
							<div id="div_2" class="p2">

							</div>
							<div id="div_3" class="p3">

							</div>
						</div>
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
	</body>
</html>
