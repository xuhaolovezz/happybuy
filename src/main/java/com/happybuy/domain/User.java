package com.happybuy.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 用户实体类，关联数据库表为user
 * Created by 徐豪 on 2017/6/20/020.
 */
public class User implements Serializable{

    //主键id
    private String id;
    //用户名
    private String username;
    //密码
    private String password;
    //昵称
    private String uname;
    //邮箱
    private String email;
    //年龄
    private Integer age;
    //性别 1代表男 2代表女
    private Integer gender;
    //生日
    private Date birthday;
    //手机号
    private String phone;
    //状态  0代表未激活 1代表激活
    private Integer state;
    //注册时生成的激活码
    private String regCode;
    //盐值
    private String salt;
    //修改密码的验证码
    private String code;
    //发送验证码的时间
    private Long codeTime;
    //权限 0代表普通用户 1代表管理员
    private Integer root;

    //用户所有订单
    private List<Order> orderList;
    //用户所有评价
    private List<Comment> commentList;
    //用户的所有收货地址
    private List<Address> addressList;
    //用户所有收藏
    private List<Collecting> collectingList;

    public User() {
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

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getRegCode() {
        return regCode;
    }

    public void setRegCode(String regCode) {
        this.regCode = regCode;
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

    public Long getCodeTime() {
        return codeTime;
    }

    public void setCodeTime(Long codeTime) {
        this.codeTime = codeTime;
    }

    public List<Order> getOrderList() {
        return orderList;
    }

    public void setOrderList(List<Order> orderList) {
        this.orderList = orderList;
    }

    public Integer getRoot() {
        return root;
    }

    public void setRoot(Integer root) {
        this.root = root;
    }

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    public List<Address> getAddressList() {
        return addressList;
    }

    public void setAddressList(List<Address> addressList) {
        this.addressList = addressList;
    }

    public List<Collecting> getCollectingList() {
        return collectingList;
    }

    public void setCollectingList(List<Collecting> collectingList) {
        this.collectingList = collectingList;
    }
}
