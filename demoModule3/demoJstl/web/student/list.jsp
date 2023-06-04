<%@ page import="java.util.List" %>
<%@ page import="entity.Student" %><%--
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
    <h1>List student</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Class Name</th>
            <th>Address</th>
        </tr>
        <%
            List<Student> students = (List<Student>) request.getAttribute("listStudent");
            for (Student s: students) {
        %>
            <tr>
                <td><%=s.getId()%></td>
                <td><%=s.getName()%></td>
                <td><%=s.getClassName()%></td>
                <td><%=s.getAddress()%></td>
            </tr>
        <%
            }
        %>
    </table>
</body>
</html>
