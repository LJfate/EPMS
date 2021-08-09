package com.lj.controller;

import com.github.pagehelper.PageInfo;
import com.lj.domain.Department;
import com.lj.service.DepartmentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller

public class DepartmentController {
    //通过名称属性进行注入
    @Resource
    DepartmentService departmentService;
    ModelAndView mv;

    //查询所有部门信息，并跳转到dep_list.jsp页面
    @RequestMapping(value = "/department/findAll")
    public ModelAndView findAll(@RequestParam(defaultValue ="1") int page, @RequestParam(defaultValue = "5" ) int size,String nameSearch){
        List<Department> departmentList=departmentService.findAll(page,size,nameSearch);
        PageInfo pageInfos=new PageInfo(departmentList);
        mv=new ModelAndView();
        mv.addObject("pageInfos",pageInfos);
        mv.setViewName("admin/department/dep_list");
        return mv;
    }
    //根据id查询一条部门信息
    @RequestMapping(value = "department/findOne",method = RequestMethod.GET)
    public ModelAndView findOne(Integer did){
        Department department = departmentService.findOne(did);
        mv=new ModelAndView();
        mv.addObject("department",department);
        mv.setViewName("admin/department/dep_update");
        return mv;
    }
    //跳转到dep_add.jsp页面
    @RequestMapping(value = "/department/toAdd",method = RequestMethod.GET)
    public String toAdd(){
        return "admin/department/dep_add";
    }

    //dep_add页面的业务处理
    @RequestMapping(value = "/department/add",method = RequestMethod.POST)
    public String add(Department department){
        departmentService.add(department);
        return "redirect:findAll";
    }

    //删除
    @RequestMapping(value = "department/deleteById",method = RequestMethod.GET)
    public  String deleteById(Integer dep_id){
        departmentService.deleteById(dep_id);
        return "redirect:findAll";
    }
    //删除选中项操作
    @RequestMapping("department/delSelected")
    public String delSelected(HttpServletRequest request, HttpServletResponse response){
        /* 获取所有id */
        String[] dids = request.getParameterValues("did");
        //调用service删除
        departmentService.delSelectedDepartment(dids);
        //跳转到查询所有servlet
        return "redirect:findAll";
    }

    //更新
    @RequestMapping("department/update")
    public String update(Department department ){
        departmentService.update(department);
        //System.out.println(department.getDep_id());
        return "redirect:findAll";
    }
}
