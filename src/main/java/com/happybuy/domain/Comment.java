package com.happybuy.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

/**
 * 商品的评价类，对应数据库中的表为comment
 * Created by 徐豪 on 2017/6/20/020.
 */
public class Comment implements Serializable{
    //主键
    private String id;
    //评论内容
    private String content;
    //评价时间
    private String createTime;
    //打分：好评、中评、差评分别代表321
    private Integer score;
    //此评价的点赞人数
    private Integer like;
    //评论图片1
    private String picture1;
    //评论图片2
    private String picture2;
    //评论图片3
    private String picture3;
    //评论图片4
    private String picture4;

    //评价人
    private User user;
    //评价的商品
    private Commodity commodity;
    //评价所属的订单
    private Order order;

    public Comment() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getLike() {
        return like;
    }

    public void setLike(Integer like) {
        this.like = like;
    }

    public String getPicture1() {
        return picture1;
    }

    public void setPicture1(String picture1) {
        this.picture1 = picture1;
    }

    public String getPicture2() {
        return picture2;
    }

    public void setPicture2(String picture2) {
        this.picture2 = picture2;
    }

    public String getPicture3() {
        return picture3;
    }

    public void setPicture3(String picture3) {
        this.picture3 = picture3;
    }

    public String getPicture4() {
        return picture4;
    }

    public void setPicture4(String picture4) {
        this.picture4 = picture4;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Commodity getCommodity() {
        return commodity;
    }

    public void setCommodity(Commodity commodity) {
        this.commodity = commodity;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

}
