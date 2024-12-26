<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/10/22
  Time: 17:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <link rel="stylesheet" href="static/css/register.css">
</head>
<body>
<%
    String error = request.getParameter("error");
    if ("1".equals(error)) {
%>
<p>用户已存在！</p>
<%
    }
%>
<div class="main">
    <div class="top">
        <a href="toLogin">返回</a>
    </div>
    <form action="register" method="post">
        <h1>用户注册</h1>
        <input type="text" placeholder="用户名" name="username" value="">
        <input type="password" placeholder="密码" name="password" value="">
        <input type="text" placeholder="姓名" name="r_name" value="">
        <input type="text" placeholder="手机号" name="tel" value="">
        <input type="submit" value="注册">
    </form>
</div>
</body>
<script src="static/js/register.js"></script>
</html>
