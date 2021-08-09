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
             <cite>>员工信息</cite>
            </a>
         </span>
        <div style="padding: 35px;">
            <form class="layui-form" action="" method="post">
                <!--  隐藏域 提交id -->
                <input type="hidden" name="emp_id" value="${employee.emp_id}">
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                        <input style="width: 250px;" type="text" name="emp_name" readonly required value="${employee.emp_name}" lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">性别：</label>
                    <div class="layui-input-block">
                        <c:if test="${employee.sex=='男'}">
                        <input type="radio" name="sex" value="男" title="男" checked>
                        </c:if>
                        <c:if test="${employee.sex=='女'}">
                            <input type="radio" name="sex" value="女" title="女" checked>
                        </c:if>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">部门：</label>
                    <div class="layui-input-inline">
                        <select name="dep_id" lay-search readonly required lay-verify="required">
                            <c:if test="${employee.dep_id==101}" >
                            <option value="101" selected>人事部</option>
                            </c:if>
                        <c:if test="${employee.dep_id==102}" >
                            <option value="102" selected>开发部</option>
                        </c:if>
                            <c:if test="${employee.dep_id==103}" >
                                <option value="103" selected>销售部</option>
                            </c:if>
                        </select>
<%--                        <input type="text" name="department" required lay-verify="required" value="${employee.department}"  autocomplete="off" class="layui-input">--%>
                    </div>
<%--                    <div class="layui-form-mid layui-word-aux">提示！</div>--%>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">职位：</label>
                    <div class="layui-input-block">
                        <input style="width: 250px;" type="text" name="post" value="${employee.post}" readonly required  lay-verify="required"   autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">职称：</label>
                    <div class="layui-input-block">
                        <input style="width: 250px;" type="text" name="post_title" readonly required value="${employee.post_title}" lay-verify="required"   autocomplete="off" class="layui-input">
                    </div>

                </div>

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">入职时间：</label>

                    <div class="layui-input-inline">
                        <input style="width: 250px;" type="text" name="dateintocompany" id="date" readonly required value="${employee.dateintocompanyStr}" lay-verify="required"   autocomplete="off" class="layui-input">
                    </div>

                </div>
                <div class="layui-form-item ">
                    <label class="layui-form-label">身份证：</label>
                    <div class="layui-input-inline ">
                        <input    type="text" class="layui-input" readonly required value="${employee.identity_card}" name="identity_card"   lay-verify="required"   autocomplete="off" >
                    </div>
                </div>
                <div class="layui-form-item ">
                    <label class="layui-form-label">学历：</label>
                    <div class="layui-input-inline ">
                        <input    type="text" class="layui-input" readonly required  value="${employee.education}" name="education"   lay-verify="required"   autocomplete="off" >
                    </div>
                </div>
                <div class="layui-form-item ">
                    <label class="layui-form-label">手机号：</label>
                    <div class="layui-input-inline ">
                        <input    type="text" class="layui-input" readonly required value="${employee.mobile}"  name="mobile"   lay-verify="required"   autocomplete="off" >
                    </div>
                </div>
                <div class="layui-form-item ">
                    <label class="layui-form-label">生日：</label>
                    <div class="layui-input-inline ">
                        <input    type="text" class="layui-input" readonly required id="date1" value="${employee.birth}" name="birth"   lay-verify="required"   autocomplete="off" >
                    </div>
                </div>
                <div class="layui-form-item ">
                    <label class="layui-form-label">地址：</label>
                    <div class="layui-input-inline ">
                        <input    type="text" class="layui-input"  required readonly  name="address" value="${employee.address}"  lay-verify="required"   autocomplete="off" >
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
            elem: '#date1' //指定元素
            ,type: 'date'
            ,trigger: 'click'//呼出事件改成click
        });
  });
</script>
</body>
</html>
