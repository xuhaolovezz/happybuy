package com.happybuy.controller;

import com.happybuy.annotation.SystemControllerLog;
import com.happybuy.service.interfaces.CollectingService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * 用户收藏相关的操作
 * Created by 徐豪 on 2017/7/3/003.
 */
@Controller
@RequestMapping("/collecting")
public class CollectingController {

    @Resource(name = "collectingService")
    private CollectingService collectingService;

    /**
     * 删除某个收藏
     */
    @RequestMapping(value = "{collectingId}",method = RequestMethod.DELETE)
    @ResponseBody
    @SystemControllerLog(description = "删除收藏商品")
    public String deleteOne(@PathVariable String collectingId){
        collectingService.deleteOne(collectingId);
        return "success";
    }

    /**
     * 添加商品到收藏
     */
    @RequestMapping(value = "addCollecting",method = RequestMethod.PUT)
    @ResponseBody
    @SystemControllerLog(description = "添加收藏商品")
    public String addCollecting(String commodityId, HttpSession session){
        String userId = (String) session.getAttribute("id");
        String msg = collectingService.insertOne(userId,commodityId);
        return msg;
    }
}
