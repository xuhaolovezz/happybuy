package com.happybuy.controller;

import com.happybuy.annotation.SystemControllerLog;
import com.happybuy.common.Iconst;
import com.happybuy.domain.Commodity;
import com.happybuy.service.interfaces.CommodityService;
import com.happybuy.util.CommodityPictureUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * 商品相关的控制层
 * Created by 徐豪 on 2017/6/22/022.
 */
@Controller
@RequestMapping("/commodity")
public class CommodityController implements Iconst{

    @Resource(name = "commodityService")
    private CommodityService commodityService;

    /**
     * 查询某个商品的信息
     * @param id
     * @return
     */
    @RequestMapping(value = "{id}",method = RequestMethod.GET)
    @ResponseBody
    public Commodity getCommodity(@PathVariable("id") String id){
        Commodity commodity = commodityService.queryOne(id);
        return commodity;
    }

    /**
     * 添加商品
     */
    @RequestMapping(method = RequestMethod.POST)
    @SystemControllerLog(description = "添加商品")
    public String add(Commodity commodity, MultipartFile[] pictures, MultipartFile[] descPictures) throws IOException {
        //将传进来的4张商品图片以及4张描述图片设置到commodity中
        commodity = CommodityPictureUtil.setCommodityPicturesAndDescPictures(commodity,pictures,descPictures,PATH);
        commodityService.addCommodity(commodity);
        return "redirect:/admin/commodityList/1";
    }

    /**
     * 删除商品
     */
    @RequestMapping(value = "{id}",method = RequestMethod.DELETE)
    @ResponseBody
    @SystemControllerLog(description = "删除商品")
    public String delete(@PathVariable("id") String id){
        commodityService.deleteOne(id);
        return "success";
    }

    /**
     * 更新商品
     */
    @RequestMapping(value = "update")
    @SystemControllerLog(description = "更新商品")
    public String update(Commodity commodity,MultipartFile[] pictures, MultipartFile[] descPictures){
        commodityService.updateCommodity(commodity, pictures, descPictures);
        return "redirect:/admin/commodityDetail/"+commodity.getId();
    }

    /**
     * 改变商品的状态
     */
    @RequestMapping(value = "changeState",method = RequestMethod.PUT)
    @ResponseBody
    @SystemControllerLog(description = "改变商品的销售状态")
    public String changeState(String id){
        commodityService.changeState(id);
        return "success";
    }
}
