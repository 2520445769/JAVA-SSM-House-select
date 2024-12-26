<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/10/19
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${cellInfoList[0].cellname}</title>
    <link rel="stylesheet" href="static/css/cellinfo.css">
</head>
<body>
<div class="top">
    <a href="toHome">返回</a>
    <p>欢迎用户：${user.username}</p>
    <h1>MO选房管理系统</h1>
    <a href="userinfo">个人信息</a>
</div>
<form action="toCellInfo?cellname=${cellInfoList[0].cellname}" method="post">
    状态查询:
    <select name="selection">
        <option value="">全部</option>
        <option value="已选定">已选定</option>
        <option value="未选定">未选定</option>
    </select>
    <input type="submit" value="查询">
</form>
    <table border="1px">
        <tr>
            <td>序号</td>
            <td>小区名称</td>
            <td>楼号</td>
            <td>房间号</td>
            <td>面积</td>
            <td>类型</td>
            <td>价格</td>
            <td>图片</td>
            <td>状态</td>
            <td></td>
        </tr>
        <c:forEach items="${cellInfoList}" var="item">
            <tr>
                <td>${item.id}</td>
                <td>${item.cellname}</td>
                <td>${item.building}</td>
                <td>${item.roomno}</td>
                <td>${item.area}</td>
                <td>${item.type}</td>
                <td>${item.price}元</td>
                <td><img src="static/images/${item.picture.split(',')[0]}"></td>
                <td>${item.selection}</td>
                <td>
                    <a href="roomdetail?id=${item.id}">查看详情</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
