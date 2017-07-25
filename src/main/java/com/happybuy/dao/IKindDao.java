package com.happybuy.dao;

import com.happybuy.domain.Kind;

import java.util.List;
import java.util.Map;

/**
 * 商品中种类的接口，对应的XML映射文件为KindMapper.xml
 * Created by 徐豪 on 2017/6/22/022.
 */
public interface IKindDao {

    /**
     * 查询所有商品种类及其子类
     */
    List<Kind> queryAll();

    /**
     * 查询商品种类的数量
     */
    Integer countAll();

    /**
     * 分页查询商品种类
     */
    List<Kind> queryKindByPage(Map<String,Object> parameter);

    /**
     * 更新商品品类的名称
     */
    void updateName(Kind kind);

    /**
     * 添加一个商品品类
     */
    void insertOne(Kind kind);

    /**
     * 删除一个商品品类
     */
    void deleteOne(String id);

    /**
     * 查询一条商品品类信息
     */
    Kind selectOne(String id);
}
