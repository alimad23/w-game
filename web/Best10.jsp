<%@ page import="BusinessLayer.BLImpl" %>
<%@ page import="DataAccessLayer.DAImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DataAccessLayer.GameUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("username")==null) {
        response.sendRedirect("FirstPage.html");
    }
%>



<%!
    BLImpl bl = new BLImpl(new DAImpl());
%>
<%
    ArrayList<GameUser> min_moves = bl.bestOfMoves(10);
    ArrayList<GameUser> min_time = bl.bestOfTime(10);
    int loop = 3 < min_moves.size() ? 3 : min_moves.size();

%>
<html>
<head>
    <title>Best Of Level 10</title>
</head>
<body>
<table>
    <tr>
        <th>MOVES</th>
    </tr>
    <%for (int i = 0; i < loop; i++) {%>
    <tr>
        <td>
            <%out.print((i+1));%>.<%out.print(min_moves.get(i).getUsername() + " " + min_moves.get(i).getMove());%></td>
    </tr>
    <%}%>

</table>

<table>
    <tr>
        <th>TIME</th>
    </tr>
        <%for (int i = 0; i < loop; i++) {%>
    <tr>
        <td>
            <%out.print((i+1));%>.<%out.print(min_time.get(i).getUsername() + " " + min_time.get(i).getTime());%></td>
    </tr>
        <%}%>

</body>
</html>
