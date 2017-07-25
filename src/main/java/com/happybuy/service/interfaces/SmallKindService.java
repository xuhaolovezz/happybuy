package com.happybuy.service.interfaces;

import com.happybuy.domain.SmallKind;

/**
 * 商品小品类业务层接口
 * Created by 徐豪 on 2017/6/24/024.
 */
public interface SmallKindService {
    /**
     * 修改小品类名称
     * @param smallKind
     */
    void updateName(SmallKind smallKind);

    /**
     * 删除一条小品类
     * @param id
     */
    void deleteOne(String id);

    /**
     * 添加一条小品类
     * @param smallKind
     */
    void addOne(SmallKind smallKind);
}
