package com.happybuy.annotation;

import java.lang.annotation.*;

/**
 * 用来记录控制层操作的注解
 * Created by 徐豪 on 2017/6/27/027.
 */
@Target(ElementType.METHOD)
@Documented
@Retention(RetentionPolicy.RUNTIME)
public @interface SystemControllerLog {

    /**
     * 该方法的描述
     * @return
     */
    String description();

}
