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
     * 查询所有商品种类，返回JSON数据
     */
    function queryAllKind() {
        $.ajax({
            url:basePath + "/kind/findAllKind",
            type:"post",
            success:function (data) {
                return data;
            }
        });
    }
    //根据选择的大种类找到所有的小种类
    var kindList;
    function findSmallKind(index) {
        $("#smallkind").empty();
        $.each(kindList[index].smallKindList,function (i,smallKind) {
            $("#smallkind").append("<option value='"+smallKind.id+"'>"+smallKind.name+"</option>" +
                ""
            );
        });
    }
    //初始化图片上传
    $("#pictures").fileinput({
         showUpload: false,
        // showCaption: false,
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
            });
            kindList = data;
            //设置种类为当前商品的种类
            initKind();
            $.each(kindList,function (i,kind) {
                //初始化小种类和设置小种类为当前商品的小种类
                if(kind.id == $("#kind").val()){
                    findSmallKind(i);
                    initSmallKind();
                }
            })
        }
    });
    //选择大分类时加载对应的小分类
    $("#kind").on("change",function () {
        var index = $(this).find("option:selected").index();
        findSmallKind(index);
    });

    //初始化改变商品状态按钮
    if($("#commodity-state").text() == "在售"){
        $("#btn-change-state").removeClass("btn-primary");
        $("#btn-change-state").addClass("btn-danger");
    } else if($("#commodity-state").text() == "下架"){
        $("#btn-change-state").removeClass("btn-danger");
        $("#btn-change-state").val("在售");
        $("#btn-change-state").addClass("btn-primary");
    }

    /**
     * 改变商品的状态，在售或者下架
     */
    $("#btn-change-state").on('click',function () {
        var id = $(this).attr("data");
        $.ajax({
            url:basePath + "/commodity/changeState",
            type:"PUT",
            data:{"id":id},
            success:function () {
                window.location.reload(true);
            }
        })
    })

});
