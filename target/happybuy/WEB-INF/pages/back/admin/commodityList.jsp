<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<TITLE> 后台管理界面</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="icon" href="${pageContext.request.contextPath}/resources/css/img/icon.ico" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/fileinput.css" media="all" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/admin/commodityList.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back/admin/adminCommon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/fileinput.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/zh.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/back/admin/commodityList.js"></script>
    <script type="text/javascript">
        $(function () {
            var currPage =${requestScope.commodityPageBean.currPage};
            if( currPage == '1'){
                $("#prevPage").attr("href","javascript:;");
                $("#prevPage").parent().addClass("disabled");
                $("#firstPage").attr("href","javascript:;");
                $("#firstPage").parent().addClass("disabled");
            }
            if(currPage >= "${requestScope.commodityPageBean.totalPage}"){
                $("#nextPage").attr("href","javascript:;");
                $("#nextPage").parent().addClass("disabled");
                $("#lastPage").attr("href","javascript:;");
                $("#lastPage").parent().addClass("disabled");
            }
            //循环输出页码
			for(var i = 1; i <= ${commodityPageBean.totalPage}; i ++){
                if(i <= 8){
                    $(".page-next").before("<li class='li-page'>" +
                    	"<a href='${pageContext.request.contextPath}/admin/commodityList/"+i+
						"?condition=${condition}" +
                    	"<c:if test='${sort!=null}'>&sort=${sort}</c:if>'>"+i+"</a>" +
                    	"    </li>" +
						"");
                }
            }
            //设置当前页码高亮显示
            $.each($(".li-page"),function (i,e) {
                if($(this).text() == currPage){
                    $(this).addClass("active");
                }
            });
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
			<li class="nav-li nav-active">
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
			<li class="nav-li">
				<a class="" href="${pageContext.request.contextPath}/admin/editPass" target="_top">修 改 密 码</a>
			</li>
		</div>
	</div>
	<div class="col-md-9 col-xs-offset-2 nav-right">
		<div class="page-header">
			<div class="title"><span>商品管理</span></div>
			<div class="add-commodity">
				<button type="button" class="btn btn-success btn-add-commodity" data-toggle="modal" data-target="#modal-add-commodity">
					<span class="glyphicon glyphicon-plus"></span>   添加商品
				</button>
			</div>
			<div class="header-search">
				<form action="${pageContext.request.contextPath}/admin/commodityList/1/" method="get">
					<input type="text" name="condition" class="form-control input-condition" value="${condition}" placeholder="分类/名称/描述">
					<input type="button" class="btn btn-info btn-search" value="搜索">
				</form>
			</div>
		</div>
		<c:if test="${commodityPageBean.list.size() == 0}">
			<div class="no-order">
				<span>抱歉，没有搜索到您想要的商品。</span>
			</div>
		</c:if>
		<table class="table table-bordered table-responsive table-hover text-center">
			<tr class="info" style="text-align: center">
                <td><b>编号</b></td>
                <td><b>图片</b></td>
                <td><b>名称</b></td>
                <td width="40%"><b>描述</b></td>
                <td><b>分类</b></td>
                <td><b id="order-price" order="${sort}" style="cursor: pointer" title="按照价格排序">
					价格&nbsp;<span class="text-primary	glyphicon glyphicon-sort"></span></b></td>
                <td><b id="order-stock" order="${sort}" style="cursor: pointer" title="按照库存排序">
					库存&nbsp;<span class="text-primary	glyphicon glyphicon-sort"></span></b></td>
				<td><b>操作</b></td>
			</tr>
			<c:forEach items="${requestScope.commodityPageBean.list}" var="item" varStatus="i">
                <tr>
					<td>${i.index + 1}</td>
					<td>
						<a href="${pageContext.request.contextPath}/item/details/${item.id}" target="_blank">
							<img class="itemPicture" src="${pageContext.request.contextPath}/upload/${item.picture1}"/>
						</a>
					</td>
					<td>${item.name}</td>
					<td>
						<a target="_blank" href="${pageContext.request.contextPath}/item/details/${item.id}">
							${item.description}
						</a>
					</td>
                    <td>${item.kind.name}—${item.smallKind.name}</td>
					<td>${item.currentPrice}元</td>
					<td>${item.stock}件</td>
					<td>
						<button type="button" title="编辑商品" class="btn btn-info btn-edit-commodity" data-toggle="modal" data-target="#modal-edit-commodity"
						><span value="${item.id}" class="glyphicon glyphicon-edit"></span> 编辑</button>&nbsp;
						<button type="button" title="删除商品" class="btn btn-danger btn-del-commodity"
						><span value="${item.id}" class="glyphicon glyphicon-remove"></span> 删除</button>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div class="col-xs-offset-4">
			<ul class="pagination">
				<li class="li-page">
					<a id="firstPage" href="${pageContext.request.contextPath}/admin/commodityList/1
					?condition=${condition}<c:if test="${sort!=null}">&sort=${sort}</c:if>">首页</a>
				</li>
				<li class="li-page">
					<a href="${pageContext.request.contextPath}/admin/commodityList/${commodityPageBean.currPage-1}?condition=
					${condition}<c:if test="${sort!=null}">&sort=${sort}</c:if>"
					   id="prevPage">&laquo; 上一页</a>
				</li>

				<li class="li-page page-next">
					<a href="${pageContext.request.contextPath}/admin/commodityList/${commodityPageBean.currPage+1}?condition=
					${condition}<c:if test="${sort!=null}">&sort=${sort}</c:if>"
					   id="nextPage">下一页 &raquo;</a>
				</li>
				<li class="li-page">
					<a id="lastPage"  href="${pageContext.request.contextPath}/admin/commodityList
					/${commodityPageBean.totalPage}?condition=${condition}<c:if test="${sort!=null}">&sort=${sort}</c:if>" >尾页</a>
				</li>
				<li style="cursor: default">
                        <span>当前第 <span>${commodityPageBean.currPage} / ${commodityPageBean.totalPage} 页</span>&nbsp;
                        共 ${commodityPageBean.totalSize} 条记录</span>
				</li>
			</ul>
		</div>
		<br>
	</div>
</div>
<%--添加商品的弹窗--%>
<div class="modal fade" id="modal-add-commodity" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width: 1000px">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></button>
				<h4 class="modal-title" id="myModalLabel">添加商品</h4>
			</div>
			<div class="modal-body">
				<form class="form-group form-inline" action="${pageContext.request.contextPath}/commodity" method="post" id="form-addCommodity"
                      enctype="multipart/form-data">
					<table class="table table-bordered table-responsive">
                        <tr>
                            <td>商品名称：<input type="text" class="form-control" name="name"></td>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon">库存:</span>
                                    <input type="text" class="form-control" name="stock">
                                    <span class="input-group-addon">件</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                商品介绍：<textarea class="form-control" rows="4" cols="50" name="description"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon">原价:</span>
                                    <input type="text" class="form-control" name="originalPrice">
                                    <span class="input-group-addon">元</span>
                                </div>
                            </td>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon">现价:</span>
                                    <input type="text" class="form-control" name="currentPrice">
                                    <span class="input-group-addon">元</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">分类：
                                <select name="kind.id" class="form-control" id="kind">

                                </select>&nbsp;&nbsp;
                                <select name="smallKind.id" class="form-control" id="smallKind"></select>
                            </td>
                        </tr>
                        <tr>
							<td colspan="2"><h4>选择四张缩略图：</h4>
								<input type="file" name="pictures" id="pictures" multiple></td>
                        </tr>
                        <tr>
							<td colspan="2"><h4>选择四张商品描述图：</h4><input type="file" name="descPictures" id="descPictures" multiple></td>
                        </tr>
					</table>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="btn-addCommodity">添加</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<div class="modal fade" id="alertModal">
	<div class="modal-dialog" style="margin-top:350px;width: 400px">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></button>
				<h4 class="modal-title" id="myModalLabel2">提示</h4>
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