package com.happybuy.util;

import com.happybuy.domain.ShopCart;
import com.happybuy.domain.ShopCartCommodity;

/**
 * 购物车和订单生成时的价格计算
 * Created by 徐豪 on 2017/7/2/002.
 */
public class CountShopCartAmountUtil {

    public static ShopCart countNumberAndAmount(ShopCart shopCart){
        //购物车中商品的总数
        Integer totalSize = 0;
        //购物车总金额
        Double totalAmount = 0.00;
        //购物车折扣前的金额
        Double totalOriginalAmount = 0.00;

        //为购物车的每个商品的totalPrice和totalOriginalPrice赋值  等于数量*商品的价格
        for(ShopCartCommodity scc:shopCart.getShopCartCommodityList()){
            Double totalPrice ;
            Double totalOriginalPrice ;

            //获得购物车中该商品的数量
            Integer commodityNumber = scc.getCommodityNumber();
            //获得该商品的现在价格
            Double commodityCurrentPrice = scc.getCommodity().getCurrentPrice();
            //获得该商品的打折前的价格
            Double commodityOriginalPrice = scc.getCommodity().getOriginalPrice();

            //设置商品总金额 = 数量 * 现价
            totalPrice = commodityNumber * commodityCurrentPrice;
            scc.setTotalPrice(totalPrice);

            totalSize += commodityNumber;

            //设置商品打折前的金额 = 数量 * 原价
            totalOriginalPrice = commodityNumber * commodityOriginalPrice;
            scc.setTotalOriginalPrice(totalOriginalPrice);

            //将商品的总金额累加,放到购物车中
            totalAmount += totalPrice;
            totalOriginalAmount += totalOriginalPrice;
        }
        shopCart.setTotalSize(totalSize);
        shopCart.setTotalAmount(totalAmount);
        shopCart.setTotalOriginalAmount(totalOriginalAmount);
        return shopCart;
    }

}
