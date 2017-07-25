package com.happybuy.service.interfaces;

import com.happybuy.domain.ShopCart;

/**
 * 购物车业务层接口
 * Created by 徐豪 on 2017/6/30/030.
 */
public interface ShopCartService {
    /**
     * 查询某个用户的购物车
     * @param userId
     * @return
     */
    ShopCart queryShopCartByUser(String userId);

    /**
     * 从购物车中删除一个商品
     * @param shopCartId 购物车ID
     * @param commodityId 商品ID
     */
    void deleteCommodity(String shopCartId, String commodityId);

    /**
     * 从购物车中删除多个商品
     * @param shopCartId 购物车id shopCartId
     * @param commodityIds 多个商品id String类型的commodityIds 如" '1','2' "
     */
    void deleteCommodities(String shopCartId, String commodityIds);

    /**
     * 查询某个指定商品的购物车
     * @param shopCartId 购物车id
     * @param commodityIds 多个商品的id
     * @return
     */
    ShopCart queryByIDAndCommodityIds(String shopCartId, String commodityIds);

    /**
     * 根据用户和多个商品id查询购物车
     * @param userId 用户id
     * @param commodityIds 多个商品id String类型的commodityIds 如" '1','2' "
     * @return
     */
    ShopCart queryByUserAndCommodities(String userId, String commodityIds);

    /**
     * 查询某个用户的购物车ID
     * @param userId
     * @return
     */
    ShopCart queryOne(String userId);

    /**
     * 给用户添加一个购物车
     * @param userId
     */
    void insertOne(String userId);

    /**
     * 根据用户id删除某个购物车中的商品
     * @param userId 用户id
     * @param commodityId 商品id
     */
    void deleteCommodityByUser(String userId, String commodityId);
}
