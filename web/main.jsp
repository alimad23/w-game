<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    if (session.getAttribute("username")==null) {
        response.sendRedirect("FirstPage.html");
    }
%>
<html>
<head>
    <title>Main Menu</title>
</head>
<body>
<%
    String username = (String) session.getAttribute("username");
    System.out.println(username);

%>
<%session.setAttribute("username", username);%>

<p>Welcome to Game <%out.println(username);%></p>


<a href="Levels.jsp">Levels</a> |
<a href="UnregisterProcess.jsp">Unsubscribe</a> |
<a href="LogoutProcess.jsp"> Logout </a>
</body>
</html>
