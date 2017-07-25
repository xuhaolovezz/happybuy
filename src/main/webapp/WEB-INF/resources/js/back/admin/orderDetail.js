/**
 * Created by Administrator on 2017/6/30/030.
 */
$(function () {
    var basePath = $("#basePath").val();
    /**
     * 给订单发货
     */
    $(".btn-deliver-goods").on("click",function () {
        var orderId = $(this).attr("orderId");
        $.ajax({
            url:basePath + "/order",
            type:"put",
            data:{"orderId":orderId,"state":"已发货"},
            success:function () {
                window.location.reload(true);
            }
        })
    })
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
});