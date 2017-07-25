package com.happybuy.domain;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

/**
 * 商品实体类，对应数据库的表为commodity
 * Created by 徐豪 on 2017/6/20/020.
 */
public class Commodity implements Serializable {
    //主键
    private String id;
    //商品名称
    private String name;
    //商品描述
    private String description;
    //商品库存
    private Integer stock;
    //累计销量
    private Integer totalBuy;
    //商品的状态 在售 或者下架
    private String state;
    //商品原价
    private Double originalPrice;
    //商品现价
    private Double currentPrice;
    //商品图片1
    private String picture1;
    //商品图片2
    private String picture2;
    //商品图片3
    private String picture3;
    //商品图片4
    private String picture4;
    //商品详情图片1
    private String descPicture1;
    //商品详情图片2
    private String descPicture2;
    //商品详情图片3
    private String descPicture3;
    //商品详情图片4
    private String descPicture4;

    //商品种类
    private Kind kind;
    //商品种类的细致的分类
    private SmallKind smallKind;
    //商品的所有评价
    private List<Comment> commentList;
    //好评率
    private Integer goodRatio;
    //总评价数
    private Integer totalComment;
    //好评数
    private Integer totalGood;
    //中评数
    private Integer totalNormal;
    //差评数
    private Integer totalBad;

    public Commodity() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getTotalBuy() {
        return totalBuy;
    }

    public void setTotalBuy(Integer totalBuy) {
        this.totalBuy = totalBuy;
    }

    public Integer getTotalComment() {
        return totalComment;
    }

    public void setTotalComment(Integer totalComment) {
        this.totalComment = totalComment;
    }

    public Double getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(Double originalPrice) {
        this.originalPrice = originalPrice;
    }

    public Double getCurrentPrice() {
        return currentPrice;
    }

    public void setCurrentPrice(Double currentPrice) {
        this.currentPrice = currentPrice;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
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

    public String getDescPicture1() {
        return descPicture1;
    }

    public void setDescPicture1(String descPicture1) {
        this.descPicture1 = descPicture1;
    }

    public String getDescPicture2() {
        return descPicture2;
    }

    public void setDescPicture2(String descPicture2) {
        this.descPicture2 = descPicture2;
    }

    public String getDescPicture3() {
        return descPicture3;
    }

    public void setDescPicture3(String descPicture3) {
        this.descPicture3 = descPicture3;
    }

    public String getDescPicture4() {
        return descPicture4;
    }

    public void setDescPicture4(String descPicture4) {
        this.descPicture4 = descPicture4;
    }

    public Kind getKind() {
        return kind;
    }

    public void setKind(Kind kind) {
        this.kind = kind;
    }

    public SmallKind getSmallKind() {
        return smallKind;
    }

    public void setSmallKind(SmallKind smallKind) {
        this.smallKind = smallKind;
    }

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    public Integer getGoodRatio() {
        return goodRatio;
    }

    public void setGoodRatio(Integer goodRatio) {
        this.goodRatio = goodRatio;
    }

    public Integer getTotalGood() {
        return totalGood;
    }

    public void setTotalGood(Integer totalGood) {
        this.totalGood = totalGood;
    }

    public Integer getTotalNormal() {
        return totalNormal;
    }

    public void setTotalNormal(Integer totalNormal) {
        this.totalNormal = totalNormal;
    }

    public Integer getTotalBad() {
        return totalBad;
    }

    public void setTotalBad(Integer totalBad) {
        this.totalBad = totalBad;
    }

}
