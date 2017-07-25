package com.happybuy.service.impl;

import com.happybuy.dao.IAddressDao;
import com.happybuy.domain.Address;
import com.happybuy.service.interfaces.AddressService;
import com.happybuy.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Address对应的业务层接口实现类
 * Created by 徐豪 on 2017/6/28/028.
 */
@Service("addressService")
@Transactional
public class AddressServiceImpl implements AddressService {

    @Autowired
    private IAddressDao addressDao;

    /**
     * 查询某个用户的所有收货地址
     * @param id
     * @return
     */
    @Override
    public List<Address> queryAddressByUser(String id) {
        return addressDao.queryAddressByUser(id);
    }



    /**
     * 给某个用户添加一个收货地址
     */
    @Override
    public void insertOne(Address address) {
        String addressId = UUIDUtil.getUUID();
        List<Address> addressList = queryAddressByUser(address.getUser().getId());
        //如果该用户没有收货地址，则新添加的为默认地址
        if( addressList.size() == 0 || addressList.get(0).getId() == null){
            address.setDefaultAddress(1);
        } else {
            //设置非默认地址
            address.setDefaultAddress(0);
        }
        address.setId(addressId);
        addressDao.insertOne(address);
    }

    /**
     * 删除某个收货地址
     * @param id
     */
    @Override
    public void deleteOne(String id) {
        addressDao.deleteOne(id);
    }

    /**
     * 修改收货地址
     * @param address
     */
    @Override
    public void updateAddress(Address address) {
        addressDao.updateAddress(address);
    }

    /**
     * 设置某个用户的某个收货地址为默认收货地址
     * @param userId
     * @param addressId
     */
    @Override
    public void setDefaultAddress(String userId, String addressId) {
        //将该用户的原来的收货地址设置为非默认收货地址
        addressDao.setNoDefault(userId);
        //将要设置的收货地址设置为默认收货地址
        addressDao.setDefault(addressId);
    }

    /**
     * 根据id查询一条收货地址
     * @param addressId
     * @return
     */
    @Override
    public Address findAddressById(String addressId) {
        return addressDao.queryOne(addressId);
    }
}
