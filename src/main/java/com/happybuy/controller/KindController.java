package com.happybuy.controller;

import com.happybuy.annotation.SystemControllerLog;
import com.happybuy.domain.Kind;
import com.happybuy.service.interfaces.KindService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 商品种类的控制层
 * Created by 徐豪 on 2017/6/22/022.
 */
@Controller
@RequestMapping("/kind")
public class KindController {

    @Resource(name = "kindService")
    private KindService kindService;

    /**
     * 查询所有商品种类及其子类
     * @return
     */
    @RequestMapping("/findAllKind")
    @ResponseBody
    public List<Kind> findAllKind(){
        return kindService.findAll();
    }

    /**
     * 修改商品品类名称
     */
    @RequestMapping(method = RequestMethod.PUT)
    @ResponseBody
    @SystemControllerLog(description = "修改商品品类名称")
    public String updateName(Kind kind){
        kindService.updateName(kind);
        return null;
    }

    /**
     * 添加商品品类
     */
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "添加商品品类")
    public String addKind(Kind kind){
        kindService.addKind(kind);
        return null;
    }

    /**
     * 删除商品品类
     */
    @RequestMapping(value = "{id}",method = RequestMethod.DELETE)
    @ResponseBody
    @SystemControllerLog(description = "删除商品品类")
    public String deleteKind(@PathVariable("id") String id){
        kindService.deleteKind(id);
        return null;
    }

    /**
     * 跳转到该商品的小品类
     */
    @RequestMapping(value = "{id}",method = RequestMethod.GET)
    public String toSmallKind(@PathVariable("id") String id, Model model){
        Kind kind = kindService.selectOne(id);
        model.addAttribute("kind",kind);
        return "back/admin/smallKind";
    }

}
