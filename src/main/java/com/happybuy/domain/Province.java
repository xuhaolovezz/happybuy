package com.happybuy.domain;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

/**
 * 省份表 对应数据库中的表为province
 * Created by 徐豪 on 2017/6/20/020.
 */
public class Province implements Serializable{
    //省份主键
    private String id;
    //省份名
    private String name;

    //省份的所有城市
    private List<City> cityList;

    public Province() {
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

    public List<City> getCityList() {
        return cityList;
    }

    public void setCityList(List<City> cityList) {
        this.cityList = cityList;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Province province = (Province) o;
        return Objects.equals(id, province.id) &&
                Objects.equals(name, province.name) &&
                Objects.equals(cityList, province.cityList);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, cityList);
    }
}
