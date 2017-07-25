package com.happybuy.controller;

import com.happybuy.annotation.SystemControllerLog;
import com.happybuy.domain.SmallKind;
import com.happybuy.service.interfaces.SmallKindService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * 商品品类下的小品类
 * Created by 徐豪 on 2017/6/24/024.
 */
@Controller
@RequestMapping("/smallKind")
public class SmallKindController {

    @Resource(name = "smallKindService")
    private SmallKindService smallKindService;

    /**
     * 修改小品类名称
     */
    @RequestMapping(method = RequestMethod.PUT)
    @ResponseBody
    @SystemControllerLog(description = "修改小品类名称")
    public String updateName(SmallKind smallKind){
        smallKindService.updateName(smallKind);
        return null;
    }

    /**
     * 删除小品类
     */
    @RequestMapping(value = "{id}",method = RequestMethod.DELETE)
    @ResponseBody
    @SystemControllerLog(description = "删除小品类")
    public String delete(@PathVariable("id") String id){
        smallKindService.deleteOne(id);
        return null;
    }

    /**
     * 添加一条小品类
     */
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "添加一条小品类")
    public String add(SmallKind smallKind){
        smallKindService.addOne(smallKind);
        return null;
    }

}
