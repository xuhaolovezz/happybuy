package com.happybuy.service.interfaces;

import com.happybuy.domain.Comment;

import java.util.List;

/**
 * 商品评论的业务层接口
 * Created by 徐豪 on 2017/7/6/006.
 */
public interface CommentService {

    /**
     * 保存一条或者多条评论到数据库中
     * @param commentList
     */
    void saveComment(List<Comment> commentList);
}
