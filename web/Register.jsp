<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<html>
<head>
    <title>Register</title>
</head>
<body>
<form action="RegisterProcess.jsp" method="post">
    <table>

        <tr>
            <td>Username :</td>
            <td><input type="text" name="username"></td>
        </tr>
        <tr>
            <td>Password :</td>
            <td><input type="password" name="password"></td>
        </tr>
        <tr>

            <td><input type="submit" name="reg.but" value="Register"></td>
        </tr>
    </table>
</form>
</body>
</html>