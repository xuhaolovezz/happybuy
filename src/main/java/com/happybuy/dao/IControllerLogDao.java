package com.happybuy.dao;

import com.happybuy.entity.ControllerLog;

import java.util.List;
import java.util.Map;

/**
 * ControllerLog持久层接口，对应的mapper为ControllerLogMapper.xml
 * Created by 徐豪 on 2017/6/27/027.
 */
public interface IControllerLogDao {

    /**
     * 插入一条日志记录
     * @param controllerLog
     */
    void insertOne(ControllerLog controllerLog);

    /**
     * 查询日志总数
     * @return
     */
    int count();

    /**
     * 分页查询登录日志
     * @param parameter
     * @return
     */
    List<ControllerLog> queryLogByPage(Map<String,Object> parameter);

    /**
     * 批量删除日志
     */
    void deleteLogs(String idString);

}
