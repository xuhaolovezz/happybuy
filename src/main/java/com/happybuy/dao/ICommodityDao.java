package com.happybuy.dao;

import com.happybuy.domain.Commodity;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;
import java.util.Map;

/**
 * 商品数据库层接口，对应的XML映射文件为CommodityMapper.xml
 * Created by 徐豪 on 2017/6/23/023.
 */
public interface ICommodityDao {

    /**
     * 插入一条商品记录
     * @param commodity
     */
    void insertOne(Commodity commodity);

    /**
     * 计算条件查询商品的总数
     * @param commodity
     * @return
     */
    Integer countCommodity(Commodity commodity);

    /**
     * 根据条件分页查询
     * @param parameter 1.commodity 查询条件
     *                  2. pageBean 分页条件
     * @return
     */
    List<Commodity> queryCommodityByPage(Map<String,Object> parameter);

    /**
     * 删除一条商品记录
     * @param id
     */
    void deleteOne(String id);

    /**
     * 查询一条商品信息
     * @param id
     * @return
     */
    Commodity queryOne(String id);

    /**
     * 查询商品详情和其的商品评论
     */
    Commodity queryOneDetails(String commodityId);

    /**
     * 更新一条商品信息
     * @param commodity
     */
    void updateOne(Commodity commodity);

    /**
     * 改变商品的状态
     * @param commodity
     */
    void updateState(Commodity commodity);

    /**
     * 查询某个商品的销量和库存
     */
    Commodity queryTotalBuy(String commodityId);

    /**
     * 更新某个商品的销量和库存
     * @param commodity
     */
    void updateTotalBuy(Commodity commodity);

}
