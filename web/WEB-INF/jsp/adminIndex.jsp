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
<%
    String error = request.getParameter("error");
    if ("1".equals(error)) {
%>
<div class="modal" style="text-align: center; font-size: 24px;color: red;">
    <div id="del" class="modal-content" style="width: 300px;">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2>房源中还有楼房，无法删除小区！！</h2>
    </div>
</div>
<%
    }
%>
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
    <c:forEach items="${houseSourceList}" var="h">
        <div class="house">
            <table>
                <tr>
                    <img src="static/images/${h.picture.split(',')[0]}" width="300px" height="200px">

                </tr>
                <tr>
                    <td>序号</td>
                    <td>${h.id}</td>
                </tr>
                <tr>
                    <td>小区名称</td>
                    <td>${h.cellname}</td>
                </tr>
                <tr>
                    <td>地址</td>
                    <td>${h.address}</td>
                </tr>
                <tr>
                <td><a href="toUpdateHouse?id=${h.id}">修改</a></td>
                <td>
                    <a href="javascript:void(0);" onclick="confirmDeleteHouse(${h.id});">删除</a>
                </td>
                </tr>
            </table>
        </div>
    </c:forEach>
    </div>
</div>
</body>
<script src="static/js/adminIndex.js"></script>
</html>
