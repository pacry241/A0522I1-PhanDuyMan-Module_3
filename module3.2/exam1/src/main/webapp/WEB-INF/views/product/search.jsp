<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/26/2022
  Time: 7:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../layout/header.jsp"></jsp:include>

    <title>Search Product</title>
</head>
<body>
<h2>Search ID</h2>
<form method="post">
    <input type="text" name="idProduct"  size="15"/>
    <input type="submit" value="search">
</form>
</body>
</html>
