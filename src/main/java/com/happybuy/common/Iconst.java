package com.happybuy.common;

/**
 * 公共常量定义接口
 * Created by 徐豪 on 2017/6/23/023.
 */
public interface Iconst {

    /**
     * 后台管理页面每页显示的商品数量
     */
    Integer COMMODITYPAGESIZE = 10;

    /**
     * 前台搜索结果页每页显示的商品数量
     */
    Integer FRONTSEARCHSIZE = 20;

    /**
     * 分页显示的商品分类的数量
     */
    Integer KINDPAGESIZE = 10;

    /**
     * 分页显示的日志的数量
     */
    Integer LOGPAGESIZE = 10;

    /**
     * 分页显示的订单的数量
     */
    Integer ORDERPAGESIZE = 10;

    /**
     * 分页显示的用户收藏商品数量
     */
    Integer COLLECTINGSIZE = 10;

    /**
     * 设置图片的保存路径
     */
    String PATH = "D:\\WebProject\\happybuy\\upload";

}
