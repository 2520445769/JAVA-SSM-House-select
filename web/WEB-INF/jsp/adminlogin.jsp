<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2024/10/23
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录</title>
    <link rel="stylesheet" href="static/css/login.css">

</head>
<body>
    <%
    String error = request.getParameter("error");
    if ("1".equals(error)) {
%>
<p>用户名或密码错误！</p>
<%}%>
<div class="login-container">
    <a href="toLogin">用户登录</a>
    <h2>管理员登录</h2>
    <form action="adminLogin" method="post">
        <input type="text" placeholder="用户名" name="a_name" value="">
        <input type="password" placeholder="密码" name="a_password" value="">
        <button>登录</button>
    </form>
</div>
</body>
</html>
