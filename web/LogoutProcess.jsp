<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.removeAttribute("username");
    session.removeAttribute("permission");
    response.sendRedirect("FirstPage.html");
%>
<html>
<head>
</head>
<body>

</body>
</html>
