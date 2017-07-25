package com.happybuy.service.interfaces;

import com.happybuy.domain.Commodity;
import com.happybuy.entity.PageBean;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

/**
 * 商品业务层接口
 * Created by 徐豪 on 2017/6/23/023.
 */
public interface CommodityService {
    /**
     * 添加商品
     * @param commodity
     */
    void addCommodity(Commodity commodity);

    /**
     * 分页条件查询商品列表
     * @param commodity 查询条件
     * @param currPage 当前页
     * @return
     */
    PageBean<Commodity> queryCommoditiesWithConditionByPage(Commodity commodity,Integer currPage,String sort,Integer pageSize);

    /**
     * 分页查询商品并且返回List集合
     */
    List<Commodity> queryCommodityByPage(Map<String,Object> parameter);


    /**
     * 删除一个商品记录
     * @param id
     */
    void deleteOne(String id);

    /**
     * 根据id查询一条商品信息
     * @param id
     * @return
     */
    Commodity queryOne(String id);

    /**
     * 修改商品信息
     * @param commodity
     */
    void updateCommodity(Commodity commodity,MultipartFile[] pictures, MultipartFile[] descPictures);

    /**
     * 改变商品的状态
     * @param id
     */
    void changeState(String id);

    /**
     * 查询商品详情和其的商品评论
     * @param commodityId
     * @return
     */
    Commodity queryOneDetails(String commodityId);
}
