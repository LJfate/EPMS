package com.lj.controller;

import com.github.pagehelper.PageInfo;
import com.lj.domain.Employee;
import com.lj.domain.User_inf;
import com.lj.service.EmployeeService;
import com.lj.service.UserInfoService;
import com.lj.util.JsonResult;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户登录控制
 */
@Controller
public class UserController {
    //按类型注入，多个相同类型会冲突
    @Autowired
    UserInfoService userInfoService;
    @Autowired
    EmployeeService employeeService;
    ModelAndView mv;
    //请求映射
    @RequestMapping("/")
    public String toLogin1(){
        return "login";
    }
    @RequestMapping("user/")
    public String toLogin2(){
        return "login";
    }
    @RequestMapping("user/toLogin")
    public String toLogin3(){
        return "login";
    }
    //跳转到welcome.jsp
    @RequestMapping(value="/welcome")
    public String welcome(){
        String blank = "welcome";
        return blank;
    }
    //退出操作
    @RequestMapping("user/tc")
    public String tc(HttpSession session){
        session.invalidate();
        return "login";
    }
    //测试login异步登录

    @RequestMapping(value = "user/login.do", method = RequestMethod.POST)
    @ResponseBody//返回响应体
    public Map login(User_inf userInfo, @Param("password") String password, String tip, String input_code, HttpServletRequest request) {
        Map map = new HashMap();
        map.put("login",20);
        System.out.println("输入的验证码："+input_code);
        System.out.println("密码："+userInfo.getPassword()+"密码2："+password);
        HttpSession session = request.getSession();
        //在session中（从CheckCodeController类中上传到session中）获取字符串
        String code = (String) session.getAttribute("verifyCode");
        //校验验证码是否一致
        if (!code.equalsIgnoreCase(input_code)) {
            request.setAttribute("login_msg", "验证码错误，请重试！");
            map.put("login", 0);//验证码错误
            return map;
        }
        //与数据库中数据验证是否一致
        User_inf user = userInfoService.findByName(userInfo.getLogin_name());
        String login_name = user.getLogin_name();
        String password1 = user.getPassword();
        // 调用业务逻辑组件判断用户是否可以登录
        if ("1".equals(tip)) {
            if (user == null) {
                map.put("login", 2);
                return map; // 2-用户名不存在
            }

            if (!user.getPassword().equals(password)) {
                map.put("login", 3);
                return map; // 3-密码错误
            } else {
                session.setAttribute("user_name", user.getLogin_name());
                session.setAttribute("user_id", user.getId());
                session.setAttribute("user_pwd", user.getPassword());
                session.setAttribute("user_identity", tip);
                // System.out.println(session.getAttribute("user_id"));
                System.out.println(session.getAttribute("user_identity"));//user_identity
                map.put("login", 1);
                return map; // 1-成功
            }
            //普通员工
        }   else {
            Employee login = employeeService.login(login_name, password);
            if (login != null) {
                session.setAttribute("user_name", login.getLogin_name());
                session.setAttribute("user_id", login.getemp_id());
                session.setAttribute("user_pwd", login.getPassword());
                session.setAttribute("user_identity", tip);
                System.out.println(session.getAttribute("user_identity"));
                map.put("login", 1);
                return map; // 1-成功
            }
            if (user == null) {
                map.put("login", 2);
                return map; // 2-用户名不存在
            }

            if (!user.getPassword().equals(password)) {
                map.put("login", 3);
                return map; // 3-密码错误
            }
        }
        return map;
    }
    //结束测试

    //登陆验证，成功跳转到list页面，失败跳转到login.jsp页面
    @RequestMapping("user/login")
    public String login(User_inf userInfo, String input_code, HttpServletRequest  request,@RequestParam("tip") String tip) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        HttpSession session = request.getSession();
        //防止登录后，重新加载时，报500错误
        if (session.getAttribute("user_name")!=null){
            return  "index";
        }
        //在session中（从CheckCodeController类中上传到session中）获取字符串
        String code=(String) session.getAttribute("verifyCode");
        //校验验证码是否一致
        if (!code.equalsIgnoreCase(input_code)){
            request.setAttribute("login_msg","验证码错误，请重试！");
           return "login";
        }
        //与数据库中数据验证是否一致
        String login_name=userInfo.getLogin_name();
        String password = userInfo.getPassword();

//        //对密码进行加密
//        String pwd = MyMD5Util.getEncryptedPwd(password);
//        //MyMD5Util.validPassword(,)
//        System.out.println(pwd);

// 调用业务逻辑组件判断用户是否可以登录
        if("1".equals(tip)) {
            User_inf login = userInfoService.login(login_name,password);
            if (login!=null){
                session.setAttribute("user_name",login.getLogin_name());
                session.setAttribute("user_id",login.getId());
                session.setAttribute("user_pwd",login.getPassword());
                session.setAttribute("user_identity",tip);
                // System.out.println(session.getAttribute("user_id"));
                System.out.println(session.getAttribute("user_identity"));//user_identity

                return  "index";
            }else {
                request.setAttribute("login_msg","用户名或密码不正确！");
                return "/login";
            }
        //普通员工
        }else {
         Employee login = employeeService.login(login_name,password);
            if (login!=null){

                session.setAttribute("user_name",login.getLogin_name());
                session.setAttribute("user_id",login.getemp_id());
                session.setAttribute("user_pwd",login.getPassword());
                session.setAttribute("user_identity",tip);
                 System.out.println(session.getAttribute("user_identity"));
                return  "index";
            }else {
                request.setAttribute("login_msg","用户名或密码不正确！");
                return "/login";
            }
        }

    }
    //查询所有用户信息
    @RequestMapping(value = "user/findAll",method = RequestMethod.POST)//当前页page，页面大小size
    public ModelAndView findAll(@RequestParam(defaultValue ="1") int page, @RequestParam(defaultValue = "5" ) int size, String nameSearch) {
        //获取所有用户信息
        List<User_inf> userList = userInfoService.findAll(page, size, nameSearch);
        //使用分页插件，将·查询的所有用户信息进行分页
        PageInfo pageInfos=new PageInfo(userList);
        mv=new ModelAndView();
        //添加
        mv.addObject("pageInfos",pageInfos);
        mv.setViewName("admin/user/user_list");
        return mv;
    }
    @RequestMapping(value = "user/findAll",method = RequestMethod.GET)//当前页page，页面大小size
    public ModelAndView findAll(@RequestParam(defaultValue ="1") int page, @RequestParam(defaultValue = "5" ) int size) {
        //获取所有用户信息
        List<User_inf> userList = userInfoService.findAll(page, size);
        PageInfo pageInfos=new PageInfo(userList);
        mv=new ModelAndView();
        mv.addObject("pageInfos",pageInfos);
        mv.setViewName("admin/user/user_list");
        return mv;
    }
    /**
     * 查询单个用户
     * @param id
     * @return
     */
    @RequestMapping("user/findOne")
    public  ModelAndView findOne(Integer id){
        mv=new ModelAndView();
        User_inf one = userInfoService.findOne(id);
        mv.addObject("userInf",one);
        mv.setViewName("admin/user/user_update");
        return mv;
    }
    @RequestMapping("user/deleteById")
    public String deleteById(Integer id){
        userInfoService.deleteById(id);
        return "redirect:findAll";
    }
    @RequestMapping("user/update")
    public String update(User_inf userInf){
        userInfoService.update(userInf);
        return "redirect:findAll";
    }
    //处理user_add.jsp提交的信息
    @RequestMapping("user/add")
    public String add(User_inf userInf){
        userInfoService.add(userInf);
        return "redirect:findAll";
    }
    //跳转到user_add.jsp页面
    @RequestMapping("user/toAdd")
    public String toAdd(){
        return "admin/user/user_add";
    }

    //删除选中项操作
    @RequestMapping("user/delSelected")
    public String delSelected(HttpServletRequest request, HttpServletResponse response){
        /* 获取所有id */
        String[] uids = request.getParameterValues("uid");
        System.out.println(uids);
        //调用service删除
        userInfoService.delSelectedUser(uids);
        //跳转到查询所有servlet
        return "redirect:findAll";
    }
//    //	 用户自己修改密码时跳转的页面
//    @RequestMapping(value="/user/myupdate",method=RequestMethod.GET)
//    public String update(Model model, HttpSession session){
//        int user_id = (int) session.getAttribute("user_id");
//        User_inf one = userInfoService.findOne(user_id);
//        System.out.println(one.getLogin_name());
//        model.addAttribute("userInf",one);
//        return "admin/user/user_update";
//    }
}
