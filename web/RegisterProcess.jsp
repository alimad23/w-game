<%@ page import="BusinessLayer.BLImpl" %>
<%@ page import="DataAccessLayer.DAImpl" %>
<%@ page import="BusinessLayer.Exception.DuplicateUserNameException" %>
<%@ page import="BusinessLayer.Exception.SimplePasswordException" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<form action="main.jsp" method="post">
    <%

        String username = request.getParameter("username");
        System.out.println("username is : " + username);
        String password = request.getParameter("password");
        System.out.println("password is : " + password);

        BLImpl bl = new BLImpl(new DAImpl());

        try {
            bl.register(username, password);
            System.out.println("you have registered successfully");
            session.setAttribute("username", username);
            request.setAttribute("permission", true);
            response.sendRedirect("main.jsp");

        } catch (DuplicateUserNameException e) {
            out.println("DuplicateUserName!");
        } catch (SimplePasswordException e) {
            out.println("Your Password is Too Simple");
        } catch (Exception e) {
            out.println("an error occurred ...");
            e.printStackTrace();
        }
    %>
</form>