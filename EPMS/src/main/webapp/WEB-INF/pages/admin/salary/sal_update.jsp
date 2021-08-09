<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/1
  Time: 17:58
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>人事管理系统 </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui-v2.5.7/layui/css/layui.css">
</head>
<body  >
<div  >

    <div  >
        <!-- 内容主体区域 -->
        <span>
        <a href=""> 首页</a>
        <a>
            <cite> >员工工资信息更新</cite>
        </a>
        </span>

        <div style="padding: 35px;">
            <form class="layui-form" action="${pageContext.request.contextPath}/salary/update" method="post">
                <!--  隐藏域 提交id -->
                <input type="hidden" name="id" value="${salary.id}">
                <div class="layui-form-item">
                    <label class="layui-form-label">员工编号：</label>
                    <div class="layui-input-inline">
                        <input  type="text" readonly name="emp_id" required value="${salary.emp_id}" lay-verify="required"   autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">不允许修改</div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">员工姓名：</label>
                    <div class="layui-input-inline">
                        <input  type="text" readonly   required value="${salary.employee.emp_name}" lay-verify="required"   autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-input-inline">
                        <div class="layui-form-mid layui-word-aux">不允许修改</div>
                    </div>
                </div>
                <div class="layui-form-item ">
                    <label class="layui-form-label">年：</label>
                    <div class="layui-input-inline ">
                        <input    type="text" class="layui-input"  required id="date" name="sal_year" value="${salary.sal_year}"  lay-verify="required"   autocomplete="off" >
                    </div>
                </div>
                <div class="layui-form-item ">
                    <label class="layui-form-label">月：</label>
                    <div class="layui-input-inline ">
                        <input    type="text" class="layui-input"  required  name="sal_month" value="${salary.sal_month}"  lay-verify="required"   autocomplete="off" >
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">基本工资：</label>
                    <div class="layui-input-inline">
                        <input  type="text" name="basic_wages" required  value="${salary.basic_wages}" lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">补贴：</label>
                    <div class="layui-input-inline">
                        <input  type="text" name="subsidies" required  value="${salary.subsidies}" lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </div>
<%--                <div class="layui-form-item">--%>
<%--                    <label class="layui-form-label">实际工资：</label>--%>
<%--                    <div class="layui-input-inline">--%>
<%--                        <input type="text" name="real_wages" required lay-verify="required" value="${salary.real_wages}"   autocomplete="off" class="layui-input">--%>
<%--                    </div>--%>
<%--                    &lt;%&ndash;                    <div class="layui-form-mid layui-word-aux">提示！</div>&ndash;%&gt;--%>
<%--                </div>--%>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit >立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>

        </div>



    </div>
</div>
<script src="${pageContext.request.contextPath}/layui-v2.5.7/layui/layui.js"></script>
<script>
    layui.use('element',function(){
        var element = layui.element;

    });
       //Demo
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
    layui.use('laydate', function(){
        var laydate = layui.laydate;
         //日期时间选择器
        laydate.render({
            elem: '#date' //指定元素
            ,type: 'year'
            ,trigger: 'click'//呼出事件改成click
        });
    });
</script>
</body>
</html>
