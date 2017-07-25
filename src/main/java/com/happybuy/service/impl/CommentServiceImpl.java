package com.happybuy.service.impl;

import com.happybuy.dao.ICommentDao;
import com.happybuy.domain.Comment;
import com.happybuy.service.interfaces.CommentService;
import com.happybuy.service.interfaces.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 商品评论的业务层接口
 * Created by 徐豪 on 2017/7/6/006.
 */
@Service("commentService")
@Transactional
public class CommentServiceImpl implements CommentService {

    @Autowired
    private ICommentDao commentDao;

    @Resource(name = "orderService")
    private OrderService orderService;

    /**
     * 保存一条或者多条评论到数据库中
     * @param commentList
     */
    @Override
    public void saveComment(List<Comment> commentList) {
        //保存商品的评论
        commentDao.insertBatch(commentList);

        //更新当前订单状态为已完成
        String state = "已完成";
        String orderId = "";
        if(commentList.size() > 0){
            orderId = commentList.get(0).getOrder().getId();
        }
        orderService.updateStateByOrderId(orderId,state);
    }
}
