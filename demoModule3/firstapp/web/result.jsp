<%--
  Created by IntelliJ IDEA.
  User: linht
  Date: 11/14/2022
  Time: 7:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <%
        // scriptlet
        int number1 = Integer.parseInt(request.getParameter("number1"));
        int number2 = Integer.parseInt(request.getParameter("number2"));
        int sum = number1 + number2;
    %>
    <h1>Tổng của <%=number1%> và <%=number2%> là <%=sum%></h1>
</body>
</html>
