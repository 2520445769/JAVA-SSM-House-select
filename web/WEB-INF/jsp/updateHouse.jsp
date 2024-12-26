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
    <title>修改房源信息</title>
    <link rel="stylesheet" href="static/css/updateHouse.css">
</head>
<body>
<a href="toAdminIndex">返回</a>
<div class="update">
    <h1>修改房源信息</h1>
    <form action="updateHouse" method="post" enctype="multipart/form-data">
        <input type="hidden"  name="id" value="${house.id}"><br>
        小区名称:<input type="text"  name="cellname" value="${house.cellname}"><br>
        地址:<input type="text"  name="address" value="${house.address}"><br>
        图片:<img src="static/images/${house.picture}" width="100px" height="80px"><br>
        修改图片:<input type="file"  name="mtf"><br>
        <input type="submit" value="提交">
    </form>
</div>

</body>
</html>
