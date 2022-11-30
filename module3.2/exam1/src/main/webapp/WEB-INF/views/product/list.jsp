<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/19/2022
  Time: 7:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
       <jsp:include page="../layout/header.jsp"></jsp:include>

    <title>List Product</title>
</head>
<body>
<jsp:include page="../layout/navbar.jsp"></jsp:include>
    <h2>
<%--        <a href="/product?action=create">Add New User</a>--%>
    </h2>

<div class="container-fluid" align="center">
    <h2>
        <a href="/product?action=search">Search</a>
    </h2>
    <div class="row">
        <div class="col-2"></div>
        <div class="col-10">
            <table  class="table table-striped table table-bordered">
                <tr><h2>List of Users</h2></tr>
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
                <c:forEach var="product" items="${List}" varStatus="count">
                    <tr>
                        <td><c:out value="${product.id}"/></td>
                        <td><c:out value="${product.nameProduct}"/></td>
                        <td><c:out value="${product.price}"/></td>
                        <td><c:out value="${product.quantity}"/></td>
                        <td><c:out value="${product.color}"/></td>
                        <td><c:out value="${product.description}"/></td>
                        <td><c:out value="${product.category}"/></td>
                        <td>
                            <a class="btn btn-primary" href="/product?action=edit&id=${product.id}" role="button">Edit</a>
                            <a class="btn btn-danger" href="/product?action=delete&id=${product.id}" role="button">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</div>
</body>
</html>
