package com.happybuy.service.impl;

import com.happybuy.dao.IShopCartCommodityDao;
import com.happybuy.domain.Commodity;
import com.happybuy.domain.ShopCart;
import com.happybuy.domain.ShopCartCommodity;
import com.happybuy.service.interfaces.ShopCartCommodityService;
import com.happybuy.service.interfaces.ShopCartService;
import com.happybuy.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 购物车中的商品类的业务层接口实现类
 * Created by 徐豪 on 2017/7/1/001.
 */
@Service("shopCartCommodityService")
@Transactional
public class ShopCartCommodityServiceImpl implements ShopCartCommodityService{

    @Autowired
    private IShopCartCommodityDao shopCartCommodityDao;

    @Resource(name = "shopCartService")
    private ShopCartService shopCartService;

    /**
     * 查询某个购物车中的商品
     * @param shopCartId  购物车ID
     * @param commodityId 商品ID
     * @return
     */
    @Override
    public ShopCartCommodity queryOne(String shopCartId, String commodityId) {
        Map<String,Object> parameter = new HashMap<String,Object>();
        parameter.put("shopCartId",shopCartId);
        parameter.put("commodityId",commodityId);
        return shopCartCommodityDao.queryOne(parameter);
    }

    /**
     * 更新购物车中商品的数量
     * @param shopCartId
     * @param commodityId
     * @param commodityNumber
     */
    @Override
    public String updateCommodityNumber(String shopCartId, String commodityId, Integer commodityNumber) {
        String msg = "";
        //根据购物车ID和商品ID查询到购物车中该商品
        ShopCartCommodity shopCartCommodity = queryOne(shopCartId, commodityId);
        //查询到该商品的库存
        Integer stock = shopCartCommodity.getCommodity().getStock();
        //如果商品数量大于200，返回超出限制
        if(commodityNumber > 200){
            msg = "out of range";
            //如果商品数量小于等于200但是超出库存，返回库存不足
        } else if(commodityNumber <= 200 && commodityNumber > stock){
            msg = "under stock";
            //如果商品的数量小于等于200并且小于等于商品的库存，返回success
        } else if(commodityNumber <= 200 && commodityNumber <= stock){
            Map<String,Object> parameter = new HashMap<String,Object>();
            parameter.put("shopCartId",shopCartId);
            parameter.put("commodityId",commodityId);
            parameter.put("commodityNumber",commodityNumber);
            //更新购物车中的一条商品的数量
            shopCartCommodityDao.updateCommodityNumber(parameter);
            msg = "success";
        }
        return msg;
    }

    /**
     * 从购物车中删除一个商品
     * @param shopCartId 购物车ID
     * @param commodityId 商品ID
     */
    @Override
    public void deleteCommodity(String shopCartId, String commodityId) {
        Map<String,Object> parameter = new HashMap<String,Object>();
        parameter.put("shopCartId",shopCartId);
        parameter.put("commodityId",commodityId);
        shopCartCommodityDao.deleteOne(parameter);
    }

    /**
     * 从购物车中删除多个商品
     * @param shopCartId 购物车id shopCartId
     * @param commodityIds 多个商品id String类型的commodityIds 如" '1','2' "
     */
    @Override
    public void deleteCommodities(String shopCartId, String commodityIds) {
        Map<String,Object> parameter = new HashMap<String,Object>();
        parameter.put("shopCartId",shopCartId);
        parameter.put("commodityIds",commodityIds);
        shopCartCommodityDao.deleteBatch(parameter);
    }

    /**
     * 查询某个购物车中的多条商品
     * @param shopCartId   购物车id
     * @param commodityIds 多个商品ID commodityIds 如" '1','2' "
     * @return
     */
    @Override
    public List<ShopCartCommodity> queryBatch(String shopCartId, String commodityIds) {
        Map<String,Object> parameter = new HashMap<String,Object>();
        parameter.put("shopCartId",shopCartId);
        parameter.put("commodityIds",commodityIds);
        List<ShopCartCommodity> shopCartCommodityList = shopCartCommodityDao.queryBatch(parameter);

        //计算出每件商品的总价


        return shopCartCommodityList;
    }

    /**
     * 添加一条商品到购物车
     * @param commodityId
     * @param userId
     */
    @Override
    public String addCommodity(String commodityId, String userId) {
        //查询到该用户的购物车
        ShopCart shopCart = shopCartService.queryOne(userId);
        String shopCartId = shopCart.getId();

        ShopCartCommodity shopCartCommodity = new ShopCartCommodity();
        //设置主键
        shopCartCommodity.setId(UUIDUtil.getUUID());
        Commodity commodity = new Commodity();
        commodity.setId(commodityId);
        //设置添加的商品id
        shopCartCommodity.setCommodity(commodity);
        //设置默认添加的数量为1
        shopCartCommodity.setCommodityNumber(1);

        //设置添加的条件
        Map<String,Object> parameter = new HashMap<String,Object>();
        parameter.put("shopCartId",shopCartId);
        parameter.put("commodityId",commodityId);

        //如果购物车已经有了这个商品，返回已存在
        if(shopCartCommodityDao.queryOne(parameter) != null){
            return "exist";
        }

        parameter.put("shopCartCommodity",shopCartCommodity);
        shopCartCommodityDao.insertOne(parameter);
        return "success";
    }

    /**
     * 用户在商品详情页面加入购物车
     * @param commodityId 商品id
     * @param commodityNumber 商品数量
     * @param userId 用户
     * @return
     */
    @Override
    public String addCommodityAndNumber(String commodityId, Integer commodityNumber, String userId) {
        //查询到该用户的购物车
        ShopCart shopCart = shopCartService.queryOne(userId);
        String shopCartId = shopCart.getId();

        //设置添加的条件
        Map<String,Object> parameter = new HashMap<String,Object>();
        parameter.put("shopCartId",shopCartId);
        parameter.put("commodityId",commodityId);
        //如果购物车已经有了这个商品，则更新商品数量
        ShopCartCommodity shopCartCommodity = shopCartCommodityDao.queryOne(parameter);
        if(shopCartCommodity != null){
            //设置商品数量为原有的商品数量加上新添加的商品数量
            commodityNumber += shopCartCommodity.getCommodityNumber();
            parameter.put("commodityNumber",commodityNumber);
            //更新商品数量
            shopCartCommodityDao.updateCommodityNumber(parameter);
        } else {
            //如果购物车中没有该商品，则添加进去
            ShopCartCommodity shopCartCommodity2 = new ShopCartCommodity();
            //设置主键
            shopCartCommodity2.setId(UUIDUtil.getUUID());
            Commodity commodity = new Commodity();
            commodity.setId(commodityId);
            //设置添加的商品id
            shopCartCommodity2.setCommodity(commodity);
            //设置添加的数量为
            shopCartCommodity2.setCommodityNumber(commodityNumber);
            parameter.put("shopCartCommodity",shopCartCommodity2);
            shopCartCommodityDao.insertOne(parameter);
        }
        return null;
    }
}
