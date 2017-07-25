package com.happybuy.dao;

import com.happybuy.domain.OrderDetail;

/**
 * OrderDetail对应的持久层接口，对应的Mapper为OrderDetailMapper.xml
 * Created by 徐豪 on 2017/6/28/028.
 */
public interface IOrderDetailDao {

    /**
     * 插入一条订单详情记录
     * @param orderDetail
     */
    void insertOne(OrderDetail orderDetail);

}
