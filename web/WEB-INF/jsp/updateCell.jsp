<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/10/29
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改小区房间信息</title>
    <link rel="stylesheet" href="static/css/updateHouse.css">

</head>
<body>
<a href="adminCell">返回</a>
<%
    String error = request.getParameter("error");
    if ("1".equals(error)) {
%>
<div class="modal" style="text-align: center; font-size: 24px;color: red;">
    <div id="error" class="modal-content" style="width: 300px;">
        <span class="close" onclick="closeModal(${cell.id})">&times;</span>
        <h2>非法选择，请查看状态与用户信息是否比配！</h2>
    </div>
</div>
<%
    }
%>
<div class="update">
    <h1>修改房源信息</h1>
    <form action="updateCell" method="post" enctype="multipart/form-data">
        <input type="hidden"  name="id" value="${cell.id}"><br>
        小区名称:<input type="text"  name="cellname" value="${cell.cellname}" readonly><br>
        楼号:<input type="text"  name="building" value="${cell.building}"><br>
        房间号:<input type="text"  name="roomno" value="${cell.roomno}"><br>
        面积:<input type="text"  name="area" value="${cell.area}"><br>
        类型:<input type="text"  name="type" value="${cell.type}"><br>
        价格:<input type="text"  name="price" value="${cell.price}"><br>
        图片:<br>
        <c:forEach var="i" items="${imgs}">
           <img src="static/images/${i}" width="100px" height="100px">
        </c:forEach><br>
        修改图片:<input type="file" name="mtf" multiple><br>
        状态:<br>
        <select name="selection" id="selection" class="custom-select">
            <option value="${cell.selection}">${cell.selection}</option>
            <c:if test="${cell.selection == '已选定'}">
                <option value="未选定">未选定</option>
            </c:if>
            <c:if test="${cell.selection == '未选定'}">
                <option value="已选定">已选定</option>
            </c:if>
        </select><br>
        所属用户:<br>
        <select name="username" id="username" class="custom-select">
            <option value="${cell.username}">${cell.username}</option>
            <option value="" id="noUserOption">无</option>
            <c:forEach items="${users}" var="u">
                <option value="${u.username}" id="noUserOptions">${u.username}</option>
            </c:forEach>
        </select>
        <input type="hidden" name="OldName" value="${cell.username}">
        <input type="submit" value="提交">
    </form>
</div>

</body>


<script>
    document.getElementById('selection').addEventListener('change', function() {
        var selectionValue = this.value;
        var noUserOption = document.getElementById('noUserOption');
        var noUserOptions = document.getElementById('noUserOptions');
        if (selectionValue === '未选定') {
            noUserOption.style.display = 'block';
            noUserOptions.style.display = 'none';
        } else {
            noUserOptions.style.display = 'block';
            noUserOption.style.display = 'none';
        }
    });
</script>
</html>
