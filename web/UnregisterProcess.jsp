<%@ page import="BusinessLayer.BLImpl" %>
<%@ page import="DataAccessLayer.DAImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (String) session.getAttribute("username");
    session.removeAttribute("username");
    session.removeAttribute("permission");
    new BLImpl(new DAImpl()).remove(username);
    response.sendRedirect("FirstPage.html");
%>

