package com.happybuy.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.happybuy.annotation.SystemControllerLog;
import com.happybuy.common.AlipayConfig;
import com.happybuy.domain.Address;
import com.happybuy.domain.ShopCart;
import com.happybuy.service.interfaces.AddressService;
import com.happybuy.service.interfaces.OrderService;
import com.happybuy.service.interfaces.ShopCartService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * 订单控制层
 * Created by 徐豪 on 2017/6/28/028.
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    @Resource(name = "orderService")
    private OrderService orderService;

    @Resource(name = "shopCartService")
    private ShopCartService shopCartService;

    @Resource(name = "addressService")
    private AddressService addressService;

   /* @RequestMapping("1")
    @ResponseBody
    public List<Order> queryOrderByUser(String id){
        //List<Order> orderList = orderService.queryOrderByUser(id);
        return orderList;
    }*/

   //更新某个订单的状态
   @RequestMapping(method = RequestMethod.PUT)
   @ResponseBody
   @SystemControllerLog(description = "更新订单状态")
   public String updateState(String orderId, String state){
       orderService.updateStateByOrderId(orderId,state);
       return "success";
   }

    /**
     * 判断某个订单的状态是否是已收货
     */
    @RequestMapping("isTakeGoods/{orderId}")
    @ResponseBody
    public String isTakeGoods(@PathVariable String orderId){
        String msg = orderService.isTakeGoods(orderId);
        return msg;
    }


    /**
     * 跳转到订单结算页
     */
    @RequestMapping("orderConfirmation")
    public String orderConfirmation(String shopCartId, String commodityIds, HttpSession session, Model model){
        //查询要生成订单的商品
        ShopCart shopCart = shopCartService.queryByIDAndCommodityIds(shopCartId,commodityIds);

        //查询到该用户的收货地址
        String userId = (String) session.getAttribute("id");
        List<Address> addressList = addressService.queryAddressByUser(userId);

        model.addAttribute("shopCart",shopCart);
        model.addAttribute("addressList",addressList);
        return "back/user/orderConfirmation";
    }

    /**
     * 生成订单
     */
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public String newOrder(String addressId, String commodityIds, HttpSession session, HttpServletRequest request){
        //找到当前用户
        String userId = (String) session.getAttribute("id");
        Map<String,Object> map = new HashMap<String,Object>();
        //获得订单的id和订单的创建时间
        map = orderService.addOrder(addressId,commodityIds,userId);
        String order = map.get("orderId") + "," + map.get("orderDesc") + "," +
                map.get("totalAmount") + "," + map.get("orderName");

        return order;
    }

    /**
     * 跳转到订单付款页面
     */
    @RequestMapping("orderPay")
    public String orderPay(String orderId, String orderDesc, Double totalAmount,String orderName, Model model){

        //订单id、商品描述、总金额、名称
        model.addAttribute("orderId",orderId);
        model.addAttribute("orderDesc",orderDesc);
        model.addAttribute("totalAmount",totalAmount);
        model.addAttribute("orderName",orderName);
        return "back/user/orderPay";
    }

    /**
     * 根据订单id查询订单的总金额和订单的商品名称
     */
    @RequestMapping(value = "toOrderPay/{orderId}",method = RequestMethod.GET)
    @ResponseBody
    public String toOrderPay(@PathVariable String orderId){
        Map<String,Object> orderMap = orderService.queryTotalAmount(orderId);

        /*Double totalAmount = (Double) orderMap.get("totalAmount");
        String orderName = (String) orderMap.get("orderName");
        String orderDesc = (String) orderMap.get("orderDesc");*/

        //将订单一些信息重定向到支付宝付款页面
        /*redirectAttributes.addAttribute("orderId",orderId);
        redirectAttributes.addAttribute("totalAmount",totalAmount);
        redirectAttributes.addAttribute("orderName",orderName);
        redirectAttributes.addAttribute("orderDesc",orderDesc);*/
        String result = orderMap.get("orderId") + "," + orderMap.get("orderDesc") + "," +
                orderMap.get("totalAmount") + "," + orderMap.get("orderName");
        return result;
    }

    /**
     * 跳转到支付宝付款页面
     */
    @RequestMapping("aliPay")
    public String aliPay(HttpServletRequest request) throws UnsupportedEncodingException {
        String subject = new String(request.getParameter("orderName").getBytes("ISO-8859-1"),"UTF-8");
        //订单描述
        String body = new String(request.getParameter("orderDesc").getBytes("ISO-8859-1"),"UTF-8");
        return "back/order/aliPay";
    }

    /**
     * 判断订单的状态
     */
    @RequestMapping("orderPayState")
    public String orderPayState(HttpServletRequest request, Model model) throws AlipayApiException, UnsupportedEncodingException {
        String orderState = "";
        Map<String,String> params = new HashMap<String,String>();
        Map<String,String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }

        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.publicKey, AlipayConfig.charset, AlipayConfig.signType); //调用SDK验证签名

        //如果支付成功
        if(signVerified) {
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

            //付款金额
            String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");

            //交易成功，设置支付宝交易号和订单状态
            orderService.orderSuccess(out_trade_no,trade_no,total_amount);
            orderState = "success";
        }else {
            orderState = "failure";
        }
        //将支付的结果放的model里
        model.addAttribute("orderState",orderState);
        return "back/order/orderPayState";
    }

}
