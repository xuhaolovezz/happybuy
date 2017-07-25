package com.happybuy.entity;

import java.util.Date;

/**
 * 登录日志类
 * Created by 徐豪 on 2017/6/26/026.
 */
public class LoginLog {
    //主键
    private String id;
    //登录的账号
    private String username;
    //账号的权限
    private Integer root;
    //登录账号类型
    private String loginType;
    //请求的IP地址
    private String requestIP;
    //请求所在的真实地址
    private String realAddress;
    //上次登录时间
    private String lastLoginTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getRoot() {
        return root;
    }

    public void setRoot(Integer root) {
        this.root = root;
    }

    public String getLoginType() {
        return loginType;
    }

    public void setLoginType(String loginType) {
        this.loginType = loginType;
    }

    public String getRequestIP() {
        return requestIP;
    }

    public void setRequestIP(String requestIP) {
        this.requestIP = requestIP;
    }

    public String getRealAddress() {
        return realAddress;
    }

    public void setRealAddress(String realAddress) {
        this.realAddress = realAddress;
    }

    public String getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(String lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }
}
