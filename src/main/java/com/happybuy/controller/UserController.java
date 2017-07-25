package com.happybuy.controller;

import com.happybuy.annotation.SystemControllerLog;
import com.happybuy.annotation.SystemLoginLog;
import com.happybuy.domain.*;
import com.happybuy.entity.OrderStateCount;
import com.happybuy.entity.PageBean;
import com.happybuy.service.interfaces.*;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 用户控制层
 * Created by 徐豪 on 2017/6/21/021.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Resource(name = "userService")
    private UserService userService;

    @Resource(name = "orderService")
    private OrderService orderService;

    @Resource(name = "shopCartService")
    private ShopCartService shopCartService;

    @Resource(name = "collectingService")
    private CollectingService collectingService;

    @Resource(name = "addressService")
    private AddressService addressService;

    /**
     * 注册用户
     * @param user
     * @return
     */
    @RequestMapping("/regUser")
    @ResponseBody
    public String regUser(User user){
        userService.saveUser(user);
        String state = "success";
        return state;
    }

    /**
     * 验证用户名是否存在
     */
    @RequestMapping("existUserName")
    @ResponseBody
    public String existUserName(String username){
        User user = userService.selectByUserName(username);
        if(user != null){
            return "false";
        }
        return "true";
    }

    /**
     * 激活用户
     */
    @RequestMapping("/userActivate")
    public String userActivate(User user, Model model){
        if(userService.activeUser(user)){
            model.addAttribute("activeState","激活成功！您现在可以去登录了");
        } else {
            model.addAttribute("activeState","激活失败，请检查您的用户是否已经激活或者重新注册！");
        }
        return "front/registerState";
    }


    /**
     * 用户登录
     */
    @RequestMapping("/userLogin")
    @ResponseBody
    @SystemLoginLog
    public String userLogin(User user, HttpServletRequest request){
        String msg = "";
        user = userService.login(user);
        if(user == null){
            msg = "failure";
        } else if(user.getState() == 0){
            msg = "noActive";
        } else {
            msg = "login_user";
            //将用户信息放到Session中
            request.getSession().setAttribute("id",user.getId());
            request.getSession().setAttribute("username",user.getUsername());
            request.getSession().setAttribute("root",user.getRoot());
        }
        return msg;
    }

    /**
     * 用户注销
     */
    @RequestMapping("logout")
    @ResponseBody
    public String logout(HttpServletRequest request){
        if(request.getSession().getAttribute("id") != null){
            request.getSession().removeAttribute("id");
        }
        if(request.getSession().getAttribute("username") != null){
            request.getSession().removeAttribute("username");
        }
        if(request.getSession().getAttribute("root") != null){
            request.getSession().removeAttribute("root");
        }
        return "success";
    }

    /**
     * 发送邮箱验证码
     */
    @RequestMapping("sendEmailCode")
    @ResponseBody
    @SystemControllerLog(description = "发送邮箱验证码")
    public String sendEmailCode(String id){
        userService.sendEmailCode(id);
        return null;
    }

    /**
     * 验证邮箱验证码
     */
    @RequestMapping("validateCode")
    @ResponseBody
    @SystemControllerLog(description = "验证邮箱验证码")
    public String validateCode(String codes, String id){
        String result =  userService.validateCode(codes,id);
        return result;
    }

    /**
     * 修改用户密码
     */
    @RequestMapping("rePass")
    @ResponseBody
    @SystemControllerLog(description = "修改密码")
    public String rePass(User user, HttpSession session){
        userService.rePass(user);
        session.removeAttribute("id");
        session.removeAttribute("username");
        session.removeAttribute("root");
        return null;
    }

    /**
     * 跳转到用户个人资料页面
     */
    @RequestMapping("/modify")
    public String modify(HttpServletRequest request,Model model){
        //根据session中的id查询user信息
        String id = String.valueOf(request.getSession().getAttribute("id"));
        User user = new User();
        //设置查询的条件为id
        user.setId(id);
        //调用userService的条件查询
        user = userService.findUser(user);
        //将查询的结果放到request中
        model.addAttribute("user",user);
        return "back/user/modify";
    }

    /**
     * 修改用户信息
     */
    @RequestMapping(value = "update",method = RequestMethod.PUT)
    @ResponseBody
    public String update(User user, HttpSession session){
        String userId = (String) session.getAttribute("id");
        user.setId(userId);
        //保存用户信息
        userService.updateUser(user);
        return "success";
    }

    /**
     * 跳转到个人订单界面
     */
    @RequestMapping("order/{currPage}")
    public String order(@PathVariable Integer currPage,String state, HttpServletRequest request, Model model){
        //根据session中的id查询user信息
        String id = String.valueOf(request.getSession().getAttribute("id"));
        //分页查询用户订单
        PageBean<Order> orderPageBean = orderService.queryOrderByUser(id, currPage, state);
        //统计用户订单各种状态的数量
        OrderStateCount orderStateCount = orderService.countOrderState(id);
        model.addAttribute("orderPageBean",orderPageBean);
        model.addAttribute("orderStateCount",orderStateCount);
        model.addAttribute("state",state);
        return "back/user/order";
    }

    /**
     * 跳转到订单详情页面
     */
    @RequestMapping("order/detail/{orderId}")
    public String orderDetail(@PathVariable String orderId, Model model){
        //根据id查询到这条订单
        Order order = orderService.queryOrderById(orderId);
        model.addAttribute("order",order);
        return "back/user/orderDetail";
    }

    /**
     * 跳转到我的购物车页面
     */
    @RequestMapping("cart")
    public String cart(HttpServletRequest request, Model model){
        String userId = (String) request.getSession().getAttribute("id");
        ShopCart shopCart = shopCartService.queryShopCartByUser(userId);
        model.addAttribute("shopCart",shopCart);
        return "back/user/cart";
    }

    /**
     * 跳转到收藏界面
     */
    @RequestMapping("myCollecting/{currPage}")
    public String myCollecting(HttpSession session,@PathVariable Integer currPage, Model model){
        String userId = (String) session.getAttribute("id");
        PageBean<Collecting> collectingPageBean = collectingService.queryCollectingByPage(userId,currPage);
        model.addAttribute("collectingPageBean",collectingPageBean);
        return "back/user/myCollecting";
    }

    /**
     * 跳转到修改密码界面
     */
    @RequestMapping("editPass")
    public String editPass(){

        return "back/user/editPass";
    }

    /**
     * 跳转到收货地址界面
     */
    @RequestMapping("myAddress")
    public String myAddress(HttpSession session, Model model){
        String userId = (String) session.getAttribute("id");
        List<Address> addressList = addressService.queryAddressByUser(userId);
        model.addAttribute("addressList",addressList);
        return "back/user/myAddress";
    }


}
