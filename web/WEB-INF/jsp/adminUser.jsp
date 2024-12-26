<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2024/10/23
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员主页</title>
    <link rel="stylesheet" href="static/css/adminIndex.css">
</head>
<body>
<div class="header">
    <p>欢迎管理员：${admin.a_name}</p>
    <h1>MO选房管理系统</h1>
    <a href="logout">注销</a>
</div>
<div class="main">
    <div class="left">
        <a href="toAdminIndex">房源管理</a>
        <a href="adminCell">小区管理</a>
        <a href="adminUser">用户管理</a>
        <a href="toAddHouse">添加房源</a>
        <a href="toAddCell">添加小区</a>
        <a href="toAddUser">添加用户</a>
    </div>
    <div class="right">
        <div class="search">
            <form action="adminUser" method="post">
                <input type="text" name="username" placeholder="请输入用户名">
                <input type="submit" value="搜索">
            </form>
        </div>
        <c:forEach items="${userList}" var="u">
            <div class="user">
                <table>
                    <tr>
                        <td>序号</td>
                        <td>${u.id}</td>
                    </tr>
                    <tr>
                        <td>用户名</td>
                        <td>${u.username}</td>
                    </tr>
                    <tr>
                        <td>密码</td>
                        <td>${u.password}</td>
                    </tr>
                    <tr>
                        <td><a href="toUserInfo?username=${u.username}">查看详情</a></td>
                        <td><a href="toUpdateUserInfo?username=${u.username}">修改</a>|
                            <a href="deleteUserInfo?id=${u.id}">删除</a></td>
                    </tr>
                </table>
            </div>
        </c:forEach>


    </div>
</div>
</body>
</html>
