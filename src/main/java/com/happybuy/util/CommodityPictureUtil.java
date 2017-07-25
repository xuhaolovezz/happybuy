package com.happybuy.util;

import com.happybuy.domain.Commodity;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * 用来保存商品图片的工具类
 * Created by 徐豪 on 2017/6/23/023.
 */
public class CommodityPictureUtil {

    /**
     * 设置商品的图片
     * @param commodity 商品
     * @param pictures 4张商品图片
     * @param path 图片保存的路径
     * @return
     * @throws IOException
     */
    public static Commodity setCommodityPictures(Commodity commodity, MultipartFile[] pictures, String path) throws IOException {
        //设置商品的图片
        for(int i = 0; i < pictures.length; i++ ){
            if(pictures[i].getSize() > 0){
                //图片的原始名字
                String fileName = pictures[i].getOriginalFilename();
                //这是用来控制上传文件类型的
                if(fileName.endsWith("jpg") || fileName.endsWith("png") || fileName.endsWith("gif")){
                    //获得图片的后缀名
                    String str = fileName.substring(fileName.lastIndexOf("."),fileName.length());
                    //重命名图片
                    String newFileName = UUID.randomUUID().toString() + str;
                    System.out.println("newFileName：" + newFileName );
                    File targetFile = new File(path,newFileName);
                    if(!targetFile.exists()){
                        targetFile.mkdirs();
                    }
                    //将图片复制到目标路径
                    pictures[i].transferTo(targetFile);
                    if(i == 0){
                        commodity.setPicture1(newFileName);
                    } else if(i == 1){
                        commodity.setPicture2(newFileName);
                    } else if(i == 2){
                        commodity.setPicture3(newFileName);
                    } else {
                        commodity.setPicture4(newFileName);
                    }
                }
            }
        }
        return commodity;
    }

    /**
     * 设置商品描述图片
     * @param commodity 商品
     * @param descPictures 4张描述图片
     * @param path 图片保存的路径
     * @return
     * @throws IOException
     */
    public static Commodity setCommodityDescPictures(Commodity commodity, MultipartFile[] descPictures, String path) throws IOException {

        //设置商品的描述图片
        for(int i = 0; i < descPictures.length; i++ ){
            if(descPictures[i].getSize() > 0){
                //图片的原始名字
                String fileName = descPictures[i].getOriginalFilename();
                //这是用来控制上传文件类型的
                if(fileName.endsWith("jpg") || fileName.endsWith("png") || fileName.endsWith("gif")){
                    //获得图片的后缀名
                    String str = fileName.substring(fileName.lastIndexOf("."),fileName.length());
                    //重命名图片
                    String newFileName = UUID.randomUUID().toString() + str;
                    System.out.println("newFileName：" + newFileName );
                    File targetFile = new File(path,newFileName);
                    if(!targetFile.exists()){
                        targetFile.mkdirs();
                    }
                    //将图片复制到目标路径
                    descPictures[i].transferTo(targetFile);
                    if(i == 0){
                        commodity.setDescPicture1(newFileName);
                    } else if(i == 1){
                        commodity.setDescPicture2(newFileName);
                    } else if(i == 2){
                        commodity.setDescPicture3(newFileName);
                    } else {
                        commodity.setDescPicture4(newFileName);
                    }
                }
            }
        }
        return commodity;
    }

    /**
     * 设置商品图片和描述图片
     * @param commodity 商品
     * @param pictures 4张商品图片
     * @param descPictures 4张商品描述图片
     * @param path 图片保存的路径
     * @return
     * @throws IOException
     */
    public static Commodity setCommodityPicturesAndDescPictures(Commodity commodity,MultipartFile[] pictures,
                                                                MultipartFile[] descPictures, String path) throws IOException {
        commodity = setCommodityPictures(commodity,pictures,path);
        commodity = setCommodityDescPictures(commodity, descPictures, path);
        return commodity;
    }

}
