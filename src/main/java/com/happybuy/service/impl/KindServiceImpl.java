package com.happybuy.service.impl;

import com.happybuy.common.Iconst;
import com.happybuy.dao.IKindDao;
import com.happybuy.domain.Kind;
import com.happybuy.entity.PageBean;
import com.happybuy.service.interfaces.KindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by 徐豪 on 2017/6/22/022.
 */
@Service("kindService")
@Transactional
public class KindServiceImpl implements KindService ,Iconst{

    @Autowired
    private IKindDao kindDao;

    /**
     * 查询所有商品分类
     * @return
     */
    @Override
    public List<Kind> findAll() {
        return kindDao.queryAll();
    }

    /**
     * 分页查询所有商品分类
     * @param currPage
     * @return
     */
    @Override
    //@Cacheable(cacheNames = {"testCache"})
    public PageBean<Kind> queryKindsByPage(Integer currPage) {
        PageBean<Kind> kindPageBean = new PageBean<Kind>();
        //设置当前查询页数
        kindPageBean.setCurrPage(currPage);

        //设置每页显示的记录数
        kindPageBean.setPageSize(KINDPAGESIZE);

        //设置总记录数
        Integer totalSize = kindDao.countAll();
        kindPageBean.setTotalSize(totalSize);

        //设置每页显示的记录数以及数据库分页查询需要的参数
        kindPageBean.count();

        //设置查询返回的List结果
        Map<String,Object> parameter = new HashMap<String,Object>();
        //参数名pageBean为固定写法，用来拦截器获取分页参数
        parameter.put("pageBean",kindPageBean);
        List<Kind> kindList = kindDao.queryKindByPage(parameter);
        kindPageBean.setList(kindList);

        return kindPageBean;
    }

    /**
     * 修改商品品类名称
     * @param kind
     */
    @Override
    public void updateName(Kind kind) {
        kindDao.updateName(kind);
    }

    /**
     * 添加商品品类
     * @param kind
     */
    @Override
    public void addKind(Kind kind) {
        //使用UUID的方式生成主键
        String id = String.valueOf(UUID.randomUUID());
        kind.setId(id);
        kindDao.insertOne(kind);
    }

    /**
     * 删除一条商品品类
     * @param id
     */
    @Override
    public void deleteKind(String id) {
        kindDao.deleteOne(id);
    }

    /**
     * 查询一条商品品类信息
     */
    @Override
    public Kind selectOne(String id) {
        return kindDao.selectOne(id);
    }
}
