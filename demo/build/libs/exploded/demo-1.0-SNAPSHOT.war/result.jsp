<%--
  Created by IntelliJ IDEA.
  User: linht
  Date: 9/9/2022
  Time: 7:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <% int result = (int) request.getAttribute("result"); %>
    <b>Tổng của 2 số là: <%=result %></b>
    <b>Tổng của 2 số là: ${result}</b>

    <%-- Scriplet
        <% %>: viết code java thông thường
        <%= %>: hiển thị 1 biến
        <%! %>: khai báo biến, method
    --%>
</body>
</html>
