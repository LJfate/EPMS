package com.lj.controller;

import com.github.pagehelper.PageInfo;
import com.lj.domain.Salary;
import com.lj.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/salary")
public class SalaryController {
      ModelAndView mv;
    @Autowired
    private SalaryService salaryService;

    /**
     * 查询所有工资信息
     * @return
     */
    @RequestMapping(value = "/findAll")
    public ModelAndView findAll(@RequestParam(defaultValue ="1") int page, @RequestParam(defaultValue = "5" ) int size, String nameSearch,HttpServletRequest request){

        mv=new ModelAndView();
        int user_identity=Integer.parseInt((String) request.getSession().getAttribute("user_identity"));
        if (user_identity==1){
            //管理员
            List<Salary> salaryList = salaryService.findAll(page,size,nameSearch);
            PageInfo pageInfo = new PageInfo(salaryList);
            mv.addObject("pageInfo",pageInfo);

        }else {
            //普通用户
            int emp_id=(int)request.getSession().getAttribute("user_id");
            List<Salary> byEmpId = salaryService.findByEmpId(emp_id);
            PageInfo pageInfo = new PageInfo(byEmpId);
            mv.addObject("pageInfo",pageInfo);
        }
         mv.setViewName("admin/salary/sal_list");
         return mv;
    }

    /**
     * 查询单条工资信息，然后跳转到sal_update.jsp
     * @param id
     * @return
     */
    @RequestMapping("/findOne")
    public  ModelAndView findOne( Integer id){
        mv=new ModelAndView();
        Salary one = salaryService.findOne(id);
        mv.addObject("salary",one);
        mv.setViewName("admin/salary/sal_update");
        return mv;
    }

    @RequestMapping("/deleteById")
    public String deleteById(Integer id){
        salaryService.deleteById(id);
        return "redirect:findAll";
    }

    @RequestMapping("/update")
    public String update(Salary salary){
        int basic=salary.getBasic_wages();
        int sub= salary.getSubsidies();
        salary.setReal_wages(basic+sub);
        salaryService.update(salary);
        return "redirect:findAll";
    }
    //跳转
    @RequestMapping("toAdd")
    public String toAdd(){
        return "admin/salary/sal_add";
    }
    //添加
    @RequestMapping("/add")
    public String add(Salary salary ){
        //System.out.println("控制层：月份为"+salary.getSal_month());
       int basic=salary.getBasic_wages();
       int sub= salary.getSubsidies();
        salary.setReal_wages(basic+sub);
        salaryService.add(salary);
        return "redirect:findAll";
    }
    @RequestMapping(value = "delSelected")
    public String delSelected(HttpServletRequest request){
        String[] sids = request.getParameterValues("sid");
        salaryService.delSelectedSalary(sids);
        return "redirect:findAll";
    }

}
