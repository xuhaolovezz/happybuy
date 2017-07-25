package com.happybuy.service.impl;

import com.happybuy.dao.IAdminDao;
import com.happybuy.domain.Admin;
import com.happybuy.service.interfaces.AdminService;
import com.happybuy.util.EncryPasswordUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * 关于管理员账号的业务层类接口实现类
 * Created by 徐豪 on 2017/6/25/025.
 */
@Service("adminService")
@Transactional
public class AdminServiceImpl implements AdminService{

    @Autowired
    private IAdminDao adminDao;

    /**
     * 负责管理员登录
     * @param admin
     * @return
     */
    @Override
    public Admin login(Admin admin) {
        Admin dbAdmin = adminDao.selectOne(admin);
        //如果查询不到该管理员
        if(dbAdmin == null){
            return null;
        }
        /**
         * 当用户名和密码都相同时返回该用户
         * 根据输入的密码和数据库中的salt值进行加密处理，
         * 和数据库中存放的密码进行比较
         */
        if(dbAdmin.getUsername().equals(admin.getUsername()) &&
                EncryPasswordUtil.validate(admin.getPassword(),dbAdmin.getPassword(), dbAdmin.getSalt())){
            return dbAdmin;
        }
        return null;
    }

    /**
     * 给指定用户发送邮箱验证码
     * @param id
     */
    @Override
    public void sendEmailCode(String id) {
        Admin admin = new Admin();
        admin.setId(id);
        admin = adminDao.selectOne(admin);
    }
}
