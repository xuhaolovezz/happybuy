package com.happybuy.dao;

import com.happybuy.domain.City;

import java.util.List;

/**
 * 城市持久层接口，对应的Mapper为CityMapper.xml
 * Created by 徐豪 on 2017/6/27/027.
 */
public interface ICityDao {

    /**
     * 查询某个省份下的所有城市
     */
    List<City> queryCitiesByProvince(String id);
}
