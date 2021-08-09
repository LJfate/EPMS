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
    <title>系统登录</title>
    <jsp:include page="taglib.jsp"></jsp:include>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui-v2.5.7/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui-v2.5.7/layui/css/layui.mobile.css">
    <script src="${pageContext.request.contextPath}/layui-v2.5.7/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>

    <script type="text/javascript">
        function login(){
            var login_name = $.trim($("#login_name").val());
            var password = $.trim($("#password").val());
            if(login_name == ""){
                alert("请输入用户名");
                return false;
            }else if(password == ""){
                alert("请输入密码");
                return false;
            }
            // $.ajax()是jQuery框架中用于提交请求并获取响应结果的函数
            // $.ajax()函数的参数是一个JSON对象
            // 参数的JSON对象中需要配置几个属性：
            // url：将请求提交到哪里去
            // data：需要提交到服务器的请求参数，可以通过$("#表单id").serialize()函数获取整个表单的数据，提交到服务器的数据
            // type：提交方式，取值为post、get等
            // dataType：该属性名区分大小写，服务器端响应的数据的类型，取值可以是text、json、xml
            // success：当服务器成功响应（HTTP响应码为200）时的回调函数，函数的参数就是服务器响应的JSON数据
            $.ajax({
                "url":"${pageContext.request.contextPath}/user/login.do",
                "data":$("#form-login").serialize(),
                "type":"post",
                //编码设置
                contentType:"application/json;charset=utf-8",
                "dataType":"json",
                "success":function(json) {
                    if(json.login==0){
                        alert("验证码错误");
                    } else  if (json.login == 1) {
                        alert("登录成功！");
                        window.location.href = "${pageContext.request.contextPath}/index.jsp";
                    } else if (json.login == 2) {
                        alert("登录失败！用户名不存在！");
                    } else {
                        alert("登录失败！密码错误！");
                    }
                }
            });
         }


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
<body>
<div class="  layui-anim layui-anim-up" >
    <h3  style="font-family: 'Arial Rounded MT Bold';text-align: center">系统登录</h3>
    <div style="margin-left: 37%;margin-top: 10px">

        <form id="form-login" class="layui-form layui-form-pane" method="post" action="${pageContext.request.contextPath}/user/login" >
            <div class="layui-form-item">
                <label class="layui-form-label">用户名：</label>
                <div class="layui-input-inline">
                    <input type="text" id="login_name" name="login_name" required   placeholder="请输入名称" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码:</label>
                <div class="layui-input-inline">
                    <input type="password" id="password" name="password"   required  placeholder="请输入密码" autocomplete="off" class="layui-input">
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
                <div class="layui-input-block" style="margin: auto" >
                    <button class="layui-btn" lay-submit lay-filter="formDemo"  >立即提交</button>
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
