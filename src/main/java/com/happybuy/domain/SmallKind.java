package com.happybuy.domain;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

/**
 * 商品分类更细的分类，对应数据库中的表为smallkind
 * Created by 徐豪 on 2017/6/20/020.
 */
public class SmallKind implements Serializable {
    //主键
    private String id;
    //分类名
    private String name;
    //所属的大分类
    private Kind kind;
    //该分类下所有商品
    private List<Commodity> commodityList;

    public SmallKind() {
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

    public Kind getKind() {
        return kind;
    }

    public void setKind(Kind kind) {
        this.kind = kind;
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
        SmallKind smallKind = (SmallKind) o;
        return Objects.equals(id, smallKind.id) &&
                Objects.equals(name, smallKind.name) &&
                Objects.equals(kind, smallKind.kind) &&
                Objects.equals(commodityList, smallKind.commodityList);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, kind, commodityList);
    }
}
