<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/10/21
  Time: 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>房间详情</title>
    <link rel="stylesheet" href="static/css/roomdetail.css">

</head>
<body>
<div id="content">
    <div class="top">
        <a href="toCellInfo?cellname=${cellInfo.cellname}">返回</a>
        <a href="toHome">首页</a>
    </div>

    <div class="center">
        <div class="left">
            <div class="slider">
                <ul class="slider-img">
                    <c:forEach items="${imgs}" var="i">
                        <li><a href="#"><img src="static/images/${i}"></a></li>
                    </c:forEach>
                </ul>
                <ul class="slider-btn">
                    <li class="active"></li>
                    <c:forEach items="${imgs}" var="i" begin="1">
                        <li></li>
                    </c:forEach>
                </ul>
                <div class="slider-arrow">
                    <span class="prev">&lt;</span>
                    <span class="next">&gt;</span>
                </div>
            </div>
        </div>
        <div class="right">
            <div class="l-top">
                <h1>小区名称：${cellInfo.cellname}</h1>
            </div>
            <div class="l-center">
                <h2>房间位置：${cellInfo.building}${cellInfo.roomno}</h2>
                <h2>房间面积：${cellInfo.area}</h2>
                <h2>房间类型：${cellInfo.type}</h2>
            </div>
            <div class="l-bottom">
                <h2>价格：${cellInfo.price}元</h2>
                <h1>${cellInfo.selection}</h1>
                <c:if test="${cellInfo.selection=='未选定' and userInfo.cellname==null}">
                    <a href="choose?id=${cellInfo.id}">选定</a>
                </c:if>
                <c:if test="${ userInfo.cellname!='' and userInfo.cellname!=null}">
                    <h3>您已拥有房子，不可再选</h3>
                </c:if>
                <c:if test="${cellInfo.selection=='已选定'}">
                    <h3>归属用户：${cellInfo.username}</h3>
                </c:if>
            </div>
        </div>
    </div>
</div>
</body>

<script src="static/js/roomdetail.js"></script>

</html>
