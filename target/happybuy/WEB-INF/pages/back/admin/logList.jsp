<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<TITLE> 后台管理界面</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="icon" href="${pageContext.request.contextPath}/resources/css/img/icon.ico" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/skins/flat/red.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/admin/logList.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/admin/adminCommon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/bootstrap.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/icheck.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/back/admin/logList.js"></script>
    <script type="text/javascript">
        $(function () {
            var currPage =${requestScope.controllerLogPageBean.currPage};
            if( currPage == '1'){
                $("#prevPage").attr("href","javascript:;");
                $("#prevPage").parent().addClass("disabled");
                $("#firstPage").attr("href","javascript:;");
                $("#firstPage").parent().addClass("disabled");
            }
            if(currPage == "${requestScope.controllerLogPageBean.totalPage}"){
                $("#nextPage").attr("href","javascript:;");
                $("#nextPage").parent().addClass("disabled");
                $("#lastPage").attr("href","javascript:;");
                $("#lastPage").parent().addClass("disabled");
            }
            //循环输出页码
            if("${controllerLogPageBean.totalPage}" <=6){
                for(var i = 1; i <= ${controllerLogPageBean.totalPage}; i ++){
                    $(".page-next").before("<li class='li-page'>" +
                        "<a href='${pageContext.request.contextPath}/admin/logList/"+i+"'>"
                        + i + "</a>" +
                        "</li>");
                }
            } else {
                if(currPage >= 4){
                    for( var j = currPage - 3; j <= currPage+3 && j<=${controllerLogPageBean.totalPage}; j++){
                        $(".page-next").before("<li class='li-page'>" +
                            "<a href='${pageContext.request.contextPath}/admin/logList/"+j+"'>"
                            + j + "</a>" +
                            "</li>");
                    }

                }else {
                    for(var k = 1; k <= 6; k ++){
                        $(".page-next").before("<li class='li-page'>" +
                            "<a href='${pageContext.request.contextPath}/admin/logList/"+k+"'>"
                            + k + "</a>" +
                            "</li>");
                    }
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
			<li class="nav-li nav-active">
				<a class="" href="${pageContext.request.contextPath}/admin/logList/1" target="_top">日 志 管 理</a>
			</li>
			<li class="nav-li">
				<a class="" href="${pageContext.request.contextPath}/admin/editPass" target="_top">修 改 密 码</a>
			</li>
		</div>
	</div>
	<div class="col-md-9 col-xs-offset-2 nav-right">
		<div class="page-header">
			<div class="title"><span>日志管理</span></div>
			<div class="nav-log">
                <span class="nav-log-span span-selected">
                    <a href="${pageContext.request.contextPath}/admin/logList/1" target="_top">操作日志</a>
                </span>
				<span class="nav-log-span ">
                    <a href="${pageContext.request.contextPath}/admin/loginLogList/1">登录日志</a>
                </span>
				<div class="nav-log-delete">
					<button type="button" id="btn-delLog" class="btn btn-warning"
					><span class="glyphicon glyphicon-remove"></span> 批量删除</button>
				</div>
			</div>
		</div>
		<table class="table table-bordered table-responsive table-hover text-center">
			<tr class="info" style="text-align: center">
				<td><a class="" href="javascript:;" id="checkAll">全选</a></td>
                <td><b>编号</b></td>
				<td><b>账号</b></td>
				<td><b>账号类型</b></td>
				<td><b>方法</b></td>
                <td><b>方法描述</b></td>
				<td><b>请求IP</b></td>
				<td><b>请求时间</b></td>
			</tr>
			<c:forEach items="${controllerLogPageBean.list}" var="item" varStatus="i">
                <tr >
					<td value="${item.id}">
						<input type="checkbox" id="checkLog${i.index+1}" class="checkLog" >
						<%--<label for="checkLog${i.index+1}"></label>--%>
					</td>
					<td>${i.index + 1}</td>
					<td>${item.username}</td>
					<td>${item.accountType}</td>
					<td>${item.methodName}</td>
					<td>${item.description}</td>
					<td>${item.requestIP}</td>
					<td>${item.requestTime}</td>
				</tr>
			</c:forEach>
		</table>
		<div class="col-xs-offset-4">
			<ul class="pagination">
				<li class="li-page">
					<a id="firstPage" href="${pageContext.request.contextPath}/admin/logList/1">首页</a>
				</li>
				<li class="li-page">
					<a href="${pageContext.request.contextPath}/admin/logList/${requestScope.controllerLogPageBean.currPage-1}"
					   id="prevPage">&laquo; 上一页</a>
				</li>
				<%--<li class="li-page">
					<a href="${pageContext.request.contextPath}/admin/logList/1">1</a>
				</li>--%>

				<li class="li-page page-next">
					<a href="${pageContext.request.contextPath}/admin/logList/${requestScope.controllerLogPageBean.currPage+1}"
					   id="nextPage">下一页 &raquo;</a>
				</li>
				<li class="li-page">
					<a id="lastPage"  href="${pageContext.request.contextPath}/admin/logList/${requestScope.controllerLogPageBean.totalPage}">尾页</a>
				</li>
				<li style="cursor: default">
                        <span>当前第 <span>${requestScope.controllerLogPageBean.currPage} / ${requestScope.controllerLogPageBean.totalPage} 页</span>&nbsp;
                        共 ${requestScope.controllerLogPageBean.totalSize} 条记录
                            </span>
				</li>
			</ul>
		</div>
		<br>
	</div>
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