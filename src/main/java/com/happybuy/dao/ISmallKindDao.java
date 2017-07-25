package com.happybuy.dao;

import com.happybuy.domain.SmallKind;

/**
 * 商品中种类的小分类接口，对应的XML映射文件为SmallKindMapper.xml
 * Created by 徐豪 on 2017/6/22/022.
 */
public interface ISmallKindDao {

    /**
     * 修改小品类的名称
     * @param smallKind
     */
    void updateName(SmallKind smallKind);

    /**
     * 添加一条记录
     */
    void insertOne(SmallKind smallKind);

    /**
     * 删除一条记录
     */
    void deleteOne(String id);
}
