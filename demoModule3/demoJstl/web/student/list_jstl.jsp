<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: linht
  Date: 11/16/2022
  Time: 6:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List student</title>
</head>
<body>
    <h1>List student JSTL</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Class Name</th>
            <th>Address</th>
            <th>Is Bảo</th>
        </tr>
        <c:forEach items="${listStudent}" var="s">
            <tr>
                <td>${s.id}</td>
                <td>
                    <c:choose>
                        <c:when test="${s.name == 'Bảo'}">
                            <b>${s.name}</b>
                        </c:when>
                        <c:when test="${s.name == 'Mẫn'}">
                            <i>${s.name}</i>
                        </c:when>
                        <c:otherwise>
                            ${s.name}
                        </c:otherwise>
                    </c:choose>

                </td>
                <td><c:out value="${s.className}"/></td>
                <td>${s.address}</td>
                <td>
                    <c:if test="${s.name == 'Bảo'}">
                        Yes
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
