package com.happybuy.domain;

import java.io.Serializable;
import java.util.Objects;

/**
 * 用户收藏的商品,对应数据库中的表为collecting
 * Created by 徐豪 on 2017/6/20/020.
 */
public class Collecting implements Serializable {
    //主键
    private String id;
    //商品
    private Commodity commodity;
    //所属用户
    private User user;

    public Collecting() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Commodity getCommodity() {
        return commodity;
    }

    public void setCommodity(Commodity commodity) {
        this.commodity = commodity;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
