package com.happybuy.service.impl;

import com.happybuy.dao.IShopCartDao;
import com.happybuy.domain.ShopCart;
import com.happybuy.domain.ShopCartCommodity;
import com.happybuy.service.interfaces.ShopCartCommodityService;
import com.happybuy.service.interfaces.ShopCartService;
import com.happybuy.util.CountShopCartAmountUtil;
import com.happybuy.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;


/**
 * 购物车业务层接口实现类
 * Created by 徐豪 on 2017/6/30/030.
 */
@Service("shopCartService")
@Transactional
public class ShopCartServiceImpl implements ShopCartService {

    @Autowired
    private IShopCartDao shopCartDao;

    @Resource(name = "shopCartCommodityService")
    private ShopCartCommodityService shopCartCommodityService;

    /**
     * 查询某个用户的购物车
     * @param userId
     * @return
     */
    @Override
    public ShopCart queryShopCartByUser(String userId) {
        //查询到该用户的购物车
        Map<String,Object> parameter = new HashMap<String, Object>();
        parameter.put("userId",userId);
        ShopCart shopCart = shopCartDao.queryOneByUser(parameter);

        //如果购物车中有商品，计算出商品的总数量和总价
        if(shopCart.getShopCartCommodityList().get(0).getId() != null){
            shopCart = CountShopCartAmountUtil.countNumberAndAmount(shopCart);
        }

        return shopCart;
    }

    /**
     * 从购物车中删除一个商品
     * @param shopCartId 购物车ID
     * @param commodityId 商品ID
     */
    @Override
    public void deleteCommodity(String shopCartId, String commodityId) {
        shopCartCommodityService.deleteCommodity(shopCartId,commodityId);
    }

    /**
     * 从购物车中删除多个商品
     * @param shopCartId 购物车id shopCartId
     * @param commodityIds 多个商品id String类型的commodityIds 如" '1','2' "
     */
    @Override
    public void deleteCommodities(String shopCartId, String commodityIds) {
        shopCartCommodityService.deleteCommodities(shopCartId,commodityIds);
    }

    /**
     * 查询某个指定商品的购物车
     * @param shopCartId 购物车id
     * @param commodityIds 多个商品的id
     * @return
     */
    @Override
    public ShopCart queryByIDAndCommodityIds(String shopCartId, String commodityIds) {

        /**
         * 根据购物车id和多个商品的id查询到该购物车
         */
        Map<String,Object> parameter = new HashMap<String, Object>();
        parameter.put("shopCartId",shopCartId);
        parameter.put("commodityIds",commodityIds);
        ShopCart shopCart = shopCartDao.queryOneByUser(parameter);

        //计算出商品的总数量和总价
        shopCart = CountShopCartAmountUtil.countNumberAndAmount(shopCart);

        return shopCart;
    }

    /**
     * 根据用户和多个商品id查询购物车
     * @param userId 用户id
     * @param commodityIds 多个商品id String类型的commodityIds 如" '1','2' "
     * @return
     */
    @Override
    public ShopCart queryByUserAndCommodities(String userId, String commodityIds) {

        //设置查询的条件
        Map<String,Object> parameter = new HashMap<String, Object>();
        parameter.put("userId",userId);
        parameter.put("commodityIds",commodityIds);
        ShopCart shopCart = shopCartDao.queryOneByUser(parameter);

        //计算出商品的总数量和总价
        shopCart = CountShopCartAmountUtil.countNumberAndAmount(shopCart);

        return shopCart;
    }

    /**
     * 查询某个用户的购物车ID
     * @param userId
     * @return
     */
    @Override
    public ShopCart queryOne(String userId) {
        return shopCartDao.queryOne(userId);
    }

    /**
     * 给用户添加一个购物车
     * @param userId
     */
    @Override
    public void insertOne(String userId) {

        Map<String, Object> parameter = new HashMap<String ,Object>();
        String shopCartId = UUIDUtil.getUUID();

        //设置插入记录的值
        parameter.put("shopCartId",shopCartId);
        parameter.put("userId",userId);

        shopCartDao.insertOne(parameter);
    }

    /**
     * 根据用户id删除某个购物车中的商品
     * @param userId 用户id
     * @param commodityId 商品id
     */
    @Override
    public void deleteCommodityByUser(String userId, String commodityId) {
        //查询到该用户的购物车id
        ShopCart shopCart = queryOne(userId);
        //根据购物车id和商品id删除该商品
        shopCartCommodityService.deleteCommodity(shopCart.getId(),commodityId);
    }

}
