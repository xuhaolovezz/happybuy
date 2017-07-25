/**
 * Created by Administrator on 2017/7/1/001.
 */
$(function () {
    var basePath = $("#basePath").val();

    /**
     * 立即收货
     */
   $(".a-take-goods").on("click",function () {
       var orderId = $(this).attr("data-orderId");
       var state = "已收货";
       $(".modal-body").text("确定要收货吗？");
       $("#btn-dismiss").text("取消");
       $("#btn-operate").text("确定");
       $('#alertModal').modal('show');
       $("#btn-operate").off();
       $("#btn-operate").on("click",function () {
           $.ajax({
               url:basePath + "/order",
               type:"put",
               data:{"orderId":orderId,"state":state},
               success:function () {
                   window.location.reload(true);
               }
           })
       })
   });

    /**
     * 取消订单
     */
    $(".p-order-a").on("click",function () {
        var orderId = $(this).attr("data-orderId");
        var state = "已取消";
        $(".modal-body").text("确定要取消订单吗？");
        $("#btn-dismiss").text("取消");
        $("#btn-operate").text("确定");
        $('#alertModal').modal('show');
        $("#btn-operate").off();
        $("#btn-operate").on("click",function () {
            $.ajax({
                url:basePath + "/order",
                type:"put",
                data:{"orderId":orderId,"state":state},
                success:function () {
                    window.location.reload(true);
                }
            })
        })
    })

    /**
     * 评价
     */
    $(".a-comment").on("click",function () {
        var orderId = $(this).attr("data-orderId");
        $.ajax({
            url:basePath + "/order/isTakeGoods/"+orderId,
            type:"get",
            success:function (data) {
                if(data == "true"){
                    window.open(basePath + "/comment/addComment/"  + orderId);
                } else {
                    alert("订单状态错误，无法进行评论");
                }
            }
        })
    });

    /**
     * 跳转至付款页面
     */
    $(".a-pay").on("click",function () {
        var orderId = $(this).attr("data-orderId");
        $.ajax({
            url:basePath + "/order/toOrderPay/" + orderId,
            type:"get",
            success:function (data) {
                var orderId = data.split(",")[0];
                var orderDesc = data.split(",")[1];
                var totalAmount = data.split(",")[2];
                var orderName = data.split(",")[3];
                window.open(basePath + "/order/orderPay?orderId="+orderId+"&orderDesc="+orderDesc+
                    "&totalAmount="+totalAmount+"&orderName="+orderName);
            }
        });
        // window.open(basePath + "/order/toOrderPay/" + orderId);
    });
});