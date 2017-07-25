package com.happybuy.util;

import java.util.UUID;

/**
 * Created by 徐豪 on 2017/7/3/003.
 */
public class UUIDUtil {

    public static String getUUID(){
        String uuid = String.valueOf(UUID.randomUUID());
        return uuid.replaceAll("\\-", "");
    }

}
