package com.happybuy.service.impl;

import com.happybuy.common.Iconst;
import com.happybuy.dao.ICollectingDao;
import com.happybuy.dao.ICommodityDao;
import com.happybuy.domain.Collecting;
import com.happybuy.domain.Comment;
import com.happybuy.domain.Commodity;
import com.happybuy.entity.PageBean;
import com.happybuy.service.interfaces.CommodityService;
import com.happybuy.util.CommodityPictureUtil;
import com.happybuy.util.EmailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.MessagingException;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 商品业务层接口实现类
 * Created by 徐豪 on 2017/6/23/023.
 */
@Service("commodityService")
@Transactional
public class CommodityServiceImpl implements CommodityService,Iconst{

    //忽略掉这个错误，这是编译时期错误，实际运行时不影响
    @Autowired
    private ICommodityDao commodityDao;

    @Autowired
    private ICollectingDao collectingDao;

    /**
     * 添加商品
     * @param commodity
     */
    @Override
    public void addCommodity(Commodity commodity) {
        //设置商品的销售状态为在售
        commodity.setState("在售");
        //初始化商品总购买数
        commodity.setTotalBuy(0);
        commodityDao.insertOne(commodity);
    }

    /**
     * 分页条件查询商品列表
     * @param commodity 查询条件
     * @return
     */
    //@Cacheable(cacheNames = {"testCache"})
    @Override
    public PageBean<Commodity> queryCommoditiesWithConditionByPage(Commodity commodity,Integer currPage, String sort,Integer pageSize) {
        PageBean<Commodity> commodityPageBean = new PageBean<Commodity>();

        //设置当前页
        commodityPageBean.setCurrPage(currPage);

        //设置每页显示的商品数量
        commodityPageBean.setPageSize(pageSize);

        //设置条件查询出来的商品总数
        Integer totalSize = commodityDao.countCommodity(commodity);
        commodityPageBean.setTotalSize(totalSize);

        //设置总页数和数据库查询需要的条件
        commodityPageBean.count();

        //设置分页查询需要的查询条件和limit参数
        Map<String,Object> parameter = new HashMap<String,Object>();
        parameter.put("commodity",commodity);
        //参数名pageBean为固定写法，用来拦截器获取分页参数
        parameter.put("pageBean",commodityPageBean);

        //设置查询的排序条件(price_asc,price_desc,stock_asc,stock_desc)等
        parameter.put("sort",sort);

        //根据条件查询出来结果
        List<Commodity> commodityList = queryCommodityByPage(parameter);
        commodityPageBean.setList(commodityList);
        return commodityPageBean;
    }

    /**
     * 分页查询商品并且返回List集合
     */
    @Override
    //@Cacheable(cacheNames = {"testCache"})
    public List<Commodity> queryCommodityByPage(Map<String,Object> parameter){
        List<Commodity> commodityList = commodityDao.queryCommodityByPage(parameter);
        return commodityList;
    }

    /**
     * 删除一个商品记录
     * @param id
     */
    @Override
    public void deleteOne(String id) {
        commodityDao.deleteOne(id);
    }

    /**
     * 根据id查询一条商品信息
     * @param id
     * @return
     */
    @Override
    public Commodity queryOne(String id) {
        return commodityDao.queryOne(id);
    }

    /**
     * 修改商品信息
     * @param commodity
     */
    @Override
    public void updateCommodity(Commodity commodity, MultipartFile[] pictures, MultipartFile[] descPictures) {
        //从数据库中查询出该商品的信息
        Commodity commodity1 = commodityDao.queryOne(commodity.getId());
        //如果前台传过来的有商品图片，就覆盖原来的图片
        if(!pictures[0].getOriginalFilename().equals("") ){
            try {
                commodity = CommodityPictureUtil.setCommodityPictures(commodity,pictures,PATH);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else { //如果前台传过来的没有商品图片，就把原本商品的图片赋给当前对象，防止更新时候设置为空
            commodity.setPicture1(commodity1.getPicture1());
            commodity.setPicture2(commodity1.getPicture2());
            commodity.setPicture3(commodity1.getPicture3());
            commodity.setPicture4(commodity1.getPicture4());
        }
        //如果前台传过来的有商品描述图片，就覆盖原来的图片
        if(!descPictures[0].getOriginalFilename().equals("")  ){
            try {
                commodity = CommodityPictureUtil.setCommodityDescPictures(commodity,descPictures,PATH);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {  //如果前台传过来的没有商品描述图片，就把原本商品描述图片赋给当前对象，防止更新时候设置为空
            commodity.setDescPicture1(commodity1.getDescPicture1());
            commodity.setDescPicture2(commodity1.getDescPicture2());
            commodity.setDescPicture3(commodity1.getDescPicture3());
            commodity.setDescPicture4(commodity1.getDescPicture4());
        }
        commodityDao.updateOne(commodity);

        //如果商品价格比数据库中的价格要低，则对所有收藏此商品的用户发送邮件
        if(commodity.getCurrentPrice() < commodity1.getCurrentPrice()){
            //商品的id，名称、描述、降价的金额
            String commodityId = commodity.getId();
            String commodityName = commodity.getName();
            String commodityDesc = commodity.getDescription();
            Double salePrice = commodity1.getCurrentPrice() - commodity.getCurrentPrice();
                    //查出所有收藏该商品的用户
            List<Collecting> collectingList = collectingDao.queryBatchByCommodity(commodityId);
            for(Collecting collecting: collectingList){
                //获得当前的用户id
                String userId = collecting.getUser().getId();
                //获得用户名
                String username = collecting.getUser().getUsername();
                //获得用户的邮箱
                String email = collecting.getUser().getEmail();
                //发送邮件
                try {
                    EmailUtil.sendSaleNotice(username,email,salePrice,commodityId,commodityName,commodityDesc);
                } catch (MessagingException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * 改变商品的状态
     * @param id
     */
    @Override
    public void changeState(String id) {
        Commodity commodity = commodityDao.queryOne(id);

        //如果商品的状态是在售，就改为下架，反之则改为在售
        if(commodity.getState().equals("在售")){
            commodity.setState("下架");
        } else {
            commodity.setState("在售");
        }
        commodityDao.updateState(commodity);
    }

    /**
     * 查询商品详情和其的商品评论
     * @param commodityId
     * @return
     */
    @Override
    public Commodity queryOneDetails(String commodityId) {
        //根据id查询到该商品
        Commodity commodity = commodityDao.queryOneDetails(commodityId);

        //计算好评3、中评2、差评1和好评率
        if(commodity.getCommentList() != null){
            List<Comment> commentList = commodity.getCommentList();

            //评价总数
            Integer totalComment = commentList.size();
            //好评率
            Integer goodRatio = 0;
            //好评数
            Integer totalGood = 0;
            //中评数
            Integer totalNormal = 0;
            //差评数
            Integer totalBad = 0;
            if(totalComment > 0 && commentList.get(0).getId() != null){
                for(Comment comment: commentList){
                    switch (comment.getScore()){
                        case 3:
                            totalGood += 1;
                            break;
                        case 2:
                            totalNormal += 1;
                            break;
                        case 1:
                            totalBad += 1;
                            break;
                    }
                }
                //好评率 = 好评数/总评论 保留两位小数
                /*float temp = (float) (totalGood / totalComment );
                DecimalFormat df = new DecimalFormat("0.00");
                temp = Float.parseFloat(df.format(temp));
                goodRatio = (int)(temp * 100);*/
                goodRatio = ((totalGood * 100) / totalComment);
            }
            //设置商品的好评率
            commodity.setGoodRatio(goodRatio);
            //设置好评数
            commodity.setTotalGood(totalGood);
            //设置中评数
            commodity.setTotalNormal(totalNormal);
            //设置差评数
            commodity.setTotalBad(totalBad);
        }
        return commodity;
    }
}
