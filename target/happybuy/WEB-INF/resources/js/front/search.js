/**
 * Created by Administrator on 2017/7/5/005.
 */
$(function () {
    var basePath = $("#basePath").val();
    $(".add-collecting").hover(function () {
        $(this).find("span").css("color","#FF4A49");
    },function () {
        $(this).find("span").css("color","#d1d1d1");
    })
    $(".a-sort").hover(function () {
        if(!$(this).hasClass("a-sort-selected")){
            $(this).css("border","1px solid #ef4746");
            $(this).css("color","#ef4746");
        }
    },function () {
        if(!$(this).hasClass("a-sort-selected")) {
            $(this).css("border", "1px solid #d9edf7");
            $(this).css("color", "#333");
        }
    })
    //根据商品价格排序
    $("#order-price").on("click",function () {
        var condition = $(this).parent().attr("data-condition");
        var order = $(this).attr("order");
        if(order == "price_asc"){
            order = "desc";
        } else {
            order = "asc";
        }
        window.location.href = basePath + "/item/search/1?condition="+condition+"&sort=price_"+order;
    });
    //根据销量库存排序
    $("#order-totalBuy").on("click",function () {
        var condition = $(this).parent().attr("data-condition");
        var order = $(this).attr("order");
        if(order == "totalBuy_asc"){
            order = "desc";
        } else {
            order = "asc";
        }
        window.location.href = basePath + "/item/search/1?condition="+condition+"&sort=totalBuy_"+order;
    });
});