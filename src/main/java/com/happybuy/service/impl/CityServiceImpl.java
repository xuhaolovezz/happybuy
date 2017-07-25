package com.happybuy.service.impl;

import com.happybuy.dao.ICityDao;
import com.happybuy.domain.City;
import com.happybuy.service.interfaces.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * City实体类对应的业务层接口实现类
 * Created by 徐豪 on 2017/6/27/027.
 */
@Service("cityService")
@Transactional
public class CityServiceImpl implements CityService{

    @Autowired
    private ICityDao cityDao;

    @Override
    public List<City> queryCitiesByProvince(String id) {
        return cityDao.queryCitiesByProvince(id);
    }
}
