package com.happybuy.controller;

import com.happybuy.annotation.SystemLoginLog;
import com.happybuy.common.Iconst;
import com.happybuy.domain.*;
import com.happybuy.entity.ControllerLog;
import com.happybuy.entity.LoginLog;
import com.happybuy.entity.PageBean;
import com.happybuy.service.interfaces.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.regex.Pattern;

/**
 * 管理员的控制层类
 * Created by 徐豪 on 2017/6/22/022.
 */
@Controller
@RequestMapping("/admin")
public class AdminController implements Iconst{

    @Resource(name = "commodityService")
    private CommodityService commodityService;

    @Resource(name = "kindService")
    private KindService kindService;

    @Resource(name = "logService")
    private LogService logService;

    @Resource(name = "userService")
    private UserService userService;

    @Resource(name = "orderService")
    private OrderService orderService;

    /**
     * 跳转到管理员登录界面
     */
    @RequestMapping("login")
    public String login(){

        return "front/login";
    }


    /**
     * 验证管理员登录
     */
    @RequestMapping("/validateLogin")
    @ResponseBody
    @SystemLoginLog
    public String validateLogin(User user, HttpServletRequest request){
        String msg = "";
        user = userService.login(user);
        //如果账号密码错误或者权限不够，返回"失败"
        if(user == null || user.getRoot() == 0){
            msg = "failure";
        } else if(user.getState() == 0){
            msg = "noActive";
        } else {
            msg = "login_admin";
            request.getSession().setAttribute("id",user.getId());
            request.getSession().setAttribute("username",user.getUsername());
            request.getSession().setAttribute("root",user.getRoot());
        }
        return msg;
    }

    /**
     * 管理员注销
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
     * 跳转到admin的商品管理界面
     * @return
     */
    @RequestMapping(value = "commodityList/{currPage}",method = RequestMethod.GET)
    public String commodity(Model model, @PathVariable("currPage") String currPage, Commodity commodity,String condition, String sort){
        //设置初始化查询条件为空
        PageBean<Commodity> commodityPageBean = new PageBean<Commodity>();
        //设置查询起始页
        Pattern pattern = Pattern.compile("[0-9]{1,9}");
        Integer newCurrPage ;
        //检验前台传过来的分页是否合法
        if(currPage == null || !pattern.matcher(currPage).matches()){
            newCurrPage = 1;
        } else {
            newCurrPage = Integer.parseInt(currPage);
        }
        if(condition != null){
            if(condition.equals("")){
                condition = null;
            }
        }

        //设置分页查询条件
        //模糊查询的条件为商品名称、描述、分类
        commodity.setDescription(condition);
        commodity.setName(condition);

        Kind kind = new Kind();
        kind.setName(condition);
        //设置查询的条件为种类的名字
        commodity.setKind(kind);

        SmallKind smallKind = new SmallKind();
        smallKind.setName(condition);
        //设置查询的条件为小种类的名字
        commodity.setSmallKind(smallKind);

        //设置查询出来的带分页信息的商品列表
        commodityPageBean = commodityService.queryCommoditiesWithConditionByPage(commodity,newCurrPage,sort,COMMODITYPAGESIZE);

        //将商品列表放到request域中
        model.addAttribute("commodityPageBean",commodityPageBean);
        //将查询的参数放到request域中
        model.addAttribute("condition",condition);
        //将排序的参数放到request域中
        model.addAttribute("sort",sort);

        return "back/admin/commodityList";
    }

    /**
     * 跳转到编辑商品界面
     */
    @RequestMapping(value = "commodityDetail/{id}",method = RequestMethod.GET)
    public String commodityDetail(@PathVariable("id") String id, Model model){
        //根据id查询到这条商品信息
        Commodity commodity = commodityService.queryOne(id);
        //往request域中放入commodity对象
        model.addAttribute("commodity",commodity);
        return "back/admin/commodityDetail";
    }

    /**
     * 跳转到品类管理界面
     */
    @RequestMapping(value = "kindList/{currPage}",method = RequestMethod.GET)
    public String kindList(@PathVariable Integer currPage, Model model){
        //根据当前页码分页查询商品种类
        PageBean<Kind> kindPageBean = kindService.queryKindsByPage(currPage);
        model.addAttribute("kindPageBean",kindPageBean);

        return "back/admin/kindList";
    }

    /**
     * 跳转到订单管理界面
     */
    @RequestMapping(value = "orderList/{currPage}",method = RequestMethod.GET)
    public String orderList(@PathVariable Integer currPage, String condition, String state, Model model){
        Order order = new Order();
        order.setId(condition);
        order.setState(state);
        PageBean<Order> orderPageBean = orderService.queryOrderByPage(currPage,order);
        model.addAttribute("orderPageBean",orderPageBean);
        model.addAttribute("condition",condition);
        model.addAttribute("state",state);
        return "back/admin/orderList";
    }

    /**
     * 跳转到订单详情界面
     */
    @RequestMapping(value = "orderDetail/{id}",method = RequestMethod.GET)
    public String orderDetail(@PathVariable("id") String id, Model model){
        //根据id查询到这条订单
        Order order = orderService.queryOrderById(id);
        model.addAttribute("order",order);
        return "back/admin/orderDetail";
    }

    /**
     * 跳转到日志管理界面
     */
    @RequestMapping("logList/{currPage}")
    public String logList(@PathVariable Integer currPage, Model model){
        PageBean<ControllerLog> controllerLogPageBean = logService.queryControllerLogByPage(currPage);
        model.addAttribute("controllerLogPageBean",controllerLogPageBean);
        return "back/admin/logList";
    }

    /**
     * 跳转到登录日志管理界面
     */
    @RequestMapping("loginLogList/{currPage}")
    public String loginLogList(@PathVariable Integer currPage, Model model){
        PageBean<LoginLog> loginLogPageBean = logService.queryLoginLogByPage(currPage);
        model.addAttribute("loginLogPageBean",loginLogPageBean);
        return "back/admin/loginLogList";
    }

    /**
     * 跳转到修改密码界面
     */
    @RequestMapping("editPass")
    public String editPass(){

        return "back/admin/editPass";
    }
}
