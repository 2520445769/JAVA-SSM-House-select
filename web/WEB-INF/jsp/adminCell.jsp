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
  <div id="error" class="modal-content" style="width: 300px;">
    <span class="close" onclick="closeModal()">&times;</span>
    <h2>删除成功！</h2>
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

    <div class="search">
      <form action="adminCell" method="post">
        选择小区：
        <select name="cellname">
          <option value="">全部</option>
          <c:forEach items="${Cells}" var="item">
            <option value="${item.cellname}">${item.cellname}</option>
          </c:forEach>
        </select>
        状态查询:
        <select name="selection">
          <option value="">全部</option>
          <option value="已选定">已选定</option>
          <option value="未选定">未选定</option>
        </select>
        <input type="submit" value="查询">
      </form>
    </div>

    <c:forEach items="${cellInfoList}" var="c">
      <div class="cell">
        <table>
          <tr>
            <td><img src="static/images/${c.picture.split(',')[0]}"></td>
            <td><a href="toadminroomdetail?id=${c.id}">查看详情</a></td>
          </tr>
          <tr>
            <td>序号</td>
            <td>${c.id}</td>
          </tr>
          <tr>
            <td>小区名称</td>
            <td>${c.cellname}</td>

          </tr>
          <tr>
            <td>楼号</td>
            <td>${c.building}</td>
          </tr>
          <tr>
            <td>房间号</td>
            <td>${c.roomno}</td>
          </tr>
          <tr>
            <td>面积</td>
            <td>${c.area}</td>
          </tr>
          <tr>
            <td>类型</td>
            <td>${c.type}</td>
          </tr>
          <tr>
            <td>价格</td>
            <td>${c.price}</td>
          </tr>
          <tr>
            <td>状态</td>
            <td>${c.selection}</td>
          </tr>
          <tr>
            <td>
              所属用户
            </td>
            <c:if test="${c.selection=='已选定'}">
              <td>${c.username}</td>
            </c:if>
          </tr>
          <tr>
            <td><a href="toUpdateCell?id=${c.id}">修改</a></td>
            <td><a href="javascript:void(0);" onclick="confirmDeleteCell(${c.id},${c.username});">删除</a></td>
          </tr>
        </table>
      </div>
    </c:forEach>
  </div>
</div>
</body>
<script src="static/js/adminCell.js"></script>
</html>
