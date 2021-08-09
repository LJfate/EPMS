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
<div >


    <div  >
        <!-- 内容主体区域 -->
        <span>
        <a href=""> 首页</a>
        <a>
            <cite> >员工考勤添加</cite>
        </a>
        </span>

        <div style="padding: 35px;">
            <form class="layui-form" action="${pageContext.request.contextPath}/attendance/add" method="post">




                <div class="layui-form-item ">
                    <label class="layui-form-label">员工编号：</label>
                    <div class="layui-input-inline ">
                        <input    type="text" class="layui-input"   name="emp_id"   lay-verify="required"   autocomplete="off" >
                    </div>
                </div>

                <div class="layui-form-item ">
                    <label class="layui-form-label">日期：</label>
                    <div class="layui-input-inline ">
                        <input    type="text" class="layui-input"  id="date" name="att_date"   lay-verify="required"   autocomplete="off" >
                    </div>
                </div>

                <div class="layui-form-item ">
                    <label class="layui-form-label">上班时间：</label>
                    <div class="layui-input-inline ">
                        <input    type="text" class="layui-input"  id="date1" name="att_shangban"   lay-verify="required"   autocomplete="off" >
                    </div>
                </div>

                <div class="layui-form-item ">
                    <label class="layui-form-label">下班时间：</label>
                    <div class="layui-input-inline ">
                        <input    type="text" class="layui-input"   id="att_xiaban" name="att_xiaban"   lay-verify="required"   autocomplete="off" >
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">类别：</label>
                    <div class="layui-input-inline">
                        <select name="att_type"  lay-search  required lay-verify="required">
                            <option value="" >请选择类别</option>
                            <option value="1">正常</option>
                            <option value="2">迟到</option>
                            <option value="3">早退</option>
                        </select>

                    </div>
                    <%--                    <div class="layui-form-mid layui-word-aux">提示！</div>--%>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" id="but" lay-submit >立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>

        </div>




    </div>
</div>
<script src="${pageContext.request.contextPath}/layui-v2.5.7/layui/layui.js"></script>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        // //日期时间选择器
        laydate.render({
            elem: '#date' //指定元素
            ,trigger: 'click'//呼出事件改成click
        });
        laydate.render({
            elem: '#date1' //指定元素
            ,type: 'time'
            ,trigger: 'click'//呼出事件改成click
        });
        laydate.render({
            elem: '#att_xiaban' //指定元素
            ,type: 'time'
            ,trigger: 'click'//呼出事件改成click
        });

    });
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


</script>
</body>
</html>
