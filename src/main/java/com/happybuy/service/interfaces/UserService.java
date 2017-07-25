package com.happybuy.service.interfaces;

import com.happybuy.domain.User;

/**
 * 用户业务层接口类
 * Created by 徐豪 on 2017/6/21/021.
 */
public interface UserService {
    /**
     * 保存用户
     * @param user
     */
    void saveUser(User user);

    /**
     * 激活用户 成功返回true ，失败返回false
     * @param user
     */
    boolean activeUser(User user);

    /**
     * 用户登录 返回null为登录失败
     * @param user
     * @return
     */
    User login(User user);

    /**
     * 根据条件查询用户
     */
    User findUser(User user);

    /**
     * 发送邮箱验证码
     * @param id
     */
    void sendEmailCode(String id);

    /**
     * 验证输入的邮箱验证码和数据库中的验证码是否相同
     * @param codes 前台输入的验证码
     * @param id 验证的用户id
     * @return 1.success：验证成功
     *          2.failure：验证失败
     *          3.timeout：验证码超时
     */
    String validateCode(String codes, String id);

    /**
     * 修改用户密码
     * @param user
     */
    void rePass(User user);

    /**
     * 根据用户名查询用户
     * @param username
     * @return
     */
    User selectByUserName(String username);

    /**
     * 更新用户信息
     * @param user
     */
    void updateUser(User user);
}
