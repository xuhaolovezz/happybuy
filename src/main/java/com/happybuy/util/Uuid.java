package com.happybuy.util;

import java.util.UUID;

/**
 * Created by 徐豪 on 2017/6/22/022.
 */
public class Uuid {
    public static void main(String[] args) {
        String uuid = String.valueOf(UUID.randomUUID());
        System.out.println(uuid.replaceAll("\\-", ""));
        System.out.println(System.currentTimeMillis());
    }
}
