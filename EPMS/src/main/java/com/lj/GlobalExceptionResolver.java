package com.lj;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
通过判断控制器方法上是否有ResponseBody注解，来判断方法返回的是是json对象还是视图

 */
//全局异常处理器，全局异常统一处理
@Component
public class GlobalExceptionResolver  implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("error");
        mv.addObject("code",400);
        mv.addObject("msg","系统错误，请稍后再试");
        //判断HandlerMethod
        if (o instanceof HandlerMethod){
        //类型转换
            HandlerMethod handlerMethod = (HandlerMethod) o;
            //获取方法上的ResponseBody注解
            ResponseBody annotation = handlerMethod.getMethod().getAnnotation(ResponseBody.class);
            //判断注解是否存在
            if (null==annotation){
                /*
                方法返回视图
                 */
//                if (e instanceof ParamsException){
//
//
//                }
            }

        }
        return null;
    }
}
