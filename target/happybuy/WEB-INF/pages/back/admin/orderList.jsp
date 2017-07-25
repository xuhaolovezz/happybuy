<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<TITLE> 后台管理界面</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="icon" href="${pageContext.request.contextPath}/resources/css/img/icon.ico" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/admin/orderList.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/skins/flat/red.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/admin/adminCommon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/bootstrap.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/icheck.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/back/admin/orderList.js"></script>
    <script type="text/javascript">
        $(function () {
            var currPage =${requestScope.orderPageBean.currPage};
            if( currPage == '1'){
                $("#prevPage").attr("href","javascript:;");
                $("#prevPage").parent().addClass("disabled");
                $("#firstPage").attr("href","javascript:;");
                $("#firstPage").parent().addClass("disabled");
            }
            if(currPage >= "${requestScope.orderPageBean.totalPage}"){
                $("#nextPage").attr("href","javascript:;");
                $("#nextPage").parent().addClass("disabled");
                $("#lastPage").attr("href","javascript:;");
                $("#lastPage").parent().addClass("disabled");
            }
            //循环输出页码
            for(var i = 1; i <= ${orderPageBean.totalPage}; i ++){
                if(i <= 8){
                    $(".page-next").before("<li class='li-page'>" +
                        "<a href='${pageContext.request.contextPath}/admin/orderList/"+i+
                        "?condition=${condition}" +
                        "&state=${state}'>"+i+"</a>" +
                        "    </li>" +
                        "");
                }
            }
            $.each($(".li-page"),function (i,e) {
                if($(this).text() == currPage){
                    $(this).addClass("active");
                }
            })
			$(".btn-state").each(function (i,e) {
				if($(this).text() == "${state}"){
				    $(this).removeClass("btn-info");
                    $(this).addClass("btn-warning");
                }
            })

        })
    </script>
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
			<li class="nav-li nav-active">
				<a class="" href="${pageContext.request.contextPath}/admin/orderList/1" target="_top">订 单 管 理</a>
			</li>
			<li class="nav-li">
				<a class="" href="${pageContext.request.contextPath}/admin/logList/1" target="_top">日 志 管 理</a>
			</li>
			<li class="nav-li">
				<a class="" href="${pageContext.request.contextPath}/admin/editPass" target="_top">修 改 密 码</a>
			</li>
		</div>
	</div>
	<div class="col-md-9 col-xs-offset-2 nav-right">
		<div class="page-header">
			<div class="title"><span>订单管理</span></div>
		</div>
		<div class="header-search">
			<%--<select id="slt-condition" class="form-control slt-condition">
				<option value="1">按照订单号查询</option>
				<option value="2">按照订单状态查询</option>
			</select>--%>
			<div class="search-order-state">
				<span class="span-condition">条件查询：</span>
				<a href="${pageContext.request.contextPath}/admin/orderList/1?condition=${condition}&state=已取消" class="btn btn-info btn-state">已取消</a>
				<a href="${pageContext.request.contextPath}/admin/orderList/1?condition=${condition}&state=未付款" class="btn btn-info btn-state">未付款</a>
				<a href="${pageContext.request.contextPath}/admin/orderList/1?condition=${condition}&state=已支付" class="btn btn-info btn-state">已支付</a>
				<a href="${pageContext.request.contextPath}/admin/orderList/1?condition=${condition}&state=已发货" class="btn btn-info btn-state">已发货</a>
				<a href="${pageContext.request.contextPath}/admin/orderList/1?condition=${condition}&state=已收货" class="btn btn-info btn-state">已收货</a>
				<a href="${pageContext.request.contextPath}/admin/orderList/1?condition=${condition}&state=已完成" class="btn btn-info btn-state">已完成</a>
			</div>
			<div class="box-search">
				<form action="${pageContext.request.contextPath}/admin/orderList/1/" class="form-inline" method="get">
					<input type="hidden" id="state" value="${state}">
					<input type="text" name="condition" class="form-control input-condition" value="${condition}" placeholder="订单号">
					<input type="button" class="btn btn-info btn-search" value="搜索">
					<a href="${pageContext.request.contextPath}/admin/orderList/1" class="btn btn-info">清空条件</a>
				</form>
			</div>
		</div>
		<c:if test="${orderPageBean.list.size() == 0}">
			<div class="no-order">
				<span>抱歉，没有搜索到您想要的订单。</span>
			</div>
		</c:if>
		<table class="table table-bordered table-responsive table-hover text-center">
			<tr class="info" style="text-align: center">
                <td><b>订单号</b></td>
				<td><b>收件人</b></td>
                <td><b>订单状态</b></td>
				<td><b>订单总价</b></td>
				<td><b>创建时间</b></td>
				<td><b>操作</b></td>
			</tr>
			<c:forEach items="${orderPageBean.list}" var="item" varStatus="i">
                <tr >
					<td>${item.id}</td>
					<td>${item.orderDetail.name}</td>
					<td>${item.state}</td>
					<td>¥ ${item.totalAmount}</td>
					<td>${item.orderDetail.createTime}</td>
					<td>
						<button type="button" class="btn btn-info btn-edit-order"
						><span value="${item.id}" class="glyphicon glyphicon-zoom-out"></span> 查看</button>&nbsp;
					</td>
				</tr>
			</c:forEach>
		</table>
		<div class="col-xs-offset-4">
			<ul class="pagination">
				<li class="li-page">
					<a id="firstPage" href="${pageContext.request.contextPath}/admin/orderList/1">首页</a>
				</li>
				<li class="li-page">
					<a href="${pageContext.request.contextPath}/admin/orderList/${orderPageBean.currPage-1}?condition=${condition}&state=${state}"
					   id="prevPage">&laquo; 上一页</a>
				</li>
				<%--<li class="li-page">
					<a href="${pageContext.request.contextPath}/admin/orderList/1?condition=${condition}&state=${state}">1</a>
				</li>--%>

				<li class="li-page page-next">
					<a href="${pageContext.request.contextPath}/admin/orderList/${orderPageBean.currPage+1}?condition=${condition}&state=${state}"
					   id="nextPage">下一页 &raquo;</a>
				</li>
				<li class="li-page">
					<a id="lastPage"  href="${pageContext.request.contextPath}/admin/orderList/${orderPageBean.totalPage}?condition=${condition}&state=${state}">尾页</a>
				</li>
				<li style="cursor: default">
                        <span>当前第 <span>${requestScope.orderPageBean.currPage} / ${orderPageBean.totalPage} 页</span>&nbsp;
                        共 ${requestScope.orderPageBean.totalSize} 条记录
                            </span>
				</li>
			</ul>
		</div>
		<br>
	</div>
</div>
</body>
</html>