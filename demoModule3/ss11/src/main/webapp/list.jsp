<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/30/2022
  Time: 09:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/student?action=create">Create Student</a>
<table border="1">
    <tr>
        <th>Code Student</th>
        <th>Name Student</th>
        <th>Point</th>
        <th>Gender</th>
        <th>Rank</th>
    </tr>
    <c:forEach var="temp" items="${listStudent}">
        <tr>
            <td>${temp.codeStudent}</td>
            <td>${temp.nameStudent}</td>
            <td><c:out value="${temp.point}"></c:out></td>
            <td>
                <c:if test="${temp.gender == 0}">
                    FeMale
                </c:if>
                <c:if test="${temp.gender == 1}">
                    Male
                </c:if>
                <c:if test="${temp.gender == null}">
                    Other
                </c:if>
            </td>
            <td>
                <c:choose>
                    <c:when test="${temp.point >8}">Very good</c:when>
                    <c:when test="${temp.point >6.5}">Good</c:when>
                    <c:when test="${temp.point >5}">Not good</c:when>
                    <c:when test="${temp.point >3.5}">Bad</c:when>
                    <c:when test="${temp.point <=3.5}">Very Bad</c:when>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
