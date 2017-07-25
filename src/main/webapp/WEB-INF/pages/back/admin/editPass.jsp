
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>后台管理</title>
    <link rel="icon" href="${pageContext.request.contextPath}/resources/css/img/icon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/admin/adminCommon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/bootstrap.js"></script>
    <script type="text/javascript">
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
                            $(".breadcrumb").find("li").eq(0).removeClass("text-primary");
                            $(".breadcrumb").find("li").eq(1).addClass("text-primary");
                            $(".breadcrumb").find("span").eq(0).removeClass("text-primary");
                            $(".breadcrumb").find("span").eq(1).addClass("text-primary");
                            $("#div_2").append("<div class=right_title2>"+
                                "<span class=\"h3 strong\">您需要使用邮箱验证</span>"+
                                "   </div><br>" +
                                "<div class=form-group>" +
                                "   <input type=button class=\"btn btn-info btn-lg\" id=sendEmail_btn value=获得验证码><br><br>" +
                                "   <input type=text class=\"form-control input-lg\" id=code placeholder=输入验证码><br>" +
                                "    <input type=button class=\"btn btn-success btn-lg\" id=next_code value=\"下 一 步\">" +
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
                                                $(".breadcrumb").find("li").eq(1).removeClass("text-primary");
                                                $(".breadcrumb").find("li").eq(2).addClass("text-primary");
                                                $("#div_1").hide();
                                                $("#div_2").hide();
                                                $("#div_3").show();
                                                $("#div_3").append(" <div class=\"right_3 form-group col-xs-3\">" +
                                                    "<form action="+basePath + "'/user/rePass' method=post id=repassForm>" +
                                                    "<input type=hidden name=id value=${sessionScope.id}>" +
                                                    "<span class=\"h3 \">请输入您的新密码</span><br><br>" +
                                                    "<input type=password name=password class=\"form-control input-lg \" id=password placeholder=新密码><br><br>" +
                                                    "<input type=password class=\"form-control input-lg \" id=repass placeholder=再次确认密码><br><br>" +
                                                    " <div class=col-xs-6>" +
                                                    "<input type=button class=\"btn btn-lg btn-block btn-success\" id=finsh value=\" 完 成 \">" +
                                                    "</form>" +
                                                    "</div></div>");
                                                $("#finsh").on('click',function () {
                                                    if($("#password").val() == $("#repass").val()){
                                                        $.ajax({
                                                            url:basePath + "/user/rePass",
                                                            data:$("#repassForm").serialize(),
                                                            success:function () {
                                                                alert("修改成功！");
                                                                window.location.reload(true);
                                                            }
                                                        });
                                                    }
                                                })
                                                break;
                                            case 'failure':
                                                alert("验证码错误！");
                                                break;
                                            case 'timeout':
                                                alert("验证码失效，请重新发送验证码！");
                                                break;
                                        }
                                    },
                                    error:function () {
                                        alert("失败！");
                                    }
                                })
                            })
                        } else {
                            alert("密码错误！");
                        }
                    }
                })
            })
        })
    </script>
    <style type="text/css">
        body{
            padding-top: 50px;
        }
        .sidebar {
            background-color: #f5f5f5;
            position: fixed;
            left: 0px;
            bottom: 0px;
            top: 51px;
            padding: 20px 0 0 0;
        }
        .nav-sidebar > .active > a,
        .nav-sidebar > .active > a:hover,
        .nav-sidebar > .active > a:focus {
            color: #fff;
            background-color: #428bca;
        }
        .col-xs-offset-2{
            margin-left: 18% !important;
        }
        .navbar-right{
            margin-right: 50px;
        }
        .breadcrumb{
            background-color: white !important;
            font-size: 24px;
        }

        body{
            padding-top: 50px;
        }
        li{
            list-style-type: none;
        }
        a,a:hover,a:link{
            text-decoration: none;
        }
        a:hover{
            text-decoration: none;
        }
        .sidebar {
            background-color: #f5f5f5;
            position: fixed;
            left: 0px;
            bottom: 0px;
            top: 51px;
            padding: 20px 0 0 0;
        }

        .nav-li{
            line-height: 40px;
        }
        .nav-li a{
            margin-left: 30px;
            font-size: 18px;
            color: rgba(31, 98, 254, 0.81);
        }
        .nav-active{
            background-color: rgba(233, 231, 244, 0.81);
        }
    </style>
</head>
<body>
<input type="hidden" id="basePath" value="${pageContext.request.contextPath}">
<div class="navbar header navbar-fixed-top" role="navigation">
    <div class="logo">
		<span class="span-title">
			<a target="_blank" class="title-home" href="${pageContext.request.contextPath}/index.jsp">
				<span class="glyphicon glyphicon-home"></span></a>  后台管理</span>
    </div>
    <div class="logout">
        <span class="span-username"><span class="glyphicon glyphicon-user"></span>  ${username}</span>
        <input type="button" class="btn btn-default" value="注销" id="btn-logout">
    </div>
</div>
<div class="container-fluid">
    <div class="nav-left">
        <div class="col-md-2 sidebar">
            <li class="nav-li ">
                <a class="" href="${pageContext.request.contextPath}/admin/commodityList/1" target="_top">商 品 管 理</a>
            </li>
            <li class="nav-li">
                <a class="" href="${pageContext.request.contextPath}/admin/kindList/1" target="_top">品 类 管 理</a>
            </li>
            <li class="nav-li">
                <a class="" href="${pageContext.request.contextPath}/admin/orderList/1" target="_top">订 单 管 理</a>
            </li>
            <li class="nav-li">
                <a class="" href="${pageContext.request.contextPath}/admin/logList/1" target="_top">日 志 管 理</a>
            </li>
            <li class="nav-li nav-active">
                <a class="" href="${pageContext.request.contextPath}/admin/editPass" target="_top">修 改 密 码</a>
            </li>
        </div>
    </div>
        <div class="col-md-8 col-xs-offset-2 nav-right">
            <div class="page-header">
                <h1>修改密码</h1>
                <ul class="breadcrumb">
                    <li class="text-primary">输入密码</li>
                    <span class="glyphicon glyphicon-chevron-right text-primary"></span>
                    <li>邮箱验证</li>
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <li>修改密码</li>
                </ul>
            </div>
            <div id="div_1" class="col-xs-3">
                <div class="right_title form-group">
                    <span class="h2 strong">请输入密码:</span>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control input-lg" id="pass"><br><br>
                    <input type="button" class="btn btn-success btn-lg" id="next_pass" value="下 一 步">
                </div>
            </div>
        <div id="div_2" class="col-xs-3">

        </div>
        <div id="div_3">

        </div>
    </div>
</div>
</div>
</body>
</html>
