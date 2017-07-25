/**
 * Created by Administrator on 2017/6/30/030.
 */

$(function () {
    var basePath = $("#basePath").val();

    $('input').iCheck({
        checkboxClass: 'icheckbox_flat-red',
        radioClass: 'iradio_flat-red'
    });

    /*$(".slt-condition").on("change",function () {
       var value = $(this).val();
       if(value == 1){
           $(".box-search").show();
           $(".search-order-state").hide();
       } else {
           $(".box-search").hide();
           $(".search-order-state").show();
       }
    });*/

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

    //根据订单ID搜索
    $(".btn-search").on("click",function () {
        var condition = $(".input-condition").val();
        var state = $("#state").val();
        window.location.href = basePath + "/admin/orderList/1?condition=" + condition + "&state="+state;
    })

    $(".btn-edit-order").on("click",function () {
        var id = $(this).find("span").attr("value");
        window.location.href = basePath + "/admin/orderDetail/"+id;
    })

});