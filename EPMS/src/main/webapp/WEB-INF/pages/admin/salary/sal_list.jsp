<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/1
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%-- 用el表达式需先声明--%>
<%@page language="java" contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>人事管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui-v2.5.7/layui/css/layui.css">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body >
<div >


    <div  >
        <!-- 内容主体区域 -->
        <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a>
            <cite> >员工工资信息 </cite></a>
        </span>
        <c:if test="${pageContext.session.getAttribute('user_identity')==1}">
        <div  class="layui-row"    align="center">
            <%--        搜索框--%>
            <form class="layui-form layui-col-md12" action="findAll" method="post" >
                <div class="layui-form-item" style="width: 50%;margin: 0 auto">
                    <%--                <input type="text" name="name" style="width:50%;"  placeholder="请输入名字" autocomplete="off" class="layui-input">--%>
                    <%--                <button type="submit"  class="layui-btn"><i class="layui-icon">&#xe615;</i></button>--%>
                    <div class="layui-input-inline">
                        <input type="text" name="nameSearch"  style="width: 260px"   lay-verify="title" autocomplete="off" placeholder="请输入名字" class="layui-input">
                    </div>
                    <div class="layui-input-inline"> <button type="submit"  class="layui-btn"><i class="layui-icon">&#xe615;</i></button></div>
                </div>
            </form>
            <%-- 结束搜索框--%>
        </div>
        </c:if>
        <div style="padding: 0px;">
            <c:if test="${pageContext.session.getAttribute('user_identity')==1}">
            <div style="float: right;margin: 5px;">
                <a class="layui-btn" href="javascript:void(0);" id="delSelected">删除选中</a>
            </div>
            </c:if>
        </div>
            <form id="form-salid" method="post" action="${pageContext.request.contextPath}/salary/delSelected" >

        <div style="padding: 35px;">
            <table class="layui-table" >
                <colgroup>
                    <col width="150">
                    <col width="200">
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <c:if test="${pageContext.session.getAttribute('user_identity')==1}">
                    <th><input type="checkbox" id="fristbox"></th>
                    </c:if>
                    <th>序号</th>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>年份</th>
                    <th>月份</th>
                    <th>基本工资</th>
                    <th>补贴</th>
                    <th>实际工资</th>
                    <c:if test="${pageContext.session.getAttribute('user_identity')==1}">
                    <th>编辑</th>
                    </c:if>
                </tr>
                </thead>
                <tbody>   <%--   varStatus:遍历的状态信息            --%>
                 <c:forEach varStatus="aid" items="${pageInfo.list}" var="sal">
                <tr>
                    <c:if test="${pageContext.session.getAttribute('user_identity')==1}">
                    <th><input type="checkbox" name="sid" value="${sal.id}"> </th>
                    </c:if>
                    <th>${aid.count}</th>
                    <th>${sal.id}</th>
                    <th>${sal.employee.emp_name}</th>
                    <th>${sal.sal_year}</th>
                    <th>${sal.sal_month}</th>
                    <th>${sal.basic_wages}</th>
                    <th>${sal.subsidies}</th>
                    <th>${sal.real_wages}</th>
                    <c:if test="${pageContext.session.getAttribute('user_identity')==1}">
                    <th><div class="layui-btn-group">
                        <a type="button" class="layui-btn layui-btn-sm" href="${pageContext.request.contextPath}/salary/findOne?id=${sal.id}">编辑</a>
                        <a type="button" class="layui-btn layui-btn-sm" onclick="del(${sal.id})">删除</a>
                    </div>
                    </th>
                    </c:if>
                </tr>
                 </c:forEach>
                </tbody>
            </table>

             <div>

                <div class="box-tools pull-right">
                    <ul class="pagination">
                        <li ><a href="${pageContext.request.contextPath}/salary/findAll?page=1&size=5" aria-label="Previous">首页</a> </li>
                        <li ><a href="${pageContext.request.contextPath}/salary/findAll?page=${pageInfo.pageNum-1}&size=5"  >上一页</a> </li>
                        <c:forEach begin="1" end="${pageInfo.pages}"  var="pageNumer">
                            <li><a href="${pageContext.request.contextPath}/salary/findAll?page=${pageNumer}&size=5">${pageNumer}</a></li>
                        </c:forEach>
                        <li ><a href="${pageContext.request.contextPath}/salary/findAll?page=${pageInfo.pageNum+1}&size=5"  >下一页</a> </li>
                        <li ><a href="${pageContext.request.contextPath}/salary/findAll?page=${pageInfo.pages}&size=5"  >尾页</a> </li>
                    </ul>
                </div>
            </div>

        </div>
            </form>
        </div>

</div>
<script src="${pageContext.request.contextPath}/layui-v2.5.7/layui/layui.js"></script>
<script>

    layui.use('element',function(){
        var element = layui.element;

    });


    window.onload=function () {
        //删除选中判断
        document.getElementById("delSelected").onclick = function () {
            if (confirm("你确定要删除选中信息吗？")) {
                //判断是否选取条目
                var flog = false;
                var cbs = document.getElementsByName("sid");
                for (var i = 0; i < cbs.length; i++) {
                    //判断是否有任一复选框被选中
                    if (cbs[i].checked) {
                        flog = true;
                        break;
                    }

                }
                if (flog) {
                    //提交表单
                    document.getElementById("form-salid").submit();
                }

            }


        }

        //获取当前页所有复选框
        //1获取第一个cb
        document.getElementById("fristbox").onclick = function () {
            //2获取下方列表所有cb
            var cbs = document.getElementsByName("sid");
            //3遍历
            for (var i = 0; i < cbs.length; i++) {
                //4.获取这些复选框的checked状态=fristbox.checked
                cbs[i].checked = this.checked;
            }

        }
    }

    function del(sid) {
        var  flag=confirm("你确定要删除这条信息吗");
        if (flag){
            location.href="${pageContext.request.contextPath}/salary/deleteById?id="+sid;
        }

    }

</script>


</body>
</html>