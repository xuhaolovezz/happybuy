/**
 * Created by Administrator on 2017/6/24/024.
 */
$(function () {
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

   $(".btn-edit-smallKind").on("click",function () {
       var id = $(this).find("span").attr("value");
       $("#input-smallKind-id").val(id);
   })

    //修改商品小品类的名称
    $("#btn-updateSmallKind").on("click",function () {
        var id = $("#input-smallKind-id").val();
        var name = $("#input-smallKind-name").val();
        $.ajax({
            url:basePath + "/smallKind",
            type:"PUT",
            data:{"id":id,"name":name},
            success:function () {
                window.location.reload(true);
            }
        });
    });

    //删除小品类
    $(".btn-del-smallKind").on("click",function () {
        var id = $(this).find("span").attr("value");
        $(".alert-text").text("确定要删除此小类吗？");
        $("#btn-operate").off();
        $("#btn-operate").on("click",function () {
            $.ajax({
                url: basePath + "/smallKind/"+id,
                type: "DELETE",
                success: function () {
                    window.location.reload(true);
                }
            });
        });
        $("#alertModal").modal('show');
    });

    $(".btn-add-smallKind").on("click",function () {
       var id = $(this).find("span").attr("value");
       $("#kind-id").val(id);
    });

    //添加小品类
    $("#btn-addSmallKind").on("click",function () {
        var kind_id = $("#kind-id").val();
        var name = $("#input-smallKindName").val();
        $.ajax({
            url:basePath + "/smallKind",
            type:"POST",
            data:{"kind.id":kind_id,"name":name},
            success:function () {
                window.location.reload(true);
            }
        });
    });
});