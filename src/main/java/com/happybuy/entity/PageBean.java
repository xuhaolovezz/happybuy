package com.happybuy.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * 分页对应的实体类
 * Created by 徐豪 on 2017/6/11/011.
 */
public class PageBean<T> {
    //每页显示条数
    private int pageSize= 5;
    //当前页数
    private int currPage;
    //总条数
    private int totalSize;
    //总页数
    private int totalPage;
    //数据库中limit的参数，从第几条开始取
    private int dbIndex;
    //数据库中limit的参数，一共取多少条
    private int dbNumber;
    //查询的集合
    List<T> list = new ArrayList<T>();
    /**
     * 根据当前对象中属性值计算并设置相关属性值
     */
    public void count(){
        Double totalPageTemp = Math.ceil( (double)this.totalSize / (double)this.pageSize);
        this.totalPage = totalPageTemp.intValue();

        // 设置当前页数
        // 总页数小于当前页数，应将当前页数设置为总页数
        if(this.totalPage < this.currPage) {
            this.currPage = this.totalPage;
        }
        // 当前页数小于1设置为1
        if(this.currPage < 1) {
            this.currPage = 1;
        }

        // 设置limit的参数
        this.dbIndex = (this.currPage - 1) * this.pageSize;
        this.dbNumber = this.pageSize;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getCurrPage() {
        return currPage;
    }

    public void setCurrPage(int currPage) {
        this.currPage = currPage;
    }

    public int getTotalSize() {
        return totalSize;
    }

    public void setTotalSize(int totalSize) {
        this.totalSize = totalSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getDbIndex() {
        return dbIndex;
    }

    public void setDbIndex(int dbIndex) {
        this.dbIndex = dbIndex;
    }

    public int getDbNumber() {
        return dbNumber;
    }

    public void setDbNumber(int dbNumber) {
        this.dbNumber = dbNumber;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
