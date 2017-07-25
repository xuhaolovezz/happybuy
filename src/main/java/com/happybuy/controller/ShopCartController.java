package com.happybuy.controller;

import com.happybuy.annotation.SystemControllerLog;
import com.happybuy.domain.ShopCart;
import com.happybuy.service.interfaces.ShopCartCommodityService;
import com.happybuy.service.interfaces.ShopCartService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * 购物车相关的控制层类
 * Created by 徐豪 on 2017/7/1/001.
 */
@Controller
@RequestMapping("cart")
public class ShopCartController {

    @Resource(name = "shopCartService")
    private ShopCartService shopCartService;

    @Resource(name = "shopCartCommodityService")
    private ShopCartCommodityService shopCartCommodityService;

    @RequestMapping(value = "updateCommodityNumber",method = RequestMethod.PUT)
    @ResponseBody
    @SystemControllerLog(description = "更改购物车商品的数量")
    public String addCommodityNumber(String shopCartId, String commodityId, Integer commodityNumber){
        String msg = shopCartCommodityService.updateCommodityNumber(shopCartId, commodityId, commodityNumber);
        return msg;
    }

    /**
     * 从某个用户的购物车中删除商品
     */
    @RequestMapping(value = "deleteCommodity",method = RequestMethod.PUT)
    @ResponseBody
    @SystemControllerLog(description = "从购物车中删除商品")
    public String deleteCommodity(String shopCartId, String commodityId){
        shopCartService.deleteCommodity(shopCartId,commodityId);
        return "success";
    }

    /**
     * 从某个用户的购物车中删除多个商品
     */
    @RequestMapping(value = "deleteCommodities",method = RequestMethod.PUT)
    @ResponseBody
    @SystemControllerLog(description = "从购物车中删除商品")
    public String deleteCommodities(String shopCartId, String commodityIds){
        shopCartService.deleteCommodities(shopCartId,commodityIds);
        return "success";
    }

    /**
     * 添加商品进购物车
     */
    @RequestMapping(value = "addCommodity",method = RequestMethod.PUT)
    @ResponseBody
    @SystemControllerLog(description = "添加商品进购物车")
    public String addCommodity(String commodityId, HttpSession session){
        String userId = (String) session.getAttribute("id");
        String msg = shopCartCommodityService.addCommodity(commodityId,userId);
        return msg;
    }

    /**
     * 添加一定商品数量进购物车
     */
    @RequestMapping(value = "addCommodityAndNumber",method = RequestMethod.PUT)
    @ResponseBody
    @SystemControllerLog(description = "添加商品进购物车")
    public String addCommodityAndNumber(String commodityId, Integer commodityNumber,HttpSession session){
        String userId = (String) session.getAttribute("id");
        String msg = shopCartCommodityService.addCommodityAndNumber(commodityId, commodityNumber, userId);
        return msg;
    }

    /**
     * 查询某个用户的购物车，返回JSON数据
     */
    @RequestMapping(value = "queryShopCart",method = RequestMethod.GET)
    @ResponseBody
    public ShopCart queryShopCart(HttpSession session){
        String userId = (String) session.getAttribute("id");
        //查询到该用户的购物车
        ShopCart shopCart = shopCartService.queryShopCartByUser(userId);

        return shopCart;
    }

    /**
     * 根据用户id删除某个购物车中的商品
     */
    @RequestMapping(value = "deleteCommodityByUser",method = RequestMethod.PUT)
    @ResponseBody
    public String deleteCommodityByUser(HttpSession session,String commodityId){
        String userId = (String) session.getAttribute("id");
        shopCartService.deleteCommodityByUser(userId,commodityId);

        return "success";
    }
}
