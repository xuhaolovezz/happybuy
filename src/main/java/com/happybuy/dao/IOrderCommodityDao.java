package com.happybuy.dao;

import com.happybuy.domain.OrderCommodity;

import java.util.List;

/**
 * 订单中的商品类持久层接口，对应的Mapper为OrderCommodityMapper.xml
 * Created by 徐豪 on 2017/7/3/003.
 */
public interface IOrderCommodityDao {

    /**
     * 插入多条订单商品记录
     * @param orderCommodityList
     */
    void insertBatch(List<OrderCommodity> orderCommodityList);

    /**
     * 根据订单id查询订单商品记录
     * @param orderId
     * @return
     */
    List<OrderCommodity> queryBatchByOrder(String orderId);

    /**
     * 根据订单id查询订单商品详细记录
     */
    List<OrderCommodity> queryDetailsByOrder(String orderId);

}
