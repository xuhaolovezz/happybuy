package com.happybuy.dao;

import com.happybuy.domain.Admin;

/**
 * 管理员持久层接口，对应的SQL映射文件为AdminMapper
 * Created by 徐豪 on 2017/6/25/025.
 */
public interface IAdminDao {

    /**
     * 查询一条管理员记录
     */
    Admin selectOne(Admin admin);

}
