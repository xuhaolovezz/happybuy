package com.happybuy.domain;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

/**
 * 购物车类 ，对应数据的表为shopcart
 * Created by 徐豪 on 2017/6/20/020.
 */
public class ShopCart implements Serializable {
    //购物车的主键
    private String id;
    //购物车中的所有商品数量
    private Integer totalSize;
    //购物车总价
    private Double totalAmount;
    //购物车折扣之前的价格
    private Double totalOriginalAmount;
    //购物车所属用户
    private User user;
    //购物车里的商品
    private List<ShopCartCommodity> shopCartCommodityList;

    public ShopCart() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getTotalSize() {
        return totalSize;
    }

    public void setTotalSize(Integer totalSize) {
        this.totalSize = totalSize;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<ShopCartCommodity> getShopCartCommodityList() {
        return shopCartCommodityList;
    }

    public void setShopCartCommodityList(List<ShopCartCommodity> shopCartCommodityList) {
        this.shopCartCommodityList = shopCartCommodityList;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Double getTotalOriginalAmount() {
        return totalOriginalAmount;
    }

    public void setTotalOriginalAmount(Double totalOriginalAmount) {
        this.totalOriginalAmount = totalOriginalAmount;
    }
}
