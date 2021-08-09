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
<body >


<%--    <jsp:include page="../public/head.jsp"></jsp:include>--%>
<%--    <jsp:include page="../public/lside.jsp"/>--%>

        <!-- 内容主体区域 -->
        <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a>
          <cite>>员工信息添加</cite></a>
      </span>

        <div style="padding: 35px;">
            <form class="layui-form" action="${pageContext.request.contextPath}/employee/add" method="post">

                <div class="layui-form-item">
                    <label class="layui-form-label">员工编号：</label>
                    <div class="layui-input-block">
                        <input style="width: 250px;" type="text" name="emp_id" required  lay-verify="required"   autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                        <input style="width: 250px;" type="text" name="emp_name" required  lay-verify="required" placeholder="请输入真实姓名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">性别：</label>
                    <div class="layui-input-block">
                        <input type="radio" name="sex" value="男" title="男" checked>
                        <input type="radio" name="sex" value="女" title="女" >
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">部门：</label>
                    <div class="layui-input-inline">
                        <select name="dep_id"  lay-search  required lay-verify="required">
                            <option value="" >请选择部门</option>
                            <option value="101">人事部</option>
                            <option value="102">开发部</option>
                            <option value="103">销售部</option>
                        </select>

                    </div>
<%--                    <div class="layui-form-mid layui-word-aux">提示！</div>--%>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">职位：</label>
                    <div class="layui-input-block">
                        <input style="width: 250px;" type="text" name="post"   required  lay-verify="required"   autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">职称：</label>
                    <div class="layui-input-block">
                        <input style="width: 250px;" type="text" name="post_title" required  lay-verify="required"   autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item ">
                    <label class="layui-form-label">入职时间：</label>
                    <div class="layui-input-inline ">
                         <input    type="text" class="layui-input"  id="date" name="dateintocompany"   lay-verify="required"   autocomplete="off" >
                    </div>
                </div>
                <div class="layui-form-item ">
                    <label class="layui-form-label">身份证：</label>
                    <div class="layui-input-inline ">
                        <input    type="text" class="layui-input"  required  name="identity_card"   lay-verify="required"   autocomplete="off" >
                    </div>
                </div>
                <div class="layui-form-item ">
                    <label class="layui-form-label">学历：</label>
                    <div class="layui-input-inline ">
                        <input    type="text" class="layui-input"  required   name="education"   lay-verify="required"   autocomplete="off" >
                    </div>
                </div>
                <div class="layui-form-item ">
                    <label class="layui-form-label">手机号：</label>
                    <div class="layui-input-inline ">
                        <input    type="text" class="layui-input"  required   name="mobile"   lay-verify="required"   autocomplete="off" >
                    </div>
                </div>
                <div class="layui-form-item ">
                    <label class="layui-form-label">生日：</label>
                    <div class="layui-input-inline ">
                        <input    type="text" class="layui-input"  required id="date1" name="birth"   lay-verify="required"   autocomplete="off" >
                    </div>
                </div>
                <div class="layui-form-item ">
                    <label class="layui-form-label">地址：</label>
                    <div class="layui-input-inline ">
                        <input    type="text" class="layui-input"  required   name="address"   lay-verify="required"   autocomplete="off" >
                    </div>
                </div>


                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" id="but" lay-submit >立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>

        </div>






<script src="${pageContext.request.contextPath}/layui-v2.5.7/layui/layui.js"></script>
<script>

    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //日期时间选择器
        laydate.render({
            elem: '#date' //指定元素
            ,type: 'datetime'
            ,trigger: 'click'//呼出事件改成click
        });
        laydate.render({
            elem: '#date1' //指定元素
            ,type: 'date'
            ,trigger: 'click'//呼出事件改成click
        });
    });

    layui.use('element',function(){
        var element = layui.element;

    });
       //Demo
    layui.use('form', function(){
        var form = layui.form;
        // 重新对表单动态渲染
        form.render();
        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });


</script>
</body>
</html>
