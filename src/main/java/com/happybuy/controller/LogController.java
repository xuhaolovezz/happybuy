package com.happybuy.controller;

import com.happybuy.service.interfaces.LogService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * 日志控制层
 * Created by 徐豪 on 2017/6/27/027.
 */
@Controller
@RequestMapping("/log")
public class LogController {

    @Resource(name = "logService")
    private LogService logService;

    @RequestMapping("deleteControllerLogs")
    @ResponseBody
    public String deleteControllerLogs(String idString){
        logService.deleteControllerLogs(idString);
        return "";
    }

    @RequestMapping("deleteLoginLogs")
    @ResponseBody
    public String deleteLoginLogs(String idString){
        logService.deleteLoginLogs(idString);
        return "";
    }

}
