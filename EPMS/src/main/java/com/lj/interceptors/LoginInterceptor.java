package com.lj.interceptors;

import com.alibaba.druid.support.spring.mvc.StatHandlerInterceptor;
import com.lj.service.UserInfoService;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


//登录拦截器
public class LoginInterceptor implements HandlerInterceptor {

    // 预处理回调方法，实现处理器的预处理
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 在拦截点执行前拦截，如果返回true则不执行拦截点后的操作（拦截成功）
        // 返回false则不执行拦截
        HttpSession session = request.getSession();
        //String uri = request.getRequestURI(); // 获取登录的uri，这个是不进行拦截的
        //if(session.getAttribute("LOGIN_USER")!=null || uri.indexOf("system/login")!=-1) {// 说明登录成功 或者 执行登录功能
        if (session.getAttribute("user_id")!= null) {
            //System.out.println("用户id："+session.getAttribute("user_id"));
            // 登录成功不拦截
            return true;
        }
        if (session.getAttribute("admin_id")!= null) {
            //System.out.println("用户id："+session.getAttribute("user_id"));
            // 登录成功不拦截
            return true;
        }
            // 拦截后进入登录页面
            response.sendRedirect(request.getContextPath()+"/user/toLogin");
            return false;




    }



    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
