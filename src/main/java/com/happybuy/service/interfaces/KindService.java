package com.happybuy.service.interfaces;

import com.happybuy.domain.Kind;
import com.happybuy.entity.PageBean;

import java.util.List;

/**
 * 商品种类业务层接口
 * Created by 徐豪 on 2017/6/22/022.
 */
public interface KindService {

    /**
     * 查询所有商品种类及其子类
     * @return
     */
    List<Kind> findAll();

    /**
     * 分页查询所有分类
     * @param currPage
     * @return
     */
    PageBean<Kind> queryKindsByPage(Integer currPage);

    /**
     * 修改种类的名字
     * @param kind
     */
    void updateName(Kind kind);

    /**
     * 添加商品品类
     * @param kind
     */
    void addKind(Kind kind);

    /**
     * 删除一条商品品类
     * @param id
     */
    void deleteKind(String id);

    /**
     * 查询一条商品品类信息
     */
    Kind selectOne(String id);
}
