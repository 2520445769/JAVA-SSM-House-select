<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/10/19
  Time: 0:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>

    <link rel="stylesheet" href="static/css/login.css">

</head>
<body>
<%
    String error = request.getParameter("error");
    if ("1".equals(error)) {
%>
<p>用户名或密码错误！</p>
<%
    }
    if ("2".equals(error)) {
%>
<p>注册成功！</p>
<%
    }if ("3".equals(error)) {
%>
<p>修改成功,请重新登录！</p>
<%
        }
%>
    <div class="login-container">
        <a href="toAdminLogin">管理员登录</a>
    <h2>用户登录</h2>
        <form action="login" method="post">
            <input type="text" placeholder="用户名" name="username" value="">
            <input type="password" placeholder="密码" name="password" value="">
            <button>登录</button>
        </form>
        <a href="toRegister">注册</a>
    </div>
</body>
</html>
