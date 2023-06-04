<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: linht
  Date: 9/14/2022
  Time: 7:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new product</title>
</head>
<body>
    <h1>Add new product</h1>
    <c:if test="${error != null}">
        <h2 style="color: red">${error}</h2>
    </c:if>

    <a href="/product">Return List</a>
    <form action="/product" method="post">
        <table border="1">
            <tr>
                <td>ID</td>
                <td><input type="text" name="id" /></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" /></td>
            </tr>
            <tr>
                <td>Price</td>
                <td><input type="text" name="price" /></td>
            </tr>
            <tr>
                <td>Date Release</td>
                <td><input type="date" name="dateRelease" /></td>
            </tr>
            <tr>
                <td>Quantity</td>
                <td><input type="text" name="quantity" /></td>
            </tr>
            <tr>
                <td>
                    <input type="reset" value="Reset" />
                </td>
                <td>
                    <input type="submit" value="Submit" />
                </td>
            </tr>
        </table>
        <input type="hidden" name="action" value="create" />
    </form>
</body>
</html>
