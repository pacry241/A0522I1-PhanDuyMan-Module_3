<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 9/12/2022
  Time: 7:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/display-discount" method="post">
      <label>Product Description</label>
      <input type="text" name="des" placeholder="Product Description"><br>
      <label>List Price</label>
      <input type="text" name="price" placeholder="0"><br>
      <label>Discount Percent</label>
      <input type="text" name="discount" placeholder="0"><br>
      <input type="submit" value="count" id="submit">
  </form>
  </body>
</html>
