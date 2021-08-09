package com.lj.controller;
import com.github.pagehelper.PageInfo;
import com.lj.domain.Employee;
import com.lj.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
      ModelAndView mv;
    @Autowired
    private EmployeeService employeeService ;

    /**
     * 查询所有员工
     * @return
     */
//    @RequestMapping("/findAll")//当前页page，页面大小size
//    public ModelAndView findAll(@RequestParam(defaultValue ="1") int page,@RequestParam(defaultValue = "5" ) int size){
//        List<Employee> employeeList =employeeService.findAll(page, size);
//        PageInfo pageInfos=new PageInfo(employeeList);
//        mv=new ModelAndView();
//        mv.addObject("pageInfos",pageInfos);
//        mv.setViewName("/employee/emp_list");
//        return mv;
//    }
    @RequestMapping(value = "/findAll")//当前页page，页面大小size
    public ModelAndView findAll(@RequestParam(defaultValue ="1") int page,@RequestParam(defaultValue = "5" ) int size,String nameSearch,HttpServletRequest request) {


        List<Employee> employeeList = employeeService.findAll(page, size, nameSearch);
        // List<Employee> employeeList =employeeService.findAll(page, size);
        PageInfo pageInfos=new PageInfo(employeeList);
        mv=new ModelAndView();
        mv.addObject("pageInfos",pageInfos);
        int user_identity=Integer.parseInt((String) request.getSession().getAttribute("user_identity"));
        if (user_identity==1){
            //管理员
        mv.setViewName("admin/employee/emp_list");
        }else {
            //普通用户
            int user_id = (int)request.getSession().getAttribute("user_id");
            Employee one = employeeService.findOne(user_id);
            mv.addObject("employee",one);
            mv.setViewName("commonuser/employee/emp_inf");
        }
        return mv;
    }

    /**
     * 查询单个员工
     * @param eid
     * @return
     */
    @RequestMapping("/findOne")
    public  ModelAndView findOne( Integer eid){
        mv=new ModelAndView();
        Employee one = employeeService.findOne(eid);
        mv.addObject("employee",one);
        mv.setViewName("admin/employee/emp_update");
        return mv;
    }
    @RequestMapping("/deleteById")
    public String deleteById(Integer emp_id){
        employeeService.deleteById(emp_id);
        return "redirect:findAll";
    }
    @RequestMapping("/update")
    public String update(Employee employee){
        employeeService.update(employee);
        return "redirect:findAll";
    }
    //处理per_add.jsp提交的信息
    @RequestMapping("/add")
    public String add(Employee employee){
        employeeService.add(employee);
        return "redirect:findAll";
    }
    //跳转到per_add.jsp页面
    @RequestMapping("toAdd")
    public String toAdd(){
        return "admin/employee/emp_add";
    }

    //删除选中项操作
    @RequestMapping("delSelected")
    public String delSelected(HttpServletRequest request, HttpServletResponse response){
        /* 获取所有id */
        String[] eids = request.getParameterValues("eid");
        //调用service删除
        employeeService.delSelectedEmployee(eids);
        //跳转到查询所有servlet
        return "redirect:findAll";
    }
    //	 员工自己修改密码时跳转的页面
    @RequestMapping(value="/myupdate",method=RequestMethod.GET)
    public String update(Model model, HttpSession session){
        int user_id = (int) session.getAttribute("user_id");
        Employee one = employeeService.findOne(user_id);
        System.out.println(one.getemp_id());
        model.addAttribute("employee",one);
        return "admin/employee/emp_myupdate";
    }
    @RequestMapping("/updatezhanghu")
    public String updateupdatezhanghu(Employee employee){
        employeeService.updatezhanghu(employee);
        return "redirect:findAll";
    }
}
