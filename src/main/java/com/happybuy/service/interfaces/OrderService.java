package com.happybuy.service.interfaces;

import com.happybuy.domain.Order;
import com.happybuy.entity.OrderStateCount;
import com.happybuy.entity.PageBean;

import java.util.List;
import java.util.Map;

/**
 * 订单相关的业务层接口
 * Created by 徐豪 on 2017/6/28/028.
 */
public interface OrderService {

    /**
     * 根据用户或者订单状态查询订单
     * @param parameter  1. user_id 用户  2.order_id 订单id   2.state 订单状态
     * @return
     */
    List<Order> queryOrderByPage(Map<String,Object> parameter);

    /**
     * 分页查询订单
     * @param currPage 当前页
     * @return
     */
    PageBean<Order> queryOrderByPage(Integer currPage, Order order);

    /**
     * 根据订单ID查询订单详情
     * @param id
     * @return
     */
    Order queryOrderById(String id);

    /**
     * 更新某个订单的状态
     * @param orderId
     */
    void updateStateByOrderId(String orderId, String state);

    /**
     * 分页查询某个用户的所有订单
     * @param id 用户id
     * @param currPage
     * @return
     */
    PageBean<Order> queryOrderByUser(String id, Integer currPage, String state);

    /**
     * 统计某个用户的所有订单各种状态的数量
     * @param userId
     */
    OrderStateCount countOrderState(String userId);

    /**
     * 生成新订单
     * @param addressId 订单的收货地址
     * @param commodityIds 订单中的商品
     * @param userId 用户
     * @return 生成的订单id和订单创建时间
     */
    Map<String,Object> addOrder(String addressId, String commodityIds, String userId);

    /**
     * 判断某个订单的状态是否是已收货
     * @param orderId
     * @return
     */
    String isTakeGoods(String orderId);

    /**
     * 订单交易成功
     * @param out_trade_no 订单号
     * @param trade_no 支付宝号
     * @param total_amount 订单的交易金额
     */
    void orderSuccess(String out_trade_no, String trade_no, String total_amount);

    /**
     * 根据订单id查询订单的总金额和订单的商品名称
     * @param orderId
     * @return
     */
    Map<String,Object> queryTotalAmount(String orderId);
}
