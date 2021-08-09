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
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">


    <div  >
        <!-- 内容主体区域 -->
        <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a>
          <cite>>部门更新</cite></a>
      </span>
        <div style="padding: 35px;">
            <form class="layui-form" action="${pageContext.request.contextPath}/department/update" method="post">
                <!--  隐藏域 提交id -->
                <input type="hidden" name="dep_id" value="${department.dep_id}">
                <div class="layui-form-item">
                    <label class="layui-form-label">部门名称：</label>
                    <div class="layui-input-block">
                        <input style="width: 250px;" type="text" name="dep_name"  required value="${department.dep_name}" lay-verify="required"   autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">简介：</label>
                    <div class="layui-input-block">
<%--                        <input style="width: 250px;" type="text" name="dep_intro" required value="${department.dep_intro}" lay-verify="required"   autocomplete="off" class="layui-input">--%>
                        <textarea placeholder="请输入内容" name="dep_intro"  class="layui-textarea">${department.dep_intro}</textarea>
                    </div>
                </div>

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

    });

</script>
</body>
</html>
