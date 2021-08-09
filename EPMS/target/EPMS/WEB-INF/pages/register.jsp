<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/19
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui-v2.5.7/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui-v2.5.7/layui/css/layui.mobile.css">
    <script src="${pageContext.request.contextPath}/layui-v2.5.7/layui/layui.js"></script>

    <script type="text/javascript">



    </script>
</head>
<body>
<div class="content" >
    <div style="text-align: center; width: 30%; margin: auto"   >
        <h3 style="font-family: 'Arial Rounded MT Bold'"  >注册</h3>

        <form class="layui-form  layui-form-pane" action="login"   method="post">
            <div class="layui-form-item">
                <label class="layui-form-label">用户名：</label>
                <div class="layui-input-block">
                    <input type="text" name="login_name" required style="width: 300px"   placeholder="请输入名称" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">员工编号：</label>
                <div class="layui-input-block">
                    <input type="text" name="per_id" required style="width: 300px"    placeholder="请输入编号" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码:</label>
                <div class="layui-input-inline">
                    <input type="password" name="password" style="width: 300px" required  placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">

                <div class="layui-input-block" style="  width: 50%; margin: auto" >
                    <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>


<%--    <form action="login" method="post">--%>
<%--        <div class="form-group">--%>
<%--            <label for="login">登录名：</label>--%>
<%--            <input type="text" name="login_name"--%>
<%--                   class="form-control" id="login" placeholder="请输入登录名"/>--%>
<%--        </div>--%>

<%--        <div class="form-group">--%>
<%--            <label for="password">密码：</label>--%>
<%--            <input type="password" name="password" class="form-control" id="password" placeholder="请输入密码"/>--%>
<%--        </div>--%>

<%--        <div class="form-inline">--%>
<%--            <label for="ver_code_img">验证码：</label>--%>
<%--            <input type="text" name="input_code" class="form-control" id="input_code" placeholder="请输入验证码" style="width: 160px;"/>--%>
<%--            <img src="${pageContext.request.contextPath}/getCheckCode" onclick="refreshCode()" class="form-control" id="ver_code_img" style="width: 140px;" title="看不清？刷新一下！">--%>
<%--        </div>--%>
<%--        <hr/>--%>
<%--        <div class="form-group" style="text-align: center;">--%>
<%--            <input class="btn btn btn-primary" type="submit" value="登录">--%>
<%--        </div>--%>
<%--    </form>--%>


    <!-- 出错显示的信息框 -->
    <c:if test="${login_msg!=null}">
<%--    <div class="alert alert-warning alert-dismissable" role="alert">--%>
<%--        <button type="button" class="close" data-dismiss="alert" >--%>
<%--            <span>&times;</span>--%>
<%--        </button>--%>
<div style=" width: 10%; margin:0 auto">
    <strong>${login_msg}</strong>
</div>


<%--    </div>--%>
    </c:if>
</div>
</body>
</html>
