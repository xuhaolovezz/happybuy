package com.happybuy.dao;

import com.happybuy.domain.Province;

import java.util.List;

/**
 * Province对应的持久层接口，对应的Mapper为ProvinceMapper.xml
 * Created by 徐豪 on 2017/6/27/027.
 */
public interface IProvinceDao {

    /**
     * 查询所有省份及其城市
     */
    List<Province> queryAll();
}
