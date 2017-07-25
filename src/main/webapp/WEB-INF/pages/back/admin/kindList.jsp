<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<TITLE> 后台管理界面</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="icon" href="${pageContext.request.contextPath}/resources/css/img/icon.ico" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/admin/adminCommon.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/fileinput.css" media="all" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/admin/commodityList.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/fileinput.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/back/admin/kindList.js"></script>
    <script type="text/javascript">
        $(function () {
            var currPage =${requestScope.kindPageBean.currPage};
            if( currPage == '1'){
                $("#prevPage").attr("href","javascript:;");
                $("#prevPage").parent().addClass("disabled");
                $("#firstPage").attr("href","javascript:;");
                $("#firstPage").parent().addClass("disabled");
            }
            if(currPage == "${requestScope.kindPageBean.totalPage}"){
                $("#nextPage").attr("href","javascript:;");
                $("#nextPage").parent().addClass("disabled");
                $("#lastPage").attr("href","javascript:;");
                $("#lastPage").parent().addClass("disabled");
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
			<li class="nav-li nav-active">
				<a class="" href="${pageContext.request.contextPath}/admin/kindList/1" target="_top">品 类 管 理</a>
			</li>
			<li class="nav-li">
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
			<div class="title"><span>品类管理</span></div>
			<div class="add-commodity">
				<button type="button" class="btn btn-success btn-add-commodity" data-toggle="modal" data-target="#modal-add-kind">
					<span class="glyphicon glyphicon-plus"></span>   添加品类
				</button>
			</div>
		</div>
		<table class="table table-bordered table-responsive table-hover text-center">
			<tr class="info" style="text-align: center">
                <td><b>编号</b></td>
				<td><b>id</b></td>
                <td><b>名称</b></td>
				<td><b>操作</b></td>
			</tr>
			<c:forEach items="${requestScope.kindPageBean.list}" var="item" varStatus="i">
                <tr >
					<td>${i.index + 1}</td>
					<td>${item.id}</td>
					<td>${item.name}</td>
					<td>
						<button type="button" class="btn btn-info btn-edit-kind" data-toggle="modal" data-target="#modal-edit-kind"
						><span value="${item.id}" class="glyphicon glyphicon-edit"></span> 修改名称</button>&nbsp;
						<button type="button" class="btn btn-info btn-edit-smallKind"
						><span value="${item.id}" class="glyphicon glyphicon-zoom-out">查看其子类</span></button>
						<button type="button" class="btn btn-warning btn-del-kind"
						><span value="${item.id}" class="glyphicon glyphicon-remove">删除</span></button>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div class="col-xs-offset-4">
			<ul class="pagination">
				<li class="li-page">
					<a id="firstPage" href="${pageContext.request.contextPath}/admin/kindList/1">首页</a>
				</li>
				<li class="li-page">
					<a href="${pageContext.request.contextPath}/admin/kindList/${requestScope.kindPageBean.currPage-1}"
					   id="prevPage">&laquo; 上一页</a>
				</li>
				<li class="li-page">
					<a href="${pageContext.request.contextPath}/admin/kindList/1">1</a>
				</li>

				<li class="li-page">
					<a href="${pageContext.request.contextPath}/admin/kindList/${requestScope.kindPageBean.currPage+1}"
					   id="nextPage">下一页 &raquo;</a>
				</li>
				<li class="li-page">
					<a id="lastPage"  href="${pageContext.request.contextPath}/admin/kindList/${requestScope.kindPageBean.totalPage}">尾页</a>
				</li>
				<li style="cursor: default">
                        <span>当前第 <span>${requestScope.kindPageBean.currPage} / ${requestScope.kindPageBean.totalPage} 页</span>&nbsp;
                        共 ${requestScope.kindPageBean.totalSize} 条记录
                            </span>
				</li>
			</ul>
		</div>
		<br>
	</div>
</div>
<%--修改商品品类名称的弹窗--%>
<div class="modal fade" id="modal-edit-kind" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></button>
				<h4 class="modal-title" id="myModalLabel">修改品类</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" id="input-kind-id" value="">
				<h4 style="display: inline">请输入要修改的新名称：</h4>
				<input type="text" style="display: inline;width: 45%" class="form-control" id="input-kind-name">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="btn-updateKind">修改</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<%--添加商品品类名称的弹窗--%>
<div class="modal fade" id="modal-add-kind" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></button>
				<h4 class="modal-title" id="myModalLabel2">添加品类</h4>
			</div>
			<div class="modal-body">
				<h4 style="display: inline">请输入要添加的品类名称：</h4>
				<input type="text" style="display: inline;width: 45%" class="form-control" id="input-kindName">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="btn-addKind">添加</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<div class="modal fade" id="alertModal">
	<div class="modal-dialog" style="margin-top:350px;width: 400px">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></button>
				<h4 class="modal-title" id="myModalLabel3">提示</h4>
			</div>
			<div class="modal-body alert-text" style="text-align: center;font-size: 18px;">

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="btn-dismiss" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary" id="btn-operate">确定</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</body>
</html>