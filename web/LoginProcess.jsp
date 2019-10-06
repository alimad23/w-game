
<%@ page import="DataAccessLayer.DAImpl" %>
<%@ page import="BusinessLayer.BLImpl" %>
<%@ page import="BusinessLayer.Exception.PasswordDoesntMatchException" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<form action="main.jsp" method="post">
<%

    String username = request.getParameter("username");
    String password = request.getParameter("password");
    BLImpl bl = new BLImpl(new DAImpl());
    try {
        bl.login(username,password);
        System.out.println("you have login successfully");
        session.setAttribute("username",username);
        request.setAttribute("permission",true);
        response.sendRedirect("main.jsp");
    }catch (PasswordDoesntMatchException e){
        out.println("password doesn't match!");
    }catch (Exception e){
        out.println("an error occurred ...");
        e.printStackTrace();
    }

%>

</form>