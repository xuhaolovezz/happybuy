package com.happybuy.service.interfaces;

import com.happybuy.entity.ControllerLog;
import com.happybuy.entity.LoginLog;
import com.happybuy.entity.PageBean;

/**
 * 负责日志的业务层操作接口
 * Created by 徐豪 on 2017/6/27/027.
 */
public interface LogService {

    /**
     * 插入一条登录日志
     * @param loginLog
     */
    void saveOne(LoginLog loginLog);

    /**
     * 插入一条Controller日志
     * @param controllerLog
     */
    void saveControllerLog(ControllerLog controllerLog);

    /**
     * 分页查询ControllerLog
     * @param currPage
     * @return
     */
    PageBean<ControllerLog> queryControllerLogByPage(Integer currPage);

    /**
     * 批量删除ControllerLogs
     * @param idString
     */
    void deleteControllerLogs(String idString);

    /**
     * 分页查询LoginLog
     * @param currPage
     * @return
     */
    PageBean<LoginLog> queryLoginLogByPage(Integer currPage);

    /**
     * 批量删除登录日志
     * @param idString
     */
    void deleteLoginLogs(String idString);
}
