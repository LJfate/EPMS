package com.lj.controller;

import com.github.pagehelper.PageInfo;
import com.lj.domain.Attendance;
import com.lj.service.AttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {
      ModelAndView mv;
    @Autowired
    private AttendanceService attendanceService;

    /**
     * 查询所有
     * @return
     */
    @RequestMapping(value = "/findAll")
    public ModelAndView findAll(@RequestParam(defaultValue ="1") int page, @RequestParam(defaultValue = "5" ) int size, String nameSearch,HttpServletRequest request){

        mv=new ModelAndView();
        int user_identity=Integer.parseInt((String) request.getSession().getAttribute("user_identity"));
        if (user_identity==1){
            //管理员
            List<Attendance> attendanceList = attendanceService.findAll(page,size,nameSearch);
            PageInfo pageInfo = new PageInfo(attendanceList);
            mv.addObject("pageInfo",pageInfo);

        }else {
            //普通用户
            int emp_id=(int)request.getSession().getAttribute("user_id");
            List<Attendance> byEmpId = attendanceService.findByEmpId(emp_id);
            PageInfo pageInfo = new PageInfo(byEmpId);
            mv.addObject("pageInfo",pageInfo);
            //mv.setViewName("commonuser/employee/emp_inf");
        }
        mv.setViewName("admin/attendance/att_list");

         return mv;
    }

    /**
     * 查询单个考勤
     * @param att_id
     * @return
     */
    @RequestMapping("/findOne")
    public  ModelAndView findOne( Integer att_id){
        mv=new ModelAndView();
        Attendance one = attendanceService.findOne(att_id);
        mv.addObject("attendance",one);
        mv.setViewName("admin/attendance/att_update");
        return mv;
    }

    @RequestMapping("/deleteById")
    public String deleteById(Integer att_id){
        attendanceService.deleteById(att_id);
        return "redirect:findAll";
    }

    @RequestMapping("/update")
    public String update(Attendance attendance ){
        attendanceService.update(attendance);
        System.out.println("部门id："+attendance.getEmp_id());
        return "redirect:findAll";
    }
    //跳转
    @RequestMapping("toAdd")
    public String toAdd(){
        return "admin/attendance/att_add";
    }
    //添加
    @RequestMapping("/add")
    public String add(Attendance attendance ){

        attendanceService.add(attendance);
        return "redirect:findAll";
    }
    @RequestMapping(value = "delSelected")
    public  String delSelected(HttpServletRequest request){
        String[] aid = request.getParameterValues("aid");
        attendanceService.delSelectAttendance(aid);
        return "redirect:findAll";
    }

}
