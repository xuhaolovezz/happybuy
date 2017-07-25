package com.happybuy.service.interfaces;

import com.happybuy.domain.Province;

import java.util.List;

/**
 * Province实体对应的业务层接口
 * Created by 徐豪 on 2017/6/27/027.
 */
public interface ProvinceService {
    /**
     * 查询所有省份及其城市
     * @return
     */
    List<Province> queryAll();

}
