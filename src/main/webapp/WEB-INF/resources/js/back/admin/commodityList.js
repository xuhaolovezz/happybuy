/**
 * Created by Administrator on 2017/6/22/022.
 */
$(function(){
    var basePath = $("#basePath").val();

    //管理员退出
    $("#btn-logout").on("click",function () {
        $.ajax({
            url:basePath + "/admin/logout",
            type:"post",
            success:function () {
                window.location.href = basePath + "/index.jsp";
            }
        })
    });

    /**
     * 负责分页的跳转
     * @param condition 查询条件
     * @param currPage 当前页
     * @sort 排序条件
     */
    function toCommodityListByPage(condition,currPage,sort) {
        window.location.href = basePath + "/admin/commodityList/"+currPage+"?condition="+condition+"&sort="+sort;
    }

    //按照条件搜索商品
    $(".btn-search").on("click",function () {
        var condition = $(".input-condition").val();
        window.location.href = basePath + "/admin/commodityList/1?condition="+condition;

    });
    //根据商品价格排序
    $("#order-price").on("click",function () {
        var condition = $(".input-condition").val();
        var order = $(this).attr("order");
        if(order == "price_asc"){
            order = "desc";
        } else {
            order = "asc";
        }
        window.location.href = basePath + "/admin/commodityList/1?condition="+condition+"&sort=price_"+order;
    });
    //根据商品库存排序
    $("#order-stock").on("click",function () {
        var condition = $(".input-condition").val();
        var order = $(this).attr("order");
        if(order == "stock_asc"){
            order = "desc";
        } else {
            order = "asc";
        }
        window.location.href = basePath + "/admin/commodityList/1?condition="+condition+"&sort=stock_"+order;
    });

    /**
     * 查询所有商品种类，返回JSON数据
     */
    function queryAllKind() {
        $.ajax({
            url:basePath + "/kind/findAllKind",
            type:"post",
            success:function (data) {
                return data;
            }
        })
    }
    //根据选择的大种类找到所有的小种类
    var kindList;
    function findSmallKind(index) {
        $("#smallKind").empty();
        $.each(kindList[index].smallKindList,function (i,smallKind) {
            $("#smallKind").append("<option value='"+smallKind.id+"'>"+smallKind.name+"</option>" +
                ""
            );
        })
    }
    //点击添加商品初始化分类
    $(".btn-add-commodity").on('click',function () {
        //初始化图片上传
        $("#pictures").fileinput({
            showUpload: false,
            // showCaption: false,
            uploadUrl: '#',
            language: 'zh', //设置语言
            maxFileCount:4,//允许最大上传文件个数
            maxFileSize: 10240,//单位为kb，如果为0表示不限制文件大小
            dropZoneEnabled: false,//是否显示拖拽区域
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
            browseClass: "btn btn-primary",
            allowedFileExtensions : ['jpg', 'png','gif'],//接收的文件后缀
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>"
        });
        $("#descPictures").fileinput({
            showUpload: false,
            // showCaption: false,
            uploadUrl: '#',
            language: 'zh', //设置语言
            maxFileCount:4,//允许最大上传文件个数
            maxFileSize: 10240,//单位为kb，如果为0表示不限制文件大小
            dropZoneEnabled: false,//是否显示拖拽区域
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
            browseClass: "btn btn-primary",
            allowedFileExtensions : ['jpg', 'png','gif'],//接收的文件后缀
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>"
        });
        $.ajax({
            url:basePath + "/kind/findAllKind",
            type:"post",
            success:function (data) {
                $.each(data,function (i,kind) {
                    $("#kind").append("<option value='"+kind.id+"'>"+kind.name+"</option>" +
                        ""
                    );
                })
                kindList = data;
                findSmallKind(0);
            }
        })
        //选择大分类时加载对应的小分类
        $("#kind").on("change",function () {
            var index = $(this).find("option:selected").index();
            findSmallKind(index);
        })

    });

    /**
     * 提交添加商品的表单
     */
    $("#btn-addCommodity").on("click",function () {
        $("#form-addCommodity").submit();
    });

    /**
     * 删除商品
     */
    $(".btn-del-commodity").on('click',function () {
        //获得当前要删除商品的id
        var id = $(this).find("span").attr("value");
        $(".alert-text").text("确定要删除此商品吗？");
        $("#btn-operate").off();
        $("#btn-operate").on("click",function () {
            $.ajax({
                url:basePath + "/commodity/"+id,
                type:"DELETE",
                success:function () {
                    window.location.reload(true);
                }
            })
        });
        $("#alertModal").modal('show');
    });

    /**
     * 点击编辑商品后初始化商品信息
     */
    $(".btn-edit-commodity").on('click',function () {
        //当前选择要编辑的商品的id
        var id = $(this).find("span").attr("value");
        //跳转到编辑商品页面
        window.location.href = basePath + "/admin/commodityDetail/" + id;
    })
    
});
