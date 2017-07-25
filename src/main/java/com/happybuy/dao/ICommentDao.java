package com.happybuy.dao;

import com.happybuy.domain.Comment;

import java.util.List;

/**
 * 商品评论持久层接口，对应的mapper为CommentMapper.xml
 * Created by 徐豪 on 2017/7/5/005.
 */
public interface ICommentDao {

    /**
     * 插入一条或者多条记录
     * @param commentList
     */
    void insertBatch(List<Comment> commentList);

}
