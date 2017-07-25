package com.happybuy.service.interfaces;

import com.happybuy.domain.City;

import java.util.List;

/**
 * City实体类对应的业务层接口
 * Created by 徐豪 on 2017/6/27/027.
 */
public interface CityService {

    /**
     * 查询某个省份下的所有城市
     */
    List<City> queryCitiesByProvince(String id);
}
