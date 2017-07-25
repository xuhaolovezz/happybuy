package com.happybuy.domain;

import java.io.Serializable;

/**
 * 订单详情类，对应数据库中的表是orderdetail
 * Created by 徐豪 on 2017/6/20/020.
 */
public class OrderDetail implements Serializable {
    //订单主键
    private String id;
    //订单创建时间
    private String createTime;
    //订单的收货人
    private String name;
    //订单的收货地址
    private String address;
    //订单的收货电话
    private String phone;


    public OrderDetail() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
