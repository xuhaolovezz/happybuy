package com.happybuy.AOP;

import com.happybuy.annotation.SystemControllerLog;
import com.happybuy.annotation.SystemLoginLog;
import com.happybuy.entity.ControllerLog;
import com.happybuy.entity.LoginLog;
import com.happybuy.service.interfaces.LogService;
import com.happybuy.util.DateUtil;
import com.happybuy.util.IPDataHandler;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;
import java.util.UUID;

/**
 * 日志切面类，用来通知登录方法和操作方法
 * Created by 徐豪 on 2017/6/27/027.
 */
@Component
@Aspect
public class LogAspect {

    @Resource(name = "logService")
    private LogService logService;

    //拦截注解了SystemLoginLog的方法进行通知
    @Pointcut("@annotation(com.happybuy.annotation.SystemLoginLog)")
    public void loginLogPointCut(){}

    //拦截注解了SystemService的方法进行通知
    @Pointcut("@annotation(com.happybuy.annotation.SystemControllerLog)")
    public void controllerLogPointCut(){}

    /**
     * 返回通知，用来进行登录日志的记录
     * @param joinPoint
     * @throws Throwable
     */
    @AfterReturning(pointcut = "loginLogPointCut() ")
    public void afterReturning(JoinPoint joinPoint) throws Throwable {

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

        System.out.println("=====通知开始==========");

        //如果用户登录成功，将登录日志保存到数据库中
        if(request.getSession().getAttribute("id") != null){

            LoginLog loginLog = new LoginLog();

            //设置主键生成策略为UUID
            String id = String.valueOf(UUID.randomUUID());
            loginLog.setId(id);

            //获得登录的用户名
            String username = (String) request.getSession().getAttribute("username");
            loginLog.setUsername(username);

            //获得登录账号的权限
            Integer root = (Integer) request.getSession().getAttribute("root");
            loginLog.setRoot(root);

            //获得登录的IP
            String ip = request.getRemoteAddr();
            //获得登录的真实地址
            String realAddress = IPDataHandler.getAddressByIp(ip);

            //String realAddress = "测试地址";
            loginLog.setRequestIP(ip);
            loginLog.setRealAddress(realAddress);

            //获得当前时间
            String currTime = DateUtil.getCurrentDateTime();
            loginLog.setLastLoginTime(currTime);

            //获得登录类型
            String loginType = "";
            if( root == 0){
                loginType = "普通用户";
            } else {
                loginType = "管理员";
            }
            loginLog.setLoginType(loginType);

            //将日志记录保存到数据库中
            logService.saveOne(loginLog);
        }

    }

    /**
     * 前置通知，用来通知Controller层操作进行日志记录
     * @param joinPoint
     */
    @Before("controllerLogPointCut()")
    public void doBefore(JoinPoint joinPoint) throws Exception {

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();

        if(session.getAttribute("id") != null){

            ControllerLog controllerLog = new ControllerLog();

            //设置主键生成策略为UUID
            String id = String.valueOf(UUID.randomUUID());
            controllerLog.setId(id);

            //获得登录的用户名
            String username = (String) session.getAttribute("username");
            controllerLog.setUsername(username);

            //获得登录账号的权限
            Integer root = (Integer) request.getSession().getAttribute("root");
            //获得登录类型
            String accountType = "";
            if( root == 0){
                accountType = "普通用户";
            } else {
                accountType = "管理员";
            }
            controllerLog.setAccountType(accountType);

            //获得登录的IP
            String ip = request.getRemoteAddr();
            //获得登录的真实地址
            String realAddress = IPDataHandler.getAddressByIp(ip);

            //测试时统一写测试地址
            //String realAddress = "测试地址";
            controllerLog.setRequestIP(ip);
            controllerLog.setRealAddress(realAddress);

            //获得当前时间
            String currTime = DateUtil.getCurrentDateTime();
            controllerLog.setRequestTime(currTime);

            //获得方法名
            controllerLog.setMethodName(getMethodName(joinPoint));

            //获得方法的描述
            controllerLog.setDescription(getServiceLogDescription(joinPoint));

            //保存日志到数据库中
            logService.saveControllerLog(controllerLog);

        }

    }

    public  static String getMethodName(JoinPoint joinPoint)  throws Exception {
        //获得拦截的方法签名对象
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        //获得拦截的方法
        Method method = signature.getMethod();
        //获得方法上的SystemServiceLog注解的description值
        String methodName = method.getName();
        return methodName;
    }

    /**
     * 获取注解中对方法的描述
     */
    public  static String getServiceLogDescription(JoinPoint joinPoint)  throws Exception {
        //获得拦截的方法签名对象
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        //获得拦截的方法
        Method method = signature.getMethod();
        //获得方法上的SystemServiceLog注解的description值
        String description = method.getAnnotation(SystemControllerLog.class).description();
        return description;
    }

}
