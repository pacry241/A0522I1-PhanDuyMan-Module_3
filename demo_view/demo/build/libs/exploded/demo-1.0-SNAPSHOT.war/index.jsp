<%--
  Created by IntelliJ IDEA.
  User: linht
  Date: 9/9/2022
  Time: 7:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>SUm</title>
  </head>
  <body>
      <form action="/SumServlet" method="get">
          a: <input type="text" name="number1"> <br/>
          b: <input type="text" name="number2"> <br/>
          <input type="submit" value="Cộng">
      </form>
  </body>
</html>
