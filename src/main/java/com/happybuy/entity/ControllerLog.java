package com.happybuy.entity;

/**
 * 控制层日志记录
 * Created by 徐豪 on 2017/6/27/027.
 */
public class ControllerLog {

    //主键
    private String id;
    //请求人的账号
    private String username;
    //账号类型
    private String accountType;
    //请求的方法名
    private String methodName;
    //请求的方法描述
    private String description;
    //请求时间
    private String requestTime;
    //请求IP
    private String requestIP;
    //请求地址
    private String realAddress;

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

    public String getAccountType() {
        return accountType;
    }

    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRequestTime() {
        return requestTime;
    }

    public void setRequestTime(String requestTime) {
        this.requestTime = requestTime;
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
}
