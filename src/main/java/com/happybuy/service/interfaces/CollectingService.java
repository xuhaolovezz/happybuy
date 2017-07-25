package com.happybuy.service.interfaces;

import com.happybuy.domain.Collecting;
import com.happybuy.entity.PageBean;

import java.util.List;

/**
 * Collecting实体类对应的业务层接口
 * Created by 徐豪 on 2017/6/28/028.
 */
public interface CollectingService {

    /**
     * 为某个用户添加一个收藏
     * @param userId 用户id
     * @param commodityId 商品id
     */
    String insertOne(String userId, String commodityId);

    /**
     * 根据用户id和商品id查询某个收藏
     * @param userId 用户id
     * @param commodityId 商品id
     * @return
     */
    Collecting queryOne(String userId, String commodityId);

    /**
     * 删除一条收藏
     */
    void deleteOne(String id);

    /**
     * 分页查询用户收藏
     * @param userId
     * @param currPage
     * @return
     */
    PageBean<Collecting> queryCollectingByPage(String userId, Integer currPage);
}
