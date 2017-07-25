package com.happybuy.domain;

import java.io.Serializable;
import java.util.Objects;

/**
 * 城市表。对应数据库为city
 * Created by 徐豪 on 2017/6/20/020.
 */
public class City implements Serializable {
    //城市主键
    private String id;
    //城市名
    private String name;

    public City() {
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

}
