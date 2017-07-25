package com.happybuy.domain;

import java.io.Serializable;

/**
 * 每个订单中包含的商品、价格和数量
 * Created by 徐豪 on 2017/6/28/028.
 */
public class OrderCommodity implements Serializable{

    //主键
    private String id;

    //该商品的ID
    private String commodityId;
    //该商品的数量
    private Integer commodityNumber;
    //该商品的总价
    private Double totalPrice;
    //商品打折前的价格
    private Double totalOriginalPrice;
    //该商品的原单价
    private Double originalPrice;
    //该商品的现价
    private Double currentPrice;
    //商品的描述
    private String description;
    //商品的图片
    private String commPicture;

    private Order order;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCommodityId() {
        return commodityId;
    }

    public void setCommodityId(String commodityId) {
        this.commodityId = commodityId;
    }

    public Double getTotalOriginalPrice() {
        return totalOriginalPrice;
    }

    public void setTotalOriginalPrice(Double totalOriginalPrice) {
        this.totalOriginalPrice = totalOriginalPrice;
    }

    public Double getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(Double originalPrice) {
        this.originalPrice = originalPrice;
    }

    public Double getCurrentPrice() {
        return currentPrice;
    }

    public void setCurrentPrice(Double currentPrice) {
        this.currentPrice = currentPrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCommPicture() {
        return commPicture;
    }

    public void setCommPicture(String commPicture) {
        this.commPicture = commPicture;
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

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
}
