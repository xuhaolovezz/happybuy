package com.happybuy.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期操作的工具类
 * Created by 徐豪 on 2017/6/8/008.
 */
public class DateUtil {

    public static SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");
    public static SimpleDateFormat sdfDateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    /**
     * 获得当前日期 格式为yyyy-MM-dd
     * @return
     */
    public static String getCurrentDate(){
        Date date = new Date();
        return sdfDate.format(date);

    }

    /**
     * 获得当前日期时间 格式为yyyy-MM-dd HH:mm:ss
     * @return
     */
    public static String getCurrentDateTime(){
        Date date = new Date();
        return sdfDateTime.format(date);
    }

    /**
     * 格式化日期 返回格式为yyyy-MM-dd
     * @return
     */
    public static String formatDate(Date date){
        return sdfDate.format(date);
    }

    /**
     * 格式化日期 返回格式为yyyy-MM-dd HH:mm:ss
     * @return
     */
    public static String formatDateTime(Date date){
        return sdfDateTime.format(date);
    }
}
