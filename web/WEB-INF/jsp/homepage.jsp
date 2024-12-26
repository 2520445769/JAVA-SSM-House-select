<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/10/19
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>选房主页</title>
    <link rel="stylesheet" href="static/css/homepage.css">
</head>
<body>
<%
    String error = request.getParameter("error");
    if ("1".equals(error)) {
%>
<div class="modal" style="text-align: center; font-size: 24px;color: red;">
    <div id="error" class="modal-content" style="width: 300px;">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2>选房成功！</h2>
    </div>
</div>
<%
    }
%>
<div class="top">
    <a href="logout">退出登录</a>
    <p>欢迎用户：${user.username}</p>
    <h1>MO选房系统</h1>
    <a href="userinfo">个人信息</a>
</div>
<form action="toHome" method="post">
    查询小区名称:
    <select name="cellname">
        <option value="">全部</option>
        <c:forEach items="${Cells}" var="item">
            <option value="${item.cellname}">${item.cellname}</option>
        </c:forEach>
    </select>
    <input type="submit" value="查询">
</form>

<table border="1">
    <tr>
        <td>序号</td>
        <td>小区名称</td>
        <td>地址</td>
        <td>图片</td>
        <td></td>
    </tr>

    <c:forEach items="${HSList}" var="item">
            <tr>
                <td>${item.id}</td>
                <td>${item.cellname}</td>
                <td>${item.address}</td>
                <td><img src="static/images/${item.picture}" width="150px" height="150px"></td>
                <td><a href="toCellInfo?cellname=${item.cellname}">查看详情</a></td>
            </tr>
    </c:forEach>
</table>
</body>
<script>
    function closeModal() {
        document.getElementById("error").style.display = "none";
    }
</script>
</html>
