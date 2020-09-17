<%-- 
    Document   : badstockdelete
    Created on : 17 Apr, 2014, 2:52:40 PM
    Author     : Hp
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
    <body>
      <%
            String badstockid = request.getParameter("badsto");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driverloaded successfully");
            Connection com = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/pointofsale","root","12345");
            System.out.println("Connection build");
            Statement stmt = com.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery("select * from badstock where bad_stock_id='"+badstockid+"'");
            while(rs.next())
            {
                rs.deleteRow();
                response.sendRedirect("viewbadstock.jsp?msgeditedDel= badstock deleted successfully");
            }
        %>
    </body>
</html>
