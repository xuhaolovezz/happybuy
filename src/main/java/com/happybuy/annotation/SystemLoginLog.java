package com.happybuy.annotation;

import java.lang.annotation.*;

/**
 * 登录日志的注解，被此注解注解的方法只能是登录方法
 * Created by 徐豪 on 2017/6/27/027.
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SystemLoginLog {
    
}
