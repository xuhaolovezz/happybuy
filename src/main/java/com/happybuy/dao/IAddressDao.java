package com.happybuy.dao;

import com.happybuy.domain.Address;

import java.util.List;

/**
 * Address持久层接口，对应的Mapper为AddressMapper.xml
 * Created by 徐豪 on 2017/6/28/028.
 */
public interface IAddressDao {

    /**
     * 查询某个用户的所有收货地址
     */
    List<Address> queryAddressByUser(String id);

    /**
     * 将某个收货地址设置为默认收货地址
     * 先将原来的默认地址设为0
     * 再将要设置的地址设为1
     */
    void setNoDefault(String userId);
    void setDefault(String addressId);

    /**
     * 查询一条收货地址
     * @param addressId
     * @return
     */
    Address queryOne(String addressId);

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
}
