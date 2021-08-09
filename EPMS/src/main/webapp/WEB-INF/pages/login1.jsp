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
<var>${prc=pageContext.request.contextPath} </var>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>系统登录</title>
    <jsp:include page="taglib.jsp"></jsp:include>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui-v2.5.7/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui-v2.5.7/layui/css/layui.mobile.css">
    <script src="${pageContext.request.contextPath}/layui-v2.5.7/layui/layui.js"></script>
    <script src="${ctx}/js/jquery-2.1.0.min.js"></script>

    <script type="text/javascript">

        layui.use('form', function(){
            var form = layui.form;
            // 重新对表单动态渲染
            form.render();
        });
        layui.use('element',function(){
            var element = layui.element;

        });
<%--       window.onload=  页面加载时触发--%>
            window.onload=function () {
                    //加载时调用,
                    refreshCode();
                   // layer.msg("用户或密码出错！！！");

            }
            function refreshCode() {
                //获取验证码图片对象
                var vcode=document.getElementById("ver_code_img");
                //2设置其src属性，加时间戳
                vcode.src="${pageContext.request.contextPath}/getCheckCode?time="+new Date().getTime();
            }
    </script>
</head>
<body  >
<div class="  layui-anim layui-anim-up" >
    <h3     style="font-family: 'Arial Rounded MT Bold';text-align: center"  >系统登录</h3>
    <div style="margin-left: 37%;margin-top: 10px">

        <form class="layui-form layui-form-pane " action="${pageContext.request.contextPath}/user/login.do"   method="post">
            <div class="layui-form-item">
                <label class="layui-form-label"  >用户名：</label>
                <div class="layui-input-inline">
                    <input type="text" name="login_name" required   placeholder="请输入名称" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码:</label>
                <div class="layui-input-inline">
                    <input type="password" name="password"   required  placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
<%--                <div class="layui-form-mid layui-word-aux">辅助文字</div>--%>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">验证码：</label>
                <div class="layui-input-block">
                <div class="layui-input-inline" style="width: 100px"><input type="text" name="input_code"   required    placeholder="请输入验证码" autocomplete="off"   class="layui-input " ></div>
                <div class="layui-input-inline"><img src="${pageContext.request.contextPath}/getCheckCode" onclick="refreshCode()"  id="ver_code_img" style="width: 75px" class="layui-input"  title="看不清？刷新一下！"></div>

                </div>

            </div>

            <div class="layui-form-item">
                <div class="layui-input-inline"  style="margin-left:  5%">
                <select class="layui-input" name="tip">
                    <option value="1">管理员</option>
                    <option value="2">用户</option>
                </select>

                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block" style="  margin: auto" >
                    <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>


    <!-- 出错显示的信息框 -->
    <c:if test="${requestScope.login_msg!=null}">
        <div style=" width: 10%; margin:0 auto">
             <strong>${login_msg}</strong>
        </div>
    </c:if>
            <%--    <div class="alert alert-warning alert-dismissable" role="alert">--%>
            <%--        <button type="button" class="close" data-dismiss="alert" >--%>
            <%--            <span>&times;</span>--%>
            <%--        </button>--%>
            <%--    </div>--%>

</div>
</body>
</html>
