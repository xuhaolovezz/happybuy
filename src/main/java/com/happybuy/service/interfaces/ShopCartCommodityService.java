package com.happybuy.service.interfaces;

import com.happybuy.domain.ShopCartCommodity;

import java.util.List;
import java.util.Map;

/**
 * 购物车中的商品类的业务层接口
 * Created by 徐豪 on 2017/7/1/001.
 */
public interface ShopCartCommodityService {

    /**
     * 查询某个购物车中的商品
     * @param shopCartId  购物车ID
     * @param commodityId 商品ID
     * @return
     */
    ShopCartCommodity queryOne(String shopCartId, String commodityId);

    /**
     * 更新购物车中商品的数量
     * @param shopCartId
     * @param commodityId
     * @param commodityNumber
     */
    String updateCommodityNumber(String shopCartId, String commodityId, Integer commodityNumber);

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
     * 查询某个购物车中的多条商品
     * @param shopCartId   购物车id
     * @param commodityIds 多个商品ID commodityIds 如" '1','2' "
     * @return
     */
    List<ShopCartCommodity> queryBatch(String shopCartId, String commodityIds);

    /**
     * 添加一条商品到购物车
     * @param commodityId
     * @param userId
     */
    String addCommodity(String commodityId, String userId);

    /**
     * 添加多条商品进购物车
     * @param commodityId 商品id
     * @param commodityNumber 商品数量
     * @param userId 用户
     * @return
     */
    String addCommodityAndNumber(String commodityId, Integer commodityNumber, String userId);
}
