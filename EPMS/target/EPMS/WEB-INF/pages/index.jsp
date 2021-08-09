<%-- 用el表达式需先声明--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>人事管理系统 </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui-v2.5.7/layui/css/layui.css">
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
<div class="layui-header">
    <div class="layui-logo">人事管理 </div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">

    </ul>
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                ${sessionScope.get("user_name")}
            </a>
            <c:if test="${sessionScope.get('user_identity')==2}">
            <dl class="layui-nav-child">
                <dd id="basicInformation"> <a href="javascript:;">账号信息</a> </dd>
<%--                <dd><a href="">安全设置</a></dd>--%>
            </dl>
            </c:if>
        </li>
        <li class="layui-nav-item"><a href="javascript:void(0);" id="tc" >退出</a></li>
    </ul>
</div>
<div class="layui-side layui-bg-cyan">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree "  lay-filter="test">
            <li class="layui-nav-item  layui-nav-itemed">
                <a class="" href="javascript:void (0);" >员工管理</a>
                <dl class="layui-nav-child">
                    <dd><a  href="javascript:void (0);" onclick="emp()" >员工信息</a></dd>
                    <c:if test="${sessionScope.get('user_identity')==1}">
                    <dd><a href="javascript:void (0);"  onclick="emp_add()" >员工添加</a></dd>
                    </c:if>
                </dl>
            </li>
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:void (0);">部门管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:void (0);" onclick="dep()">部门信息</a></dd>
                    <c:if test="${pageContext.session.getAttribute('user_identity')==1}">
                    <dd><a href="javascript:void (0);" onclick="dep_add()">部门添加</a></dd>
                    </c:if>
                </dl>
            </li>
            <li class="layui-nav-item ">
                <a href="javascript:;">考勤管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:void (0);" onclick="att()">出勤信息</a></dd>
                    <c:if test="${pageContext.session.getAttribute('user_identity')==1}">
                    <dd><a href="javascript:void (0);" onclick="att_add()">考勤添加</a></dd>
                    </c:if>
                </dl>
            </li>
            <li class="layui-nav-item">
            <a href="javascript:void (0);" >工资管理</a>
            <dl class="layui-nav-child">
                <dd><a href="javascript:void (0);" onclick="sal()">工资信息</a></dd>
                <c:if test="${pageContext.session.getAttribute('user_identity')==1}">
                    <dd><a href="javascript:void (0);" onclick="sal_add()">工资记录添加</a></dd>
                </c:if>
            </dl>
        </li>
            <c:if test="${pageContext.session.getAttribute('user_identity')==1}">
            <li class="layui-nav-item">
                <a href="javascript:void (0);" >用户管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:void (0);" onclick="userInf()">用户信息</a></dd>
                    <dd><a href="javascript:void (0);" onclick="userInf_add()">用户添加</a></dd>

                </dl>
            </li>
            </c:if>
        </ul>
    </div>
</div>
    <div class="layui-body page-content">
        <!-- 内容主体区域 -->
        <div  >
            <div>
                <iframe src='${pageContext.request.contextPath}/welcome' name="content" id="my-iframe" frameborder="0" scrolling="yes" height="99%" width="99%"  ></iframe>
            </div>
        </div>
    </div>
    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © lliujie.com - 毕业设计
    </div>
</div>
<script src="${pageContext.request.contextPath}/layui-v2.5.7/layui/layui.js"></script>

<script>
//模块声明，才可使用
    layui.use(['element','jquery','form','layer'],function(){
         var element = layui.element;
          $=layui.jquery;
        var form = layui.form;
         var layer=layui.layer;
            // $("#basicInformation").click()依赖jquery模块
        $("#basicInformation").click(function () {
            //窗口设置
            layer.open({
                title:'账号信息',
                type:2,
                area:['400px','400px'],
                maxmin: true,
                shadeClose:true,
                content:'${pageContext.request.contextPath}/employee/myupdate'
            })
        })

    });

    document.getElementById('tc').onclick=  function tc() {
        if (confirm( "你确定要退出吗？")){
            location.href="${pageContext.request.contextPath}/user/tc";
        }
    }

    //员工
    function emp() {
        frame=document.getElementById('my-iframe');
        //获取要嵌套页面的文件名
        frame.src="${pageContext.request.contextPath}/employee/findAll";
        //location.href="${pageContext.request.contextPath}/employee/findAll ";
    }
    function emp_add() {
        frame=document.getElementById('my-iframe');
        //获取要嵌套页面的文件名
        frame.src="${pageContext.request.contextPath}/employee/toAdd";
        //location.href="${pageContext.request.contextPath}/employee/toAdd";
    }
    //部门
    function dep() {
        frame=document.getElementById('my-iframe');
        //获取要嵌套页面的文件名
        frame.src="${pageContext.request.contextPath}/department/findAll";
        //location.href="${pageContext.request.contextPath}/employee/findAll ";
    }
    function dep_add() {
        frame=document.getElementById('my-iframe');
        //获取要嵌套页面的文件名
        frame.src="${pageContext.request.contextPath}/department/toAdd";
        //location.href="${pageContext.request.contextPath}/employee/findAll ";
    }
    //考勤
    function att() {
        frame=document.getElementById('my-iframe');
        //获取要嵌套页面的文件名
        frame.src="${pageContext.request.contextPath}/attendance/findAll";

    }
    function att_add() {
        frame=document.getElementById('my-iframe');
        //获取要嵌套页面的文件名
        frame.src="${pageContext.request.contextPath}/attendance/toAdd";

    }
    //工资
    function sal() {
        frame=document.getElementById('my-iframe');
        //获取要嵌套页面的文件名
        frame.src="${pageContext.request.contextPath}/salary/findAll";

    }
    function sal_add() {
        frame=document.getElementById('my-iframe');
        //获取要嵌套页面的文件名
        frame.src="${pageContext.request.contextPath}/salary/toAdd";

    }
    //用户
    function userInf() {
        frame=document.getElementById('my-iframe');
        //获取要嵌套页面的文件名
        frame.src="${pageContext.request.contextPath}/user/findAll";

    }
    function userInf_add() {
        frame=document.getElementById('my-iframe');
        //获取要嵌套页面的文件名
        frame.src="${pageContext.request.contextPath}/user/toAdd";

    }
    layui.use('element',function(){
        var element = layui.element;

    });
</script>
</body>