package com.happybuy.dao;

import com.happybuy.domain.User;


/**
 * User的跟数据库相关联的接口，对应的映射文件为UserMapper.xml
 * Created by 徐豪 on 2017/6/21/021.
 */
public interface IUserDao {
    /**
     * 插入一条记录
     * @param user
     */
    void insertOne(User user);

    /**
     * 查询一条用户记录
     * @param user
     * @return
     */
    User selectOneUser(User user);

    /**
     * 激活用户
     * @param id
     */
    void activeUser(String id);

    /**
     * 查询用户邮箱以及邮箱验证码
     */
    User selectEmailAndCode(String id);

    /**
     * 保存用户的邮箱验证码
     */
    void updateCode(User user);

    /**
     * 更新用户密码
     */
    void updatePassword(User user);

    /**
     * 更新用户信息
     */
    void updateUser(User user);
}
