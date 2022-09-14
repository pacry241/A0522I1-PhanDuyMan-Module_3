<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 9/12/2022
  Time: 6:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Trang danh sách sinh viên</h1>
<table border="1">
    <tr>
        <th>STTT</th>
        <th>ID</th>
        <th>Name</th>
        <th>Gender</th>
        <th>Point</th>
        <th>Rank</th>
    </tr>
   <c:forEach var="student" items="${studentList}" varStatus="status">
       <tr>
           <td>${status.count}</td>
           <td>${student.getId()}</td>
           <td>${student.getName()}</td>
           <c:if test="${student.isGender()}">
               <td>Nam</td>
           </c:if>
           <c:if test="${!student.isGender()}">
               <td>Nữ</td>
           </c:if>
           <td>${student.getPoint()}</td>
           <c:choose>
               <c:when test="${student.getPoint()>=8}">
                   <td>Giỏi</td>
               </c:when>
               <c:when test="${student.getPoint()>=7}">
                   <td>Khá</td>
               </c:when>
               <c:when test="${student.getPoint()>=5}">
                   <td>Trung bình</td>
               </c:when>
               <c:otherwise>
                   <td>Yếu</td>
               </c:otherwise>
           </c:choose>

       </tr>
   </c:forEach>

</table>
</body>
</html>
