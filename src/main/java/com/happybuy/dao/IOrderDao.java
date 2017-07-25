package com.happybuy.dao;

import com.happybuy.domain.Order;

import java.util.List;
import java.util.Map;

/**
 * Order实体类的持久层接口，对应的Mapper为OrderMapper.xml
 * Created by 徐豪 on 2017/6/28/028.
 */
public interface IOrderDao {

    /**
     * 根据用户或者订单状态查询订单
     * @param parameter  1. user_id 用户 2.state 订单状态
     * @return
     */
    List<Order> queryOrderByPage(Map<String,Object> parameter);

    /**
     * 管理员查询订单
     * @param parameter  1. order_id 订单号模糊查询 2.state 订单状态
     * @return
     */
    List<Order> queryAdminOrderByPage(Map<String,Object> parameter);

    /**
     * 查询某个用户的订单状态
     */
    List<Order> countState(String userId);

    /**
     * 根据条件查询订单总记录数
     * @return
     */
    Integer countAll(Order order);

    /**
     * 根据订单ID查询订单详情
     */
    Order queryOrderById(String id);

    /**
     * 查询一条订单状态
     */
    Order queryState(String orderId);

    /**
     * 更新某个订单的状态
     * @param order
     */
    void updateStateByOrderId(Order order);

    /**
     * 添加一条订单记录
     * @param order
     */
    void insertOne(Order order);

    /**
     * 订单交易成功，更新订单的支付宝交易号
     */
    void orderPaySuccess(Order order);

    /**
     * 查询订单的总金额和订单的商品描述
     */
    Order queryTotalAmount(String orderId);
}
