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
<div>

<%--    <jsp:include page="../public/head.jsp"></jsp:include>--%>
<%--    <jsp:include page="../public/lside.jsp"/>--%>
    <div >
        <!-- 内容主体区域 -->
        <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a>
             <cite>>用户信息更新</cite>
            </a>
         </span>
        <div style="padding: 35px;">
            <form class="layui-form" id="Form" action="${pageContext.request.contextPath}/user/update" method="post">
                <!--  隐藏域 提交id -->
                <input type="hidden" name="id" value="${userInf.id}">
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                        <input style="width: 250px;" type="text" name="username" required value="${userInf.username}" lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">登录名称：</label>
                    <div class="layui-input-block">
                        <input style="width: 250px;" type="text" name="login_name" required value="${userInf.login_name}" lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码：</label>
                    <div class="layui-input-block">
                        <input style="width: 250px;" type="text" name="password" required value="${userInf.password}" lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="add">立即提交</button>
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
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
        ,layer = layui.layer;

        //监听提交
        form.on('submit(add)', function(data){

            console.log(data);
            //异步，数据提交
            layer.alert("修改成功", {icon: 6},function () {
                //提交表单
                document.getElementById('Form').submit();
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);

            });
            return false;
        });
    });
    layui.use('laydate', function(){
        var laydate = layui.laydate;

    //
    //      //日期时间选择器
    //     laydate.render({
    //         elem: '#date' //指定元素
    //         ,type: 'datetime'
    //         ,trigger: 'click'//呼出事件改成click
    //     });
  });
</script>
</body>
</html>
