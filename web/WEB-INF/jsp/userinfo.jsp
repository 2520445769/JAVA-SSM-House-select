<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/10/22
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
    <link rel="stylesheet" href="static/css/userinfo.css">
</head>
<body>
<div class="content">
    <div class="top">
        <a href="toHome">返回</a>
        <a href="toHome">首页</a>
        <p>欢迎用户：${u.username}</p>
        <input type="button" value="修改密码" onclick="openModal()">
        <div id="passwordModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <h2>修改密码</h2>
                <form action="changePassword" method="post" onsubmit="return validateForm()">
                    <input type="hidden" placeholder="用户名" name="username" value="${u.username}" readonly>
                    <input type="password" placeholder="新密码" name="confirmPassword" required>
                    <input type="password" placeholder="确认新密码" name="password" required>
                    <input type="submit" value="提交">
                </form>
            </div>
        </div>
    </div>
    <div class="main">
        <h1>个人信息</h1>
        <table border="1">
            <tr>
                <td>用户名</td>
                <td>${u.username}</td>
            </tr>
            <tr>
                <td>姓名</td>
                <td>${u.r_name}</td>
            </tr>
            <tr>
                <td>手机号</td>
                <td>${u.tel}</td>
            </tr>
            <c:if test="${u.cellname==null or u.cellname==''}">
                <tr>
                    <td>您未选房</td>
                    <td><a href="toHome">去选房</a></td>
                </tr>
            </c:if>
            <c:if test="${u.cellname != null and u.cellname != ''}">
                <tr>
                    <td>小区名称</td>
                    <td>${u.cellname}</td>
                </tr>
                <tr>
                    <td>楼栋</td>
                    <td>${u.building}</td>
                </tr>
                <tr>
                    <td>房号</td>
                    <td>${u.roomno}</td>
                </tr>
            </c:if>
            <tr>
                <td>退房请联系管理员</td>
                <td></td>
            </tr>
        </table>
    </div>
</div>

</body>
<script src="static/js/userinfo.js"></script>
</html>
