/**
 * Created by Administrator on 2017/7/4/004.
 */
$(function () {
   var basePath = $("#basePath").val();

    $(".logout").on("click",function () {
        $.ajax({
            url:basePath + "/user/logout",
            type:"post",
            success:function () {
                window.location.href = basePath + "/index.jsp";
            }
        })
    });

    $(".btn-search").on("click",function () {
        var condition = $(".search").val();
        window.open(basePath + "/item/search/1?condition="+condition);
    });

   //加载购物车
   $(".header-middle-ca").hover(function () {
       //向后台请求数据
       $.ajax({
           url:basePath + "/cart/queryShopCart",
           type:"get",
           success:function (data) {
               $(".p-list-goods").empty();
               $(".p-total-price").empty();
               $.each(data.shopCartCommodityList,function (i,e) {
                   $(".p-list-goods").append("" +
                       "<div class='list-goods-info'>" +
                           "<div class='p-goods-img'>" +
                                "<a href='javascript:;' target='_blank'>" +
                                "<img class='img-goods' src='"+basePath+"/upload/"+e.commodity.picture1+"' />" +
                                "</a>" +
                           "</div>" +
                           "<div class='p-goods-desc'>" +
                                "<a href='javascript:;' target='_blank'>" +
                                (e.commodity.description).substring(0,40)+"</a>" +
                           "</div>" +
                           "<div class='p-goods-price'>" +
                               "<span style='font-weight: bold'>¥ "+(e.commodity.currentPrice).toFixed(2)+" X"+e.commodityNumber+"</span><br>" +
                               "<a href='javascript:;' class='a-delete-commodity' data-commId='"+e.commodity.id+"'>删除" +
                               "</a>" +
                           "</div>" +
                       "</div>");
               });
               $(".p-total-price").append("<span class='span-total-number'>共"+data.totalSize+"件商品</span>" +
                   "<span class='span-total-price'>共¥ "+(data.totalAmount).toFixed(2)+"</span>");
               //从购物车中删除商品
               $(".a-delete-commodity").on("click",function () {
                   var commodityId = $(this).attr("data-commId");
                   var index = $(this).parent().parent().index();
                   $.ajax({
                        url:basePath + "/cart/deleteCommodityByUser",
                        type:"PUT",
                        data:{"commodityId":commodityId},
                        success:function () {
                            $(".list-goods-info").eq(index).remove();
                        }
                    })
               })
           }
       });
        $(".p-shop-cart").show();

   },function () {
        $(".p-shop-cart").hide();
   })

});