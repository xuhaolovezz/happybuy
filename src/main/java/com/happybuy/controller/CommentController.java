package com.happybuy.controller;

import com.happybuy.common.Iconst;
import com.happybuy.domain.*;
import com.happybuy.service.interfaces.CommentService;
import com.happybuy.service.interfaces.OrderService;
import com.happybuy.util.DateUtil;
import com.happybuy.util.UUIDUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by 徐豪 on 2017/7/6/006.
 */
@Controller
@RequestMapping("/comment")
public class CommentController implements Iconst{

    @Resource(name = "orderService")
    private OrderService orderService;

    @Resource(name = "commentService")
    private CommentService commentService;

    /**
     * 跳转到商品评论界面
     */
    @RequestMapping("addComment/{orderId}")
    public String addComment(@PathVariable String orderId, Model model){
        Order order = orderService.queryOrderById(orderId);
        model.addAttribute("order",order);
        return "/back/comment/addComment";
    }

    /**
     * 添加商品评论
     */
    @RequestMapping("saveComment")
    public String saveComment(String orderId, HttpServletRequest request) throws IOException, ServletException {

        //将request转型为MultipartHttpServletRequest
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

        //评价人
        String userId = (String) request.getSession().getAttribute("id");
        User user = new User();
        user.setId(userId);

        //查询这个订单的所有商品id
        Order order = orderService.queryOrderById(orderId);
        List<OrderCommodity> orderCommodityList = order.getOrderCommodityList();

        List<Comment> commentList = new ArrayList<Comment>();

        //循环所有商品
        for(OrderCommodity orderCommodity: orderCommodityList){
            //评论对象
            Comment comment = new Comment();
            //主键使用UUID的方式
            comment.setId(UUIDUtil.getUUID());
            //评论时间
            comment.setCreateTime(DateUtil.getCurrentDateTime());
            //点赞人数初始为0
            comment.setLike(0);

            //评论的商品
            String commodityId = orderCommodity.getCommodityId();
            Commodity commodity = new Commodity();
            commodity.setId(commodityId);

            //分别设置评论的商品、评论人和评论所属的订单
            comment.setCommodity(commodity);
            comment.setUser(user);
            comment.setOrder(order);

            //获得当前商品的评论内容
            String content = "";
            if(request.getParameter("content"+commodityId) != null){
                content = request.getParameter("content"+commodityId);
            }
            //设置评论内容
            comment.setContent(content);

            //获得当前商品的评分
            Integer score = 3;
            if(request.getParameter("score"+commodityId )!=null){
                score = Integer.valueOf(request.getParameter("score"+commodityId ));
            }
            //设置商品评分
            comment.setScore(score);

            //获得评价的图片
            //获取图片信息
            int m = 0;
            comment.setPicture1("");
            comment.setPicture2("");
            comment.setPicture3("");
            comment.setPicture4("");
            //获得对应商品id的评论图片
            List<MultipartFile> pictures = multipartRequest.getFiles("picture"+commodityId);
            if(pictures.size() > 0 && !pictures.get(0).isEmpty()){

                for(MultipartFile file : pictures){

                    m ++ ;
                    //获得图片的原来的名字
                    String fileName = file.getOriginalFilename();
                    //获得图片的后缀
                    String str = fileName.substring(fileName.lastIndexOf("."),fileName.length());
                    //重命名图片
                    String newFileName = UUIDUtil.getUUID() + str;
                    File targetFile = new File(PATH,newFileName);
                    if(!targetFile.exists()){
                        targetFile.mkdirs();
                    }
                    //将图片复制到目标路径
                    file.transferTo(targetFile);

                    //将图片地址保存到数据库中
                    if(m == 1){
                        comment.setPicture1(newFileName);
                    } else if(m == 2){
                        comment.setPicture2(newFileName);
                    } else if(m == 3){
                        comment.setPicture3(newFileName);
                    } else if(m == 4){
                        comment.setPicture4(newFileName);
                    }
            }
            }
            /*for(Part part: request.getParts()){
                System.out.println(part.getName());
                if(part.getName().startsWith("picture")){
                    //判断传过来的评论图片是哪个商品的
                    if(part.getName().substring(7).equals(commodityId)){
                        //获取请求的信息
                        String header = part.getHeader("content-disposition");
                        //获得图片的后缀名
                        String str = header.substring(header.lastIndexOf("."), header.length()-1);
                        //为文件重命名
                        String newFileName = UUIDUtil.getUUID() + str;
                        String file = PATH + "\\"+ newFileName;
                        //将文件写入到路径里
                        part.write(file);
                        System.out.println(file);
                        i ++ ;
                        if(i == 1){
                            comment.setPicture1(file);
                        } else if(i == 2){
                            comment.setPicture2(file);
                        } else if(i == 3){
                            comment.setPicture3(file);
                        } else if(i == 4){
                            comment.setPicture4(file);
                        }
                    }

                }
            }*/
            //将评论加入到集合中
            commentList.add(comment);

        }

        //保存评论
        commentService.saveComment(commentList);

        return "redirect:/user/order/1";
    }

}
