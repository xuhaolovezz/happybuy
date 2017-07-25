package com.happybuy.service.impl;

import com.happybuy.common.Iconst;
import com.happybuy.dao.ICommodityDao;
import com.happybuy.dao.IOrderCommodityDao;
import com.happybuy.dao.IOrderDao;
import com.happybuy.dao.IOrderDetailDao;
import com.happybuy.domain.*;
import com.happybuy.entity.OrderStateCount;
import com.happybuy.entity.PageBean;
import com.happybuy.service.interfaces.AddressService;
import com.happybuy.service.interfaces.OrderService;
import com.happybuy.service.interfaces.ShopCartService;
import com.happybuy.util.DateUtil;
import com.happybuy.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;

/**
 * 订单相关的业务层接口实现类
 * Created by 徐豪 on 2017/6/28/028.
 */
@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService , Iconst{

    @Autowired
    private IOrderDao orderDao;

    @Autowired
    private IOrderDetailDao orderDetailDao;

    @Autowired
    private ICommodityDao commodityDao;

    @Autowired
    private IOrderCommodityDao orderCommodityDao;

    @Resource(name = "addressService")
    private AddressService addressService;

    @Resource(name = "shopCartService")
    private ShopCartService shopCartService;

    /**
     * 根据用户或者订单状态查询订单
     * @param parameter  1. user_id 用户  2.order_id 订单id   2.state 订单状态
     * @return
     */
    @Override
    public List<Order> queryOrderByPage(Map<String,Object> parameter) {
        return orderDao.queryOrderByPage(parameter);
    }

    /**
     * 管理员分页查询订单
     * @param currPage 当前页
     * @param order 订单状态或者订单id
     * @return
     */
    @Override
    public PageBean<Order> queryOrderByPage(Integer currPage, Order order) {
        PageBean<Order> orderPageBean = new PageBean<Order>();
        //设置当前查询页数
        orderPageBean.setCurrPage(currPage);

        //设置每页显示的记录数
        orderPageBean.setPageSize(ORDERPAGESIZE);

        //设置总记录数
        Integer totalSize = orderDao.countAll(order);
        orderPageBean.setTotalSize(totalSize);
        //设置每页显示的记录数以及数据库分页查询需要的参数
        orderPageBean.count();

        //设置查询返回的List结果
        Map<String,Object> parameter = new HashMap<String,Object>();
        //参数名pageBean为固定写法，用来拦截器获取分页参数
        parameter.put("pageBean", orderPageBean);
        parameter.put("order", order);
        List<Order> orderList = orderDao.queryOrderByPage(parameter);
        orderPageBean.setList(orderList);

        orderPageBean.setTotalSize(totalSize);

        return orderPageBean;
    }

    /**
     * 根据订单ID查询订单详情
     * @param id
     * @return
     */
    @Override
    public Order queryOrderById(String id) {
        return orderDao.queryOrderById(id);
    }

    /**
     * 更新某个订单的状态
     * @param orderId
     */
    @Override
    public void updateStateByOrderId(String orderId, String state) {
        Order order = new Order();
        order.setId(orderId);
        order.setState(state);
        //查询数据库中该订单的状态
        Order dbOrder = orderDao.queryState(orderId);
        String orderState = dbOrder.getState();
        //根据数据库的状态判断即将更新的状态是否合法
        switch (state) {
            case "已取消":
                //必须是未付款的订单才能取消
                if (orderState.equals("未付款")) {
                    //查询到该订单的所有商品
                    List<OrderCommodity> orderCommodityList = orderCommodityDao.queryBatchByOrder(orderId);
                    //将该商品的库存恢复
                    for (OrderCommodity oc: orderCommodityList) {
                        //根据商品id查询到数据库中原有的库存
                        String commodityId = oc.getCommodityId();
                        Commodity commodity = commodityDao.queryTotalBuy(commodityId);
                        Integer dbStock = commodity.getStock();
                        //库存等于退款的商品数量加上原有的库存
                        dbStock += oc.getCommodityNumber();
                        commodity.setStock(dbStock);
                        //更新库存
                        commodityDao.updateTotalBuy(commodity);
                    }
                    orderDao.updateStateByOrderId(order);
                }
                break;
            case "已支付":
                //必须是未付款的订单才能变为已支付的状态
                if (orderState.equals("未付款")) {
                    //查询到该订单的所有商品
                    List<OrderCommodity> orderCommodityList = orderCommodityDao.queryBatchByOrder(orderId);
                    //更新该商品的销量
                    for (OrderCommodity oc: orderCommodityList){
                        //根据商品id查询到数据库中原有的销量
                        String commodityId = oc.getCommodityId();
                        Commodity commodity = commodityDao.queryTotalBuy(commodityId);
                        Integer dbTotalBuy = commodity.getTotalBuy();
                        //销量 + 1
                        dbTotalBuy += 1;
                        commodity.setTotalBuy(dbTotalBuy);
                        //更新销量
                        commodityDao.updateTotalBuy(commodity);
                    }
                    orderDao.updateStateByOrderId(order);
                }
                break;
            case "已发货":
                //必须是已支付的订单才能变为已发货的状态
                if (orderState.equals("已支付")) {
                    orderDao.updateStateByOrderId(order);
                }
                break;
            case "已收货":
                //必须是已发货的订单才能编程已收货的状态
                if (orderState.equals("已发货")) {
                    orderDao.updateStateByOrderId(order);
                }
                break;
            case "已完成":
                //必须是已评价的订单才能变为已完成的状态
                if (orderState.equals("已收货")) {
                    orderDao.updateStateByOrderId(order);
                }
                break;
        }

    }

    /**
     * 分页查询某个用户的所有订单
     * @param id
     * @param currPage
     * @return
     */
    @Override
    public PageBean<Order> queryOrderByUser(String id, Integer currPage, String state) {
        //给OrderMapper 的countAll设置userId参数和order state参数
        Order order = new Order();
        User user = new User();
        user.setId(id);
        order.setUser(user);
        order.setState(state);
        PageBean<Order> orderPageBean = new PageBean<Order>();
        //设置当前查询页数
        orderPageBean.setCurrPage(currPage);

        //设置每页显示的记录数
        orderPageBean.setPageSize(ORDERPAGESIZE);

        //设置总记录数
        Integer totalSize = orderDao.countAll(order);
        orderPageBean.setTotalSize(totalSize);
        //设置每页显示的记录数以及数据库分页查询需要的参数
        orderPageBean.count();

        //设置查询返回的List结果
        Map<String,Object> parameter = new HashMap<String,Object>();
        //参数名pageBean为固定写法，用来拦截器获取分页参数
        parameter.put("pageBean", orderPageBean);
        parameter.put("order", order);
        List<Order> orderList = orderDao.queryOrderByPage(parameter);
        orderPageBean.setList(orderList);

        orderPageBean.setTotalSize(totalSize);

        //查询订单对应的商品详情
        for(Order order1: orderList){
            //根据当前订单号查询到订单商品列表
            List<OrderCommodity> orderCommodityList = orderCommodityDao.queryDetailsByOrder(order1.getId());
            order1.setOrderCommodityList(orderCommodityList);
        }
        return orderPageBean;
    }

    /**
     * 统计某个用户的所有订单各种状态的数量
     * @param userId
     */
    @Override
    public OrderStateCount countOrderState(String userId) {
        //根据用户ID查询到该用户的订单
        List<Order> orderList = orderDao.countState(userId);
        /**
         * 分别对待付款，待发货，待收货、待评价的订单进行统计
         */
        Integer waitPay = 0;
        //待发货的订单数
        Integer waitSliverGoods = 0;
        //待收货的订单数
        Integer waitTakeGoods = 0;
        //待评价的订单数
        Integer waitComment = 0;
        for(Order order1: orderList){
            switch (order1.getState()){
                case "未付款":
                    waitPay++;
                    break;
                case "已支付":
                    waitSliverGoods++;
                    break;
                case "已发货":
                    waitTakeGoods++;
                    break;
                case "已收货":
                    waitComment++;
                    break;
            }
        }
        OrderStateCount orderStateCount = new OrderStateCount(waitPay,waitSliverGoods,waitTakeGoods,waitComment);
        return orderStateCount;
    }

    /**
     * 生成新订单
     * @param addressId 订单的收货地址
     * @param commodityIds 订单中的商品
     * @param userId 用户
     * @return 生成的订单id和订单创建时间
     */
    @Override
    public Map<String,Object> addOrder(String addressId, String commodityIds, String userId) {

        Order order = new Order();
        OrderDetail orderDetail = new OrderDetail();
        List<OrderCommodity> orderCommodityList = new ArrayList<OrderCommodity>();

        //查询到用户选择的收货地址
        Address address = addressService.findAddressById(addressId);

        //查询用户的购物车中选择的商品
        ShopCart shopCart = shopCartService.queryByUserAndCommodities(userId,commodityIds);

        //生成订单id
        String id = String.valueOf(System.currentTimeMillis());
        order.setId(id);
        //设置订单的状态为未付款
        order.setState("未付款");
        //设置订单所属用户
        User user = new User();
        user.setId(userId);
        order.setUser(user);
        //设置订单的总金额
        order.setTotalAmount(shopCart.getTotalAmount());
        //设置订单的原总金额
        order.setTotalOriginalAmount(shopCart.getTotalOriginalAmount());

        //设置订单详情的id
        orderDetail.setId(UUIDUtil.getUUID());
        //设置订单详情的收货人姓名
        orderDetail.setName(address.getName());
        //设置订单详情的收货人姓名
        orderDetail.setPhone(address.getPhone());
        //设置订单详情的收货地址
        String goodsAddress = address.getProvince().getName() + address.getCity().getName() + address.getDetailedAddress();
        orderDetail.setAddress(goodsAddress);
        //设置订单详情的订单创建时间
        orderDetail.setCreateTime(DateUtil.getCurrentDateTime());
        //将订单详情添加到订单里
        order.setOrderDetail(orderDetail);

        //设置订单中的商品详情
        List<ShopCartCommodity> shopCartCommodityList = shopCart.getShopCartCommodityList();

        //设置订单的名称
        String orderName = "";
        //设置订单的描述
        String orderDescription = "";

        for(int i = 0; i < shopCartCommodityList.size(); i++){

            OrderCommodity orderCommodity = new OrderCommodity();
            //设置所属订单
            orderCommodity.setOrder(order);
            //设置主键
            orderCommodity.setId(UUIDUtil.getUUID());
            //设置订单商品的id
            String commodityId = shopCartCommodityList.get(i).getCommodity().getId();
            orderCommodity.setCommodityId(commodityId);
            //设置订单商品的数量
            Integer commodityNumber = shopCartCommodityList.get(i).getCommodityNumber();
            orderCommodity.setCommodityNumber(commodityNumber);
            //设置订单商品的单价
            Double currentPrice = shopCartCommodityList.get(i).getCommodity().getCurrentPrice();
            orderCommodity.setCurrentPrice(currentPrice);
            //设置订单商品的原价
            Double originalPrice = shopCartCommodityList.get(i).getCommodity().getOriginalPrice();
            orderCommodity.setOriginalPrice(originalPrice);
            //设置订单商品的描述
            String description = shopCartCommodityList.get(i).getCommodity().getDescription();
            orderCommodity.setDescription(description);
            //设置订单商品的图片
            String commPicture = shopCartCommodityList.get(i).getCommodity().getPicture1();
            orderCommodity.setCommPicture(commPicture);
            //设置订单商品的总价
            Double totalPrice = shopCartCommodityList.get(i).getTotalPrice();
            orderCommodity.setTotalPrice(totalPrice);
            //设置订单商品的打折前的总价
            Double totalOriginalPrice = shopCartCommodityList.get(i).getTotalOriginalPrice();
            orderCommodity.setTotalOriginalPrice(totalOriginalPrice);

            //将商品的库存减少
            Commodity commodity = commodityDao.queryTotalBuy(commodityId);
            Integer dbStock = commodity.getStock();
            //库存为原本库存减去卖出去的商品数量
            dbStock -= commodityNumber;
            //更新库存
            commodity.setStock(dbStock);
            commodityDao.updateTotalBuy(commodity);

            //将订单商品添加到订单中
            orderCommodityList.add(orderCommodity);

            //设置订单名称
            orderName += shopCartCommodityList.get(i).getCommodity().getName();
            //设置订单商品描述
            orderDescription += shopCartCommodityList.get(i).getCommodity().getDescription();
        }

        //添加订单详情
        orderDetailDao.insertOne(orderDetail);
        //添加订单
        orderDao.insertOne(order);
        //添加多条订单商品记录
        orderCommodityDao.insertBatch(orderCommodityList);
        //删除购物车中的商品
        ShopCart shopCart1 = shopCartService.queryOne(userId);
        shopCartService.deleteCommodities(shopCart1.getId(),commodityIds);

        Map<String,Object> map = new HashMap<String,Object>();

        //设置截取20字的商品名称
        if(orderName.length() > 20){
            orderName = orderName.substring(0,10);
        }

        //设置截取20字的商品描述
        if(orderDescription.length() > 40){
            orderDescription = orderDescription.substring(0,40);
        }

        map.put("orderId",id);
        map.put("totalAmount",order.getTotalAmount());
        map.put("orderName",orderName);
        map.put("orderDesc", orderDescription);
        return map;
    }

    /**
     * 判断某个订单的状态是否是已收货
     * @param orderId
     * @return
     */
    @Override
    public String isTakeGoods(String orderId) {
        Order order = orderDao.queryState(orderId);
        if(order.getState().equals("已收货")){
            return "true";
        }
        return "false";
    }

    /**
     * 订单交易成功
     * @param out_trade_no 订单号
     * @param trade_no 支付宝号
     * @param total_amount 订单的交易金额
     */
    @Override
    public void orderSuccess(String out_trade_no, String trade_no, String total_amount) {
        //查询订单的交易金额是否是数据库中存放的订单金额
        Order dbOrder = orderDao.queryTotalAmount(out_trade_no);
        String dbAmount = String.valueOf(dbOrder.getTotalAmount());
        if(total_amount.substring(0,total_amount.lastIndexOf(".")).equals(dbAmount.substring(0,dbAmount.lastIndexOf(".")))){
            //更新订单的状态为已支付
            updateStateByOrderId(out_trade_no,"已支付");
            //将支付宝交易号保存到数据库中
            Order order = new Order();
            order.setId(out_trade_no);
            order.setTradeNo(trade_no);
            orderDao.orderPaySuccess(order);
        }
    }

    @Override
    public Map<String, Object> queryTotalAmount(String orderId) {
        Map<String, Object> orderMap = new HashMap<String, Object>();
        //查询到订单的所有商品的商品描述和订单的总金额，用来传递给支付宝付款
        Order order = orderDao.queryTotalAmount(orderId);

        //订单的名称
        String orderName = "";
        //订单的商品描述
        String orderDesc = "";

        List<OrderCommodity> orderCommodityList = order.getOrderCommodityList();
        for(OrderCommodity oc: orderCommodityList){
            String desc = oc.getDescription();
            //取商品描述的前十个字
            if(desc.length() > 5){
                orderName += desc.substring(0,5);
            } else {
                orderName += desc;
            }
            orderDesc += desc;
        }

        //设置截取20字的商品描述
        if(orderDesc.length() > 20){
            orderDesc = orderDesc.substring(0,20);
        }

        //将订单总金额放到map里面
        Double totalAmount = order.getTotalAmount();
        orderMap.put("orderId", orderId);
        orderMap.put("totalAmount", totalAmount);
        orderMap.put("orderName", orderName);
        orderMap.put("orderDesc", orderDesc);

        return orderMap;
    }
}
