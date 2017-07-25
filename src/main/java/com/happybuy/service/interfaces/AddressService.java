package com.happybuy.service.interfaces;

import com.happybuy.domain.Address;

import java.util.List;

/**
 * Address对应的业务层接口
 * Created by 徐豪 on 2017/6/28/028.
 */
public interface AddressService {

    /**
     * 查询某个用户的所有收货地址
     * @param id
     * @return
     */
    List<Address> queryAddressByUser(String id);

    /**
     * 给某个用户添加一个收货地址
     */
    void insertOne(Address address);

    /**
     * 删除某个收货地址
     */
    void deleteOne(String id);

    /**
     * 修改收货地址
     * @param address
     */
    void updateAddress(Address address);

    /**
     * 设置某个用户的某个收货地址为默认收货地址
     * @param userId
     * @param addressId
     */
    void setDefaultAddress(String userId, String addressId);

    /**
     * 根据id查询一条收货地址
     * @param addressId
     * @return
     */
    Address findAddressById(String addressId);
}
