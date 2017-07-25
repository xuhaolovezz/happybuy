package com.happybuy.dao;

import com.happybuy.domain.Collecting;

import java.util.List;
import java.util.Map;

/**
 * Collecting对应的持久层接口，对应的Mapper为CollectingMapper.xml
 * Created by 徐豪 on 2017/6/28/028.
 */
public interface ICollectingDao {

    /**
     * 查询某个用户的所有收藏
     * @param parameter 1.pageBean对象 2 userId
     * @return
     */
    List<Collecting> queryCollectingByPage(Map<String,Object> parameter);

    /**
     * 计算某个用户的收藏商品总数
     * @param userId
     * @return
     */
    int countAllByUser(String userId);

    /**
     * 根据用户id和商品id查询某个收藏
     * @param parameter 1.userId 用户的id
     *                   2.commodityId  商品的id
     * @return
     */
    Collecting queryOne(Map<String,Object> parameter);

    /**
     * 为某个用户添加一个收藏
     * @param parameter 1. 收藏id collectingId
     *                   2. 用户id userId
     *                   3. 商品id commodityId
     */
    void insertOne(Map<String,Object> parameter);

    /**
     * 删除一条收藏
     */
    void deleteOne(String id);

    /**
     * 查询收藏了某个商品的所有用户
     */
    List<Collecting> queryBatchByCommodity(String commodityId);
}
