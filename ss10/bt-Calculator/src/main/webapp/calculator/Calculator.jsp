<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 9/16/2022
  Time: 5:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form action="/calculator" method="post">
    <table>
        <tr>
            <th>Calculator</th>
            <th></th>
        </tr>
        <tr>
            <td>First Operand</td>
            <td><input name="first-operand" type="text" /></td>
        </tr>
        <tr>
            <td>Operator</td>
            <td>
                <select name="operator">
                    <option value="+">Addition</option>
                    <option value="-">Subtraction</option>
                    <option value="*">Multiplication</option>
                    <option value="/">Division</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Second operand</td>
            <td><input name="second-operand" type="text" /></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="submit"></td>
        </tr>
    </table>
</form>

<h1>Result:</h1>
<b>${result}</b>
<b>${error}</b>
</body>
</html>
