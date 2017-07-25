package com.happybuy.util;


import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.File;
import java.util.Properties;
import java.util.Random;

/**
 * 此类是用来发送邮件的工具类
 * Created by Administrator on 2017/5/18/018.
 */
public class EmailUtil {

    private static String host= "smtp.163.com";                     //邮件服务器
    private static String defaultEncoding = "UTF-8";                //默认编码格式
    private static String username = "xh1184243433@163.com";      //用来发送邮件的用户名
    private static String password = "xh1590123";                  //密码
    private static int port = 25;                                   //端口号

    private static JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
    private static Properties prop = new Properties();

    //加载邮件设置
    static {
        mailSender.setHost(host);
        mailSender.setDefaultEncoding(defaultEncoding);
        mailSender.setUsername(username);
        mailSender.setPassword(password);
        mailSender.setPort(port);
        prop.put("mail.smtp.auth","true");
        prop.put("mail.debug","true");
        prop.put("mail.smtp.timeout","0");
        mailSender.setJavaMailProperties(prop);
    }

    private static String createCode(){
        StringBuffer code = new StringBuffer();
        Random random = new Random();
        String[] arr = {
                "A","B","C","D","E","F","G","H","I","J","K","L","M",
                "N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
                "0","1","2","3","4","5","6","7","8","9"
        };
        for(int i = 0; i < 6; i++){
            int number = random.nextInt(36);
            code.append(arr[number]);
        }
        return code.toString();
    }

    //发送简单邮件
    public static String sendSimpleMail(String email){
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom("xh1184243433@163.com");
        mailMessage.setTo(email);
        mailMessage.setSubject("测试简单文本邮件发送！");
        mailMessage.setText("测试我的简单邮件发送机制");
        mailSender.send(mailMessage);
        return "sendSuccess";
    }

    //发送HTML邮件
    public static String sendHTMLEmail(String email,String username,String id) throws MessagingException {
        MimeMessage mailMessage = mailSender.createMimeMessage();
        MimeMessageHelper messageHelper = new MimeMessageHelper(mailMessage);
        messageHelper.setTo(email);
        String code = createCode();     //生成验证码
        messageHelper.setFrom("xh1184243433@163.com");
        //messageHelper.setFrom("2226704624@qq.com");
        messageHelper.setSubject("修改密码验证");
        //true表示启动HTML格式的邮件
        messageHelper.setText(
                "<html>\n" +
                        "<head>\n" +
                        "    <style type=\"text/css\">\n" +
                        "        .container{\n" +
                        "            width: 720px;\n" +
                        "            background-color: rgba(9, 33, 75, 0.81);\n" +
                        "            margin: 0px auto;\n" +
                        "            height: 600px;\n" +
                        "        }\n" +
                        "        ._body{\n" +
                        "            padding: 40px 0 0 60px;\n" +
                        "            line-height: 3.5em;\n" +
                        "        }\n" +
                        "        .span_1,.span_2{\n" +
                        "            font-size: 30px;\n" +
                        "            color: white;\n" +
                        "        }\n" +
                        "        .span_3{\n" +
                        "            font-size: 36px;\n" +
                        "            color: rgba(84, 243, 26, 0.81);\n" +
                        "            font-weight: bold;\n" +
                        "        }\n" +
                        "        .span_4,.span_5{\n" +
                        "            font-size: 18px;\n" +
                        "            color: rgba(188, 195, 200, 0.81);\n" +
                        "        }\n" +
                        "    </style>\n" +
                        "</head>\n" +
                        "<body>\n" +
                        "<div class=\"container\">\n" +
                        "    <div class=\"_body\">\n" +
                        "        <span class=\"span_4\">如果"+id+"不是您的账号，请不要点击邮件的任何内容。</span><br>\n" +
                        "        <span class=\"span_1\">亲爱的"+username+"，你好：</span><br>\n" +
                        "        <span class=\"span_2\">以下是您的验证码</span><br><br>\n" +
                        "        <span class=\"span_3\">"+code+"</span><br><br>\n" +
                        "        <span class=\"span_4\">我们收到您的修改密码请求，请用上面的验证码验证您的账号归属</span><br>\n" +
                        "        <span class=\"span_5\"><i>请注意：验证码将在十分钟后过期，请尽快验证！</i></span><br>\n" +
                        "    </div>\n" +
                        "</div>\n" +
                        "</body>\n" +
                        "</html>"
        ,true);
        mailSender.send(mailMessage);
        return code;
    }

    /**
     * 发送注册激活码邮件
     * @param email 要发送的邮箱
     * @param id    注册用户的主键
     * @param regCode 注册码
     */
    public static String sendRegEmail(String email, String id, String regCode) throws MessagingException {
        MimeMessage mailMessage = mailSender.createMimeMessage();
        MimeMessageHelper messageHelper = new MimeMessageHelper(mailMessage);
        messageHelper.setTo(email);
        messageHelper.setFrom("xh1184243433@163.com");
        //messageHelper.setFrom("2226704624@qq.com");
        messageHelper.setSubject("点击链接激活账号");
        //true表示启动HTML格式的邮件
        messageHelper.setText(
                "<html>\n" +
                        "<head>\n" +
                        "    <style type=\"text/css\">\n" +
                        "        .container{\n" +
                        "            width: 720px;\n" +
                        "            background-color: rgba(9, 33, 75, 0.81);\n" +
                        "            margin: 0px auto;\n" +
                        "            height: 600px;\n" +
                        "        }\n" +
                        "        ._body{\n" +
                        "            padding: 40px 0 0 60px;\n" +
                        "            line-height: 3.5em;\n" +
                        "        }\n" +
                        "        .span_1,.span_2{\n" +
                        "            font-size: 30px;\n" +
                        "            color: white;\n" +
                        "        }\n" +
                        "        .span_3{\n" +
                        "            font-size: 36px;\n" +
                        "            color: rgba(84, 243, 26, 0.81);\n" +
                        "            font-weight: bold;\n" +
                        "        }\n" +
                        "        .span_4,.span_5{\n" +
                        "            font-size: 18px;\n" +
                        "            color: rgba(188, 195, 200, 0.81);\n" +
                        "        }\n" +
                        "    </style>\n" +
                        "</head>\n" +
                        "<body>\n" +
                        "<div class=\"container\">\n" +
                        "    <div class=\"_body\">\n" +
                        "        <span class=\"span_4\">请点击下面的链接来激活您的账号</span><br>\n" +
                        "        <span class=\"span_4\"><a style='color:white;' " +
                        "       href=http://39jtte.natappfree.cc/happybuy/user/userActivate?id="+id+"&regCode=" +
                        regCode + ">localhost:6666/user/userActivate?id="+id+"&regCode=" +
                        regCode +"</a></span><br><br>\n" +
                        "        <span class=\"span_4\">请尽快激活！</span><br>\n" +
                        "    </div>\n" +
                        "</div>\n" +
                        "</body>\n" +
                        "</html>"
                ,true);
        mailSender.send(mailMessage);
        return "";
    }

    //发送商品降价通知
    public static void sendSaleNotice(String username,String email,Double salePrice, String commodityId, String commodityName, String commodityDesc) throws MessagingException {
        MimeMessage mailMessage = mailSender.createMimeMessage();
        MimeMessageHelper messageHelper = new MimeMessageHelper(mailMessage);
        messageHelper.setTo(email);
        messageHelper.setFrom("xh1184243433@163.com");
        messageHelper.setSubject("商品降价通知");
        //true表示启动HTML格式的邮件
        messageHelper.setText(
                "<html>\n" +
                        "<head>\n" +
                        "    <style type=\"text/css\">\n" +
                        "        .container{\n" +
                        "            width: 720px;\n" +
                        "            margin: 0px auto;\n" +
                        "            height: 600px;\n" +
                        "        }\n" +
                        "        .body{\n" +
                        "            padding: 40px 0 0 60px;\n" +
                        "            line-height: 3.5em;\n" +
                        "        }\n" +
                        "        .commName{\n" +
                        "            color: #f10f18;\n" +
                        "        }\n" +
                        "    </style>\n" +
                        "</head>\n" +
                        "<body>\n" +
                        "   <div class=\"container\">\n" +
                        "     <div class=\"body\">\n" +
                        "       <h3>亲爱的"+username+"：</h3>\n" +
                        "       <span style='font-size: 18px'>您收藏的商品<span class='commName'>"+commodityName+"</span>\n" +
                        "       已经降价<span class='commName'>"+salePrice+"元</span>，" +
                        "       点击链接购买商品吧</span><br>" +
                        "       <a href='http://39jtte.natappfree.cc/happybuy/item/details/"+commodityId+"' target='_blank' >" +
                                commodityDesc+ "</a>\n" +
                        "     </div>\n" +
                        "  </div>\n" +
                        "</body>\n" +
                        "</html>"
                ,true);
        mailSender.send(mailMessage);
    }

    //发送带图片的HTML邮件
    public static String sendHTMLEmailWithImg(String email) throws MessagingException {
        MimeMessage mailMessage = mailSender.createMimeMessage();
        //true时才能嵌套图片
        MimeMessageHelper messageHelper = new MimeMessageHelper(mailMessage,true);
        messageHelper.setTo(email);
        messageHelper.setFrom("xh1184243433@163.com");
        //messageHelper.setFrom("2226704624@qq.com");
        messageHelper.setSubject("测试HTML邮件");
        //true表示启动HTML格式的邮件
        messageHelper.setText(
                "<html>" +
                        "<head></head>" +
                        "<h1>测试版</h1><br>" +
                        "<img width=800px height=600px src=\"cid:aaa\" />" +
                        "</html>"
                ,true);
        FileSystemResource img = new FileSystemResource(new File("G:/IMG_2743.JPG"));
        //嵌入图片<img src=\"cid:aaa\"/>，其中cid:是固定的写法，而aaa是一个contentId
        messageHelper.addInline("aaa",img);
        mailSender.send(mailMessage);
        return "sendSuccess";
    }

    //发送带附件的HMTL邮件
    public static String sendHTMLEmailWithFile(String email) throws MessagingException {
        MimeMessage mailMessage = mailSender.createMimeMessage();
        //true时才能嵌套图片
        MimeMessageHelper messageHelper = new MimeMessageHelper(mailMessage,true);
        messageHelper.setTo(email);
        messageHelper.setFrom("xh1184243433@163.com");
        messageHelper.setSubject("测试HTML邮件");
        //true表示启动HTML格式的邮件
        messageHelper.setText(
                "<html>" +
                        "<head></head>" +
                        "<h1>测试版</h1><br>" +
                        "</html>"
                ,true);
        FileSystemResource file = new FileSystemResource(new File("G:/Editplus-v3.30.397.rar"));
        //嵌套附件
        messageHelper.addAttachment("Editplus-v3.30.397.rar",file);
        mailSender.send(mailMessage);
        return "sendSuccess";
    }
}
