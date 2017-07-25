package com.happybuy.dao;

import com.happybuy.domain.ShopCart;
import com.happybuy.domain.ShopCartCommodity;

import java.util.Map;

/**
 * 购物车持久层接口，对应的Mapper为ShopCartMapper.xml
 * Created by 徐豪 on 2017/6/27/027.
 */
public interface IShopCartDao {

    /**
     * 查询某个用户的购物车
     * @param parameter  可选参数：1. userId 用户id
     *                   2.shopCartId 购物车ID和commodityIds 商品id集合 例如" '1','2' "
     * @return
     */
    ShopCart queryOneByUser(Map<String,Object> parameter);

    /**
     * 查询某个用户的购物车ID
     * @param userId
     * @return
     */
    ShopCart queryOne(String userId);

    /**
     * 给某个用户添加一个购物车
     */
    void insertOne(Map<String,Object> parameter);

}
