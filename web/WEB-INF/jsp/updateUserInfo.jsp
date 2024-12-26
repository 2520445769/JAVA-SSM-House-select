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
    <div class="addcell form-container">
      <h1>用户详情</h1>
      <form action="updateUserInfo" method="post">
      <table border="1">
        <tr>
          <td>ID</td>
          <td><input type="text" readonly  name="id" value="${ui.id}"></td>
        </tr>
        <tr>
          <td>用户名</td>
          <td><input type="text"  name="username" value="${ui.username}"></td>
        </tr>
        <tr>
          <td>真实姓名</td>
          <td><input type="text"  name="r_name" value="${ui.r_name}"></td>
        </tr>
        <tr>
          <td>电话</td>
          <td><input type="text"  name="tel" value="${ui.tel}"></td>
        </tr>
        <tr>
          <td>小区</td>
          <td>
            <c:if test="${ui.cellname == null or ui.cellname == ''}">
              <a href="adminCell">前往小区管理页为用户绑定小区</a>
            </c:if>
            <c:if test="${ui.cellname != null}">
          <input type="text" readonly  name="cellname" value="${ui.cellname}">
          <input type="text" readonly name="building" value="${ui.building}">
          <input type="text" readonly name="roomno" value="${ui.roomno}">
            </c:if>
          </td>
        </tr>
        <tr>
          <td>密码</td>
          <td><input type="text" name="password" value="${u.password}"></td>
        </tr>
        <tr>
          <td><input type="submit" value="提交"></td>
          <td><input type="reset" value="重置"></td>
        </tr>
      </table>
      </form>
    </div>
  </div>
</div>
</body>
</html>
