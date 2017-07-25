package com.happybuy.dao;

import com.happybuy.entity.LoginLog;

import java.util.List;
import java.util.Map;

/**
 * LoginLog持久层接口，对应的Mapper为LoginLogMapper.xml
 * Created by 徐豪 on 2017/6/27/027.
 */
public interface ILoginLogDao {

    /**
     * 插入一条日志记录
     */
    void insertOne(LoginLog loginLog);

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
    List<LoginLog> queryLogByPage(Map<String,Object> parameter);

    /**
     * 批量删除登录日志
     * @param idString
     */
    void deleteLogs(String idString);
}
