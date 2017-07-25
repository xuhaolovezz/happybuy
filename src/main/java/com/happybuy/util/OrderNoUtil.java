package com.happybuy.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * Created by 徐豪 on 2017/7/1/001.
 */
public class OrderNoUtil {

   /* public static  String getOrderNo(){
        String orderNo = "" ;
        UUID uuid = UUID.randomUUID();
        String trandNo = String.valueOf((Math.random() * 9 + 1) * 1000000);
        String sdf = new SimpleDateFormat("yyyyMMddHHMMSS").format(new Date());
        orderNo = uuid.toString().substring(0, 8);
        orderNo = orderNo + sdf ;
        return orderNo ;
    }*/
   public static void main(String[] args) {
       System.out.println(getOrderNo());
   }


    //生成19随机单号 纯数字
    public static  String getOrderNo(){
        String orderNo = "" ;
        String trandNo = String.valueOf((Math.random() * 9 + 1) * 1000000);
        String sdf = new SimpleDateFormat("yyyyMMddHHMMSS").format(new Date());
        orderNo = trandNo.toString().substring(0, 4);
        orderNo = orderNo + sdf ;
        return orderNo ;
    }
}