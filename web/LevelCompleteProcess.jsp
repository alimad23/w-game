<%@ page import="BusinessLayer.BLImpl" %>
<%@ page import="DataAccessLayer.DAImpl" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>this page has no title</title>
</head>
<body>
<%
    if (session.getAttribute("username")==null) {
        response.sendRedirect("FirstPage.html");
    }
%>

<%
    int moves = Integer.parseInt(request.getParameter("moves"));
    String time = request.getParameter("time");
    int level = Integer.parseInt(request.getParameter("level"));
    String username = (String) session.getAttribute("username");
    System.out.println("moves : " + moves);
    System.out.println("level : " + level);
    System.out.println("time : " + time);
    System.out.println("username : " + username);

    BLImpl bl = new BLImpl(new DAImpl());
    try {
        bl.levelComplete(username, level, moves, time);
        bl.totalMove(username, moves);
        bl.totalTime(username, time);
    } catch (SQLException e) {
        e.printStackTrace();
    }


    response.sendRedirect("Levels.jsp");
%>
</body>
</html>
