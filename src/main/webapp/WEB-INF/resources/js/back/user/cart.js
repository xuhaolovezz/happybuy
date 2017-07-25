/**
 * Created by Administrator on 2017/7/1/001.
 */
$(function () {
    var basePath = $("#basePath").val();
    $(".logout").on("click",function () {
        $.ajax({
            url:basePath + "/user/logout",
            type:"post",
            success:function () {
                window.location.href = basePath +"/index.jsp";
            }
        })
    });

    //搜素商品
    $(".btn-search").on("click",function () {
        var condition = $(".search").val();
        window.open(basePath + "/item/search/1?condition="+condition);
    });

    function accAdd(a,b){
        var c, d, e;
        try {
            c = a.toString().split(".")[1].length;
        } catch (f) {
            c = 0;
        }
        try {
            d = b.toString().split(".")[1].length;
        } catch (f) {
            d = 0;
        }
        return e = Math.pow(10, Math.max(c, d)), (mul(a, e) + mul(b, e)) / e;
    }
    function mul(a, b) {
        var c = 0,
            d = a.toString(),
            e = b.toString();
        try {
            c += d.split(".")[1].length;
        } catch (f) {}
        try {
            c += e.split(".")[1].length;
        } catch (f) {}
        return Number(d.replace(".", "")) * Number(e.replace(".", "")) / Math.pow(10, c);
    }
    $('input').iCheck({
        checkboxClass: 'icheckbox_flat-red',
        radioClass: 'iradio_flat-red'
    });

    $('#checkAll').on('ifChecked', function(event){
        $('input').iCheck('check');
        countCartAmount();
    });
    $('#checkAll').on('ifUnchecked', function(event){
        $('input').iCheck('uncheck');
        countCartAmount();
    });
    $(".checkCommodity").on("ifChanged",function () {
       countCartAmount();
    });
    //实时计算购物车的总价
    function countCartAmount() {
        //购物车选中商品的总价
        var totalPrice = 0;
        //购物车选中商品的数量
        var totalNumber = 0;
        $(".checkCommodity").each(function (i,e) {
            //如果当前被选中
            if($(this).is(":checked")){
                var commodityPrice = $(this).parent().parent().parent().find(".commodity-price").text();
                var commodityNumber = $(this).parent().parent().parent().find(".commodity-number").val();
                totalPrice = accAdd(totalPrice,commodityPrice).toFixed(2);
                totalNumber = accAdd(totalNumber,commodityNumber);
            }
        });
        $(".commodity-totalPrice").text("￥"+totalPrice);
        $(".commodity-totalNumber").text(totalNumber);
    }

    //更新购物车中商品的数量
    function updateCommodityNumber(that, commodityId, commodityNumber, oldNumber) {
        var shopCartId = $("#shopCartId").val();
        var stock = $(that).parent().attr("data-stock");
        if(commodityNumber > 200){
            $(".modal-body").text("商品数量不能超过200！");
            $("#btn-operate").hide();
            $('#alertModal').modal('show');
            $(that).parent().children().eq(1).val(oldNumber);
            return false;
        }
        $.ajax({
            url:basePath + "/cart/updateCommodityNumber",
            type:"put",
            data:{"shopCartId":shopCartId,"commodityId":commodityId,"commodityNumber":commodityNumber},
            success:function (data) {
                if(data == "success"){
                    window.location.reload(true);
                }  else if(data == "under stock"){
                    $(".modal-body").text("商品数量超过库存！");
                    $('#alertModal').modal('show');
                }
            }
        })
    }

    //商品数量-1
    $(".commodity-number-sub").on("click",function () {
        var oldNumber = $(this).next().val();
        var number;
        var commodityId = $(this).parent().attr("data-commId");
        if(oldNumber > 1){
            number = oldNumber - 1;
            $(this).next().val(number);
            updateCommodityNumber(this,commodityId,number,oldNumber);
        }
    });

    //商品数量+1
    $(".commodity-number-add").on("click",function () {
        // var number = $(".commodity-number").val();
        var oldNumber = $(this).prev().val();
        var number;
        var commodityId = $(this).parent().attr("data-commId");
        if(oldNumber > 0){
            number = Number(oldNumber)+Number(1);
            $(this).prev().val(number);
            updateCommodityNumber(this, commodityId, number,oldNumber);
        }
    });


    var oNumber;
    $(".commodity-number").on("focus",function () {
        oNumber = $(this).val();
    });

    //设置商品数量为输入的数量
    $(".commodity-number").on("change",function () {
        var commodityId = $(this).parent().attr("data-commId");
        var number = $(this).val();
        if(oNumber != number){
            updateCommodityNumber(this,commodityId,number,oNumber);
        }
    });

    // 从购物车中删除商品
    $(".delete-commodity").on("click",function () {
        var shopCartId = $("#shopCartId").val();
        var commodityId = $(this).attr("data-commId");
        $(".modal-body").text("确定要从购物车中删除该商品吗？");
        $("#btn-dismiss").text("取消");
        $("#btn-operate").text("确定");
        $("#btn-operate").show();
        $('#alertModal').modal('show');
        $("#btn-operate").off();
        $("#btn-operate").on("click",function () {
            $.ajax({
                url:basePath + "/cart/deleteCommodity",
                type:"PUT",
                data:{"shopCartId":shopCartId, "commodityId":commodityId},
                success:function () {
                    window.location.reload(true);
                }
            })
        })

    });
    //删除选择商品
    $(".deleteAllCheck").on("click",function () {
        var shopCartId = $("#shopCartId").val();
        var commodityIds = new Array();
        $(".checkCommodity").each(function (i,e) {
            //如果当前被选中
            if($(this).is(":checked")){
                var commodityId = "'" + $(this).attr("data-commId") + "'";
                commodityIds.push(commodityId);
            }
        });
        $(".modal-body").text("确定要从购物车中删除这些商品吗？");
        $("#btn-dismiss").text("取消");
        $("#btn-operate").text("确定");
        $("#btn-operate").show();
        $('#alertModal').modal('show');
        $("#btn-operate").off();
        $("#btn-operate").on("click",function () {
            $.ajax({
                url: basePath + "/cart/deleteCommodities",
                type: "PUT",
                data: {"shopCartId": shopCartId, "commodityIds": commodityIds.toString()},
                success: function () {
                    window.location.reload(true);
                }
            })
        });
    });

    /**
     * 添加商品到收藏
     */
    $(".add-collecting").on("click",function () {
       var commodityId = $(this).prev().attr("data-commId");
        $.ajax({
            url:basePath + "/collecting/addCollecting",
            type:"put",
            data:{"commodityId":commodityId},
            success:function (data) {
                if(data == "exist"){
                    $(".modal-body").text("商品已经在收藏列表了！");
                } else if(data =="success"){
                    $(".modal-body").text("商品已成功加入收藏！");
                }
                $("#btn-operate").hide();
                $('#alertModal').modal('show');

            }
        })
    });

    /**
     * 订单结算
     */
    $(".foot-submit").on("click",function () {
        var shopCartId = $("#shopCartId").val();
        var commodityIds = new Array();
        $(".checkCommodity").each(function (i,e) {
            //如果当前被选中
            if($(this).is(":checked")){
                var commodityId = "'" + $(this).attr("data-commId") + "'";
                commodityIds.push(commodityId);
            }
        });
        commodityIds = commodityIds.toString();
        window.location.href = basePath + "/order/orderConfirmation?shopCartId=" +shopCartId+"&commodityIds="+commodityIds;
    })
});