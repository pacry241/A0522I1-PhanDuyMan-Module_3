<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/26/2022
  Time: 8:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>
        <a href="/product?action=list">List All Product</a>
    </h2>
<table border="1" cellpadding="5">
    <caption><h2>List of Users</h2></caption>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Color</th>
        <th>Description</th>
        <th>Category</th>
        <th>Action</th>
    </tr>
    <tr>
        <td>${product.id}</td>
        <td>${product.nameProduct}</td>
        <td>${product.price}</td>
        <td>${product.quantity}</td>
        <td>${product.color}</td>
        <td>${product.description}</td>
        <td>${product.category}</td>
        <td>
            <a href="/product?action=edit&id=${product.id}">Edit</a>
            <a href="/product?action=delete&id=${product.id}">Delete</a>
        </td>
    </tr>
</table>
</body>
</html>
