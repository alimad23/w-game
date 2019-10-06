<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<form action="LoginProcess.jsp" method="post">
    <table>
        <%=request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
        <tr>
            <td>Username :</td>
            <td><input type="text" name="username"></td>
        </tr>
        <tr>
            <td>Password :</td>
            <td><input type="password" name="password"></td>
        </tr>
        <tr>

            <td><input type="submit" name="log.but" value="Login"></td>
        </tr>
    </table>
</form>
</body>
</html>
