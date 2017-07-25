package com.happybuy.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 用户未登录拦截器，防止未登录用户访问用户资料页面
 * Created by 徐豪 on 2017/6/26/026.
 */
public class UserNoLoginInterceptor implements HandlerInterceptor{

    public String[] allowUrls;//还没发现可以直接配置不拦截的资源，所以在代码里面来排除

    public void setAllowUrls(String[] allowUrls) {
        this.allowUrls = allowUrls;
    }

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        System.out.println("=======拦截到方法=======");
        String path = httpServletRequest.getContextPath();
        /*String uri = httpServletRequest.getRequestURI();
        System.out.println("=======请求路径为:"+uri);
        System.out.println("=======项目根路径为:"+path);
        //如果是跳转到登录页面或者验证登录，就放行
        if(uri.equals("/happybuy/user/regUser") || uri.equals("/happybuy/user/existUserName") ||
                uri.equals("/happybuy/user/userActivate") || uri.equals("/happybuy/user/userLogin")){
            return true;
        }*/
        String requestUrl = httpServletRequest.getRequestURI().replace(httpServletRequest.getContextPath(), "");

        System.out.println(requestUrl);
        if(null != allowUrls && allowUrls.length>=1) {
            for (String url : allowUrls) {
                if (requestUrl.contains(url)) {
                    return true;
                }
            }
        }
            if(httpServletRequest.getSession().getAttribute("id") == null &&
                httpServletRequest.getSession().getAttribute("username") == null){
            System.out.println("=======用户未登录=======");
            httpServletResponse.sendRedirect(path + "/login.jsp?returnURL=" + requestUrl);
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
