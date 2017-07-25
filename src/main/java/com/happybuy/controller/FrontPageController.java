package com.happybuy.controller;

import com.happybuy.common.Iconst;
import com.happybuy.domain.Commodity;
import com.happybuy.domain.Kind;
import com.happybuy.domain.SmallKind;
import com.happybuy.entity.PageBean;
import com.happybuy.service.interfaces.CommodityService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.util.regex.Pattern;

/**
 * 负责前台页面的跳转
 * Created by 徐豪 on 2017/7/5/005.
 */
@Controller
@RequestMapping("/item")
public class FrontPageController implements Iconst{

    @Resource(name = "commodityService")
    private CommodityService commodityService;

    /**
     * 搜索结果页
     */
    @RequestMapping(value = "search/{currPage}",method = RequestMethod.GET)
    public String search(Model model, @PathVariable("currPage") String currPage, Commodity commodity,String condition, String sort){
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
        commodityPageBean = commodityService.queryCommoditiesWithConditionByPage(commodity,newCurrPage,sort,FRONTSEARCHSIZE);

        //将商品列表放到request域中
        model.addAttribute("commodityPageBean",commodityPageBean);
        //将查询的参数放到request域中
        model.addAttribute("condition",condition);
        //将排序的参数放到request域中
        model.addAttribute("sort",sort);

        return "front/search";
    }

    /**
     * 跳转到商品详情页面
     * @return
     */
    @RequestMapping("details/{commodityId}")
    public String details(@PathVariable String commodityId, Model model){
        Commodity commodity = commodityService.queryOneDetails(commodityId);
        model.addAttribute("commodity",commodity);
        return "front/details";
    }

}
