<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.alipay.api.AlipayClient" %>
<%@ page import="com.alipay.api.DefaultAlipayClient" %>
<%@ page import="com.happybuy.common.AlipayConfig" %>
<%@ page import="com.alipay.api.request.AlipayTradeWapPayRequest" %>
<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%@ page import="com.alipay.api.request.AlipayTradePagePayRequest" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<html>
<head>
    <title>付款</title>
    <%
        //初始化工厂
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.serverURL, AlipayConfig.appId, AlipayConfig.privateKey, "json", AlipayConfig.charset, AlipayConfig.publicKey, AlipayConfig.signType);
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.returnURL);
        alipayRequest.setNotifyUrl(AlipayConfig.notifyUrl);
        JSONObject json = new JSONObject();
        //商品订单号
        String out_trade_no = request.getParameter("orderId");
        //商品总金额
        String total_amount = request.getParameter("totalAmount");
        //订单名称
        String subject = new String(request.getParameter("orderName").getBytes("ISO-8859-1"),"UTF-8");
        //订单描述
        String body = new String(request.getParameter("orderDesc").getBytes("ISO-8859-1"),"UTF-8");

        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"total_amount\":\""+ total_amount +"\","
                + "\"subject\":\""+ subject +"\","
                + "\"body\":\""+ body +"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        String form = alipayClient.pageExecute(alipayRequest).getBody();
        out.println(form);
    %>
</head>
<body>
</body>
</html>
