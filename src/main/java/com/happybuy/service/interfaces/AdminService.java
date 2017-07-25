package com.happybuy.service.interfaces;

import com.happybuy.domain.Admin;

/**
 * 关于管理员账号的业务层类接口
 * Created by 徐豪 on 2017/6/25/025.
 */
public interface AdminService {

    /**
     * 负责管理员登录
     * @param admin
     * @return
     */
    Admin login(Admin admin);

    /**
     * 给指定用户发送邮箱验证码
     * @param id
     */
    void sendEmailCode(String id);
}
