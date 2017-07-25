package com.happybuy.service.impl;

import com.happybuy.common.Iconst;
import com.happybuy.dao.IControllerLogDao;
import com.happybuy.dao.ILoginLogDao;
import com.happybuy.entity.ControllerLog;
import com.happybuy.entity.LoginLog;
import com.happybuy.entity.PageBean;
import com.happybuy.service.interfaces.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 徐豪 on 2017/6/27/027.
 */
@Service("logService")
@Transactional
public class LogServiceImpl implements LogService,Iconst {

    @Autowired
    private ILoginLogDao loginLogDao;

    @Autowired
    private IControllerLogDao controllerLogDao;

    /**
     * 插入一条登录日志
     * @param loginLog
     */
    @Override
    public void saveOne(LoginLog loginLog) {
        loginLogDao.insertOne(loginLog);
    }

    /**
     * 插入一条Controller日志
     * @param controllerLog
     */
    @Override
    public void saveControllerLog(ControllerLog controllerLog) {
        controllerLogDao.insertOne(controllerLog);
    }

    /**
     * 分页查询ControllerLog
     * @param currPage
     * @return
     */
    @Override
    public PageBean<ControllerLog> queryControllerLogByPage(Integer currPage) {
        PageBean<ControllerLog> controllerLogPageBean = new PageBean<ControllerLog>();

        //设置当前页
        controllerLogPageBean.setCurrPage(currPage);

        //设置每页显示的数量
        controllerLogPageBean.setPageSize(LOGPAGESIZE);

        //设置总记录数
        controllerLogPageBean.setTotalSize(controllerLogDao.count());

        //设置总页数和数据库查询需要的条件
        controllerLogPageBean.count();

        //设置分页查询需要的查询条件和limit参数
        Map<String,Object> parameter = new HashMap<String,Object>();
        //参数名pageBean为固定写法，用来拦截器获取分页参数
        parameter.put("pageBean",controllerLogPageBean);

        //设置List集合
        List<ControllerLog> list = controllerLogDao.queryLogByPage(parameter);
        controllerLogPageBean.setList(list);

        return controllerLogPageBean;
    }

    /**
     * 批量删除ControllerLogs
     * @param idString
     */
    @Override
    public void deleteControllerLogs(String idString) {
        controllerLogDao.deleteLogs(idString);
    }

    @Override
    public PageBean<LoginLog> queryLoginLogByPage(Integer currPage) {
        PageBean<LoginLog> loginLogPageBean = new PageBean<LoginLog>();

        //设置当前页
        loginLogPageBean.setCurrPage(currPage);

        //设置每页显示的数量
        loginLogPageBean.setPageSize(LOGPAGESIZE);

        //设置总记录数
        loginLogPageBean.setTotalSize(loginLogDao.count());

        //设置总页数和数据库查询需要的条件
        loginLogPageBean.count();

        //设置分页查询需要的查询条件和limit参数
        Map<String,Object> parameter = new HashMap<String,Object>();
        //参数名pageBean为固定写法，用来拦截器获取分页参数
        parameter.put("pageBean",loginLogPageBean);

        //设置List集合
        List<LoginLog> list = loginLogDao.queryLogByPage(parameter);
        loginLogPageBean.setList(list);

        return loginLogPageBean;
    }

    /**
     * 批量删除登录日志
     * @param idString
     */
    @Override
    public void deleteLoginLogs(String idString) {
        loginLogDao.deleteLogs(idString);
    }
}
