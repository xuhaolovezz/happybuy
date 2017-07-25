package com.happybuy.util;

import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Random;

/**
 * 用来进行密码的加密，使用sha1+salt
 * 此类可以实现用户注册时密码加密
 * 用户登录时验证密码
 */
public class EncryPasswordUtil {
    private final static String[] hexDigits = { "0", "1", "2", "3", "4", "5",
            "6", "7", "8", "9", "A", "B", "C", "D", "E", "F" };
    private static MessageDigest md5 ;
    /**
     * 获取一个随机盐值
     * @return
     */
    public static String getSalt(){
        Random ranGen = new SecureRandom();
        byte[] aseKey = new byte[12];
        //生成随机数
        ranGen.nextBytes(aseKey);
        String salt = "";
        try {
            //使用UTF-8编码
            //salt = new String(aseKey,"utf-8");
            salt = byteArrayToHexString(aseKey);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return salt;
    }

    public static void main(String[] args) {
        String password = "admin";
        String[] str = getPasswordAndSalt(password);
        if(validate("admin",str[0],str[1])){
            System.out.println("true");
        } else{
            System.out.println("false");
        }
    }
    /**
     * 将传进来的初始密码进行加密
     * @param password 用户传过来的初始密码
     * @return 返回String[0]是加密后的密码
     * 	       返回String[1]是要放在数据库中的盐值
     */
    public static String[] getPasswordAndSalt(String password){
        String[] str = new String[2];
        String salt = getSalt();
        //将初始密码和salt拼接并且进行sha1计算
        password += salt;

        try {
            byte[] srcBytes = password.getBytes("utf-8");
            md5 = MessageDigest.getInstance("SHA1");
            //更新消息摘要
            md5.update(srcBytes);
            //完成hash计算，得到加密后的密码
            byte[] passwordBytes = md5.digest();
            //password = new String(passwordBytes,"utf-8");
            password = byteArrayToHexString(passwordBytes);
            //将加密后的密码和盐值返回
            str[0] = password;
            str[1] = salt;
            System.out.println("密码为："+password);
            System.out.println("salt为："+salt);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return str;
    }

    /**
     * 将传进来的密码和salt拼接然后进行hash运算，与数据库的密码进行比较
     * @param password 用户输入的密码
     * @param salt 数据库存放的盐值
     * @param dbPassword 数据库存放的加密过的密码
     * @return
     */
    public static boolean validate(String password,String dbPassword,String salt){

        password +=salt;
        try {
            byte[] passwordBytes = password.getBytes("utf-8");
            md5 = MessageDigest.getInstance("SHA1");
            md5.update(passwordBytes);
            byte[] resultBytes = md5.digest();
            password = byteArrayToHexString(resultBytes);
            if(password.equals(dbPassword)){
                return true;
            } else{
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 转换字节数组为16进制字串
     * @param b 字节数组
     * @return 16进制字串
     */
    private static String byteArrayToHexString(byte[] b) {
        StringBuffer resultSb = new StringBuffer();
        for (int i = 0; i < b.length; i++) {
            resultSb.append(byteToHexString(b[i]));
        }
        return resultSb.toString();
    }

    private static String byteToHexString(byte b) {
        int n = b;
        if (n < 0)
            n = 256 + n;
        int d1 = n / 16;
        int d2 = n % 16;
        return hexDigits[d1] + hexDigits[d2];
    }

}
