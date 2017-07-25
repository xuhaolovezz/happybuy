package com.happybuy.domain;

import java.io.Serializable;
import java.util.List;

/**
 * 订单实体类，对应数据库的表为Order
 * Created by 徐豪 on 2017/6/20/020.
 */
public class Order implements Serializable {
    //订单id
    private String id;
    //支付宝交易号
    private String tradeNo;
    //订单状态（未付款、已支付、已发货、已收货）
    private String state;
    //订单的总金额，保留两位小数
    private Double totalAmount;
    //订单原价
    private Double totalOriginalAmount;

    //订单的所属用户
    private User user;
    //订单详情  一对一
    private OrderDetail orderDetail;
    //订单的商品
    private List<OrderCommodity> orderCommodityList;

    public Order() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTradeNo() {
        return tradeNo;
    }

    public void setTradeNo(String tradeNo) {
        this.tradeNo = tradeNo;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public OrderDetail getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(OrderDetail orderDetail) {
        this.orderDetail = orderDetail;
    }

    public List<OrderCommodity> getOrderCommodityList() {
        return orderCommodityList;
    }

    public void setOrderCommodityList(List<OrderCommodity> orderCommodityList) {
        this.orderCommodityList = orderCommodityList;
    }

    public Double getTotalOriginalAmount() {
        return totalOriginalAmount;
    }

    public void setTotalOriginalAmount(Double totalOriginalAmount) {
        this.totalOriginalAmount = totalOriginalAmount;
    }
}
