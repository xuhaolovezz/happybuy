package com.happybuy.service.impl;

import com.happybuy.dao.ISmallKindDao;
import com.happybuy.domain.SmallKind;
import com.happybuy.service.interfaces.SmallKindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

/**
 * 商品小品类业务层接口实现类
 * Created by 徐豪 on 2017/6/24/024.
 */
@Service("smallKindService")
@Transactional
public class SmallKindServiceImpl implements SmallKindService {

    @Autowired
    private ISmallKindDao smallKindDao;

    /**
     * 修改小品类名称
     * @param smallKind
     */
    @Override
    public void updateName(SmallKind smallKind) {
        smallKindDao.updateName(smallKind);
    }

    /**
     * 删除一条小品类
     * @param id
     */
    @Override
    public void deleteOne(String id) {
        smallKindDao.deleteOne(id);
    }

    /**
     * 添加一条小品类
     * @param smallKind
     */
    @Override
    public void addOne(SmallKind smallKind) {
        //使用UUID的主键生成策略
        String id = String.valueOf(UUID.randomUUID());
        smallKind.setId(id);
        smallKindDao.insertOne(smallKind);
    }
}
