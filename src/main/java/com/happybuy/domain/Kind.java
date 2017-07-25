package com.happybuy.domain;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

/**
 * 商品分类，对应数据库中的实体类为kind
 * Created by 徐豪 on 2017/6/20/020.
 */
public class Kind implements Serializable {
    //主键
    private String id;
    //分类名
    private String name;
    //该种类下的所有分类
    private List<SmallKind> smallKindList;
    //该分类下的所有商品
    private List<Commodity> commodityList;

    public Kind() {
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

    public List<SmallKind> getSmallKindList() {
        return smallKindList;
    }

    public void setSmallKindList(List<SmallKind> smallKindList) {
        this.smallKindList = smallKindList;
    }

    public List<Commodity> getCommodityList() {
        return commodityList;
    }

    public void setCommodityList(List<Commodity> commodityList) {
        this.commodityList = commodityList;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Kind kind = (Kind) o;
        return Objects.equals(id, kind.id) &&
                Objects.equals(name, kind.name) &&
                Objects.equals(smallKindList, kind.smallKindList) &&
                Objects.equals(commodityList, kind.commodityList);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, smallKindList, commodityList);
    }
}
