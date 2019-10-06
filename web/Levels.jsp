<%@ page import="BusinessLayer.BLImpl" %>
<%@ page import="DataAccessLayer.DAImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%! BLImpl bl = new BLImpl(new DAImpl());%>
<%
    if (session.getAttribute("username")==null) {
        response.sendRedirect("FirstPage.html");
    }
    String username = "";
    int level = 0;
    String tt ="";
    int tm = 0;
    try {
        username = (String) session.getAttribute("username");
        System.out.println("levels page : " + username);
        level = (int) bl.getDataAccess().getSpecificData("game", "level", username);
        tt = (String) bl.getDataAccess().getSpecificData("game", "tt", username);
        int second = Integer.parseInt(tt.split(":")[1]);
        int minute = Integer.parseInt(tt.split(":")[0]);
        int hour = 0;
        if (minute >= 60) {
            hour = minute / 60;
            minute = minute % 60;
        }
        tt = hour + "h " + minute + "m " + second + "s ";
        tm = (int) bl.getDataAccess().getSpecificData("game", "tm", username);
    }catch (Exception e){
    }
    int permission = level + 1;

%>
<html>
<head>
    <title>Levels Page , <% out.println(username);%></title>
</head>
<body>
<table border="2">
    <%session.setAttribute("username", username);%>
    <tr>
        <th><b>Level</b></th>
        <th><b>Begin</b></th>
        <th><b>End</b></th>
    </tr>
    <tr>
        <td>1</td>
        <td><img src="1b.jpg"></td>
        <td><img src="1e.jpg"></td>
        <td><a href="Level1.jsp">PLAY</a></td>
        <td><a href="Best1.jsp">best of this level</a></td>
        <td><b>Your Best Move</b> : <%out.print(bl.bestOfMyMove(username, 1));%> <b>Your
            Best Time :</b> <%out.print(bl.bestOfMyTime(username, 1));%></td>
        <td rowspan="15" width="500"><p>Level : <%out.println(level);%></p>
            <p>Time : <%out.println(tt);%></p>
            <p>Moves : <%out.println(tm);%></p></td>
    </tr>
    <tr>
        <td>2</td>
        <td><img src="2b.jpg"></td>
        <td><img src="2e.jpg"></td>
        <%if (permission < 2) {%>
        <td><a>PLAY</a></td>
        <%} else {%>
        <td><a href="Level2.jsp">PLAY</a></td>
        <%}%>
        <td><a href="Best2.jsp">best of this level</a></td>
        <td><b>Your Best Move</b> : <%out.print(bl.bestOfMyMove(username, 2));%> <b>Your
            Best Time :</b> <%out.print(bl.bestOfMyTime(username, 2));%></td>
    </tr>
    <tr>
        <td>3</td>
        <td><img src="3b.jpg"></td>
        <td><img src="3e.jpg"></td>
        <%if (permission < 3) {%>
        <td><a>PLAY</a></td>
        <%} else {%>
        <td><a href="Level3.jsp">PLAY</a></td>
        <%}%>
        <td><a href="Best3.jsp">best of this level</a></td>
        <td><b>Your Best Move</b> : <%out.print(bl.bestOfMyMove(username, 3));%> <b>Your
            Best Time :</b> <%out.print(bl.bestOfMyTime(username, 3));%></td>
    </tr>
    <tr>
        <td>4</td>
        <td><img src="4b.jpg"></td>
        <td><img src="4e.jpg"></td>
        <%if (permission < 4) {%>
        <td><a>PLAY</a></td>
        <%} else {%>
        <td><a href="Level4.jsp">PLAY</a></td>
        <%}%>
        <td><a href="Best4.jsp">best of this level</a></td>
        <td><b>Your Best Move</b> : <%out.print(bl.bestOfMyMove(username, 4));%> <b>Your
            Best Time :</b> <%out.print(bl.bestOfMyTime(username, 4));%></td>
    </tr>
    <tr>
        <td>5</td>
        <td><img src="5b.jpg"></td>
        <td><img src="5e.jpg"></td>
        <%if (permission < 5) {%>
        <td><a>PLAY</a></td>
        <%} else {%>
        <td><a href="Level5.jsp">PLAY</a></td>
        <%}%>
        <td><a href="Best5.jsp">best of this level</a></td>
        <td><b>Your Best Move</b> : <%out.print(bl.bestOfMyMove(username, 5));%> <b>Your
            Best Time :</b> <%out.print(bl.bestOfMyTime(username, 5));%></td>
    </tr>
    <tr>
        <td>6</td>
        <td><img src="6b.jpg"></td>
        <td><img src="6e.jpg"></td>
        <%if (permission < 6) {%>
        <td><a>PLAY</a></td>
        <%} else {%>
        <td><a href="Level6.jsp">PLAY</a></td>
        <%}%>
        <td><a href="Best6.jsp">best of this level</a></td>
        <td><b>Your Best Move</b> : <%out.print(bl.bestOfMyMove(username, 6));%> <b>Your
            Best Time :</b> <%out.print(bl.bestOfMyTime(username, 6));%></td>
    </tr>
    <tr>
        <td>7</td>
        <td><img src="7b.jpg"></td>
        <td><img src="7e.jpg"></td>
        <%if (permission < 7) {%>
        <td><a>PLAY</a></td>
        <%} else {%>
        <td><a href="Level7.jsp">PLAY</a></td>
        <%}%>
        <td><a href="Best7.jsp">best of this level</a></td>
        <td><b>Your Best Move</b> : <%out.print(bl.bestOfMyMove(username, 7));%> <b>Your
            Best Time :</b> <%out.print(bl.bestOfMyTime(username, 7));%></td>
    </tr>
    <tr>
        <td>8</td>
        <td><img src="8b.jpg"></td>
        <td><img src="8e.jpg"></td>
        <%if (permission < 8) {%>
        <td><a>PLAY</a></td>
        <%} else {%>
        <td><a href="Level8.jsp">PLAY</a></td>
        <%}%>
        <td><a href="Best8.jsp">best of this level</a></td>
        <td><b>Your Best Move</b> : <%out.print(bl.bestOfMyMove(username, 8));%> <b>Your
            Best Time :</b> <%out.print(bl.bestOfMyTime(username, 8));%></td>
    </tr>
    <tr>
        <td>9</td>
        <td><img src="9b.jpg"></td>
        <td><img src="9e.jpg"></td>
        <%if (permission < 9) {%>
        <td><a>PLAY</a></td>
        <%} else {%>
        <td><a href="Level9.jsp">PLAY</a></td>
        <%}%>
        <td><a href="Best9.jsp">best of this level</a></td>
        <td><b>Your Best Move</b> : <%out.print(bl.bestOfMyMove(username, 9));%> <b>Your
            Best Time :</b> <%out.print(bl.bestOfMyTime(username, 9));%></td>
    </tr>
    <tr>
        <td>10</td>
        <td><img src="10b.jpg"></td>
        <td><img src="10e.jpg"></td>
        <%if (permission < 10) {%>
        <td><a>PLAY</a></td>
        <%} else {%>
        <td><a href="Level10.jsp">PLAY</a></td>
        <%}%>
        <td><a href="Best10.jsp">best of this level</a></td>
        <td><b>Your Best Move</b> : <%out.print(bl.bestOfMyMove(username, 10));%> <b>Your
            Best Time :</b> <%out.print(bl.bestOfMyTime(username, 10));%></td>
    </tr>
    <tr>
        <td>11</td>
        <td><img src="11b.jpg"></td>
        <td><img src="11e.jpg"></td>
        <%if (permission < 11) {%>
        <td><a>PLAY</a></td>
        <%} else {%>
        <td><a href="Level11.jsp">PLAY</a></td>
        <%}%>
        <td><a href="Best11.jsp">best of this level</a></td>
        <td><b>Your Best Move</b> : <%out.print(bl.bestOfMyMove(username, 11));%> <b>Your
            Best Time :</b> <%out.print(bl.bestOfMyTime(username, 11));%></td>
    </tr>
    <tr>
        <td>12</td>
        <td><img src="12b.jpg"></td>
        <td><img src="12e.jpg"></td>
        <%if (permission < 12) {%>
        <td><a>PLAY</a></td>
        <%} else {%>
        <td><a href="Level12.jsp">PLAY</a></td>
        <%}%>
        <td><a href="Best12.jsp">best of this level</a></td>
        <td><b>Your Best Move</b> : <%out.print(bl.bestOfMyMove(username, 12));%> <b>Your
            Best Time :</b> <%out.print(bl.bestOfMyTime(username, 12));%></td>
    </tr>
    <tr>
        <td>13</td>
        <td><img src="13b.jpg"></td>
        <td><img src="13e.jpg"></td>
        <%if (permission < 13) {%>
        <td><a>PLAY</a></td>
        <%} else {%>
        <td><a href="Level13.jsp">PLAY</a></td>
        <%}%>
        <td><a href="Best13.jsp">best of this level</a></td>
        <td><b>Your Best Move</b> : <%out.print(bl.bestOfMyMove(username, 13));%> <b>Your
            Best Time :</b> <%out.print(bl.bestOfMyTime(username, 13));%></td>
    </tr>
    <tr>
        <td>14</td>
        <td><img src="14b.jpg"></td>
        <td><img src="14e.jpg"></td>
        <%if (permission < 14) {%>
        <td><a>PLAY</a></td>
        <%} else {%>
        <td><a href="Level14.jsp">PLAY</a></td>
        <%}%>
        <td><a href="Best14.jsp">best of this level</a></td>
        <td><b>Your Best Move</b> : <%out.print(bl.bestOfMyMove(username, 14));%> <b>Your
            Best Time :</b> <%out.print(bl.bestOfMyTime(username, 14));%></td>
    </tr>
    <tr>
        <td>15</td>
        <td><img src="15b.jpg"></td>
        <td><img src="15e.jpg"></td>
        <%if (permission < 15) {%>
        <td><a>PLAY</a></td>
        <%} else {%>
        <td><a href="Level15.jsp">PLAY</a></td>
        <%}%>>
        <td><a href="Best15.jsp">best of this level</a></td>
        <td><b>Your Best Move</b> : <%out.print(bl.bestOfMyMove(username, 15));%> <b>Your
            Best Time :</b> <%out.print(bl.bestOfMyTime(username, 15));%></td>


    </tr>

</table>

<p><a href="LogoutProcess.jsp">Logout</a></p>
</body>
</html>
