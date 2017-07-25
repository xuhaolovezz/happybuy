package com.happybuy.domain;

import java.io.Serializable;
import java.util.Objects;

/**
 * 管理员实体类，对应数据库中的表为admin
 * Created by 徐豪 on 2017/6/20/020.
 */
public class Admin implements Serializable {
    //主键
    private String id;
    //用户名
    private String username;
    //密码
    private String password;
    //邮箱
    private String email;
    //加密所用的盐值
    private String salt;
    //验证码
    private String code;
    //验证码发送时间
    private String codeTime;

    public Admin() {
    }

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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCodeTime() {
        return codeTime;
    }

    public void setCodeTime(String codeTime) {
        this.codeTime = codeTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Admin admin = (Admin) o;
        return Objects.equals(id, admin.id) &&
                Objects.equals(username, admin.username) &&
                Objects.equals(password, admin.password) &&
                Objects.equals(email, admin.email) &&
                Objects.equals(salt, admin.salt) &&
                Objects.equals(code, admin.code) &&
                Objects.equals(codeTime, admin.codeTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, username, password, email, salt, code, codeTime);
    }
}
