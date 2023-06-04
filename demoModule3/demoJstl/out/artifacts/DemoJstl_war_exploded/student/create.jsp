<%--
  Created by IntelliJ IDEA.
  User: linht
  Date: 11/16/2022
  Time: 7:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create student</title>
</head>
<body>
    <h1>Create new student</h1>
    <form action="/student/create" method="post">
        <table border="1">
            <tr>
                <td>ID</td>
                <td><input type="text" name="id" value="${student.id}" /></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" value="${student.name}" /></td>
            </tr>
            <tr>
                <td>Class Name</td>
                <td><input type="text" name="className" value="${student.className}" /></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><input type="text" name="address" value="${student.address}" /></td>
            </tr>
            <tr>
                <td><input type="submit" value="Đăng ký"></td>
                <td><input type="reset" value="Nhập lại"></td>
            </tr>
        </table>
    </form>
</body>
</html>
