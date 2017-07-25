package com.happybuy.domain;

import java.io.Serializable;
import java.util.Objects;

/**
 * 购物车中的商品
 * Created by 徐豪 on 2017/6/28/028.
 */
public class ShopCartCommodity implements Serializable{

    private String id;

    //该商品的数量
    private Integer commodityNumber;
    //该商品的总价
    private Double totalPrice;
    //该商品折扣前的总价
    private Double totalOriginalPrice;

    //商品
    private Commodity commodity;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getCommodityNumber() {
        return commodityNumber;
    }

    public void setCommodityNumber(Integer commodityNumber) {
        this.commodityNumber = commodityNumber;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Commodity getCommodity() {
        return commodity;
    }

    public void setCommodity(Commodity commodity) {
        this.commodity = commodity;
    }

    public Double getTotalOriginalPrice() {
        return totalOriginalPrice;
    }

    public void setTotalOriginalPrice(Double totalOriginalPrice) {
        this.totalOriginalPrice = totalOriginalPrice;
    }

}
