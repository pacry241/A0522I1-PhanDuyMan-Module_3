<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 9/14/2022
  Time: 8:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

        <h1>Danh sách khách hàng</h1>

<table border="1" style="width: 100%;text-align: center">
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach var="customer" items="${CustomerList}" varStatus="item" >
        <tr>
            <td>${customer.getName()}</td>
            <td>${customer.getDateOfBirth()}</td>
            <td>${customer.getAddress()}</td>
            <td><img width="100" src="${customer.getImg()}" /></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
