/**
 * Created by Administrator on 2017/7/3/003.
 */
$(function () {
   var basePath = $("#basePath").val();

   //将商品加入购物车
    $(".add-cart").on("click",function () {
        var commodityId = $(this).attr("data-commId");
        $.ajax({
            url:basePath + "/cart/addCommodity",
            type:"put",
            data:{"commodityId":commodityId},
            success:function (data) {
                if(data == "exist"){
                    $(".modal-body").text("商品已经在购物车了！");
                } else if(data =="success"){
                    $(".modal-body").text("商品已成功加入购物车！");
                }
                $("#btn-operate").text("去购物车查看");
                $("#btn-operate").off();
                $("#btn-operate").on("click",function () {
                    window.open(basePath + "/user/cart");
                });
                $('#alertModal').modal('show');

            }
        })
    });

    //将商品从收藏中删除
    $(".delete-commodity").on("click",function () {
        var collectingId = $(this).attr("data-collId");
        $(".modal-body").text("确定要移除该商品吗？");
        $("#btn-dismiss").text("取消");
        $("#btn-operate").text("确定");
        $('#alertModal').modal('show');
        $("#btn-operate").off();
        $("#btn-operate").on("click",function () {
            $.ajax({
                url:basePath + "/collecting/"+collectingId,
                type:"DELETE",
                success:function () {
                    window.location.reload(true);
                }
            })
        })

    })
});