package com.happybuy.controller;

import com.happybuy.annotation.SystemControllerLog;
import com.happybuy.domain.Address;
import com.happybuy.domain.City;
import com.happybuy.domain.Province;
import com.happybuy.domain.User;
import com.happybuy.service.interfaces.AddressService;
import com.happybuy.service.interfaces.CityService;
import com.happybuy.service.interfaces.ProvinceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 用户收货地址相关的控制层
 * Created by 徐豪 on 2017/7/2/002.
 */
@Controller
@RequestMapping("address")
public class AddressController {

    @Resource(name = "addressService")
    private AddressService addressService;

    @Resource(name = "provinceService")
    private ProvinceService provinceService;

    @Resource(name = "cityService")
    private CityService cityService;

    /**
     * 设置默认收货地址
     * @param addressId
     */
    @RequestMapping(value = "setDefaultAddress",method = RequestMethod.PUT)
    @ResponseBody
    @SystemControllerLog(description = "设置默认收货地址")
    public String setDefaultAddress(String addressId, HttpSession session){
        String userId = (String) session.getAttribute("id");
        addressService.setDefaultAddress(userId,addressId);
        return "success";
    }

    /**
     * 查询所有省份并且返回JSON字符串
     * @return
     */
    @RequestMapping("findAllProvince")
    @ResponseBody
    public List<Province> findAllProvince(){
        return provinceService.queryAll();
    }

    /**
     * 查询某个省份下的所有城市，返回JSON
     * @param proId
     * @return
     */
    @RequestMapping("findCityByProvince")
    @ResponseBody
    public List<City> findCityByProvince(String proId){
        return cityService.queryCitiesByProvince(proId);
    }

    /**
     * 添加收货地址
     */
    @RequestMapping(value = "addAddress",method = RequestMethod.POST)
    @ResponseBody
    public String addAddress(Address address, HttpSession session){
        String userId = (String) session.getAttribute("id");
        User user = new User();
        user.setId(userId);
        address.setUser(user);
        addressService.insertOne(address);
        return "success";
    }

    /**
     * 删除收货地址
     */
    @RequestMapping(value = "{addressId}",method = RequestMethod.DELETE)
    @ResponseBody
    public String deleteAddress(@PathVariable String addressId){
        addressService.deleteOne(addressId);
        return "success";
    }

    /**
     * 根据id查询一条收货地址
     */
    @RequestMapping("findAddressById")
    @ResponseBody
    public Address findAddressById(String addressId){
        Address address = addressService.findAddressById(addressId);
        return address;
    }

    /**
     * 修改收货地址
     */
    @RequestMapping(method = RequestMethod.PUT)
    @ResponseBody
    public String update(Address address){
        addressService.updateAddress(address);
        return "success";
    }

}
