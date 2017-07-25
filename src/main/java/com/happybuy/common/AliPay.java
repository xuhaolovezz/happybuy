package com.happybuy.common;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradeWapPayRequest;

/**
 * 负责支付的类
 * Created by 徐豪 on 2017/7/4/004.
 */
public class AliPay {

    public void test(){
       /* AlipayClient alipayClient = AliPayFactory.getAlipayClient();
        AlipayTradeWapPayRequest alipayRequest = new AlipayTradeWapPayRequest();
        alipayRequest.setReturnUrl("");
        alipayRequest.setNotifyUrl("");
        JSONObject json = new JSONObject();
        json.put("out_trade_no",System.currentTimeMillis());
        json.put("total_amount","88.88");
        json.put("subject","Iphone7 64G");
        json.put("seller_id","2016080600182273");
        json.put("product_code","QUICK_WAP_PAY");
        alipayRequest.setBizContent(json.toString());

        try {
            String form = alipayClient.pageExecute(alipayRequest).getBody();

        } catch (AlipayApiException e) {
            e.printStackTrace();
        }*/
    }

}
