package com.happybuy.service;

import com.happybuy.domain.Order;
import com.happybuy.service.interfaces.OrderService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by 徐豪 on 2017/6/28/028.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TestOrderService {

    @Autowired
    private OrderService orderService;

    @Test
    public void test(){
        String id = "03f6900e-6c36-4b48-a8ea-c03297caa29c";
        System.out.println(System.currentTimeMillis());
        /*List<Order> orderList = orderService.queryOrderByUser(id);
        for(Order order : orderList){

        }*/
    }
}
