package com.happybuy.domain;

import java.io.Serializable;
import java.util.Objects;

/**
 * 用户的收货地址  对应数据库的表为address
 * Created by 徐豪 on 2017/6/20/020.
 */
public class Address implements Serializable {
    //主键
    private String id;
    //收货人名称
    private String name;
    //详细地址
    private String detailedAddress;
    //收货人电话
    private String phone;
    //是否是默认的收货地址  0代表不是，1代表是
    private Integer defaultAddress;

    //收货地址所属用户
    private User user;
    //收货地址的省份
    private Province province;
    //收货地址的城市
    private City city;

    public Address() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDetailedAddress() {
        return detailedAddress;
    }

    public void setDetailedAddress(String detailedAddress) {
        this.detailedAddress = detailedAddress;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getDefaultAddress() {
        return defaultAddress;
    }

    public void setDefaultAddress(Integer defaultAddress) {
        this.defaultAddress = defaultAddress;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Province getProvince() {
        return province;
    }

    public void setProvince(Province province) {
        this.province = province;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
