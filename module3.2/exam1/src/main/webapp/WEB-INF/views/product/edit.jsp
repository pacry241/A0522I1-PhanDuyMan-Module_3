<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/24/2022
  Time: 8:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <jsp:include page="../layout/header.jsp"></jsp:include>
    <title>Title</title>
</head>
<body>
<center>
    <h1>Product Management</h1>
    <h2>
        <a href="/product?action=users">List All Users</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">

                <h2>
                    Edit Product
                </h2>
            <c:if test="${product != null}">
                <input type="hidden" name="id" value="<c:out value='${product.id}' />"/>
            </c:if>
            <tr>
                <th>Product Name:</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="<c:out value='${product.nameProduct}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Product Price:</th>
                <td>
                    <input type="text" name="price" size="45"
                           value="<c:out value='${product.price}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Quantity:</th>
                <td>
                    <input type="text" name="quantity" size="15"
                           value="<c:out value='${product.quantity}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Color:</th>
                <td>
                    <input type="text" name="color" size="15" value=" <c:out
                            value='${product.color}' />" />
                </td>
            </tr>
            <tr>
                <th>Description:</th>
                <td>
                    <input type="text" name="description" size="15" value=" <c:out
                    value='${product.description}'/>  "
                    />
                </td>
            </tr>
            <tr>
                <th>Category:</th>
                <td>
                <select name="category" id="category" >
                    <c:forEach var="category" items="${categoryList}" varStatus="count">
                        <option value="${category.id}">${category.name}</option>
                    </c:forEach>
                </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>