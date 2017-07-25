/**
 * Created by Administrator on 2017/6/24/024.
 */
$(function () {
    var bashPath = $("#basePath").val();

    //管理员退出
    $("#btn-logout").on("click",function () {
        $.ajax({
            url:bashPath + "/admin/logout",
            type:"post",
            success:function () {
                window.location.href = bashPath + "/index.jsp";
            }
        })
    });

    $(".btn-edit-kind").on("click",function () {
        var kind_id = $(this).find("span").attr("value");
        $("#input-kind-id").val(kind_id);
    });

    //修改商品品类的名称
    $("#btn-updateKind").on("click",function () {
        var id = $("#input-kind-id").val();
        var name = $("#input-kind-name").val();
        $.ajax({
            url:bashPath + "/kind",
            type:"put",
            data:{"id":id,"name":name},
            success:function () {
                window.location.reload(true);
            }
        })
    })

    //添加商品品类
    $("#btn-addKind").on("click",function () {
       var name = $("#input-kindName").val();
       $.ajax({
           url:bashPath + "/kind",
           type:"post",
           data:{"name":name},
           success:function () {
               window.location.reload(true);
           }
       })
    });

    //删除商品品类
    $(".btn-del-kind").on("click",function () {
        var id = $(this).find("span").attr("value");
        $(".alert-text").text("确定要删除此商品品类吗？");
        $("#btn-operate").off();
        $("#btn-operate").on("click",function () {
            $.ajax({
                url:bashPath + "/kind/"+id,
                type:"DELETE",
                success:function () {
                    window.location.reload(true);
                }
            })
        });
        $("#alertModal").modal('show');
    })
    
    //查看该商品品类的子品类
    $(".btn-edit-smallKind").on("click",function () {
        var id = $(this).find("span").attr("value");
        window.location.href = bashPath + "/kind/" + id;
    })
});