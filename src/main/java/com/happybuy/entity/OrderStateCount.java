package com.happybuy.entity;

/**
 * 用来统计某个用户的所有订单的状态
 * Created by 徐豪 on 2017/7/1/001.
 */
public class OrderStateCount {

    //待付款的订单数
    private Integer waitPay;
    //待发货的订单数
    private Integer waitSliverGoods;
    //待收货的订单数
    private Integer waitTakeGoods;
    //待评价的订单数
    private Integer waitComment;

    public OrderStateCount(){

    }

    public OrderStateCount(Integer waitPay, Integer waitSliverGoods, Integer waitTakeGoods, Integer waitComment) {
        this.waitPay = waitPay;
        this.waitSliverGoods = waitSliverGoods;
        this.waitTakeGoods = waitTakeGoods;
        this.waitComment = waitComment;
    }

    public Integer getWaitPay() {
        return waitPay;
    }

    public void setWaitPay(Integer waitPay) {
        this.waitPay = waitPay;
    }

    public Integer getWaitSliverGoods() {
        return waitSliverGoods;
    }

    public void setWaitSliverGoods(Integer waitSliverGoods) {
        this.waitSliverGoods = waitSliverGoods;
    }

    public Integer getWaitTakeGoods() {
        return waitTakeGoods;
    }

    public void setWaitTakeGoods(Integer waitTakeGoods) {
        this.waitTakeGoods = waitTakeGoods;
    }

    public Integer getWaitComment() {
        return waitComment;
    }

    public void setWaitComment(Integer waitComment) {
        this.waitComment = waitComment;
    }

}
