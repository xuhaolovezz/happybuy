/**
 * Created by Administrator on 2017/6/25/025.
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

    $(".nav-li").hover(function () {
        $(this).addClass("active");
    },function () {
        $(this).removeClass("active");
    })

})