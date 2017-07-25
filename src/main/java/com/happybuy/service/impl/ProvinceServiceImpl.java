package com.happybuy.service.impl;

import com.happybuy.dao.IProvinceDao;
import com.happybuy.domain.Province;
import com.happybuy.service.interfaces.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Province实体对应的业务层接口实现类
 * Created by 徐豪 on 2017/6/27/027.
 */
@Service("provinceService")
@Transactional
public class ProvinceServiceImpl implements ProvinceService {

    @Autowired
    private IProvinceDao provinceDao;

    @Override
    public List<Province> queryAll() {
        return provinceDao.queryAll();
    }
}
