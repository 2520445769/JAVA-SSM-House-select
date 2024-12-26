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
        <div class="adduser form-container">
            <h1>添加用户</h1>
            <form action="insertUser" method="post">
                <input type="text" placeholder="用户名" name="username" value=""><br>
                <input type="text" placeholder="用户名" name="r_name" value=""><br>
                <input type="text" placeholder="手机号" name="tel" value=""><br>
                <input type="password" placeholder="密码" name="password" value=""><br>
                <input type="submit" value="提交">
            </form>
        </div>
    </div>
</div>
</body>
</html>
