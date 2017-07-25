package com.happybuy.dao;

import com.happybuy.domain.ShopCartCommodity;

import java.util.List;
import java.util.Map;

/**
 * 购物车中的商品类持久层接口，对应的mapper为ShopCartCommodityMapper.xml
 * Created by 徐豪 on 2017/7/1/001.
 */
public interface IShopCartCommodityDao {

    /**
     * 查询某个购物车中的商品
     * @param parameter 1.购物车id shopCartId    2.商品ID commodityId
     * @return
     */
    ShopCartCommodity queryOne(Map<String,Object> parameter);

    /**
     * 查询某个购物车中的多条商品
     * @param parameter 1.购物车id shopCartId    2.多个商品ID commodityIds
     * @return
     */
    List<ShopCartCommodity> queryBatch(Map<String,Object> parameter);

    /**
     * 更新购物车中的一条商品的数量
     * @param parameter 1.购物车id shopCartId    2.商品ID commodityId
     * @return
     */
    void updateCommodityNumber(Map<String,Object> parameter);

    /**
     * 添加商品到购物车中
     * @param parameter 1.购物车id shopCartId    2.shopCartCommodity
     */
    void insertOne(Map<String,Object> parameter);

    /**
     * 从购物车中删除商品
     * @param parameter 商品id commodityId和购物车id shopCartId
     */
    void deleteOne(Map<String,Object> parameter);

    /**
     * 从购物车中删除多个商品
     * @param parameter 购物车id shopCartId
     *                  多个商品id String类型的commodityIds 如" '1','2' "
     */
    void deleteBatch(Map<String,Object> parameter);
}
