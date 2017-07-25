package com.happybuy.service.impl;

import com.happybuy.common.Iconst;
import com.happybuy.dao.ICollectingDao;
import com.happybuy.domain.Collecting;
import com.happybuy.entity.PageBean;
import com.happybuy.service.interfaces.CollectingService;
import com.happybuy.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Collecting实体类对应的业务层接口实现类
 * Created by 徐豪 on 2017/6/28/028.
 */
@Service("collectingService")
@Transactional
public class CollectingServiceImpl implements CollectingService ,Iconst{

    @Autowired
    private ICollectingDao collectingDao;

    /**
     * 为某个用户添加一个收藏
     * @param userId 用户id
     * @param commodityId 商品id
     */
    @Override
    public String insertOne(String userId, String commodityId) {
        Map<String,Object> parameter = new HashMap<String,Object>();
        parameter.put("userId", userId);
        parameter.put("commodityId", commodityId);
        if(collectingDao.queryOne(parameter) != null){
            return "exist";
        }
        //使用UUID的方式生成主键
        String collectingId = UUIDUtil.getUUID();
        parameter.put("collectingId",collectingId);
        collectingDao.insertOne(parameter);
        return "success";
    }

    /**
     * 根据用户id和商品id查询某个收藏
     * @param userId 用户id
     * @param commodityId 商品id
     * @return
     */
    @Override
    public Collecting queryOne(String userId, String commodityId) {
        Map<String,Object> parameter = new HashMap<String,Object>();
        parameter.put("userId", userId);
        parameter.put("commodityId", commodityId);
        return collectingDao.queryOne(parameter);
    }

    /**
     * 删除一条收藏
     */
    @Override
    public void deleteOne(String id) {
        collectingDao.deleteOne(id);
    }

    /**
     * 分页查询用户收藏
     * @param userId
     * @param currPage
     * @return
     */
    @Override
    public PageBean<Collecting> queryCollectingByPage(String userId, Integer currPage) {

        PageBean<Collecting> collectingPageBean = new PageBean<Collecting>();

        //设置查询的当前页
        collectingPageBean.setCurrPage(currPage);
        //设置每页显示数量
        collectingPageBean.setPageSize(COLLECTINGSIZE);
        //设置总记录数
        Integer totalSize = collectingDao.countAllByUser(userId);
        collectingPageBean.setTotalSize(totalSize);
        //计算页数和分页查询需要的参数
        collectingPageBean.count();

        //设置查询和分页需要的条件
        Map<String,Object> parameter = new HashMap<String,Object>();
        parameter.put("userId",userId);
        //分页拦截器需要的pageBean对象，名称不可改
        parameter.put("pageBean",collectingPageBean);
        //分页查询
        List<Collecting> collectingList = collectingDao.queryCollectingByPage(parameter);
        collectingPageBean.setList(collectingList);

        return collectingPageBean;
    }
}
