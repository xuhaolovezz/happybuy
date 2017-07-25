package com.happybuy.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

/**
 * 用户浏览信息表，用来为用户推荐商品
 * Created by 徐豪 on 2017/6/20/020.
 */
public class UserHistory implements Serializable {
    //浏览历史的id
    private String id;
    //浏览时间
    private Date time;
    //浏览历史所属的用户
    private User user;
    //浏览的商品
    private Commodity commodity;
    //搜索的关键字
    private String keyword;

    public UserHistory() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
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

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserHistory that = (UserHistory) o;
        return Objects.equals(id, that.id) &&
                Objects.equals(time, that.time) &&
                Objects.equals(user, that.user) &&
                Objects.equals(commodity, that.commodity) &&
                Objects.equals(keyword, that.keyword);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, time, user, commodity, keyword);
    }
}
