<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: linht
  Date: 11/18/2022
  Time: 7:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Display List Book</title>
</head>
<body>
    <h1>List book</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Author</th>
            <th>Category</th>
        </tr>
        <c:forEach items="${books}" var="book">
            <tr>
                <td>${book.id}</td>
                <td>${book.name}</td>
                <td>${book.author}</td>
                <td>${book.category.name}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
