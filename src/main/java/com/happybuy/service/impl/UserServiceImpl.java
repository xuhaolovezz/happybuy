package com.happybuy.service.impl;

import com.happybuy.dao.IShopCartDao;
import com.happybuy.dao.IUserDao;
import com.happybuy.domain.User;
import com.happybuy.service.interfaces.ShopCartService;
import com.happybuy.service.interfaces.UserService;
import com.happybuy.util.EmailUtil;
import com.happybuy.util.EncryPasswordUtil;
import com.happybuy.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import java.util.UUID;

/**
 * 用户业务层接口类实现类
 * Created by 徐豪 on 2017/6/21/021.
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{

    @Autowired
    private IUserDao userDao;

    @Resource(name = "shopCartService")
    private ShopCartService shopCartService;

    /**
     * 保存一个用户
     * @param user
     */
    @Override
    public void saveUser(User user) {
        //设置user的主键id生成策略为UUID
        String id = UUIDUtil.getUUID();
        user.setId(id);
        //对传进来的用户密码进行加密运算，并且将加密后的密码和salt存到数据库中
        String str[] = EncryPasswordUtil.getPasswordAndSalt(user.getPassword());
        String password = str[0];
        String salt = str[1];
        user.setPassword(password);
        user.setSalt(salt);
        //新注册的用户设置未激活
        user.setState(0);
        //设置权限为普通用户
        user.setRoot(0);
        //生成激活码
        String regCode = UUIDUtil.getUUID();
        user.setRegCode(regCode);
        userDao.insertOne(user);
        //发送激活码
        try {
            EmailUtil.sendRegEmail(user.getEmail(),id,regCode);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    /**
     * 激活用户 成功返回true ，失败返回false
     * @param user
     */
    @Override
    public boolean activeUser(User user) {
        //根据激活码中带的用户id来查询数据库中存放的用户
        User dbUser = userDao.selectOneUser(user);
        //如果用户处于未激活状态，并且激活码和数据库中的激活码一样，表示激活成功
        if(dbUser.getState() == 0 && dbUser.getRegCode().equals(user.getRegCode())){
            //激活用户
            userDao.activeUser(user.getId());
            //给该用户添加一个购物车
            shopCartService.insertOne(user.getId());
            return true;
        }
        return false;
    }

    /**
     * 用户登录 返回null为登录失败
     * @param user
     * @return
     */
    @Override
    public User login(User user) {
        User dbUser = userDao.selectOneUser(user);
        //如果没有该用户
        if(dbUser == null){
            return null;
        }
       /* //如果用户没有激活，返回一个未激活的对象
        if(dbUser.getState() == 0){
            User noActiveUser = new User();
            noActiveUser.setState(0);
            return noActiveUser;
        }*/
        /**
         * 当用户名和密码都相同时返回该用户
         * 根据输入的密码和数据库中的salt值进行加密处理，
         * 和数据库中存放的密码进行比较
         */
        if(dbUser.getUsername() .equals(user.getUsername()) &&
                EncryPasswordUtil.validate(user.getPassword(),dbUser.getPassword(),dbUser.getSalt())){
            return dbUser;
        }
        return null;
    }

    /**
     * 根据条件查询用户
     */
    @Override
    public User findUser(User user) {
        return userDao.selectOneUser(user);
    }

    /**
     * 给指定用户发送邮箱验证码
     * @param id
     */
    @Override
    public void sendEmailCode(String id) {
        User user = userDao.selectEmailAndCode(id);
        String code = "";
        try {
            //发送邮箱验证码并且获取返回的验证码
            code = EmailUtil.sendHTMLEmail(user.getEmail(),user.getUsername(),user.getUsername());
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        user.setId(id);
        user.setCode(code);
        user.setCodeTime(System.currentTimeMillis());
        //将验证码和发送验证码的时间存到数据库中
        userDao.updateCode(user);
        //java.sql.JDBCType
    }

    /**
     * 验证输入的邮箱验证码和数据库中的验证码是否相同
     * @param codes 前台输入的验证码
     * @param id 验证的用户id
     * @return 1.success：验证成功
     *          2.failure：验证失败
     *          3.timeout：验证码超时
     */
    @Override
    public String validateCode(String codes, String id) {
        User user = userDao.selectEmailAndCode(id);
        //之前生成的验证码
        String code1 = user.getCode();
        long nowTime = System.currentTimeMillis();
        long codeTime = user.getCodeTime();
        long time = (nowTime - codeTime) / 1000;
        //如果验证码时间在10分钟内，有效，否则无效
        if(time <= 10 * 60){
            //输入的验证码正确
            if(code1.equals(codes)){
                return "success";
            }else {
                return "failure";
            }
        }else{ //超时
            return "timeout";
        }
    }

    /**
     * 修改用户密码
     * @param user
     */
    @Override
    public void rePass(User user) {
        //获得用户输入的密码
        String password = user.getPassword().trim();
        //根据原本密码经过SHA1加密后得到加密后的密码和salt值
        String[] str = EncryPasswordUtil.getPasswordAndSalt(password);
        String newPassword = str[0];
        String salt = str[1];
        user.setPassword(newPassword);
        user.setSalt(salt);
        //更新数据库的密码和salt值
        userDao.updatePassword(user);
    }

    /**
     * 根据用户名查询用户
     * @param username
     * @return
     */
    @Override
    public User selectByUserName(String username) {
        User user = new User();
        user.setUsername(username);
        user = userDao.selectOneUser(user);
        return user;
    }

    /**
     * 更新用户信息
     * @param user
     */
    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }
}
